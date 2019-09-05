Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA13C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C6BD20870
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D65NNRJi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DhtZCS6p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C6BD20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M87R1B83CdvCffRmdlG/Mhks+Wha362vswolhcqWNWM=; b=D65NNRJiCh/MHqtxQnfb7cnnPz
	o75RXiyghXQuuQfir2++HEoNIBdLRVETJe98qkdh7pEB3z8SwI/nZNj66mH6dBGeqpyIIyQMkDOQc
	cTvKmMC9OSrDoSenFiwdu0dwZ7LfqDN/CcGNiT11BMud4wZgPC2GnEt3DX3zosB2xIhxqx4LYXBUC
	IFxB5AG5Hsu10gsTWjR/bibPTwh1bUWB9Azecd/bcB4KDvPRZiUOwTyXZLEOKfDWV0l85OBdYXJ18
	E1ksjNeJG//PVjQGuU9WGwuuusTp83PCliYeQD5caF+oS0EolpYPlv3ocySp3p8uQH+fZPzKeve8S
	9qr3d8AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uTf-0002OV-Qt; Thu, 05 Sep 2019 16:19:19 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSX-0000vA-4c
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:10 +0000
Received: by mail-pf1-x444.google.com with SMTP id h195so2075742pfe.5
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rjuaqfgsXjJPwAACoDEoQUxKOEl2ZmoHXoDNdOHfK/8=;
 b=DhtZCS6pEqVXAANTeuPn229D+BZX3X67QaHqNgnEKoio/f3XFGIKudVgM5FDU+7o8L
 nQ6C8zCJpGUG562Tdrhhk+jzdjUxPEUMlyMrosXluqm8s7BPYWWQ2Sfl8GPdcyN3+vz3
 WgC0nx5vQPM/ac0gkVSlnhW9uet9jY41HdO0XoqnQ4dQQgwZRDvRXdAX5pdKiXWoz78p
 gJ/gB20nx7nFBvvCBuWrSZgl46CenVN2LnP6ZluOUqhvk/2lQx7TA+V1EqPfUJ0tOjn4
 d9umZlIflwKbjOrolidHP4+2mwXkt5JzsO/HIsQg2gt2s/+L0G/cpcGqNlGMyilyzdUy
 uaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rjuaqfgsXjJPwAACoDEoQUxKOEl2ZmoHXoDNdOHfK/8=;
 b=ujnxEjKSRG/xoEwbtwm8HHmDIqeZN5tW+wETkD3cBvXrkKBdWEPmA7IBPYiuFRHbRo
 D+BKydYSpdBBkXnLA2/PkRl7iZoF1Im6Dw4auYIvqk7TU2YRLKUoEim8UpkNlE3L93wl
 OdrnR0kSy2WIK8I1O6b6mm1GtElPq4rmSQWqop/adJFXwmLJNxjQ1htlaDnJudxdbhrg
 LlCiLTzlHeja7HseuD07eEfP+0W064BOAyntybSluGoCRPFo0VzkTNg2JxvEotL9d6Ua
 ui6vUji1FeJH3oEH9erX53uiEXwl525cvCVbrGq4O+FwpNur1d5Fw8qhLoZJQ06iRzHw
 DrHw==
X-Gm-Message-State: APjAAAUoMKMa7gUOxDXOqOdrHo6VE7IfHbrUyflQG2O5k7UIAb4tiN32
 7vwdAFSIYaVI+Xzjj5/+0KFzJA==
X-Google-Smtp-Source: APXvYqwjC/u78z/zaGM+j2+m/kS1EooYMEgWtfeDDH4gvURdMNHJyy5MyPkUpGOGmsnrWffGg8MToQ==
X-Received: by 2002:a63:394:: with SMTP id 142mr3929328pgd.43.1567700288547;
 Thu, 05 Sep 2019 09:18:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:08 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 06/18] ASoC: tlv320aic31xx: Handle inverted BCLK in
 non-DSP modes
Date: Thu,  5 Sep 2019 10:17:47 -0600
Message-Id: <20190905161759.28036-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091809_306011_CBDDDEA2 
X-CRM114-Status: GOOD (  11.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: "Andrew F. Davis" <afd@ti.com>

commit dcb407b257af06fa58b0544ec01ec9e0d3927e02 upstream

Currently BCLK inverting is only handled when the DAI format is
DSP, but the BCLK may be inverted in any supported mode. Without
this using this CODEC in any other mode than DSP with the BCLK
inverted leads to bad sampling timing and very poor audio quality.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 54a87a905eb6..d3bd0bf15ddb 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -924,6 +924,18 @@ static int aic31xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 		return -EINVAL;
 	}
 
+	/* signal polarity */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		iface_reg2 |= AIC31XX_BCLKINV_MASK;
+		break;
+	default:
+		dev_err(codec->dev, "Invalid DAI clock signal polarity\n");
+		return -EINVAL;
+	}
+
 	/* interface format */
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -931,16 +943,12 @@ static int aic31xx_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	case SND_SOC_DAIFMT_DSP_A:
 		dsp_a_val = 0x1;
 	case SND_SOC_DAIFMT_DSP_B:
-		/* NOTE: BCLKINV bit value 1 equas NB and 0 equals IB */
-		switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-		case SND_SOC_DAIFMT_NB_NF:
-			iface_reg2 |= AIC31XX_BCLKINV_MASK;
-			break;
-		case SND_SOC_DAIFMT_IB_NF:
-			break;
-		default:
-			return -EINVAL;
-		}
+		/*
+		 * NOTE: This CODEC samples on the falling edge of BCLK in
+		 * DSP mode, this is inverted compared to what most DAIs
+		 * expect, so we invert for this mode
+		 */
+		iface_reg2 ^= AIC31XX_BCLKINV_MASK;
 		iface_reg1 |= (AIC31XX_DSP_MODE <<
 			       AIC31XX_IFACE1_DATATYPE_SHIFT);
 		break;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
