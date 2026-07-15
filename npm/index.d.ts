declare module '@apiverve/hashgenerator' {
  export interface hashgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface hashgeneratorResponse {
    status: string;
    error: string | null;
    data: HashGeneratorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface HashGeneratorData {
      inputText:      null | string;
      inputLength:    number | null;
      algorithmsUsed: (null | string)[];
      hashes:         Hashes;
      hashDetails:    HashDetail[];
  }
  
  interface HashDetail {
      algorithm: null | string;
      hash:      null | string;
      length:    number | null;
      uppercase: null | string;
  }
  
  interface Hashes {
      sha256: null | string;
      md5:    null | string;
  }

  export default class hashgeneratorWrapper {
    constructor(options: hashgeneratorOptions);

    execute(callback: (error: any, data: hashgeneratorResponse | null) => void): Promise<hashgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: hashgeneratorResponse | null) => void): Promise<hashgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<hashgeneratorResponse>;
  }
}
