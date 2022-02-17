#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  EmodulProcessedDataPath:
    type: string
  EmodulDataForCalibration:
    type: string
  EmodulRawDataPath:
    type: string
  compressionProcessedDataPath :
    type: string
  compressionForCalibration:
    type: string
  compressionRawdataPath:
    type: string
outputs:
  constutive_parameters:File

steps:

  task_emodul_knowledge_graph:
    run: gen_emodul_knowledge_graph.cwl
    in:
      RawData:EmodulRawDataPath 
      ProcessedData: EmodulProcessedDataPath
      DataForCalibration: EmodulDataForCalibration
    out: []

  task_compression_knowledge_graph:
    run: gen_compression_knowledge_graph.cwl
    in:
      RawData: compressionRawdataPath
      ProcessedData: compressionProcessedDataPath
      DataForCalibration: compressionForCalibration
    out: []

  task_Emodul_calibration:
    run: Emodul_Calibration.cwl
    in:
      ProcessedData: EmodulDataForCalibration
    out: [constutive_parameters.json]
