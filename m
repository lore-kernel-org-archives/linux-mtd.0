Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B73EE57FB
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuW4hL58RDwzfkhLY13LcCeob4gkITmwv/NaaOqj+8Q=; b=RdrR68tMa8vGl0
	4exmeAY+PpwKycoGjDgMadPqTctDIfTUEBb7eltPi/yoiEIQuA0whF4ep7OBGw57jvnckjR8UWmoR
	ElpYsrYNOvnGR1BS64JzO7vSmdUv2eVbiPZoiI3ZnoERuF+Wi4rfDjjsX4pp3oGmVKGJD8ubyI7rZ
	O+nfSjI5akxHeLTJAWd57IaXc8Id8r0Z+ZCxF7yKNgWlaZhHZgEI8a/YLNrV/fz9v+DCV40WdmfPo
	8spa6deoCsr2sjNAIo1gMMSio+7VHkdgzz8cp3lpxE9tmIij4Uk6ITKHS8LYfkqcQdh8gWS/51I3f
	UiOrxe1JtlG/t5Xbd0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeZht-00DgDc-0a;
	Fri, 08 Sep 2023 11:31:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYY8-00DTL7-2V
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:17:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7FAF614A4;
	Fri,  8 Sep 2023 10:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0794CC43391;
	Fri,  8 Sep 2023 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168235;
	bh=pG2FdGd2bZ50xpBr1ZIaO+fF4bmW9tYC4LsRjQC4xQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=STicWmLv7g3D+Mkn6PXX7F3isoqBQJY4vugZUQ6V4DD78LcyI0U///6ZZzVbt04Hp
	 1VPKN7w8BA60yHQHKAGhquU49/Ks04f5FRaKO/xBkwOMxQXoakpG3ccRpwlDUZ8CG5
	 a9KAm7dTW9bYvpEH1QrWbVorP5oft5JcR8eKvuB1nRjj4KAU6FfebiLj9pfyf2dwE5
	 x8z8U3oEfGuZ/AmgtUqNHRqp3KIcHFCFIcjqnCQFjy1W1n76vfWRUrgqcAYW8u2WXw
	 DlBS/LD/tZhdjWp6W4apRqFC7mew1dnJ1vUdHA8slC/lB6vLHh9PTBW3d/IN21aihe
	 3VEz6UAdmT+lw==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:40 +0200
Subject: [PATCH v3 22/41] mtd: spi-nor: intel: convert flash_info to new
 format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-22-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031716_888360_6B37EA72 
X-CRM114-Status: GOOD (  12.01  )
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
 drivers/mtd/spi-nor/intel.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
index aba62759a02e..f647359fee7a 100644
--- a/drivers/mtd/spi-nor/intel.c
+++ b/drivers/mtd/spi-nor/intel.c
@@ -9,12 +9,22 @@
 #include "core.h"
 
 static const struct flash_info intel_nor_parts[] = {
-	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128)
-		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
+	{
+		.id = SNOR_ID(0x89, 0x89, 0x11),
+		.name = "160s33b",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}, {
+		.id = SNOR_ID(0x89, 0x89, 0x12),
+		.name = "320s33b",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}, {
+		.id = SNOR_ID(0x89, 0x89, 0x13),
+		.name = "640s33b",
+		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
+	}
 };
 
 const struct spi_nor_manufacturer spi_nor_intel = {

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
