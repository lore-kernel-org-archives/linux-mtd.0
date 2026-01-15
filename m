Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA30BD44C48
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMz/ysXHPvp8TcLpPYKtkjby1LeCETgJcNASqpV8hhE=; b=e0jUrGeLMT+sG4
	WUjYnSCn5048dmEErK+5ALRaJDhlNZZfk8B1Ij4k4p6NXAdrwF30GvoCXhBpfaPyd8M2ovVG1lOjq
	rkxFYfVUJs0z6LP0nijhXMgATKE+i4EaXNHHohSIIIipIf3Bwe9L8qS38ufI8TorCIkToXmO1MmJR
	pgiGTwHP1FjUWhTK1R5hiumBls3wLiRCzf0ThTrCmob++aYyfCxCM+XIqwM+rD+mC9VeihABjOsaB
	V1wCRBel8uXexztwrUdRszMJwc7ig9YjQZ4N3CIa60EOS3h60TaQvdWlEeBqEIcRTkhGauDJBd6pQ
	udItZbhrsV29TQZEKx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNPI-0000000CQAo-0bVv;
	Thu, 15 Jan 2026 13:29:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNPF-0000000CQ9j-2HWu
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jan 2026 13:28:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso4887355e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2026 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768483735; x=1769088535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iK603Yrl6cAoskvtZuzt5inDzVXwdlPWfjvT+cpZDag=;
        b=R9cDOlbxD47UkHQ+w08keOku5Y6MQLPfpR6feSPmVyhrIcZbXqxtm0u/9gBQ4xWnPP
         gbIYPVmpx8sdmwExrnYmEXUlLZ5dsHg3X1cdpE1KkLUU50vpF0wX5BQn1bXUob4QnjTp
         K9afTmn8IJ6vslMk+3pfXS+O6LSWafXeX9EUTppVecQiA+zp8Tv5b/d9uXD4YxJF98Me
         lgZhboEbFSn6vXKWQ1KqXL9ji0Tlx7QGFVSgQ3OELcMVQINakzbzvA3PSJNbX/BUTcu8
         /YvK4MQmqAPwR2BwwRulcgJdzz6wvlS9DDDIP+lMqnvg/e5kp6siJXRV7s9zF/9vtyLa
         +5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768483735; x=1769088535;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iK603Yrl6cAoskvtZuzt5inDzVXwdlPWfjvT+cpZDag=;
        b=QnqJUsDTCM9sNbB+UPivEQ2WX+OETlXLS6Y252se1H7AqLR1oIMVAw4pGhIpcgRz/0
         fcbZTCwRYagSItiuWt6DxVKvvbDFrAqE4ysmEzx53Jn4tMi4vBgHYAkTTBVKuv6c7XtV
         zbaBGyu2NXI8ebIz3ak5J4E81chuGlAhoVtxHM+Ph6rnoG5RD3w4LY1/p33RaRI3Ak8m
         F04rAj5cyr/U02h+F38EeNXApExIZBM0vF5yqQ5/en74dx8oV9MKfXsdmfZH3u2OEKZL
         rq87PRHpNU78B7VPGtAZHcTRFSMT66BW0LZYs6o6Se9JfbFNOZtqZifTq1bolShCIle8
         pN1A==
X-Forwarded-Encrypted: i=1; AJvYcCVzctV0djVCFstT+7uKu7kl+SuyyDtersJoRf3o25CEkUP1ZRYTX8cdyCKpOm3DDL2R44PfzhjWK8I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMda+OJ9kG0C0XQYhqkpYd6WswDwkpiv4KEv+s4I7qLhtoO0Mv
	qwpts+ELgqx3vrte2cxdP1u6ZJe/TCmfvFsD92NWQDRiZnFD1barec6JtW0zxvIro5c=
X-Gm-Gg: AY/fxX7y6zvz/rICJ0txnTxMjRL5kOqGUZCbVoDXIp5E+liLS5Xbi662XhvGl/x08j4
	2YsDUK89VzMBfC9uGjw+/08aOYaPL0gzWePo8MlWDRWBMnPF5HrOjoCknk1ZJhiOB22zOFO57Tu
	dcyC0ozfgHKwFj+LRB/boasLU1IvB2ohCdIEFkuoSJz2msJeTCNkmzGBZgDCCoUgbcHlRti/2M0
	AZlCY211yATeWPhRObHU/YxZjQrSS32FRi7//pgEw2OqRliD5LInfrVMp84Ttmp5vpxcT/x0Vpq
	jFi94QtIJm7CsMsptMd6u+5P9w+pCPiDUEendoOfVvLBD9isw9Wdi3vFIl6BK9Z46BljmUpm1XN
	NXp9CBWC+YozQqf/07rFxBtrXPHrp8+zNIF5SvOSuzPeBA/Gb9lXzkywFtBTjE2XkemjcMupeS3
	WjdabSJr/sqWoDUAA0CECNOPA94bLWsdDZAOQOZFY+kdl6GVaeZ59jUBC7+kx0ES/O
