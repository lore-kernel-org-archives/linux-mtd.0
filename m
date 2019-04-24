Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E983C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 18:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BC520685
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 18:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hDxA2vKk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJGipjPl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BC520685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0weGb8zbI35O2x+cAb0sgfM6GdMneK2uNawkRt7fx8=; b=hDxA2vKkKnYIpx
	Ks9Bpn49rMYg7Qyq04uEiiNi5Z7XEPEcyyh/GbXD27RoJFtlSbvyH5E9g8Yv6OvU+xN8gbx9eqHwL
	KzBpjOcKapZBDIS3rLm02s46SEbQ3XS0mIjDiHoUHJb55zYipY7ulZ4KWmr9iRtom7TN1gLmlghU4
	wDzqcMjlATSyzfbOg9TqgPn6qKgNJYCCOVv5tDc/aujhFedSqN9pLPe581MoZsxh7quYCx52ZFHwb
	LHPgD7U+1f+zODCtr99zGqLH0VmgYmRe9qnUbo3aN3E7MBeQjNsv3OfG1LpEPgUB30u6Ly911+GJR
	Sx4Oz8mrxLmV53Rn4e1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJMET-0003ZB-TA; Wed, 24 Apr 2019 18:02:57 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJMEL-0003Rz-9m; Wed, 24 Apr 2019 18:02:50 +0000
Received: by mail-lj1-x244.google.com with SMTP id l7so17770558ljg.6;
 Wed, 24 Apr 2019 11:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DjJKtm/R6i9o8qcXqXMBfsK5KZD61RVVhbJADm6TWaU=;
 b=IJGipjPlKnxVk5DMmHc2huZos0Q6faYN+J2p20gcc4jzRbDYaaP6YvUS2xuXNAL6vQ
 5B9lwb9gg2hh+5cNtxQZHc75nxlECRO1BwXHGtOPCnYuB/ZHQvFb2f2nDCtnBmorGwB4
 awjBzR8NNNeDkxgPa2+3Gg+uonNIP07ScX7gcI/ekfoLf+4Twic385QenPx7cJiw2bmr
 5bzg3DddZ4xukFGxx5cnBGy1Ly28pBN/BIr5u3AxGF9Gxv8le1etlAQ7eYAbNykCLo9g
 hOCfs4sLeoJUPg7fiLPvV7kxRZtowddrXHtZ8alJ84vDe7+su01E6yOf4uwlsjyKIgdF
 0bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjJKtm/R6i9o8qcXqXMBfsK5KZD61RVVhbJADm6TWaU=;
 b=lHtkMxVulJm7mN7gVQNpUWe6kh4f1a1m81HeM4IBN5ZjYt9p1TKZVwMkZYfiGhzpKL
 sX5XFqjs9oA4lmqGx6nrFumAh/rrRWeteE2ehCGbn0hBKgTuUSVJCjYXCiYw79gS6oxC
 hL+C9lYMSMrSxQ/sXeB1esaYXbH5RrlFTvxQREsxU9pmf/P65HvVPK/BS3GzGzJa0qoU
 bPdhbvz8wn1+0ly38vuNvByCRR/PKRRas0UgLzzQFtuEdd7OumCqaAyAB9au2TKlpghG
 9+p0VBFP5LWZVaGc3wEPlNqzVLsDr3Q4gQ7ByC7PImdZf2GzhdSHjUhB/vrK2J9avgNM
 MlMA==
X-Gm-Message-State: APjAAAWM9W/OsjYTRrL/KRMrAsaL+C5PoiGlvCAbf5s3bEE2GtsEhxuj
 HgZOQ8UH9Y29zfkddWpKrrI=
X-Google-Smtp-Source: APXvYqxvghpu1QaPhbpWC3coRNnVl0ClUm0loF9I7ldF+kL8zX7fhlOqqEm2dHrp673botHmTqCtqg==
X-Received: by 2002:a2e:9d59:: with SMTP id y25mr1039278ljj.137.1556128967046; 
 Wed, 24 Apr 2019 11:02:47 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl
 (109241207190.gdansk.vectranet.pl. [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id s21sm5550597lfb.0.2019.04.24.11.02.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Apr 2019 11:02:45 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v3] mtd: rawnand: ams-delta: Drop board specific partition info
Date: Wed, 24 Apr 2019 20:02:12 +0200
Message-Id: <20190424180212.10830-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190324223344.24590-1-jmkrzyszt@gmail.com>
References: <20190324223344.24590-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_110249_352347_5E146CAB 
X-CRM114-Status: GOOD (  18.27  )
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
kernel command line, possibly embedding it in CONFIG_CMDLINE:

mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved)

For their convenience, that information is added to the board Kconfig
entry help text, as well as CONFIG_MTD_CMDLINE_PARTS symbol is selected
automatically from the board Kconfig entry if the NAND driver is also
selected.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
---
Changelog:
v2->v3:
- add information on the requirement for passing partition info via
  kernel command line to the board Kconfig entry help text
v1->v2:
- fix a typo poitned out by Aaro - thanks!
- fix device_node not passed to OF parser via mtd_info
- commit message reworded and reformatted a bit for better readability

 arch/arm/mach-omap1/Kconfig      |  7 ++++++-
 drivers/mtd/nand/raw/ams-delta.c | 29 ++---------------------------
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index c4694f26b5c4..41a47d251cac 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -164,17 +164,22 @@ config MACH_NOKIA770
 	  have such a device.
 
 config MACH_AMS_DELTA
-	bool "Amstrad E3 (Delta)"
+	bool "Amstrad E3 (Delta) - see help for important information"
 	depends on ARCH_OMAP1 && ARCH_OMAP15XX
 	select FIQ
 	select GPIO_GENERIC_PLATFORM
 	select LEDS_GPIO_REGISTER
 	select REGULATOR
 	select REGULATOR_FIXED_VOLTAGE
+	select MTD_CMDLINE_PARTS if MTD_NAND_AMS_DELTA
 	help
 	  Support for the Amstrad E3 (codename Delta) videophone. Say Y here
 	  if you have such a device.
 
+	  If you are using built-in NAND, append the following partition
+	  info to kernel command line:
+	  mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved)
+
 config MACH_OMAP_GENERIC
 	bool "Generic OMAP board"
 	depends on ARCH_OMAP1 && (ARCH_OMAP15XX || ARCH_OMAP16XX)
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
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
