Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CCCC35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1A320848
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgoV7CHY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWER0fxR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C1A320848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8IJE4J/qKHoDP6bGqb2RBkLOZTcqososf0QgLpZxbw=; b=rgoV7CHYmOlnC4
	1JjyDoH9kc1hXDi+h1jr141T+7olgneYU3g/CBLOy5r9hRBJkFxiO471cKfOEdlBSQu7yop4AwBK4
	SKyE5v/DcocynOWSoAuvwScJ5nzcLwvu9SMiTXBF36PD0eChkm2fQYxmpvv4xOMAVQKOxVCHUoQM0
	1fJitcgF8fEA37RfWuPUgs29FqCRHzB5TIkSlapaf0ceo8RCvCibL6mUDs5CpuyNEC4/D/pEGFTnl
	K1PbGm20OnmTSXL3/QEy++fngWZ1x4i0LxfvPP/6zWIYllHynaDNSbcFOczCXTrXcur7dxCdka93/
	BX3HJ+qZwEM38R3RznHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1g7W-0002UO-Vb; Wed, 12 Feb 2020 00:43:15 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4g-0008DT-Vo; Wed, 12 Feb 2020 00:40:20 +0000
Received: by mail-lj1-x243.google.com with SMTP id r19so278441ljg.3;
 Tue, 11 Feb 2020 16:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKDP1hyiuSxJLJzh6PxtETHxlHhTQ3RNvBVBm9ROckc=;
 b=TWER0fxRPSTs5r+v24XbrG3jeVC7fikohs6urpewgZ329P+lFVUPmGspl4I5MUzM76
 XyA9DhMCVkyg6gxFfiOuRN8tviL6kEP9U4TpAoAZ79CQOuDU4tyOYwkPMHjhh7GAgkHy
 xS2AH5iaJxI+IR0DStViI6ZqLf6n7fwHMes7KfTavO20xrces1xeWPi1ajjwNUdREz8/
 PcqJevItqEi8/PB+RPGD2Qf6sQOwATSUy8J+hcoy/OyVF5bgZef6ZTQ6egA0T8Avn4/u
 27aArAd4t87sKe+Dd6a2ApCQNEV2agN2JeOk+TXpdTsu8g75dHO82T+suDHD8lgTH1tA
 I68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKDP1hyiuSxJLJzh6PxtETHxlHhTQ3RNvBVBm9ROckc=;
 b=s9r2jfMihvurihhJmnkEu9DCObFsj9EksWOwMn5D0X3XK127Xar69h6hfbcHvMNx2r
 tp8rYaJzqMQ4Mdt99aeUkK6STP7uvDLIzhfKDeOlK3RloE0XnU8sZisBWPFaU/W8Lz0A
 EQn9Y/RoUY7ulmEUMoMl3PnKfML8ynfPCUUh8JGBPrHc16uJFBlzwUflePC3cybT3w32
 yqr2QWkapNXDAu1uTAAa/W0yuqYtTA8ACNL7iXvJdLxFZPm82pc7lXJzJq9lsJGGFeoh
 V35JLTit3rjTBQJIRmq0xroBobMwIa0lx+urUJyrgNeskqA8OQ1gk6bsZl9q2fQmgGBB
 uekQ==
X-Gm-Message-State: APjAAAXQwpPnpLAW6lfntDmQzULWZOSrIGNyAocCCwp5+cgseLq8OFHe
 t9TOODSs3m7QGOU4pm88ieY=
X-Google-Smtp-Source: APXvYqzpKF76+7JafsOPb+hJUBKmkk6qQI4meZuR66EOWTQPQWrs9dxfJECmmgTjt7dnRy0P3ahykw==
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr5871701ljj.241.1581468017616; 
 Tue, 11 Feb 2020 16:40:17 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:17 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 04/14 v4] mtd: rawnand: ams-delta: Drop board specific
 partition info
Date: Wed, 12 Feb 2020 01:39:19 +0100
Message-Id: <20200212003929.6682-5-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164019_059341_C496CFFA 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now as we support fetching partition info from device platform data and
the Amstrad Delta board file provides that info, drop it from the
driver code.

v2: rebase on top of gpio_nand_platdata extension

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
Changelog:
v4: rebase on top of gpio_nand_platdata driver/board extensions,
  - drop no longer required command line parser related bits,
  - adjust commit description,
  - move OF fix to a separate patch.
v3: add information on the requirement for passing partition info via
    kernel command line to the board Kconfig entry help text.
v2: fix a typo poitned out by Aaro - thanks!,
  - fix device_node not passed to OF parser via mtd_info,
  - commit message reworded and reformatted a bit for better
    readability.

 drivers/mtd/nand/raw/ams-delta.c | 29 ++---------------------------
 1 file changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index fbab7cc14607..25f121adea6f 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -42,31 +42,6 @@ struct ams_delta_nand {
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
@@ -222,8 +197,8 @@ static const struct nand_controller_ops ams_delta_ops = {
 static int ams_delta_init(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
-	const struct mtd_partition *partitions = partition_info;
-	int num_partitions = ARRAY_SIZE(partition_info);
+	const struct mtd_partition *partitions = NULL;
+	int num_partitions = 0;
 	struct ams_delta_nand *priv;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
