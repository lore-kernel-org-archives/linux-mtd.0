Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91538D44C44
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4Cr0Qg+cUA3kpDl7XXb6TDJ927BHlY++IYwFhhGnfo=; b=sY+vlGCQRC/xeC
	CCjam8LaBR1kJQuBqZ1SeVo1XBBogABJa+TjurSmsv/lqJjd//OUOnOUqZQbyqQjXupLefAsOFIkB
	ylOr5EdCxkTZb/2jKzqgOLTqPuA1K7FGe2UQpFswNBAu/qKDcyswWDlgsOCkaVicvYyYOEvZOc7ai
	s1Cg5aRH6k2seyJAIQn2F0wo3tMRkT6gfsJFdLbk8By+skdKZh1bea78ITS2DZU47WO0njkdv9iUE
	Wt6Hdg6c6Na0hbUVM0PSl/DjZjOVwgqVtHKXH7fPHNGmX0AcA0AatmuFtkvdi0yhKNKdrj5lPYfhH
	17XFjUdwNzClFJB+YXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuH-0000000CMVi-25pz;
	Thu, 15 Jan 2026 12:56:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgMuC-0000000CMQV-1WtL;
	Thu, 15 Jan 2026 12:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481809;
	bh=ij+2/xT0i/DoFW7FxfCJXcT/tjhq17PWimE3fp7QbIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H1H3Wx8IM+qm3v9y+JUnLd4IuvBfDhb87DHI7Tvchu+5xuzXWhDODvvP1cOIT/qVw
	 Yn+0A67aAC/sxZw4TNPXeXshIPCQio2SawHBdDT36gaCogjcPSx/TFyspXtG3hsWPu
	 u1x3oigL8BqznjNaVohErhtqAt3xBLdYS9YQaCkj2OzKve6QzasD+lpP8N9FaC0dGj
	 7vrt5utCvcvFCnHNqSlsL9yvyFFHA10qC//35Q8EuEHaFnvnt4D2yYrXmOe3vlVRNF
	 gjfIX2ypYdmY/8H93o3OblLktBUpJVtxzmIhLbSe4djyf2H8kpdmFQW7SH9hUDhgCQ
	 l+VKcSKnRvChA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8790117E137B;
	Thu, 15 Jan 2026 13:56:48 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	julien.massot@collabora.com,
	eugen.hristev@linaro.org,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
Date: Thu, 15 Jan 2026 13:56:22 +0100
Message-ID: <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_045652_563871_4B3CFE18 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Both clocks and clock-names are missing (a lot of) entries: add
all the used audio clocks and their description and also fix the
example node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
 1 file changed, 162 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 8ddf49b0040d..16ae3328f70d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -47,16 +47,118 @@ properties:
       - description: AFE clock
       - description: ADDA DAC clock
       - description: ADDA DAC pre-distortion clock
-      - description: audio infra sys clock
-      - description: audio infra 26M clock
+      - description: ADDA ADC clock
+      - description: ADDA6 ADC clock
+      - description: Audio low-jitter 22.5792m clock
+      - description: Audio low-jitter 24.576m clock
+      - description: Audio PLL1 tuner clock
+      - description: Audio PLL2 tuner clock
+      - description: Audio Time-Division Multiplexing interface clock
+      - description: ADDA ADC Sine Generator clock
+      - description: audio Non-LE clock
+      - description: Audio DAC High-Resolution clock
+      - description: Audio High-Resolution ADC clock
+      - description: Audio High-Resolution ADC SineGen clock
+      - description: Audio ADDA6 High-Resolution ADC clock
+      - description: Tertiary ADDA DAC clock
+      - description: Tertiary ADDA DAC pre-distortion clock
+      - description: Tertiary ADDA DAC Sine Generator clock
+      - description: Tertiary ADDA DAC High-Resolution clock
+      - description: Audio infra sys clock
+      - description: Audio infra 26M clock
+      - description: Mux for audio clock
+      - description: Mux for audio internal bus clock
+      - description: Mux main divider by 4
+      - description: Primary audio mux
+      - description: Primary audio PLL
+      - description: Secondary audio mux
+      - description: Secondary audio PLL
+      - description: Primary audio en-generator clock
+      - description: Primary PLL divider by 4 for IEC
+      - description: Secondary audio en-generator clock
+      - description: Secondary PLL divider by 4 for IEC
+      - description: Mux selector for I2S port 0
+      - description: Mux selector for I2S port 1
+      - description: Mux selector for I2S port 2
+      - description: Mux selector for I2S port 3
+      - description: Mux selector for I2S port 4
+      - description: Mux selector for I2S port 5
+      - description: Mux selector for I2S port 6
+      - description: Mux selector for I2S port 7
+      - description: Mux selector for I2S port 8
+      - description: Mux selector for I2S port 9
+      - description: APLL1 and APLL2 divider for I2S port 0
+      - description: APLL1 and APLL2 divider for I2S port 1
+      - description: APLL1 and APLL2 divider for I2S port 2
+      - description: APLL1 and APLL2 divider for I2S port 3
+      - description: APLL1 and APLL2 divider for I2S port 4
+      - description: APLL1 and APLL2 divider for IEC
+      - description: APLL1 and APLL2 divider for I2S port 5
+      - description: APLL1 and APLL2 divider for I2S port 6
+      - description: APLL1 and APLL2 divider for I2S port 7
+      - description: APLL1 and APLL2 divider for I2S port 8
+      - description: APLL1 and APLL2 divider for I2S port 9
+      - description: Top mux for audio subsystem
+      - description: 26MHz clock for audio subsystem
 
   clock-names:
     items:
       - const: aud_afe_clk
       - const: aud_dac_clk
       - const: aud_dac_predis_clk
