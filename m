Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707B4D44C5C
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVRCcixfakoIbSzNGKUmYDfoCTL9dbE7Hi9hzqOPSGE=; b=fn+OF/1vsvKTQB
	cksXuP03XaUd7LNayP7SuilDsD2P1t2ljGcGYp4HKHU07XYwA1xfN0te2czVfjPq2KA7+AzIiLChP
	haOh87lPGXXrJTeKT4FNgm1CH7NZmLhVvb4RH9nxzsfI93lzdHrO3Wxd2VndRo8LsYmeoPrl5zT0r
	7E2RS1pHIiQHbSFU8Wh/d+eA/8JVZFAfoV9r7u/baEpBjk/WR0l8I9TU/zjzBs0RZde0OaAcw/Am0
	stK9qQOX/fX5aENMKVCZoj7uZEwPyZRoksaQyIBtTF2v4KrRDeLt7JUUpFlvFPwzqgp7+pO53mXh8
	2Gv5DRhz74UpGFYbh5Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOcE-0000000CWMb-2v1S;
	Thu, 15 Jan 2026 14:46:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOcB-0000000CWLw-134A;
	Thu, 15 Jan 2026 14:46:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768488380;
	bh=jj97+Ps1LFlcOetqgPF2yqCP0vAX9DGF0PsamF0O6ys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iyvHDksdgHMVpY0GgTUbNVDq1NnY/xck9IKdaWo6Ag1YX6SFMrbZ2RRG7BLt83Uwy
	 4xJdC3geHTdhzfMndGNVFtgsycJfY71AMjnzVJX+6kgZ9AjOZv1aVJL8LH0mhyK7+r
	 xn1oh+h93TqSg86bp9LU3QNunqM8IoKwEtRExGIP07tb19NlZQr+qY9eDAVc8NKy8S
	 pBGeO8fsYdWnhXDMr63YtIcESRU6LwCvsDam5RfQtiIaShHj+k7Tv0jAkNWe6bMFP3
	 5VDLiWgKJJTIJ9zVNMQ63rhO2MrjI2AkGxFy5oLDwcK4diJiR3dM5ICDbUqjcblucf
	 mzPYrzcE6Ia7w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CCDD17E0CB0;
	Thu, 15 Jan 2026 15:46:19 +0100 (CET)
Message-ID: <9bb24b4a-248d-4a97-a9fc-a00b5237f548@collabora.com>
Date: Thu, 15 Jan 2026 15:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
To: Eugen Hristev <eugen.hristev@linaro.org>
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
 <e1ed2a68-683c-4235-890b-9b2c5ad93e38@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e1ed2a68-683c-4235-890b-9b2c5ad93e38@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_064623_666874_01D3C9B1 
