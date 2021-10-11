Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA35C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 21:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EDDD60F3A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 21:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EDDD60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhJqSXF07wBrZfB/IjQf3gsOAw9a37pFF/L8WDpDrQk=; b=wOHGf7FpJtJGR5
	2EsS2hM9t0Fhc7+TzsJoUeJGTSDkQ0fAhXodYV/qbazs43rHfEL4+7qKAM1IoUanD9KTKCCfZDknP
	018wLUGr5NqSIFoSx2+zg5mv9C6KIdJRbDFQjDXi9WbrSzWTcpyYbD+4UI0B2B8DIyM+90IW71RjJ
	pVYfMtplVsBsCoRw9oiaRi6bBzj6wEn4re1/8wN3IP75bNfUoL13QqJPptBokwNsn2+O+9O78F9Zk
	7RpA461szh9k0evdxNGvwjpxc+DA9ErW7B+pNWI4YizxrTwBffxcbeVFZ3XHUzaYHYDtEGGOSfycV
	yxx8nC3BRwQGeGudtNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2OZ-00AgFY-E0; Mon, 11 Oct 2021 20:59:39 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2D9-00AdhF-Tm
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:47:53 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKlj8w071329;
 Mon, 11 Oct 2021 15:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985265;
 bh=tuvJGDtfmxbDxCYN89TxVrBjoYFXrDF0qurPeskISLc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=kKP2rKImMUnTwX9DAdlXkCDeabMU7funQMvaz1zCJvBl/nsAK5KxpzCvGE9Cd3Ykf
 uCe9iN0c/UOJ2aMXSzj3ptuTE/LvnaUJIu5BcvUevsm+zQxoiRxNv7HtdL3NGowKjE
 GQWYVhykAfFYgUoKR4zhoSE25ohcbmPtu78fTmZU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKli6H056294
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:47:45 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:47:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:47:44 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEs069811;
 Mon, 11 Oct 2021 15:47:40 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 14/14] mtd: spinand: winbond: Add support for Winbond
 W35N01JW SPI NAND flash
Date: Tue, 12 Oct 2021 02:16:19 +0530
Message-ID: <20211011204619.81893-15-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134752_080076_FBA7E75D 
X-CRM114-Status: GOOD (  12.80  )
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

Winbond W35N01JW is a SPI NAND flash supporting Octal DTR SPI protocol.
Add op_variants for W35N01JW, which include the Octal DTR read/write
page ops as well. Add W35N01JW's OOB layout functions for the
mtd_ooblayout_ops. Finally, add an entry for W35N01JW in spinand_info
table.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/winbond.c | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1857836f19d0..8f687b6a6697 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -47,6 +47,19 @@ static SPINAND_OP_VARIANTS(update_cache_variants_w25xxgv,
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
@@ -71,11 +84,40 @@ static int w25m02gv_ooblayout_free(struct mtd_info *mtd, int section,
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
@@ -110,6 +152,17 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants_w25xxgv),
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
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