+      - const: aud_adc_clk
+      - const: aud_adda6_adc_clk
+      - const: aud_apll22m_clk
+      - const: aud_apll24m_clk
+      - const: aud_apll1_tuner_clk
+      - const: aud_apll2_tuner_clk
+      - const: aud_tdm_clk
+      - const: aud_tml_clk
+      - const: aud_nle
+      - const: aud_dac_hires_clk
+      - const: aud_adc_hires_clk
+      - const: aud_adc_hires_tml
+      - const: aud_adda6_adc_hires_clk
+      - const: aud_3rd_dac_clk
+      - const: aud_3rd_dac_predis_clk
+      - const: aud_3rd_dac_tml
+      - const: aud_3rd_dac_hires_clk
       - const: aud_infra_clk
       - const: aud_infra_26m_clk
+      - const: top_mux_audio
+      - const: top_mux_audio_int
+      - const: top_mainpll_d4_d4
+      - const: top_mux_aud_1
+      - const: top_apll1_ck
+      - const: top_mux_aud_2
+      - const: top_apll2_ck
+      - const: top_mux_aud_eng1
+      - const: top_apll1_d4
+      - const: top_mux_aud_eng2
+      - const: top_apll2_d4
+      - const: top_i2s0_m_sel
+      - const: top_i2s1_m_sel
+      - const: top_i2s2_m_sel
+      - const: top_i2s3_m_sel
+      - const: top_i2s4_m_sel
+      - const: top_i2s5_m_sel
+      - const: top_i2s6_m_sel
+      - const: top_i2s7_m_sel
+      - const: top_i2s8_m_sel
+      - const: top_i2s9_m_sel
+      - const: top_apll12_div0
+      - const: top_apll12_div1
+      - const: top_apll12_div2
+      - const: top_apll12_div3
+      - const: top_apll12_div4
+      - const: top_apll12_divb
+      - const: top_apll12_div5
+      - const: top_apll12_div6
+      - const: top_apll12_div7
+      - const: top_apll12_div8
+      - const: top_apll12_div9
+      - const: top_mux_audio_h
+      - const: top_clk26m_clk
 
 required:
   - compatible
