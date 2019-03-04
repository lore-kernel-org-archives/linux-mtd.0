Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470C3C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:19:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148BB206B6
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 20:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3nMm/zI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="meqlb4Z4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 148BB206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKgGyzPLyY1Oo4DXaLAM2VlZLWfa//To5P6SRVlKGzI=; b=O3nMm/zI21jDDR
	ToWiYaI3pTkdqpy4IquJqhYADqqZuM8CgD9fYUhfgyuVUWtNAl2Frxa+HSjWWsBYtzvA/c5SDcPSW
	JSpx608UiocAskHeRBxHT5BY08CsHZ7FAj3nDcWjdd6mqivLridrChPtcRpMIpXIuRgb9DmMegbwe
	TfuFGWh0GWWDTU711mHMhV7Wl1Jaj81t+DWwkh9yBkhG43Xh9OplXkLaZYFOydomcBNYERVkg950I
	yxgwlb1Sx2vONqYpZrwzVy+HocqSckGHPKzJdVf/A8F9Im42MsWAb+jWMZM8q4/Uo336MID0mmsCZ
	8o3PK4Oi0b9tesfxmiRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0u3l-0003QW-FI; Mon, 04 Mar 2019 20:19:37 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u1Q-0000Fr-Hp; Mon, 04 Mar 2019 20:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v6cTOgBlD1OTRREq3m3CJNup+LszJYGAHlz0CbH7xwI=; b=meqlb4Z4Bjj9ZJuG9gORCCM54l
 StjDrumOKBnWqOrXNaoAsf9XiQ7/XIUNAwSqy+4K2eYGIdLTd/+5n1So6OSQ6cSGeLtC5eZxCCB1R
 Fyl+lIM+NIncpS8cgYprppeaBCEZSEP9Bnl3OqTBQF5c4pUuSUo+ls6lCE66eXlupRwufL9jPd6nU
 2M65f7RW+QeqedMo9sbXHopuDke7PjLhv3YuHBA9hSZIWGPUwQZIGYq7+506h1V3yMF+7ZYPU8sv5
 jcwc1g1dTInkSDcQw8zAZS2gXp1gidBsg9u804+D51rljDRRZtbeCJv36QRcI1rCdYT+eZu/uZ4rE
 vSrZj5Ag==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0u1N-00006z-F8; Mon, 04 Mar 2019 20:17:10 +0000
Received: from localhost.localdomain (26.43.136.77.rev.sfr.net [77.136.43.26])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id B1728240004;
 Mon,  4 Mar 2019 20:16:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 11/15] mtd: rawnand: Use nanddev_mtd_max_bad_blocks()
Date: Mon,  4 Mar 2019 21:15:18 +0100
Message-Id: <20190304201522.11323-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304201522.11323-1-miquel.raynal@bootlin.com>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_151709_753676_9D2F4F17 
X-CRM114-Status: GOOD (  14.93  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

nanddev_mtd_max_bad_blocks() is implemented by the generic NAND layer
and is already doing what we need. Reuse this function instead of
having our own implementation.

While at it, get rid of the ->max_bb_per_die and ->blocks_per_die
fields which are now unused.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/raw/nand_base.c | 38 +-------------------------------
 drivers/mtd/nand/raw/nand_onfi.c |  3 ---
 include/linux/mtd/rawnand.h      |  5 -----
 3 files changed, 1 insertion(+), 45 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 54d32ed57297..700b99a77789 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4350,42 +4350,6 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return nand_block_markbad_lowlevel(mtd_to_nand(mtd), ofs);
 }
 
-/**
- * nand_max_bad_blocks - [MTD Interface] Max number of bad blocks for an mtd
- * @mtd: MTD device structure
- * @ofs: offset relative to mtd start
- * @len: length of mtd
- */
-static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	u32 part_start_block;
-	u32 part_end_block;
-	u32 part_start_die;
-	u32 part_end_die;
-
-	/*
-	 * max_bb_per_die and blocks_per_die used to determine
-	 * the maximum bad block count.
-	 */
-	if (!chip->max_bb_per_die || !chip->blocks_per_die)
-		return -ENOTSUPP;
-
-	/* Get the start and end of the partition in erase blocks. */
-	part_start_block = mtd_div_by_eb(ofs, mtd);
-	part_end_block = mtd_div_by_eb(len, mtd) + part_start_block - 1;
-
-	/* Get the start and end LUNs of the partition. */
-	part_start_die = part_start_block / chip->blocks_per_die;
-	part_end_die = part_end_block / chip->blocks_per_die;
-
-	/*
-	 * Look up the bad blocks per unit and multiply by the number of units
-	 * that the partition spans.
-	 */
-	return chip->max_bb_per_die * (part_end_die - part_start_die + 1);
-}
-
 /**
  * nand_suspend - [MTD Interface] Suspend the NAND flash
  * @mtd: MTD device structure
@@ -5858,7 +5822,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	mtd->_block_isreserved = nand_block_isreserved;
 	mtd->_block_isbad = nand_block_isbad;
 	mtd->_block_markbad = nand_block_markbad;
-	mtd->_max_bad_blocks = nand_max_bad_blocks;
+	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
 
 	/*
 	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index f3f59cf37d7f..3ca9c8923a30 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -251,9 +251,6 @@ int nand_onfi_detect(struct nand_chip *chip)
 	memorg->bits_per_cell = p->bits_per_cell;
 	chip->bits_per_cell = p->bits_per_cell;
 
-	chip->max_bb_per_die = le16_to_cpu(p->bb_per_lun);
-	chip->blocks_per_die = le32_to_cpu(p->blocks_per_lun);
-
 	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
 		chip->options |= NAND_BUSWIDTH_16;
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 00a8795b215d..d748e09de480 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1027,9 +1027,6 @@ struct nand_legacy {
  * @id:			[INTERN] holds NAND ID
  * @parameters:		[INTERN] holds generic parameters under an easily
  *			readable form.
- * @max_bb_per_die:	[INTERN] the max number of bad blocks each die of a
- *			this nand device will encounter their life times.
- * @blocks_per_die:	[INTERN] The number of PEBs in a die
  * @data_interface:	[INTERN] NAND interface timing information
  * @cur_cs:		currently selected target. -1 means no target selected,
  *			otherwise we should always have cur_cs >= 0 &&
@@ -1085,8 +1082,6 @@ struct nand_chip {
 
 	struct nand_id id;
 	struct nand_parameters parameters;
-	u16 max_bb_per_die;
-	u32 blocks_per_die;
 
 	struct nand_data_interface data_interface;
 
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
