Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFCFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 05:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f2x5aYPdbIF99ZZdS95jOEpBdMUqj9eUgC1IitcGthk=; b=J15zdSU5E14SQH
	HBndBuZUMzvYjonFVok7b6WUM0tovtg48UTpTMLuxR2xU0Tn6+6qbMqdV9A3M4O3Sip4U8wPRUk9b
	QmLY8maYRwI6OB8EFp20eOW0cMZ+MMPM8YRz3mfJmPk+TJ8moSSXa64AuHAw3tGd94QXtKh5LkBAS
	SCSgbHe/an9SEEn6P1YLk2bZupF1TU4R2BSNjxARxxdCtsz89Er7ly2esl2cCy0fsIdhoiKan31af
	IJcQowKpp7qDEXJ65QPL8gSWHgfYOb8fAhpIp5Ea2Le9HcRRjgcPnsrrolS8kEDS10L7OyaRCQrJW
	DrvXdf4+Va0kNm6t9noA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neral-003sOW-5J; Thu, 14 Apr 2022 05:00:27 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nerai-003sNw-UB
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 05:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649912424; x=1681448424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yDlalwWnBkcn2d0X1iU/YSTVgPIyzcIKznXpiKQ8Cl8=;
 b=DfhewKbueM0nqBN1Ofnxl63cvxA651i7VjAQThGZI8EI/CKBbvhNEmAH
 ZxNsn3WdWHJYHhUnG5XuWX2bovksPGM7c3J1lKBzV7w2IrzdbGnzAfL6p
 ag35EAV97DCLb7Sfv8aSaadPtl1th/RdD5QVIJsSJI48RaY/4PU1EoMLY
 7PSLvjLNFqK0DSaMcv9ffB/ZCpm9u488+MUoz30JIqhxiXWH4dCdee1w5
 iWWUF0PyjyOqs5NmdZnAOXEA1R1f5d4Bjr0VLdgliNr1vUg/XCWc35hTO
 e7X6xUZO5NQ4Eunl9Nkl7nOWr5/JXJvSHz8VIJh7HspNJBqFdVYFwZtMV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262599514"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="262599514"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 22:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; d="scan'208";a="700535052"
Received: from unknown (HELO localhost.localdomain) ([10.226.216.87])
 by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2022 22:00:14 -0700
From: niravkumar.l.rabara@intel.com
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: issi: Add IS25WP512 device
Date: Thu, 14 Apr 2022 21:00:04 +0800
Message-Id: <20220414130004.945924-1-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_220025_059957_CE6CD1D0 
X-CRM114-Status: GOOD (  15.47  )
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

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

Add is25wp512 info to spi_nor_ids[] table entry.

Rename is25lp256_post_bfpt_fixups to is25xx_post_bfpt_fixups
as a common function for all is25xx post_bfpt fixups.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
---
 drivers/mtd/spi-nor/issi.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index c012bc2486e1..14fe07e55f85 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -9,24 +9,27 @@
 #include "core.h"
 
 static int
-is25lp256_post_bfpt_fixups(struct spi_nor *nor,
+is25xx_post_bfpt_fixups(struct spi_nor *nor,
 			   const struct sfdp_parameter_header *bfpt_header,
 			   const struct sfdp_bfpt *bfpt)
 {
 	/*
-	 * IS25LP256 supports 4B opcodes, but the BFPT advertises a
-	 * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY address width.
+	 * IS25XX256 & IS25XX512 supports 4B opcodes,
+	 * but the BFPT advertises BFPT_DWORD1_ADDRESS_BYTES_3_ONLY and
+	 * BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 address width repectively.
 	 * Overwrite the address width advertised by the BFPT.
 	 */
-	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
-		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
+	if (((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY) ||
+		((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+		BFPT_DWORD1_ADDRESS_BYTES_3_OR_4))
 		nor->addr_width = 4;
 
 	return 0;
 }
 
-static const struct spi_nor_fixups is25lp256_fixups = {
-	.post_bfpt = is25lp256_post_bfpt_fixups,
+static struct spi_nor_fixups is25xx_fixups = {
+	.post_bfpt = is25xx_post_bfpt_fixups,
 };
 
 static const struct flash_info issi_nor_parts[] = {
@@ -48,7 +51,7 @@ static const struct flash_info issi_nor_parts[] = {
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512)
 		PARSE_SFDP
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-		.fixups = &is25lp256_fixups },
+		.fixups = &is25xx_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128)
@@ -58,7 +61,11 @@ static const struct flash_info issi_nor_parts[] = {
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
-		.fixups = &is25lp256_fixups },
+		.fixups = &is25xx_fixups },
+	{ "is25wp512", INFO(0x9d701a, 0, 64 * 1024, 1024)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+		.fixups = &is25xx_fixups },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