@@ -83,23 +185,69 @@ examples:
     afe: mt8192-afe-pcm {
         compatible = "mediatek,mt8192-audio";
         interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audsys CLK_AUD_AFE>, <&audsys CLK_AUD_DAC>,
+                 <&audsys CLK_AUD_DAC_PREDIS>, <&audsys CLK_AUD_ADC>,
+                 <&audsys CLK_AUD_ADDA6_ADC>, <&audsys CLK_AUD_22M>,
+                 <&audsys CLK_AUD_24M>, <&audsys CLK_AUD_APLL_TUNER>,
+                 <&audsys CLK_AUD_APLL2_TUNER>, <&audsys CLK_AUD_TDM>,
+                 <&audsys CLK_AUD_TML>, <&audsys CLK_AUD_NLE>,
+                 <&audsys CLK_AUD_DAC_HIRES>, <&audsys CLK_AUD_ADC_HIRES>,
+                 <&audsys CLK_AUD_ADC_HIRES_TML>, <&audsys CLK_AUD_ADDA6_ADC_HIRES>,
+                 <&audsys CLK_AUD_3RD_DAC>, <&audsys CLK_AUD_3RD_DAC_PREDIS>,
+                 <&audsys CLK_AUD_3RD_DAC_TML>, <&audsys CLK_AUD_3RD_DAC_HIRES>,
+                 <&infracfg CLK_INFRA_AUDIO>, <&infracfg CLK_INFRA_AUDIO_26M_B>,
+                 <&topckgen CLK_TOP_AUDIO_SEL>, <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+                 <&topckgen CLK_TOP_MAINPLL_D4_D4>, <&topckgen CLK_TOP_AUD_1_SEL>,
+                 <&topckgen CLK_TOP_APLL1>, <&topckgen CLK_TOP_AUD_2_SEL>,
+                 <&topckgen CLK_TOP_APLL2>, <&topckgen CLK_TOP_AUD_ENGEN1_SEL>,
+                 <&topckgen CLK_TOP_APLL1_D4>, <&topckgen CLK_TOP_AUD_ENGEN2_SEL>,
+                 <&topckgen CLK_TOP_APLL2_D4>, <&topckgen CLK_TOP_APLL_I2S0_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S1_M_SEL>, <&topckgen CLK_TOP_APLL_I2S2_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S3_M_SEL>, <&topckgen CLK_TOP_APLL_I2S4_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S5_M_SEL>, <&topckgen CLK_TOP_APLL_I2S6_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S7_M_SEL>, <&topckgen CLK_TOP_APLL_I2S8_M_SEL>,
+                 <&topckgen CLK_TOP_APLL_I2S9_M_SEL>, <&topckgen CLK_TOP_APLL12_DIV0>,
+                 <&topckgen CLK_TOP_APLL12_DIV1>, <&topckgen CLK_TOP_APLL12_DIV2>,
+                 <&topckgen CLK_TOP_APLL12_DIV3>, <&topckgen CLK_TOP_APLL12_DIV4>,
+                 <&topckgen CLK_TOP_APLL12_DIVB>, <&topckgen CLK_TOP_APLL12_DIV5>,
+                 <&topckgen CLK_TOP_APLL12_DIV6>, <&topckgen CLK_TOP_APLL12_DIV7>,
+                 <&topckgen CLK_TOP_APLL12_DIV8>, <&topckgen CLK_TOP_APLL12_DIV9>,
+                 <&topckgen CLK_TOP_AUDIO_H_SEL>, <&clk26m>;
+        clock-names = "aud_afe_clk", "aud_dac_clk",
+                      "aud_dac_predis_clk", "aud_adc_clk",
+                      "aud_adda6_adc_clk", "aud_apll22m_clk",
+                      "aud_apll24m_clk", "aud_apll1_tuner_clk",
+                      "aud_apll2_tuner_clk", "aud_tdm_clk",
+                      "aud_tml_clk", "aud_nle",
+                      "aud_dac_hires_clk", "aud_adc_hires_clk",
+                      "aud_adc_hires_tml", "aud_adda6_adc_hires_clk",
+                      "aud_3rd_dac_clk", "aud_3rd_dac_predis_clk",
+                      "aud_3rd_dac_tml", "aud_3rd_dac_hires_clk",
+                      "aud_infra_clk", "aud_infra_26m_clk",
+                      "top_mux_audio", "top_mux_audio_int",
+                      "top_mainpll_d4_d4", "top_mux_aud_1",
+                      "top_apll1_ck", "top_mux_aud_2",
+                      "top_apll2_ck", "top_mux_aud_eng1",
+                      "top_apll1_d4", "top_mux_aud_eng2",
+                      "top_apll2_d4", "top_i2s0_m_sel",
+                      "top_i2s1_m_sel", "top_i2s2_m_sel",
+                      "top_i2s3_m_sel", "top_i2s4_m_sel",
+                      "top_i2s5_m_sel", "top_i2s6_m_sel",
+                      "top_i2s7_m_sel", "top_i2s8_m_sel",
+                      "top_i2s9_m_sel", "top_apll12_div0",
+                      "top_apll12_div1", "top_apll12_div2",
+                      "top_apll12_div3", "top_apll12_div4",
+                      "top_apll12_divb", "top_apll12_div5",
+                      "top_apll12_div6", "top_apll12_div7",
+                      "top_apll12_div8", "top_apll12_div9",
+                      "top_mux_audio_h", "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
+        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
         resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
         reset-names = "audiosys";
         mediatek,apmixedsys = <&apmixedsys>;
         mediatek,infracfg = <&infracfg>;
         mediatek,topckgen = <&topckgen>;
-        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
-        clocks = <&audsys CLK_AUD_AFE>,
-                 <&audsys CLK_AUD_DAC>,
-                 <&audsys CLK_AUD_DAC_PREDIS>,
-                 <&infracfg CLK_INFRA_AUDIO>,
-                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
-        clock-names = "aud_afe_clk",
-                      "aud_dac_clk",
-                      "aud_dac_predis_clk",
-                      "aud_infra_clk",
-                      "aud_infra_26m_clk";
-        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
