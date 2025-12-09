declare module '@apiverve/hashgenerator' {
  export interface hashgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface hashgeneratorResponse {
    status: string;
    error: string | null;
    data: HashGeneratorData;
    code?: number;
  }


  interface HashGeneratorData {
      inputText:           string;
      inputLength:         number;
      algorithmsUsed:      string[];
      hashes:              Hashes;
      hashDetails:         HashDetail[];
      availableAlgorithms: string[];
  }
  
  interface HashDetail {
      algorithm: string;
      hash:      string;
      length:    number;
      uppercase: string;
  }
  
  interface Hashes {
      sha256: string;
      md5:    string;
  }

  export default class hashgeneratorWrapper {
    constructor(options: hashgeneratorOptions);

    execute(callback: (error: any, data: hashgeneratorResponse | null) => void): Promise<hashgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: hashgeneratorResponse | null) => void): Promise<hashgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<hashgeneratorResponse>;
  }
}
