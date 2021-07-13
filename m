Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85010C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:18:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5589460FF1
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5589460FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXJx8CmHmKT4lwpmtVwx+Mp7oW3CyCCtJhJpeaCgehI=; b=Ecm8i0A24PLpfW
	OjZL8ZlUoUB2YGSGRis+fDY1bfCoH5gaYyQoLZ/UYo0odEBg+JBUDgfX/ENo5uWTuN1lnlPYwmsfN
	bDpHIYUC2vYlrspLiRw6T3LBN1+Eo1HLUseWtRIva7jPxGQa6poifFDc3ATQH29LvuQNiW/Pnb18S
	MnboWF0KNKF+flvpfPB6hSzvgZB2dNkxMVBc4L2XTwtWgFI5ZXQmtuYiH9qvr06UhkEzNCjhAAnLi
	uZT2/f+0GaU45bLvNtvU+29jrVQaEeUSxhscyPVPCKuHj1BM8xUwy38Y3gQj3D11O1/xrb/4jJM57
	Lx4624f0XDVwY949qdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3IIT-00AUwi-0o; Tue, 13 Jul 2021 13:18:01 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I7h-00ASVp-SJ
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:57 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD6lAf010988;
 Tue, 13 Jul 2021 08:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181607;
 bh=IaSq8ZKnYxlW8S1QnsGGWlTcMOzmg6u2gbCgHbxlUF8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Xp5OubjIO83Br2ibQwjCkHDoLHtVPYXGYtlo0JVYr02cBsZKjF+usryXPAGmYPPEp
 GsuKhtjsL84mCs5bsVAXCNmxZl2HTWXJrktq//gjXaAGw2bC4Qz1gLeUOUkbBE6iKU
 8UAU+71AQ1U+bDeh44ekSoIaxX9nsJM7gqjfU/ic=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD6lpx101619
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:06:47 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:06:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:06:47 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daN109825;
 Tue, 13 Jul 2021 08:06:43 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 13/13] mtd: spinand: Add support for Winbond W35N01JW SPI NAND
 flash
Date: Tue, 13 Jul 2021 13:05:38 +0000
Message-ID: <20210713130538.646-14-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060654_062880_50FB923A 
X-CRM114-Status: GOOD (  16.61  )
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

Winbond W35N01JW is SPI NAND flash supporting Octal DTR SPI protocol.
Add op_vairants for W35N01JW, which include the Octal DTR read/write
page ops as well. Add W35N01JW's oob layout functions for the
mtd_ooblayout_ops. Add all op adjustments required for Octal DTR SPI
mode using the adjust_op(). Finally, add an entry for W35N01JW in
spinand_info table.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/winbond.c | 116 ++++++++++++++++++++++++++++++---
 1 file changed, 107 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 58cda07c15a0..5c2b9e61b624 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -16,6 +16,13 @@
 
 #define WINBOND_CFG_BUF_READ		BIT(3)
 
+#define WINBOND_BLK_ERASE_OPCODE	0xD8
+#define WINBOND_PAGE_READ_OPCODE	0x13
+#define WINBOND_PROG_EXEC_OPCODE	0x10
+#define WINBOND_READ_REG_OPCODE_1	0x05
+#define WINBOND_READ_REG_OPCODE_2	0x0F
+#define WINBOND_READ_VCR_OPCODE		0x85
+
 /* Octal DTR SPI mode (8D-8D-8D) with Data Strobe output*/
 #define WINBOND_IO_MODE_VCR_OCTAL_DTR	0xE7
 #define WINBOND_IO_MODE_VCR_ADDR	0x00
@@ -24,7 +31,7 @@
 #define WINBOND_DUMMY_CLK_COUNT		12
 #define WINBOND_DUMMY_CLK_VCR_ADDR	0x01
 