X-Received: by 2002:a05:600c:8217:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-47ee3311593mr71935275e9.10.1768483735319;
        Thu, 15 Jan 2026 05:28:55 -0800 (PST)
Received: from ?IPV6:2a00:f2a:e0df:cca0:40b7:95ab:607c:4e79? ([2a00:f2a:e0df:cca0:40b7:95ab:607c:4e79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b488d4sm50415825e9.0.2026.01.15.05.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:28:54 -0800 (PST)
Message-ID: <e1ed2a68-683c-4235-890b-9b2c5ad93e38@linaro.org>
Date: Thu, 15 Jan 2026 15:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com, robh@kernel.org
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052857_657209_230F1D21 
X-CRM114-Status: GOOD (  15.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 1/15/26 14:56, AngeloGioacchino Del Regno wrote:
> Both clocks and clock-names are missing (a lot of) entries: add
> all the used audio clocks and their description and also fix the
> example node.

Hi Angelo,

This does not really look like a fix, if it was a fix I would expect a
Fixes tag, otherwise, it looks like you are adding a lot of clocks which
were not defined before

Eugen
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
>  1 file changed, 162 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> index 8ddf49b0040d..16ae3328f70d 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> @@ -47,16 +47,118 @@ properties:
>        - description: AFE clock
>        - description: ADDA DAC clock
>        - description: ADDA DAC pre-distortion clock
> -      - description: audio infra sys clock
> -      - description: audio infra 26M clock
> +      - description: ADDA ADC clock
> +      - description: ADDA6 ADC clock
> +      - description: Audio low-jitter 22.5792m clock
> +      - description: Audio low-jitter 24.576m clock
> +      - description: Audio PLL1 tuner clock
> +      - description: Audio PLL2 tuner clock
> +      - description: Audio Time-Division Multiplexing interface clock
> +      - description: ADDA ADC Sine Generator clock
> +      - description: audio Non-LE clock
> +      - description: Audio DAC High-Resolution clock
> +      - description: Audio High-Resolution ADC clock
> +      - description: Audio High-Resolution ADC SineGen clock
> +      - description: Audio ADDA6 High-Resolution ADC clock
> +      - description: Tertiary ADDA DAC clock
> +      - description: Tertiary ADDA DAC pre-distortion clock
> +      - description: Tertiary ADDA DAC Sine Generator clock
> +      - description: Tertiary ADDA DAC High-Resolution clock
> +      - description: Audio infra sys clock
> +      - description: Audio infra 26M clock
> +      - description: Mux for audio clock
> +      - description: Mux for audio internal bus clock
> +      - description: Mux main divider by 4
> +      - description: Primary audio mux
> +      - description: Primary audio PLL
> +      - description: Secondary audio mux
> +      - description: Secondary audio PLL
> +      - description: Primary audio en-generator clock
> +      - description: Primary PLL divider by 4 for IEC
> +      - description: Secondary audio en-generator clock
> +      - description: Secondary PLL divider by 4 for IEC
> +      - description: Mux selector for I2S port 0
> +      - description: Mux selector for I2S port 1
> +      - description: Mux selector for I2S port 2
> +      - description: Mux selector for I2S port 3
> +      - description: Mux selector for I2S port 4
> +      - description: Mux selector for I2S port 5
> +      - description: Mux selector for I2S port 6
> +      - description: Mux selector for I2S port 7
> +      - description: Mux selector for I2S port 8
> +      - description: Mux selector for I2S port 9
> +      - description: APLL1 and APLL2 divider for I2S port 0
> +      - description: APLL1 and APLL2 divider for I2S port 1
> +      - description: APLL1 and APLL2 divider for I2S port 2
> +      - description: APLL1 and APLL2 divider for I2S port 3
> +      - description: APLL1 and APLL2 divider for I2S port 4
> +      - description: APLL1 and APLL2 divider for IEC
> +      - description: APLL1 and APLL2 divider for I2S port 5
> +      - description: APLL1 and APLL2 divider for I2S port 6
> +      - description: APLL1 and APLL2 divider for I2S port 7
> +      - description: APLL1 and APLL2 divider for I2S port 8
> +      - description: APLL1 and APLL2 divider for I2S port 9
> +      - description: Top mux for audio subsystem
> +      - description: 26MHz clock for audio subsystem
>  
>    clock-names:
>      items:
>        - const: aud_afe_clk
>        - const: aud_dac_clk
>        - const: aud_dac_predis_clk
> +      - const: aud_adc_clk
> +      - const: aud_adda6_adc_clk
> +      - const: aud_apll22m_clk
> +      - const: aud_apll24m_clk
> +      - const: aud_apll1_tuner_clk
> +      - const: aud_apll2_tuner_clk
> +      - const: aud_tdm_clk
> +      - const: aud_tml_clk
> +      - const: aud_nle
> +      - const: aud_dac_hires_clk
> +      - const: aud_adc_hires_clk
> +      - const: aud_adc_hires_tml
> +      - const: aud_adda6_adc_hires_clk
> +      - const: aud_3rd_dac_clk
> +      - const: aud_3rd_dac_predis_clk
> +      - const: aud_3rd_dac_tml
> +      - const: aud_3rd_dac_hires_clk
>        - const: aud_infra_clk
>        - const: aud_infra_26m_clk
> +      - const: top_mux_audio
> +      - const: top_mux_audio_int
> +      - const: top_mainpll_d4_d4
> +      - const: top_mux_aud_1
> +      - const: top_apll1_ck
> +      - const: top_mux_aud_2
> +      - const: top_apll2_ck
> +      - const: top_mux_aud_eng1
> +      - const: top_apll1_d4
> +      - const: top_mux_aud_eng2
> +      - const: top_apll2_d4
> +      - const: top_i2s0_m_sel
> +      - const: top_i2s1_m_sel
> +      - const: top_i2s2_m_sel
> +      - const: top_i2s3_m_sel
> +      - const: top_i2s4_m_sel
> +      - const: top_i2s5_m_sel
> +      - const: top_i2s6_m_sel
> +      - const: top_i2s7_m_sel
> +      - const: top_i2s8_m_sel
> +      - const: top_i2s9_m_sel
> +      - const: top_apll12_div0
> +      - const: top_apll12_div1
> +      - const: top_apll12_div2
> +      - const: top_apll12_div3
> +      - const: top_apll12_div4
> +      - const: top_apll12_divb
> +      - const: top_apll12_div5
> +      - const: top_apll12_div6
> +      - const: top_apll12_div7
> +      - const: top_apll12_div8
> +      - const: top_apll12_div9
> +      - const: top_mux_audio_h
> +      - const: top_clk26m_clk
>  
>  required:
>    - compatible
> @@ -83,23 +185,69 @@ examples:
>      afe: mt8192-afe-pcm {
>          compatible = "mediatek,mt8192-audio";
>          interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&audsys CLK_AUD_AFE>, <&audsys CLK_AUD_DAC>,
> +                 <&audsys CLK_AUD_DAC_PREDIS>, <&audsys CLK_AUD_ADC>,
> +                 <&audsys CLK_AUD_ADDA6_ADC>, <&audsys CLK_AUD_22M>,
> +                 <&audsys CLK_AUD_24M>, <&audsys CLK_AUD_APLL_TUNER>,
> +                 <&audsys CLK_AUD_APLL2_TUNER>, <&audsys CLK_AUD_TDM>,
> +                 <&audsys CLK_AUD_TML>, <&audsys CLK_AUD_NLE>,
> +                 <&audsys CLK_AUD_DAC_HIRES>, <&audsys CLK_AUD_ADC_HIRES>,
> +                 <&audsys CLK_AUD_ADC_HIRES_TML>, <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
> +                 <&audsys CLK_AUD_3RD_DAC>, <&audsys CLK_AUD_3RD_DAC_PREDIS>,
> +                 <&audsys CLK_AUD_3RD_DAC_TML>, <&audsys CLK_AUD_3RD_DAC_HIRES>,
> +                 <&infracfg CLK_INFRA_AUDIO>, <&infracfg CLK_INFRA_AUDIO_26M_B>,
> +                 <&topckgen CLK_TOP_AUDIO_SEL>, <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
> +                 <&topckgen CLK_TOP_MAINPLL_D4_D4>, <&topckgen CLK_TOP_AUD_1_SEL>,
> +                 <&topckgen CLK_TOP_APLL1>, <&topckgen CLK_TOP_AUD_2_SEL>,
> +                 <&topckgen CLK_TOP_APLL2>, <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
> +                 <&topckgen CLK_TOP_APLL1_D4>, <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
> +                 <&topckgen CLK_TOP_APLL2_D4>, <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>, <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>, <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>, <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>, <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
> +                 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>, <&topckgen CLK_TOP_APLL12_DIV0>,
> +                 <&topckgen CLK_TOP_APLL12_DIV1>, <&topckgen CLK_TOP_APLL12_DIV2>,
> +                 <&topckgen CLK_TOP_APLL12_DIV3>, <&topckgen CLK_TOP_APLL12_DIV4>,
> +                 <&topckgen CLK_TOP_APLL12_DIVB>, <&topckgen CLK_TOP_APLL12_DIV5>,
> +                 <&topckgen CLK_TOP_APLL12_DIV6>, <&topckgen CLK_TOP_APLL12_DIV7>,
> +                 <&topckgen CLK_TOP_APLL12_DIV8>, <&topckgen CLK_TOP_APLL12_DIV9>,
> +                 <&topckgen CLK_TOP_AUDIO_H_SEL>, <&clk26m>;
> +        clock-names = "aud_afe_clk", "aud_dac_clk",
> +                      "aud_dac_predis_clk", "aud_adc_clk",
> +                      "aud_adda6_adc_clk", "aud_apll22m_clk",
> +                      "aud_apll24m_clk", "aud_apll1_tuner_clk",
> +                      "aud_apll2_tuner_clk", "aud_tdm_clk",
> +                      "aud_tml_clk", "aud_nle",
> +                      "aud_dac_hires_clk", "aud_adc_hires_clk",
> +                      "aud_adc_hires_tml", "aud_adda6_adc_hires_clk",
> +                      "aud_3rd_dac_clk", "aud_3rd_dac_predis_clk",
> +                      "aud_3rd_dac_tml", "aud_3rd_dac_hires_clk",
> +                      "aud_infra_clk", "aud_infra_26m_clk",
> +                      "top_mux_audio", "top_mux_audio_int",
> +                      "top_mainpll_d4_d4", "top_mux_aud_1",
> +                      "top_apll1_ck", "top_mux_aud_2",
> +                      "top_apll2_ck", "top_mux_aud_eng1",
> +                      "top_apll1_d4", "top_mux_aud_eng2",
> +                      "top_apll2_d4", "top_i2s0_m_sel",
> +                      "top_i2s1_m_sel", "top_i2s2_m_sel",
> +                      "top_i2s3_m_sel", "top_i2s4_m_sel",
> +                      "top_i2s5_m_sel", "top_i2s6_m_sel",
> +                      "top_i2s7_m_sel", "top_i2s8_m_sel",
> +                      "top_i2s9_m_sel", "top_apll12_div0",
> +                      "top_apll12_div1", "top_apll12_div2",
> +                      "top_apll12_div3", "top_apll12_div4",
> +                      "top_apll12_divb", "top_apll12_div5",
> +                      "top_apll12_div6", "top_apll12_div7",
> +                      "top_apll12_div8", "top_apll12_div9",
> +                      "top_mux_audio_h", "top_clk26m_clk";
> +        memory-region = <&afe_dma_mem>;
> +        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
>          resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
>          reset-names = "audiosys";
>          mediatek,apmixedsys = <&apmixedsys>;
>          mediatek,infracfg = <&infracfg>;
>          mediatek,topckgen = <&topckgen>;
> -        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
> -        clocks = <&audsys CLK_AUD_AFE>,
> -                 <&audsys CLK_AUD_DAC>,
> -                 <&audsys CLK_AUD_DAC_PREDIS>,
> -                 <&infracfg CLK_INFRA_AUDIO>,
> -                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
> -        clock-names = "aud_afe_clk",
> -                      "aud_dac_clk",
> -                      "aud_dac_predis_clk",
> -                      "aud_infra_clk",
> -                      "aud_infra_26m_clk";
> -        memory-region = <&afe_dma_mem>;
>      };
>  
>  ...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
