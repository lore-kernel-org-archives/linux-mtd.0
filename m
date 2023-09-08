Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F5EEE57F8
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmjOBM7oAVR9wyJbhmg3bUnd2freZg2GMWzmPNOqqfc=; b=4d1A8SwzpPo4oy
	y1Ko319dASNL2ykY6OFXRpArDT0D+Ts5AuCPrYpHsjtq4TsM/Hv8GcLJoQOLKe+SkQpeIpKuZm31n
	tFoDN/3sqqWPN8fItKfkKdfn9/LIhzC+QsgcnkyEjLe8UzlxVkBZqbQEwGRqSMIBzt1Yn+HFAyBoE
	JYi8WcRfZjq+QHz/kRR6GZMEU4MkiKxjXwTMYJXQlWjEaSgOPfaGE6vBmvkz+7TwGkIIPhc+ay+93
	2AnyxKivGcPIUGOPXt+MGA8Qim964MKYCl6xgoki0Bcf0H2qhkd3EY4hUqveyoQOkA2tek+sr3Bwz
	pjoix3BwbrUAQLGqGQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeZhv-00DgEm-2k;
	Fri, 08 Sep 2023 11:31:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYW-00DTj4-1m
	for linux-mtd@bombadil.infradead.org;
	Fri, 08 Sep 2023 10:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gBCpuVU/pd44YCVNRKiXUy+CVJBTcFq+JBSIfZh7EkM=; b=NOY1uECdDbmOObX3BM2YPSXi/9
	EjSr/Mq4F/NoXGlgd2BXQIFZLBZHaoK9nGZUFQigebZAozbEipYFAc2BgIsAX2c1U70VsDTxYpj0u
	tmEmEWdQ9+/6BnFuHrxeLG5qkjVHM76MLSmDo+nRPuKkWfIbhITRCcSyR1R6Murqs7mDUOKsAK/yi
	cc9cg3RNIEkDG20hPZ89aHla+SQwg8fsZa8JaIxxKpiY0x2Yshb3+u0PyNmNGb6UBaVcEY5BBLrDQ
	IruNtSHPY0tJ7fyh0BY/gwdcZKJEPk+ntc4d2DulNQOS4T20svePHkUsx7vzzMpLpvs5JsT/yEz9g
	NHmRt3Fw==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYYQ-002R0m-1z
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 36F5CB82038;
	Fri,  8 Sep 2023 10:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FECC433C7;
	Fri,  8 Sep 2023 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168252;
	bh=qrtlb3Inp+0PAFufVQ6/JFPnxSSyzXyjdaLgPSqbaiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DYxVNw2n5ACTgyEoxTzZ9Gf4qW625HO4uRskm+x+dDOZoyrZ8YbRg8Jg1Jsy/ApZH
	 n2L+hQ/EggbK1KymH5orwnBB8AKmOVdDcD6FcAEA4cBGZ5J0tyBqEc4or9YesO6x3V
	 tnULKFbsdrXg8mGEJKkC69OvNBAoyaSLQG/6bWr7hjS/xgIoARfM2e8f3JO+jUhr6J
	 HqCgjrPMkmd0Y+A6rkaQpnAGisZT2IsiV/6cH5iSKQny7bH70S6BzgX0wzAISW1hnX
	 BYfXdllxaWW/14bUNT7NDf2eNVi7n6Qi+8awYHxDh/EknL3qCHQRw+4h6+Vo/ZL+kT
	 z4qkyaTGzZysQ==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:48 +0200
Subject: [PATCH v3 30/41] mtd: spi-nor: xmc: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-30-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_111736_274820_D3AB4E47 
X-CRM114-Status: GOOD (  11.97  )
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

The INFOx() macros are going away. Convert the flash_info database to
the new format.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/xmc.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
index 48062ccb22fa..d5a06054b0dd 100644
--- a/drivers/mtd/spi-nor/xmc.c
+++ b/drivers/mtd/spi-nor/xmc.c
@@ -9,12 +9,17 @@
 #include "core.h"
 
 static const struct flash_info xmc_nor_parts[] = {
-	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
-		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+	{
+		.id = SNOR_ID(0x20, 0x70, 0x17),
+		.name = "XM25QH64A",
+		.size = SZ_8M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x20, 0x70, 0x18),
+		.name = "XM25QH128A",
+		.size = SZ_16M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	},
 };
 
 /* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
