using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.HashGenerator
{
    /// <summary>
    /// Query options for the Hash Generator API
    /// </summary>
    public class HashGeneratorQueryOptions
    {
        /// <summary>
        /// Text to hash
        /// </summary>
        [JsonProperty("text")]
        public string Text { get; set; }

        /// <summary>
        /// Comma-separated list of algorithms or 'all'
        /// </summary>
        [JsonProperty("algorithms")]
        public string Algorithms { get; set; }
    }
}
