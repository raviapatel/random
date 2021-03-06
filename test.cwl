#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  EmodulProcessedDataPath:
    type: string
    
  EmodulRawDataPath:
    type: string
    
  compressionProcessedDataPath:
    type: string
    
  compressionRawdataPath:
    type: string
    
outputs:
  constitutive_parameters:
    type: File


steps:
  task_emodul_knowledge_graph:
    run: gen_emodul_knowledge_graph.cwl
    in:
      RawData: EmodulProcessedDataPath
      ProcessedData: EmodulRawDataPath
    out: []

  task_compression_knowledge_graph:
    run: gen_compression_knowledge_graph.cwl
    in:
      RawData: compressionProcessedDataPath
      ProcessedData: compressionRawdataPath
    out: []

  task_Emodul_calibration:
    run: Emodul_Calibration.cwl
    in:
      RawData: EmodulProcessedDataPath
      ProcessedData: EmodulRawDataPath
    out: [constitutive_parameters]
