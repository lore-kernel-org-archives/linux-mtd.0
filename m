Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928FBC04A94
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmjOBM7oAVR9wyJbhmg3bUnd2freZg2GMWzmPNOqqfc=; b=BHi91Xj4S4SRvB
	o/k5hfH6O4+thBzLaDSA/Ksyl2pSfUZlSRo0e2fNqXcl5oA2bYnRNCf9FpxIXOUPBxLQCzZIbQHZ6
	x3kL3p9cjGcEv65ksIrCzZe+HpWTFElYKmhPtT+2EUx8/5xRrCSdt59B2v0CFRNT+ER6HSltdlIpf
	vVwQoTeQInAy3xscMPusGJ2EQ/VHG/tPjLKFKHbR80lEwz+0JaLpNd/S4AzM/UEu9c4+2adHntLx0
	uqtFVJ9wQNMI/nB9nV8QmxNxhc2g4BktOk0Snil7zqMvKzedP9X1z7SUTRqdp9IiiTmpfwOsvIYB9
	4gmLHLSkkk/vOs1CdHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Cz-00HMH7-09;
	Mon, 07 Aug 2023 13:23:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CL-00HLdc-0y
	for linux-mtd@bombadil.infradead.org;
	Mon, 07 Aug 2023 13:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gBCpuVU/pd44YCVNRKiXUy+CVJBTcFq+JBSIfZh7EkM=; b=FgCb9ehmpXadjuwo27zMnXl4vD
	EA8PxEZDCBCGxtXnsdfsQHDWor1VXX3QGMhA83a6D+khfvuvKwYZs7SCMu2wxU6wVri/aFpxLuQ7a
	ERQSBlxgFabNzE6Hd4QmYhfqqWDATrG/z2x4mdMoMVmlNkMfo6KlqXkTznJnBi8rsGkX8TjvrxPXs
	bFav9+YDc5+oDwzeGkQYFhmsPoMAZwBMA99j0BzgU2TTVVxUFR6gmx09JhvAwA5VMsDu4jY6NT4Nk
	8KGrxZ9/532NtxSYk+/nIysukzdZSfZPcfa4BOJmeJDWclosEqspSuf15NUNR3kE7/C2tPh5sBqJw
	7mg5mOMg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0CG-003qfU-36
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:22:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEEE361AFE;
	Mon,  7 Aug 2023 13:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E518C433CA;
	Mon,  7 Aug 2023 13:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691414576;
	bh=qrtlb3Inp+0PAFufVQ6/JFPnxSSyzXyjdaLgPSqbaiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NsR9qDDkaxORpZBJiKsta+1/GDmhp6GK5QJQzBO5BYofQPVspWIV4sKjVRJ3KSGZn
	 84Gn3Xke2SL/S3sMIoYYvJIKCpMnguwiYYxJ5odVcjQvGYhBLAfwE+i1BNfLr8G7yj
	 JHuV1NoEKkGHIi0ZFaymdqu0dHOVJfz+C0oPrCDQbQwTN26kpCw1W0uPLj7J6cGZCR
	 3PnBxVYlfbOpe3G0QbUdobR0T6oKcMZM/kzzOlJbfQHQiZIcb7ba9ml+BqBG8nz2oq
	 c2OIuDIC9NbBvShiKX7TLR2JabhafBhyxJaandhllpN8QGhzvC/xt5G02xJjM5LYYN
	 dDypKC/z8C1dg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 07 Aug 2023 15:21:24 +0200
Subject: [PATCH 30/41] mtd: spi-nor: xmc: convert flash_info to new format
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v1-30-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_142257_574996_6EADEDC4 
X-CRM114-Status: GOOD (  11.46  )
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
