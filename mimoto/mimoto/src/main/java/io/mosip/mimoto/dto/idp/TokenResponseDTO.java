package io.mosip.mimoto.dto.idp;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data

public class TokenResponseDTO {
    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String id_token;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String token_type;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String access_token;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private int expires_in;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private String scope;
}
