python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllSysts/lumi1/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi1_MSSMvsSM_cmb" --title-right="2.3 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allsyst_lumi1.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllSysts/lumi50/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi50_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 50 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allsyst_lumi50.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllSysts/lumi100/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi100_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 100 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allsyst_lumi100.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllSysts/lumi300/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi300_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 300 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allsyst_lumi300.root"

python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/bbbScale/lumi1/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi1_bbbScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="bbbscale_lumi1.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/bbbScale/lumi50/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi50_bbbScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 50 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="bbbscale_lumi50.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/bbbScale/lumi100/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi100_bbbScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 100 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="bbbscale_lumi100.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/bbbScale/lumi300/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi300_bbbScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 300 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="bbbscale_lumi300.root"

python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllScale/lumi1/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi1_AllScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allscale_lumi1.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllScale/lumi50/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi50_AllScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 50 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allscale_lumi50.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllScale/lumi100/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi100_AllScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 100 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allscale_lumi100.root"
python scripts/plotMSSMLimitGrid.py CombineOutputProjectionsECFA/AllScale/lumi300/HybridNewGridMSSM.root  --scenario-label="m_{h}^{mod+} scenario"  --output="mssm_ECFA_lumi300_AllScale_MSSMvsSM_cmb" --title-right="2.3 fb^{-1} -> 300 fb^{-1}" --cms-sub="Preliminary" --contours="exp0"  --x-range="90,2000" --debug-output="allscale_lumi300.root"

python scripts/MSSM2DlimitCompare.py --file=allsyst_lumi1.root,allsyst_lumi50.root,allsyst_lumi100.root,allsyst_lumi300.root --labels="2.3 fb^{-1},50 fb^{-1},100 fb^{-1},300 fb^{-1}" --outname="mssm_ECFA_allsyst_modeldep_compare" --channel_label="m_{h}^{mod+} scenario" --title=" " --cms-sub="Preliminary"
python scripts/MSSM2DlimitCompare.py --file=allsyst_lumi1.root,bbbscale_lumi50.root,bbbscale_lumi100.root,bbbscale_lumi300.root --labels="2.3 fb^{-1},50 fb^{-1},100 fb^{-1},300 fb^{-1}" --outname="mssm_ECFA_bbbscale_modeldep_compare" --channel_label="m_{h}^{mod+} scenario" --title=" " --cms-sub="Preliminary"
python scripts/MSSM2DlimitCompare.py --file=allsyst_lumi1.root,allscale_lumi50.root,allscale_lumi100.root,allscale_lumi300.root --labels="2.3 fb^{-1},50 fb^{-1},100 fb^{-1},300 fb^{-1}" --outname="mssm_ECFA_allscale_modeldep_compare" --channel_label="m_{h}^{mod+} scenario" --title=" " --cms-sub="Preliminary"