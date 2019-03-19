Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD739C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 22:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE0E20850
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 22:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mBSnAVKY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWpvVzXr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE0E20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R0A0mKB1I8eWT1qHO8ZAhDI88WomqNuXeHMp/HbQV2M=; b=mBSnAVKYqlMvAu
	QeOnivlIZnsg8cACS8rM5cQJMH5Cp4bpEh91mYXAFSMyvU/VDXoJbfeW8xXm0VPjY4hk6XJTjm53s
	pzPlWQ2Sjk6XyqTOjGY0FqRV5s7KxO/VhO3ISG7qngJ3CXbTRS7sj5PkAOGekXPer/btdgDp39FIX
	BFXIM8E6j+IKxwB2UGuA/zXr/nWCmyRm2Nw5kbX2EgbuE69jbLxShUOcJVkkQwtpGsX14+DzXR0q2
	ZpXJmIEsr4PWBYH3iGgZJUBv054qjw6sax408v+kOZOrXsVtlNJ6Igz3VBwPUUHp9nSZGbyE9hZtp
	cQ/uczCC7vn34BEB0jsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6NMr-0008PD-99; Tue, 19 Mar 2019 22:37:57 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6NMm-0008Om-OB; Tue, 19 Mar 2019 22:37:53 +0000
Received: by mail-lj1-x243.google.com with SMTP id j89so558751ljb.1;
 Tue, 19 Mar 2019 15:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2uS3JYGyQ73AUhjSqp6WbiOn0rKDAb2enK7Ui9OG1k=;
 b=EWpvVzXrXBYLmg4ieBzv3cl784Xf9T968WwgPowvJKcHSmFbwGgIcs6Of9Z4/tz/7s
 EZeoucooRipWxBcUbTnfXUFLV1+ZrWulSBMXOUEACygIoWjxo3UgbJYkyKYQvWsMGleR
 QriXZGfH7BvlyVeeAhMg5RVYoJsg+lssZlpsynrchTqGeOoetgP20B/PD0yOWsHY3blE
 +hS1HiGrTaVyVpWjTndgKqUXm+AB5XlxI457V+dt1y8mbJbOnvWNY2vbc83X/V5h14gK
 ypUF7jpoGhrBag36xsFshcHgLBMlEaSTF89VAGrTw8A8QAllZ7LdI0YfCVkYIXinxYtb
 PskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2uS3JYGyQ73AUhjSqp6WbiOn0rKDAb2enK7Ui9OG1k=;
 b=rOY1QBFJbmxMpm1dpFVwUK2dfgYcFh/uBocPNLJwo1TuetraXvNxm2xwcSWBm5K3nq
 q/ezPBJBjfhbBevEG9qwgrMHuaLHJhmVMbDvosRnck7xZuK1x3ff5hOMykqLK+GRSzWy
 6NwjXVmVmml+HPRzFC//HjbG11AEg8eFDkHNryfWofypG2uGSWDjE5XMCROzgQMbcS11
 F5+1oVcLQlHKL0U+7PSc9wV67UGdacfyRQivcjiH+Y1LOehhCaD1Nz5yrTvkmRdWqnQW
 UyjGrHEP+psc4Tm5zCcZpBW3eUyNF5bM/gxIorWaTKD/XcPV0ozkAsjzd2If8fSarJPD
 BNJw==
X-Gm-Message-State: APjAAAVWuaJIv6JvUNgrylmcVA90yLJZxOijrBXhW6lk2cnH8OU5UKBg
 EvXqVEUzoqYn/JNaiuQNUVw=
X-Google-Smtp-Source: APXvYqxRGGAMBczbx5QCobRazLvMcrQnc58m6gR2XMzSf0XUPwTAHtOEYTkf0qZQql0G5AidHWzl0w==
X-Received: by 2002:a2e:5b44:: with SMTP id p65mr15344283ljb.182.1553035070683; 
 Tue, 19 Mar 2019 15:37:50 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl
 (109241207190.gdansk.vectranet.pl. [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id t18sm51192ljg.64.2019.03.19.15.37.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 15:37:49 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: ams-delta: Drop board specific partition info
Date: Tue, 19 Mar 2019 23:37:18 +0100
Message-Id: <20190319223718.26131-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_153752_790996_3E09D15D 
X-CRM114-Status: GOOD (  16.61  )
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

Drop the partition info and use MTD partition parser with default
list of partition types instead.

Amstrad Delta users should append the followig partition info to their
kernel command line, possibly by embedding it in CONFIG_CMDLINE:
mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).  For their
convenience, select CONFIG_MTD_CMDLINE_PARTS  symbol from that board
Kconfig automatically if this NAND driver is also selected.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap1/Kconfig      |  1 +
 drivers/mtd/nand/raw/ams-delta.c | 28 +---------------------------
 2 files changed, 2 insertions(+), 27 deletions(-)

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
index 8312182088c1..2e8e37ea549a 100644
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
@@ -315,8 +290,7 @@ static int ams_delta_init(struct platform_device *pdev)
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