-static SPINAND_OP_VARIANTS(read_cache_variants,
+static SPINAND_OP_VARIANTS(read_cache_variants_w25xxgv,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
@@ -32,14 +39,27 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
 
-static SPINAND_OP_VARIANTS(write_cache_variants,
+static SPINAND_OP_VARIANTS(write_cache_variants_w25xxgv,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD(true, 0, NULL, 0));
 
-static SPINAND_OP_VARIANTS(update_cache_variants,
+static SPINAND_OP_VARIANTS(update_cache_variants_w25xxgv,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+static SPINAND_OP_VARIANTS(read_cache_variants_w35n01jw,
+		SPINAND_PAGE_READ_FROM_CACHE_OCTALIO_DTR_OP(0, 24, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants_w35n01jw,
+		SPINAND_PROG_LOAD_OCTALIO_DTR(true, 0, NULL, 0),
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants_w35n01jw,
+		SPINAND_PROG_LOAD_OCTALIO_DTR(false, 0, NULL, 0),
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
 static int w25m02gv_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -64,11 +84,40 @@ static int w25m02gv_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static int w35n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 12;
+	region->length = 4;
+
+	return 0;
+}
+
+static int w35n01jw_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 7)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 2;
+	region->length = 10;
+
+	return 0;
+}
+
 static const struct mtd_ooblayout_ops w25m02gv_ooblayout = {
 	.ecc = w25m02gv_ooblayout_ecc,
 	.free = w25m02gv_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops w35n01jw_ooblayout = {
+	.ecc = w35n01jw_ooblayout_ecc,
+	.free = w35n01jw_ooblayout_free,
+};
+
 static int w25m02gv_select_target(struct spinand_device *spinand,
 				  unsigned int target)
 {
@@ -88,9 +137,9 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xab),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 2),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_w25xxgv,
+					      &write_cache_variants_w25xxgv,
+					      &update_cache_variants_w25xxgv),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
 		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
@@ -98,11 +147,22 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_w25xxgv,
+					      &write_cache_variants_w25xxgv,
+					      &update_cache_variants_w25xxgv),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+	SPINAND_INFO("W35N01JW",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc),
+		     NAND_MEMORG(1, 4096, 128, 64, 512, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_w35n01jw,
+					      &write_cache_variants_w35n01jw,
+					      &update_cache_variants_w35n01jw),
+		     SPINAND_HAS_OCTAL_DTR_BIT | SPINAND_HAS_POR_CMD_BIT |
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL)),
+
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)
@@ -183,9 +243,47 @@ static int winbond_spinand_octal_dtr_enable(struct spinand_device *spinand)
 	return 0;
 }
 
+static void winbond_spinand_adjust_op(struct spi_mem_op *op,
+				      const enum spinand_proto reg_proto)
+{
+	/*
+	 * To support both 1 byte opcode and 2 byte opcodes, extract the MSB
+	 * byte from the opcode as the LSB byte in 2 byte opcode is treated as
+	 * don't care.
+	 */
+	u8 opcode = op->cmd.opcode >> (8 * (op->cmd.nbytes - 1));
+
+	if (reg_proto == SPINAND_OCTAL_DTR) {
+		switch (opcode) {
+		case WINBOND_READ_REG_OPCODE_1:
+		case WINBOND_READ_REG_OPCODE_2:
+			op->dummy.nbytes = 14;
+			op->dummy.buswidth = 8;
+			op->dummy.dtr = true;
+			return;
+
+		case WINBOND_READ_VCR_OPCODE:
+			op->dummy.nbytes = 16;
+			op->dummy.buswidth = 8;
+			op->dummy.dtr = true;
+			return;
+
+		case WINBOND_BLK_ERASE_OPCODE:
+		case WINBOND_PAGE_READ_OPCODE:
+		case WINBOND_PROG_EXEC_OPCODE:
+			op->addr.nbytes = 2;
+			return;
+
+		default:
+			return;
+		}
+	}
+}
+
 static const struct spinand_manufacturer_ops winbond_spinand_manuf_ops = {
 	.init = winbond_spinand_init,
 	.octal_dtr_enable = winbond_spinand_octal_dtr_enable,
+	.adjust_op = winbond_spinand_adjust_op,
 };
 
 const struct spinand_manufacturer winbond_spinand_manufacturer = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
