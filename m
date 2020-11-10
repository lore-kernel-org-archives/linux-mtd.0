Return-Path: <SRS0=eCmO=EQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06A3C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 00:29:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCAC206D8
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2020 00:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgkrfiy0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4sDCksR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCAC206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b4GG0jqoE8IoEtJEUxpMPnJW7eVcEngVQ02IUHAsk2o=; b=rgkrfiy0Q1gMdF8D+0GBY6Xtpd
	ClMAHgK2NBclUOS1WSQRawqxui19E10t3omA5zZ778f9rGiFNq+gaUCRgvrB7equE7CdL0h47tRSE
	Lhbq8l/UEEUThAs3EaiQe81cUU053VMmNbmBygafrQioukhQsVeJ+NspfEI3W/FQiowT5IAVYzqNr
	fu3xKAsc+o60N2+YhiK8//Dz0z+Q8HLkQCFx+SjyXtKod8mJwpz8v22GOjgE5BgnCFEjIDksULFAA
	+t0+HFrpZVFm5WzcxFXMY8W+XHfehukiK2jjZOreB2EGB/SIWchgt/bKPjAp8ifaPrEcuAtF2Qxc1
	8ORV/aSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcHWJ-0001Y8-BP; Tue, 10 Nov 2020 00:28:23 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcHWG-0001XY-UN
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2020 00:28:22 +0000
Received: by mail-qt1-x842.google.com with SMTP id i7so7436758qti.6
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 16:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1NdjgsqubXUSXOEYBjRWJOg1c24uqkZeHs9AlmvWM7Q=;
 b=i4sDCksRbF5Uezr2NXVI4mFQB2kwI1xSkA8VSwxW0/52+FHjHs6Sxp1W1GF6yuWjXV
 8+r1wDpZwNwldQgvukINLxkaGkYE0KN6r/mlStwVnttbyvFbfvQJo5AuU6qW+/cRO4oU
 Y5McFyLCeM1FA2xqtSZHV3pHWbsNSQAQKy7iHiprlT/6pX9gac2knlwe1Tf75AuaClH/
 Ggy/8/bqAhTlTLMJhxEdpk0Dnwya6/en86trHOOaMMkFvprjmrIy4aAO86/X+aBqgHMv
 TGuEjxGXEKNMRNeKnsSuzWbfrzo8Yx3cVGODYFO+jzByl2WoTzT5HFUgrrSk6DwymepJ
 Tmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1NdjgsqubXUSXOEYBjRWJOg1c24uqkZeHs9AlmvWM7Q=;
 b=PsfqD0kOmhctm7JH47kF//T/FqoCXhvad4C5jvQLo/aNToCLaImrY3D+w8zSR+k4l9
 rXn3OOXogCE6qTcbOohkjg5rBTxCdem0hsBZ+JxcmP9EBuLVovf+EnILvouAbBkdSoHo
 zI3FETBD4smC5a0Ml7v7Y7ILaPO3FttejBHl/LHj+QAJT/3w7LYjSY22O1VVq4xItXzL
 1BUyWCVO45iAI4nxnTC1XY6cCx3om40+yG1iUAjxXKZbKm2knM0gsct7s8L7YqViZ0pC
 Rfmzd+R2Br51gcccCzGliT6fwQ6e4Gxon410J0DfSN2Y99c2pMQXoTOT9z1iOpIohNQ6
 gyfQ==
X-Gm-Message-State: AOAM533ib69H5NoTOTjiUa9omb/DFPi7adM6XguBoPpzLTFeaFAys5vV
 l10L/AD1rXhBd2Sr+ptFqNufivQHt/bWkA==
X-Google-Smtp-Source: ABdhPJxpc9VLRTKQUc+JGRm75BkK7oO2URC4OfgSJXfG2gf5mdZyaS5bahhQNgz9undEpFnnBBCuHQ==
X-Received: by 2002:ac8:774e:: with SMTP id g14mr15342279qtu.76.1604968098175; 
 Mon, 09 Nov 2020 16:28:18 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
 by smtp.gmail.com with ESMTPSA id
 b12sm6886027qtj.12.2020.11.09.16.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 16:28:17 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH] mtd: rawnand: mxc: Remove platform data support
Date: Mon,  9 Nov 2020 21:28:07 -0300
Message-Id: <20201110002807.7072-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_192821_031235_E2EF16C7 
X-CRM114-Status: GOOD (  20.19  )
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
Cc: Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

i.MX is a devicetree-only platform now and the existing platform data
support in this driver was only useful for old non-devicetree platforms.

Get rid of the platform data support since it is no longer used.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c            | 25 +---------------------
 include/linux/platform_data/mtd-mxc_nand.h | 19 ----------------
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 include/linux/platform_data/mtd-mxc_nand.h

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 684c51e5e60d..e38c84e1c76d 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -21,7 +21,6 @@
 #include <linux/completion.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/platform_data/mtd-mxc_nand.h>
 
 #define DRIVER_NAME "mxc_nand"
 
@@ -184,7 +183,6 @@ struct mxc_nand_host {
 	unsigned int		buf_start;
 
 	const struct mxc_nand_devtype_data *devtype_data;
-	struct mxc_nand_platform_data pdata;
 };
 
 static const char * const part_probes[] = {
@@ -1801,17 +1799,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 		return PTR_ERR(host->clk);
 
 	err = mxcnd_probe_dt(host);
-	if (err > 0) {
-		struct mxc_nand_platform_data *pdata =
-					dev_get_platdata(&pdev->dev);
-		if (pdata) {
-			host->pdata = *pdata;
-			host->devtype_data = (struct mxc_nand_devtype_data *)
-						pdev->id_entry->driver_data;
-		} else {
-			err = -ENODEV;
-		}
-	}
 	if (err < 0)
 		return err;
 
@@ -1843,14 +1830,6 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	this->legacy.select_chip = host->devtype_data->select_chip;
 
-	/* NAND bus width determines access functions used by upper layer */
-	if (host->pdata.width == 2)
-		this->options |= NAND_BUSWIDTH_16;
-
-	/* update flash based bbt */
-	if (host->pdata.flash_bbt)
-		this->bbt_options |= NAND_BBT_USE_FLASH;
-
 	init_completion(&host->op_completion);
 
 	host->irq = platform_get_irq(pdev, 0);
@@ -1891,9 +1870,7 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL,
-					host->pdata.parts,
-					host->pdata.nr_parts);
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
 	if (err)
 		goto cleanup_nand;
 
diff --git a/include/linux/platform_data/mtd-mxc_nand.h b/include/linux/platform_data/mtd-mxc_nand.h
deleted file mode 100644
index d1230030c6db..000000000000
--- a/include/linux/platform_data/mtd-mxc_nand.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright 2004-2007 Freescale Semiconductor, Inc. All Rights Reserved.
- * Copyright 2008 Sascha Hauer, kernel@pengutronix.de
- */
-
-#ifndef __ASM_ARCH_NAND_H
-#define __ASM_ARCH_NAND_H
-
-#include <linux/mtd/partitions.h>
-
-struct mxc_nand_platform_data {
-	unsigned int width;	/* data bus width in bytes */
-	unsigned int hw_ecc:1;	/* 0 if suppress hardware ECC */
-	unsigned int flash_bbt:1; /* set to 1 to use a flash based bbt */
-	struct mtd_partition *parts;	/* partition table */
-	int nr_parts;			/* size of parts */
-};
-#endif /* __ASM_ARCH_NAND_H */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