X-CRM114-Status: GOOD (  15.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Il 15/01/26 14:28, Eugen Hristev ha scritto:
> 
> 
> On 1/15/26 14:56, AngeloGioacchino Del Regno wrote:
>> Both clocks and clock-names are missing (a lot of) entries: add
>> all the used audio clocks and their description and also fix the
>> example node.
> 
> Hi Angelo,
> 
> This does not really look like a fix, if it was a fix I would expect a
> Fixes tag, otherwise, it looks like you are adding a lot of clocks which
> were not defined before
> 
> Eugen

Hey. Yes, right, that makes sense.

I wonder if the Fixes tag can be added while applying.

In case...


Fixes: c861af7861aa ("ASoC: dt-bindings: mediatek: mt8192: re-add audio afe document")

Cheers,
Angelo

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
>>   1 file changed, 162 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
>> index 8ddf49b0040d..16ae3328f70d 100644
>> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
>> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
>> @@ -47,16 +47,118 @@ properties:
>>         - description: AFE clock
>>         - description: ADDA DAC clock
>>         - description: ADDA DAC pre-distortion clock
>> -      - description: audio infra sys clock
>> -      - description: audio infra 26M clock
>> +      - description: ADDA ADC clock
>> +      - description: ADDA6 ADC clock
>> +      - description: Audio low-jitter 22.5792m clock
>> +      - description: Audio low-jitter 24.576m clock
>> +      - description: Audio PLL1 tuner clock
>> +      - description: Audio PLL2 tuner clock
>> +      - description: Audio Time-Division Multiplexing interface clock
>> +      - description: ADDA ADC Sine Generator clock
>> +      - description: audio Non-LE clock
>> +      - description: Audio DAC High-Resolution clock
>> +      - description: Audio High-Resolution ADC clock
>> +      - description: Audio High-Resolution ADC SineGen clock
>> +      - description: Audio ADDA6 High-Resolution ADC clock
>> +      - description: Tertiary ADDA DAC clock
>> +      - description: Tertiary ADDA DAC pre-distortion clock
>> +      - description: Tertiary ADDA DAC Sine Generator clock
>> +      - description: Tertiary ADDA DAC High-Resolution clock
>> +      - description: Audio infra sys clock
>> +      - description: Audio infra 26M clock
>> +      - description: Mux for audio clock
>> +      - description: Mux for audio internal bus clock
>> +      - description: Mux main divider by 4
>> +      - description: Primary audio mux
>> +      - description: Primary audio PLL
>> +      - description: Secondary audio mux
>> +      - description: Secondary audio PLL
>> +      - description: Primary audio en-generator clock
>> +      - description: Primary PLL divider by 4 for IEC
>> +      - description: Secondary audio en-generator clock
>> +      - description: Secondary PLL divider by 4 for IEC
>> +      - description: Mux selector for I2S port 0
>> +      - description: Mux selector for I2S port 1
>> +      - description: Mux selector for I2S port 2
>> +      - description: Mux selector for I2S port 3
>> +      - description: Mux selector for I2S port 4
>> +      - description: Mux selector for I2S port 5
>> +      - description: Mux selector for I2S port 6
>> +      - description: Mux selector for I2S port 7
>> +      - description: Mux selector for I2S port 8
>> +      - description: Mux selector for I2S port 9
>> +      - description: APLL1 and APLL2 divider for I2S port 0
>> +      - description: APLL1 and APLL2 divider for I2S port 1
>> +      - description: APLL1 and APLL2 divider for I2S port 2
>> +      - description: APLL1 and APLL2 divider for I2S port 3
>> +      - description: APLL1 and APLL2 divider for I2S port 4
>> +      - description: APLL1 and APLL2 divider for IEC
>> +      - description: APLL1 and APLL2 divider for I2S port 5
>> +      - description: APLL1 and APLL2 divider for I2S port 6
>> +      - description: APLL1 and APLL2 divider for I2S port 7
>> +      - description: APLL1 and APLL2 divider for I2S port 8
>> +      - description: APLL1 and APLL2 divider for I2S port 9
>> +      - description: Top mux for audio subsystem
>> +      - description: 26MHz clock for audio subsystem
>>   
>>     clock-names:
>>       items:
>>         - const: aud_afe_clk
>>         - const: aud_dac_clk
>>         - const: aud_dac_predis_clk
>> +      - const: aud_adc_clk
>> +      - const: aud_adda6_adc_clk
>> +      - const: aud_apll22m_clk
>> +      - const: aud_apll24m_clk
>> +      - const: aud_apll1_tuner_clk
>> +      - const: aud_apll2_tuner_clk
>> +      - const: aud_tdm_clk
>> +      - const: aud_tml_clk
>> +      - const: aud_nle
>> +      - const: aud_dac_hires_clk
>> +      - const: aud_adc_hires_clk
>> +      - const: aud_adc_hires_tml
>> +      - const: aud_adda6_adc_hires_clk
>> +      - const: aud_3rd_dac_clk
>> +      - const: aud_3rd_dac_predis_clk
>> +      - const: aud_3rd_dac_tml
>> +      - const: aud_3rd_dac_hires_clk
>>         - const: aud_infra_clk
>>         - const: aud_infra_26m_clk
>> +      - const: top_mux_audio
>> +      - const: top_mux_audio_int
>> +      - const: top_mainpll_d4_d4
>> +      - const: top_mux_aud_1
>> +      - const: top_apll1_ck
>> +      - const: top_mux_aud_2
>> +      - const: top_apll2_ck
>> +      - const: top_mux_aud_eng1
>> +      - const: top_apll1_d4
>> +      - const: top_mux_aud_eng2
>> +      - const: top_apll2_d4
>> +      - const: top_i2s0_m_sel
>> +      - const: top_i2s1_m_sel
>> +      - const: top_i2s2_m_sel
>> +      - const: top_i2s3_m_sel
>> +      - const: top_i2s4_m_sel
>> +      - const: top_i2s5_m_sel
>> +      - const: top_i2s6_m_sel
>> +      - const: top_i2s7_m_sel
>> +      - const: top_i2s8_m_sel
>> +      - const: top_i2s9_m_sel
>> +      - const: top_apll12_div0
>> +      - const: top_apll12_div1
>> +      - const: top_apll12_div2
>> +      - const: top_apll12_div3
>> +      - const: top_apll12_div4
>> +      - const: top_apll12_divb
>> +      - const: top_apll12_div5
>> +      - const: top_apll12_div6
>> +      - const: top_apll12_div7
>> +      - const: top_apll12_div8
>> +      - const: top_apll12_div9
>> +      - const: top_mux_audio_h
>> +      - const: top_clk26m_clk
>>   
>>   required:
>>     - compatible
>> @@ -83,23 +185,69 @@ examples:
>>       afe: mt8192-afe-pcm {
>>           compatible = "mediatek,mt8192-audio";
>>           interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&audsys CLK_AUD_AFE>, <&audsys CLK_AUD_DAC>,
>> +                 <&audsys CLK_AUD_DAC_PREDIS>, <&audsys CLK_AUD_ADC>,
>> +                 <&audsys CLK_AUD_ADDA6_ADC>, <&audsys CLK_AUD_22M>,
>> +                 <&audsys CLK_AUD_24M>, <&audsys CLK_AUD_APLL_TUNER>,
>> +                 <&audsys CLK_AUD_APLL2_TUNER>, <&audsys CLK_AUD_TDM>,
>> +                 <&audsys CLK_AUD_TML>, <&audsys CLK_AUD_NLE>,
>> +                 <&audsys CLK_AUD_DAC_HIRES>, <&audsys CLK_AUD_ADC_HIRES>,
>> +                 <&audsys CLK_AUD_ADC_HIRES_TML>, <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
>> +                 <&audsys CLK_AUD_3RD_DAC>, <&audsys CLK_AUD_3RD_DAC_PREDIS>,
>> +                 <&audsys CLK_AUD_3RD_DAC_TML>, <&audsys CLK_AUD_3RD_DAC_HIRES>,
>> +                 <&infracfg CLK_INFRA_AUDIO>, <&infracfg CLK_INFRA_AUDIO_26M_B>,
>> +                 <&topckgen CLK_TOP_AUDIO_SEL>, <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
>> +                 <&topckgen CLK_TOP_MAINPLL_D4_D4>, <&topckgen CLK_TOP_AUD_1_SEL>,
>> +                 <&topckgen CLK_TOP_APLL1>, <&topckgen CLK_TOP_AUD_2_SEL>,
>> +                 <&topckgen CLK_TOP_APLL2>, <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
>> +                 <&topckgen CLK_TOP_APLL1_D4>, <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
>> +                 <&topckgen CLK_TOP_APLL2_D4>, <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
>> +                 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>, <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
>> +                 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>, <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
>> +                 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>, <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
>> +                 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>, <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
>> +                 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>, <&topckgen CLK_TOP_APLL12_DIV0>,
>> +                 <&topckgen CLK_TOP_APLL12_DIV1>, <&topckgen CLK_TOP_APLL12_DIV2>,
>> +                 <&topckgen CLK_TOP_APLL12_DIV3>, <&topckgen CLK_TOP_APLL12_DIV4>,
>> +                 <&topckgen CLK_TOP_APLL12_DIVB>, <&topckgen CLK_TOP_APLL12_DIV5>,
>> +                 <&topckgen CLK_TOP_APLL12_DIV6>, <&topckgen CLK_TOP_APLL12_DIV7>,
>> +                 <&topckgen CLK_TOP_APLL12_DIV8>, <&topckgen CLK_TOP_APLL12_DIV9>,
>> +                 <&topckgen CLK_TOP_AUDIO_H_SEL>, <&clk26m>;
>> +        clock-names = "aud_afe_clk", "aud_dac_clk",
>> +                      "aud_dac_predis_clk", "aud_adc_clk",
>> +                      "aud_adda6_adc_clk", "aud_apll22m_clk",
>> +                      "aud_apll24m_clk", "aud_apll1_tuner_clk",
>> +                      "aud_apll2_tuner_clk", "aud_tdm_clk",
>> +                      "aud_tml_clk", "aud_nle",
>> +                      "aud_dac_hires_clk", "aud_adc_hires_clk",
>> +                      "aud_adc_hires_tml", "aud_adda6_adc_hires_clk",
>> +                      "aud_3rd_dac_clk", "aud_3rd_dac_predis_clk",
>> +                      "aud_3rd_dac_tml", "aud_3rd_dac_hires_clk",
>> +                      "aud_infra_clk", "aud_infra_26m_clk",
>> +                      "top_mux_audio", "top_mux_audio_int",
>> +                      "top_mainpll_d4_d4", "top_mux_aud_1",
>> +                      "top_apll1_ck", "top_mux_aud_2",
>> +                      "top_apll2_ck", "top_mux_aud_eng1",
>> +                      "top_apll1_d4", "top_mux_aud_eng2",
>> +                      "top_apll2_d4", "top_i2s0_m_sel",
>> +                      "top_i2s1_m_sel", "top_i2s2_m_sel",
>> +                      "top_i2s3_m_sel", "top_i2s4_m_sel",
>> +                      "top_i2s5_m_sel", "top_i2s6_m_sel",
>> +                      "top_i2s7_m_sel", "top_i2s8_m_sel",
>> +                      "top_i2s9_m_sel", "top_apll12_div0",
>> +                      "top_apll12_div1", "top_apll12_div2",
>> +                      "top_apll12_div3", "top_apll12_div4",
>> +                      "top_apll12_divb", "top_apll12_div5",
>> +                      "top_apll12_div6", "top_apll12_div7",
>> +                      "top_apll12_div8", "top_apll12_div9",
>> +                      "top_mux_audio_h", "top_clk26m_clk";
>> +        memory-region = <&afe_dma_mem>;
>> +        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
>>           resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
>>           reset-names = "audiosys";
>>           mediatek,apmixedsys = <&apmixedsys>;
>>           mediatek,infracfg = <&infracfg>;
>>           mediatek,topckgen = <&topckgen>;
>> -        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
>> -        clocks = <&audsys CLK_AUD_AFE>,
>> -                 <&audsys CLK_AUD_DAC>,
>> -                 <&audsys CLK_AUD_DAC_PREDIS>,
>> -                 <&infracfg CLK_INFRA_AUDIO>,
>> -                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
>> -        clock-names = "aud_afe_clk",
>> -                      "aud_dac_clk",
>> -                      "aud_dac_predis_clk",
>> -                      "aud_infra_clk",
>> -                      "aud_infra_26m_clk";
>> -        memory-region = <&afe_dma_mem>;
>>       };
>>   
>>   ...
> 


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
