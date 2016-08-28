import CombineHarvester.CombineTools.plotting as plot 
import CombineHarvester.CombineTools.maketable as maketable
import ROOT
import math
import argparse
import json
import sys

ROOT.gROOT.SetBatch(ROOT.kTRUE)
parser = argparse.ArgumentParser()
parser.add_argument('--file', '-f', help='named input file')
parser.add_argument('--labels', help='Labels for legend')
parser.add_argument('--process', help='The process on which a limit has been calculated. [gg#phi, bb#phi]', default="gg#phi")
parser.add_argument('--custom_y_range', help='Fix y axis range', action='store_true', default=False)
parser.add_argument('--y_axis_min',  help='Fix y axis minimum', default=0.001)
parser.add_argument('--y_axis_max',  help='Fix y axis maximum', default=100.0)
parser.add_argument('--custom_x_range', help='Fix x axis range', action='store_true', default=False)
parser.add_argument('--x_axis_min',  help='Fix x axis minimum', default=90.0)
parser.add_argument('--x_axis_max',  help='Fix x axis maximum', default=1000.0)
parser.add_argument('--verbosity', '-v', help='verbosity', default=0)
parser.add_argument('--log', help='Set log range for x and y axis', action='store_true', default=False)
parser.add_argument('--outname','-o', help='Name of output plot', default='limit_comparison')
parser.add_argument('--channel_label',default='#mu#tau_{h} no b-tag',help='Channel - category label')
parser.add_argument('--title',help='Plot label', default='2.3 fb^{-1} (13 TeV)')
parser.add_argument(
    '--cms-sub', default='Internal', help="""Text below the CMS logo""")
#parser.add_argument('--table_vals', help='Amount of values to be written in a table for different masses', default=10)
args = parser.parse_args()

channel_label = args.channel_label

colourlist=[ROOT.kGreen+3,ROOT.kRed,ROOT.kBlue,ROOT.kBlack,ROOT.kYellow+2,ROOT.kOrange,ROOT.kCyan+3,ROOT.kMagenta+2,ROOT.kViolet-5,ROOT.kGray]
files = (args.file).split(',')
if args.labels:
  labels = (args.labels).split(',')
else:
  labels =[]
outname = args.outname


if len(colourlist) < len(files):
  print 'Too many input files! Maximum supported is %d'%len(colourlist)
  sys.exit(1)

if len(labels) < len(files)  :
  print 'Provide at least as many legend labels as files'
  sys.exit(1)


exp_graph_list = [ROOT.TGraph() for i in range(len(files))]
#if args.relative or args.absolute:
for i in range(len(files)):
  if ".root" in files[i]:
    tfile = ROOT.TFile(files[i])
    exp_graph_list[i] = ROOT.TGraph(tfile.Get('cont_exp0_0'))

max_vals = []
for i in range(len(exp_graph_list)):
  max_vals.append(ROOT.TMath.MaxElement(exp_graph_list[i].GetN(),exp_graph_list[i].GetY()))

mass_list=[]
for i in range(exp_graph_list[0].GetN()) :
    mass_list.append(float(exp_graph_list[0].GetX()[i]))
mass_list = sorted(set(mass_list))
mass_bins=len(mass_list)

# Setup the canvas: we'll use a two pad split, with a small top pad to contain


# the CMS logo and the legend
plot.ModTDRStyle(r=0.06, l=0.12)
#axis = plot.makeHist1D('hist1d', mass_bins, exp_graph_list[0])
axis = plot.TH2FromTGraph2D(exp_graph_list[0])
ROOT.gStyle.SetFrameLineWidth(2)
c1=ROOT.TCanvas()
pads = plot.TwoPadSplit(0.8, 0, 0)
pads[1].cd()
axis.GetYaxis().SetTitle("tan#beta")
if args.custom_y_range : axis.GetYaxis().SetRangeUser(float(args.y_axis_min), float(args.y_axis_max))
axis.GetXaxis().SetTitle("m_{A} (GeV)")
if args.custom_x_range : axis.GetXaxis().SetRangeUser(float(args.x_axis_min), float(args.x_axis_max))
axis.GetYaxis().SetTitleSize(0.040)    
axis.GetYaxis().SetTitleOffset(1.2)    
axis.Draw()

for i in xrange(len(files)):
    exp_graph_list[i].SetLineColor(colourlist[i])
    exp_graph_list[i].SetLineWidth(3)
    exp_graph_list[i].SetMarkerStyle(20)
    exp_graph_list[i].SetMarkerColor(colourlist[i])
    exp_graph_list[i].SetLineStyle(2)
    exp_graph_list[i].Draw("L")

pads[0].cd()
h_top = axis.Clone()
#necessary in case chosen range surrounds 0 which will cause axis to contain a horizontal line at 0
#h_top.GetYaxis().SetRangeUser(0.001,100)
plot.Set(h_top.GetXaxis(), LabelSize=0, TitleSize=0, TickLength=0)
plot.Set(h_top.GetYaxis(), LabelSize=0, TitleSize=0, TickLength=0)
h_top.Draw()

legend = plot.PositionedLegend(0.4, 0.11, 3, 0.015)
plot.Set(legend, NColumns=2, Header='#bf{%.0f%% CL Excluded:}' % 95)
for i in range(len(files)):
    legend.AddEntry(exp_graph_list[i],labels[i],"L")
      
legend.Draw()

latex2 = ROOT.TLatex()
latex2.SetNDC()
latex2.SetTextAngle(0)
latex2.SetTextColor(ROOT.kBlack)
latex2.SetTextSize(0.032)
latex2.DrawLatex(0.125,0.96,channel_label)

plot.DrawCMSLogo(pads[0], 'CMS', args.cms_sub, 11, 0.045, 0.15, 1.0, '', 1.0)
plot.DrawTitle(pads[0], '%s'%args.title, 3);
plot.FixOverlay()

# Redraw the frame because it usually gets covered by the filled areas
pads[1].cd()
pads[1].GetFrame().Draw()
pads[1].RedrawAxis()

c1.SaveAs("%s.pdf"%outname)
c1.SaveAs("%s.png"%outname)
    
