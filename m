Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B0BC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 22:34:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 059A120989
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 22:34:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vCELDcg2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkcXvtFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 059A120989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGD9SWh729qgsLY2nOxNZQGsqsL4JV0is1BBENiMQrQ=; b=vCELDcg2/xcK4U
	33afwqAPWO/7cgWAwFTD+ycxlCZYIsn0ZsxzGKyegMwcixmE+hLoGvkQTRpPXp4KGikvAp1kmMvmm
	2ehAXxVKHcccy7B6EkApqiOIrknRNg75vQ3EZPjEL26pg1pc5CF3NjEPOuHHdGfjJDRYCPWp1LPTq
	Wd77GMKPr1cnmlyKpITpxtW52cvr/LmOoKEDcSzW1sAEdYpWWYBLy3u0rkfNd5IAl7JzIVZO+GSzT
	E7qXeTtWX7utZXdj0lxt8X8bewVAlRBu9SJo+BhYrakKOisqnWIG9WZZJSJVQeKCvJhOQYW6wm2h9
	f4MHbqCIwOJefDciJa8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8BhQ-0000mR-6W; Sun, 24 Mar 2019 22:34:40 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8BhH-0000fH-Fw; Sun, 24 Mar 2019 22:34:33 +0000
Received: by mail-lj1-x243.google.com with SMTP id y6so6108045ljd.12;
 Sun, 24 Mar 2019 15:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jo46dSpvZSN1TN7vD8NpGaggh1SE8FrmPLyEYV3JD/Y=;
 b=MkcXvtFjLvU0+Or9yc3L+Epwks0AgedL9rcDQQrKq9TGR6llz1b5hsz4mZaOGyH95c
 bgLNiMi84HSntOgV0PRgQ8JFffvZY2mYAck4EYCFz+Hb4jg/XF1m4PzDxiuIL0c3e1se
 R5qmu3by1qggAfd09pf2mgNlA9fETu4FN4b4mZO0AOgZmeYnMAsg+uTprJLzW95J7k+4
 RFu+9Gh28inRQplofEF1nk43nKmwJM0WxbMYHk3ZmTelfgQzT5EMGKqFzPpA3JdcWfDO
 nyT7ZMwB3BFoYI7SKTpwLhgmEv4GRPJMkEGuOcYFSLVbRy6iYIjZbI5e/M1omG6SulEo
 MEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jo46dSpvZSN1TN7vD8NpGaggh1SE8FrmPLyEYV3JD/Y=;
 b=Gm4etQOWNR7X/oA5l22lBkUev+93v4cSkTCK6Mbbo3aN8PsuRIthSFjRJnKWCDQKHs
 7uEZm5Qohd9x3GoR8Fq885lb/HIkSygvv6SETGXC+2TzQlXOFAoZqgJOoDeUt3EaBmBz
 VZemQxMX+T3mX9aQ+ZySzzKoSVnA+BVAsvtUAwuFjNXNMIjA4Qzep3PPODNhj527mVyi
 up3bmf0HBimzr2RHAkzHnNZSOdgq9PCnEKnzS+r8BAsNb0IXiCfKV1duC5fOgLC/wtzT
 e9NI914nWp15p7avKVnDQKpQwigyjPOtDZkKJii7yTmt3FOSTYOdCQLiK/a+yFAN6z6L
 +mtQ==
X-Gm-Message-State: APjAAAVwYmQwa6PPRZtdR3heoob8+5HeayeriDA+s/QsMSZFrSzVCTZT
 flQeEPlMOt2i8nWNc25KazA=
X-Google-Smtp-Source: APXvYqw5HGdP9TLmBjfsNtycFwIx6TtTmV1CL2ndpqJUJyVNMec6h44CyqSsLVBj4orKb7nx0nS/qw==
X-Received: by 2002:a2e:9b4e:: with SMTP id o14mr11530352ljj.189.1553466869131; 
 Sun, 24 Mar 2019 15:34:29 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl
 (109241207190.gdansk.vectranet.pl. [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id x76sm3144324ljb.17.2019.03.24.15.34.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 15:34:28 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: rawnand: ams-delta: Drop board specific partition info
Date: Sun, 24 Mar 2019 23:33:44 +0100
Message-Id: <20190324223344.24590-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190319223718.26131-1-jmkrzyszt@gmail.com>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_153431_532982_E500D308 
X-CRM114-Status: GOOD (  17.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

After recent modifications, only a hardcoded partition info makes
the driver device specific.  Other than that, the driver uses GPIO
exclusively and can be used on any hardware.

Drop the partition info and use MTD partition parser with default list
of parser names instead.  For the OF parser to work correctly, pass
device of_node to mtd.

Amstrad Delta users should append the following partition info to their
kernel command line, possibly by embedding it in CONFIG_CMDLINE:

mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).

For their convenience, CONFIG_MTD_CMDLINE_PARTS symbol is selected
automatically from that board Kconfig if this NAND driver is also
selected.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
---
CHangelog:
v1->v2:
- fix a typo poined out by Aaro - thanks!
- fix device_node not passed to OF parser via mtd_info
- commit message reworded and reformatted a bit for better readability

 arch/arm/mach-omap1/Kconfig      |  1 +
 drivers/mtd/nand/raw/ams-delta.c | 29 ++---------------------------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index c4694f26b5c4..62cf20f22828 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -171,6 +171,7 @@ config MACH_AMS_DELTA
 	select LEDS_GPIO_REGISTER
 	select REGULATOR
 	select REGULATOR_FIXED_VOLTAGE
+	select MTD_CMDLINE_PARTS if MTD_NAND_AMS_DELTA
 	help
 	  Support for the Amstrad E3 (codename Delta) videophone. Say Y here
 	  if you have such a device.
diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 8312182088c1..e0f09179bbda 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -41,31 +41,6 @@ struct ams_delta_nand {
 	bool			data_in;
 };
 
-/*
- * Define partitions for flash devices
- */
-
-static const struct mtd_partition partition_info[] = {
-	{ .name		= "Kernel",
-	  .offset	= 0,
-	  .size		= 3 * SZ_1M + SZ_512K },
-	{ .name		= "u-boot",
-	  .offset	= 3 * SZ_1M + SZ_512K,
-	  .size		= SZ_256K },
-	{ .name		= "u-boot params",
-	  .offset	= 3 * SZ_1M + SZ_512K + SZ_256K,
-	  .size		= SZ_256K },
-	{ .name		= "Amstrad LDR",
-	  .offset	= 4 * SZ_1M,
-	  .size		= SZ_256K },
-	{ .name		= "File system",
-	  .offset	= 4 * SZ_1M + 1 * SZ_256K,
-	  .size		= 27 * SZ_1M },
-	{ .name		= "PBL reserved",
-	  .offset	= 32 * SZ_1M - 3 * SZ_256K,
-	  .size		=  3 * SZ_256K },
-};
-
 static void ams_delta_write_commit(struct ams_delta_nand *priv)
 {
 	gpiod_set_value(priv->gpiod_nwe, 0);
@@ -238,6 +213,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	mtd->dev.parent = &pdev->dev;
 
 	nand_set_controller_data(this, priv);
+	nand_set_flash_node(this, pdev->dev.of_node);
 
 	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
 	if (IS_ERR(priv->gpiod_rdy)) {
@@ -315,8 +291,7 @@ static int ams_delta_init(struct platform_device *pdev)
 		return err;
 
 	/* Register the partitions */
-	err = mtd_device_register(mtd, partition_info,
-				  ARRAY_SIZE(partition_info));
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
 	if (err)
 		goto err_nand_cleanup;
 
-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
