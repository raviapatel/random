#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

outputs:
  [constutive_parameters.json]

inputs:
  EmodulProcessedDataPath:
    type: str
  EmodulRawDataPath:
    type: str
  compressionProcessedDataPath :
    type: str
  compressionRawdataPath:
    type: str
steps:

  make_dependencies:
    run: make_dependencies.cwl
    in:[]
    out: []

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
    out: [constutive_parameters.json]
