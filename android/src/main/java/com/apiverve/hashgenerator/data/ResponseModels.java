// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     HashGeneratorData data = Converter.fromJsonString(jsonString);

package com.apiverve.hashgenerator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static HashGeneratorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(HashGeneratorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(HashGeneratorData.class);
        writer = mapper.writerFor(HashGeneratorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// HashGeneratorData.java

package com.apiverve.hashgenerator.data;

import com.fasterxml.jackson.annotation.*;

public class HashGeneratorData {
    private String inputText;
    private long inputLength;
    private String[] algorithmsUsed;
    private Hashes hashes;
    private HashDetail[] hashDetails;
    private String[] availableAlgorithms;

    @JsonProperty("input_text")
    public String getInputText() { return inputText; }
    @JsonProperty("input_text")
    public void setInputText(String value) { this.inputText = value; }

    @JsonProperty("input_length")
    public long getInputLength() { return inputLength; }
    @JsonProperty("input_length")
    public void setInputLength(long value) { this.inputLength = value; }

    @JsonProperty("algorithms_used")
    public String[] getAlgorithmsUsed() { return algorithmsUsed; }
    @JsonProperty("algorithms_used")
    public void setAlgorithmsUsed(String[] value) { this.algorithmsUsed = value; }

    @JsonProperty("hashes")
    public Hashes getHashes() { return hashes; }
    @JsonProperty("hashes")
    public void setHashes(Hashes value) { this.hashes = value; }

    @JsonProperty("hash_details")
    public HashDetail[] getHashDetails() { return hashDetails; }
    @JsonProperty("hash_details")
    public void setHashDetails(HashDetail[] value) { this.hashDetails = value; }

    @JsonProperty("available_algorithms")
    public String[] getAvailableAlgorithms() { return availableAlgorithms; }
    @JsonProperty("available_algorithms")
    public void setAvailableAlgorithms(String[] value) { this.availableAlgorithms = value; }
}

// HashDetail.java

package com.apiverve.hashgenerator.data;

import com.fasterxml.jackson.annotation.*;

public class HashDetail {
    private String algorithm;
    private String hash;
    private long length;
    private String uppercase;

    @JsonProperty("algorithm")
    public String getAlgorithm() { return algorithm; }
    @JsonProperty("algorithm")
    public void setAlgorithm(String value) { this.algorithm = value; }

    @JsonProperty("hash")
    public String getHash() { return hash; }
    @JsonProperty("hash")
    public void setHash(String value) { this.hash = value; }

    @JsonProperty("length")
    public long getLength() { return length; }
    @JsonProperty("length")
    public void setLength(long value) { this.length = value; }

    @JsonProperty("uppercase")
    public String getUppercase() { return uppercase; }
    @JsonProperty("uppercase")
    public void setUppercase(String value) { this.uppercase = value; }
}

// Hashes.java

package com.apiverve.hashgenerator.data;

import com.fasterxml.jackson.annotation.*;

public class Hashes {
    private String sha256;
    private String md5;

    @JsonProperty("sha256")
    public String getSha256() { return sha256; }
    @JsonProperty("sha256")
    public void setSha256(String value) { this.sha256 = value; }

    @JsonProperty("md5")
    public String getMd5() { return md5; }
    @JsonProperty("md5")
    public void setMd5(String value) { this.md5 = value; }
}