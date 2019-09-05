Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB7AC43331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C5B20CC7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 16:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XvDD6itp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HI5tWkpk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C5B20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cb1DxEE1IWHQKldWKuqIJhss2aw2BA7SNvVhp7P4L9g=; b=XvDD6itpM4SPW5J0cHML5xqu7G
	LjAfog0jNzhIRVOoqzHj1vMtxhymBrv/QpMv6nXEcGlC5e4lR8typUCKglUEKGe7BrT1C13Lli8WY
	xBMq5kRx/u9ircvSkuyZJHHs5FI17gXYftH8mlBrn7zzipYzivnkJ8rg9M+2pLVR6NR8XcR3K3N5Y
	x1sjFozstrK5MjfKT1goZ2rIZW7sA5hjhJCFObb4IIQElSjXL7NYh08gJwoqRGSau+x2OHu+9WOrg
	I2kB7FpPzoKa4b3HnvOyEfWaJjnNF6oTXPqBdVEMRfab85PLPsuAtFF2fsZcyeQvZAe/WgsUmyYKN
	EaqpDfiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5uTS-000295-Oi; Thu, 05 Sep 2019 16:19:06 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5uSW-0000t5-42
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 16:18:09 +0000
Received: by mail-pf1-x442.google.com with SMTP id s12so2071580pfe.6
 for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2019 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3Bt6nNLlt+xUVNaG8TogY6q5T68efSQtUAFTBH8Xlsg=;
 b=HI5tWkpkgDB2JApLY2ATp8wEzTgsgI7cUXG07/am8F65CP7VSB3lI0NXxyns+DWiX2
 gaWTANI3zq2OwmaBZXn99DM6sZThpLtoRKLYi5a2I85zG/SH7P8SCjVgftKwhY5ktFuA
 vJO992gbVyS1qZ7VJYG2btuxuSIAhhpNXMIqEzmVfiiabSsH0Mel1mVFYnYEbX7WVla8
 tN7UFY3JcIVURcYH4ZeeV0a1XoRM7rgtLWf0/zDA5+VHxMm9oxNpGTujIBcQCjB7dge2
 mpkITrf0/86JuXKn9lS53c6lBD7zg0AWMotgCzvCXmzDoFROpRfyCy8gCpdWJAq9a8Hw
 RNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3Bt6nNLlt+xUVNaG8TogY6q5T68efSQtUAFTBH8Xlsg=;
 b=pWVu4Ii9CjJ0si7dHF02zwTUdAAs+O5sZ+Kn3H2zEUbLrZrFiSmDDqkO0T7w4jBwJn
 TW5FSA/4eKCnHTjxitL2oluxAqOOo+8lbpU+nGor3hvXXBxSgG0eP/4iz3A/TFX3Z/68
 MPnXBGTCN4WnqvF1R5Xtq0IgbKaJmMdtfwsmyPE9Mmvscyu6GWuRi7CMImCTBXPDFEpF
 ELucHOlW2aoSgikPe65gKaOgryVICWEr6o+NdDk00IxsK+8ELemGTj7gwGxXHTjImajp
 W8kutZ6vrL+au9xlzz4xxTn38WARasHPuHC+YhJyr1uEevTWomqcuNDoP8dZIR6GDc2G
 u4Zg==
X-Gm-Message-State: APjAAAU96lsDw4IObmDiyex0bxM2ZmMNQx3P9lnBzh63ikM1192JixMP
 OcSWEY+DOuglscgkwqGbBix4VbwcnTs=
X-Google-Smtp-Source: APXvYqyeuaXfpPcMY8LL3N9SzaC/DWAxU9D1agyzvWDKKPe/Or/72DzL6TV62pYkRSpSy8AT7z2T/g==
X-Received: by 2002:a63:6686:: with SMTP id a128mr3841760pgc.361.1567700287353; 
 Thu, 05 Sep 2019 09:18:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 05/18] mfd: palmas: Assign the right powerhold mask
 for tps65917
Date: Thu,  5 Sep 2019 10:17:46 -0600
Message-Id: <20190905161759.28036-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_091808_173433_ADC79143 
X-CRM114-Status: GOOD (  10.38  )
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

From: Keerthy <j-keerthy@ti.com>

commit 572ff4d560be3784205b224cd67d6715620092d7 upstream

The powerhold mask for TPS65917 is different when comapred to
the other palmas versions. Hence assign the right mask that enables
power off of tps65917 pmic correctly.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/mfd/palmas.c       | 10 +++++++++-
 include/linux/mfd/palmas.h |  3 +++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index 3922a93f9f92..663a2398b6b1 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -430,6 +430,7 @@ static void palmas_power_off(void)
 {
 	unsigned int addr;
 	int ret, slave;
+	u8 powerhold_mask;
 	struct device_node *np = palmas_dev->dev->of_node;
 
 	if (of_property_read_bool(np, "ti,palmas-override-powerhold")) {
@@ -437,8 +438,15 @@ static void palmas_power_off(void)
 					  PALMAS_PRIMARY_SECONDARY_PAD2);
 		slave = PALMAS_BASE_TO_SLAVE(PALMAS_PU_PD_OD_BASE);
 
+		if (of_device_is_compatible(np, "ti,tps65917"))
+			powerhold_mask =
+				TPS65917_PRIMARY_SECONDARY_PAD2_GPIO_5_MASK;
+		else
+			powerhold_mask =
+				PALMAS_PRIMARY_SECONDARY_PAD2_GPIO_7_MASK;
+
 		ret = regmap_update_bits(palmas_dev->regmap[slave], addr,
-				PALMAS_PRIMARY_SECONDARY_PAD2_GPIO_7_MASK, 0);
+					 powerhold_mask, 0);
 		if (ret)
 			dev_err(palmas_dev->dev,
 				"Unable to write PRIMARY_SECONDARY_PAD2 %d\n",
diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
index 6dec43826303..cffb23b8bd70 100644
--- a/include/linux/mfd/palmas.h
+++ b/include/linux/mfd/palmas.h
@@ -3733,6 +3733,9 @@ enum usb_irq_events {
 #define TPS65917_REGEN3_CTRL_MODE_ACTIVE			0x01
 #define TPS65917_REGEN3_CTRL_MODE_ACTIVE_SHIFT			0x00
 
+/* POWERHOLD Mask field for PRIMARY_SECONDARY_PAD2 register */
+#define TPS65917_PRIMARY_SECONDARY_PAD2_GPIO_5_MASK		0xC
+
 /* Registers for function RESOURCE */
 #define TPS65917_REGEN1_CTRL					0x2
 #define TPS65917_PLLEN_CTRL					0x3
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
