Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3014AC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 15:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECC7A25581
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 15:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nYa0m+DS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgIP8sWC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECC7A25581
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLjcoyHPpst2Bg5BKb/oyXIrasdN+qE3oAlGJHL9TIk=; b=nYa0m+DSW1ua1rCE7mIgn6cXIx
	4IGjbOv3h5VpuIuCNWos7t+CXckoiopzsv2arDFJoE9kPuJmGjRdtahyHSjWIW9jhHvxtGvsg3mSv
	juJLl2bwQimVBSdMVrkeeKuFiVGg0qdWnLVyoP+uC9nMoTdzDKEQrPfKykD/RsAxgAQ+Qv4vbYeO7
	XuNvVRrcAoTabJHbLs0DHYLp6L/+Nq0FL5mLx2b2dtNMxEi6zeynmSYIuvT7kajAxmDGmRayQ2E2J
	A5NaJI2GhufrUdXTI/QIWYSuB6xj5U8/eGcrgn1oOgFyaYIECm3BcriV5oAD0rLwBKrZptpp4OFLx
	I1XpIePA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpwAW-0004bH-Iz; Mon, 29 Jun 2020 15:58:04 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpwAU-0004Zz-OF
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 15:58:03 +0000
Received: by mail-lj1-x242.google.com with SMTP id 9so18600581ljc.8
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2020 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zMZEixiFTF5mevY+VAYJknP06+KYN1owPnfYBfA5mxY=;
 b=fgIP8sWCkgrxJ+mLPRUsnOUtmnT8rWOcMr5mr81MZdDyY8rho2NuX5xFE2H3wesszQ
 mcd1dx0F7G+izOpy6l1Q/1cxspZ9URShXtjWxPEXMgQNHqHh2baD4Zc8YGtdXnmJoGTl
 e0AhQuG8+eQlDwRxuPr/F7eDzV6euJu6nu1qMPZmhw1eGLMdGLg1ivo6v1RuuieZ0k9t
 jo/5HyLQ5hbOEViAErngn2fWTJ/buTp2J3IVsw7h9BqdCYXQfWPBQJbqc+Y4hayqRv8q
 FXjEYb18omFR0bm9d9fNMziFFh/tFowXdaPBVYNfNKDkPgX35VjGEcu/2ojH+eVtcP5J
 5MFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zMZEixiFTF5mevY+VAYJknP06+KYN1owPnfYBfA5mxY=;
 b=LdzPOGLx0bwaDYQtYXzwGdqIMSSAUnkgGQiS0mQd1KsJdRhWRF6p2p4XQLfSbecxWA
 aibO49Kpbg8Jtjer1JoAGzz1JRat/jppw924bpJHeP9wM5DxDrdfN2rb2I1CmYniNybN
 8RvhMg9p2ogRtWw4PxDvo+jYEQkJ16rYaoUHLERGzW2xrCnx7cyoJWQV0tMh+Vj1FXKv
 R412ZAa7ud1ay8hdBmWI1kmmpwJDj4LuuEmIEXtCVS/g7czdc/WQfSrdlUkQo/lldmaN
 MkSztfEE1F2RBNjZcb3AiTwBBU4B5XTcrTHgZBhLag0aSI0N5a/8s7a2jEbksZEcAbuK
 8e5A==
X-Gm-Message-State: AOAM532NvCwVIDjCOID39CW1nKGMorNhVjWonUqtuOZCq9LKDtg76M3A
 6+VeCz/7WN7HW8dVgUnjiPIfpX1awQXoJd5WP6U=
X-Google-Smtp-Source: ABdhPJyJa1uJ8nWPgBY1njmJFVf8+PrABb1P8QVxFmDEpUU06Og534cpetWQyyaLbYaEtBrKco73a0FNHHfFhqvuMS8=
X-Received: by 2002:a2e:7a03:: with SMTP id v3mr2178955ljc.141.1593446279815; 
 Mon, 29 Jun 2020 08:57:59 -0700 (PDT)
MIME-Version: 1.0
From: microcai <microcaicai@gmail.com>
Date: Mon, 29 Jun 2020 23:57:48 +0800
Message-ID: <CAMgqO2y9MYDj6antOaWLBRKU8vGEwqCB-Y1TkXTSWsmsed+W6A@mail.gmail.com>
Subject: [PATCH] spi-nor: Add support for xt25f32b/xt25f128b
To: tudor.ambarus@microchip.com
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
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From 5e308ec7332d01e84a3a5233f4cb8bd5a00026cf Mon Sep 17 00:00:00 2001
From: microcai <microcaicai@gmail.com>
Date: Mon, 29 Jun 2020 23:36:40 +0800
Subject: [PATCH] spi-nor: Add support for xt25f32b/xt25f128b

The RockPi4b dev board ship with xt25f32b solded. add these ids so the
board's spi flash can be accessed within linux.

Signed-off-by: microcai <microcaicai@gmail.com>
---
 drivers/mtd/spi-nor/Makefile |  1 +
 drivers/mtd/spi-nor/xtx.c    | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/xtx.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 653923896205..3f7a52d7fa0b 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -17,6 +17,7 @@ spi-nor-objs += sst.o
 spi-nor-objs += winbond.o
 spi-nor-objs += xilinx.o
 spi-nor-objs += xmc.o
+spi-nor-objs += xtx.o
 obj-$(CONFIG_MTD_SPI_NOR) += spi-nor.o

 obj-$(CONFIG_MTD_SPI_NOR) += controllers/
diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
new file mode 100644
index 000000000000..05f2d69401b2
--- /dev/null
+++ b/drivers/mtd/spi-nor/xtx.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info xtx_parts[] = {
+ /* XTX (Shenzhen Xin Tian Xia Tech) */
+ { "xt25f32b", INFO(0x0b4016, 0, 64 * 1024, 64, SECT_4K) },
+ { "xt25f128b", INFO(0x0b4018, 0, 64 * 1024, 256, SECT_4K) },
+};
+
+const struct spi_nor_manufacturer spi_nor_xtx = {
+ .name = "xtx",
+ .parts = xtx_parts,
+ .nparts = ARRAY_SIZE(xtx_parts),
+};
-- 
2.26.2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
