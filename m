Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31588C5ACD5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 16:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+u75PURAzG0u/btTaPW1JUeCIh6cw8JQOGI0Blcn+fo=; b=39PMbSZA8uxFyE
	lLlgeGvmYnGx7CBHPtMtnEQ/nc2CbW5iBbSPlB1//tdwTaps6v4fnttK47F7eZ0hRKKzoc5KpyUs4
	nzpB78LE8x59+HitnDdsX228VWlqnpuDDD1EDab0RQuQXLiL9NXjOmrt4g0GImWiRaSip/ekSqaw/
	HU07vakKVn432JiWRiaAzrExY7JiNHDU+Pd3QgwMFXKPwxVskwojYa0VRcqrozAx6QZN1jGHtcmDt
	LXz+Glz517H/9uV8vcuGMBlp3O/pFx7/Co+DJq42kYxDnHu7qWeFofVcp4hhp6WTdMkSnn+P7ar9v
	t8uSGpImmkFByL/YgMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5W-0000000FBZ7-3iT2;
	Fri, 20 Feb 2026 16:10:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtT5S-0000000FBSj-0dXQ
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 16:10:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8058EC16543;
	Fri, 20 Feb 2026 16:10:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A26835FA8F;
	Fri, 20 Feb 2026 16:10:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9149C10368D47;
	Fri, 20 Feb 2026 17:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771603835; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Kma/dQTmZIgX72gFxn/OuuMgzz0tSVOS/9inwwwNmo=;
	b=sHDQeCgn5sygMr4vwv4OD7wil38NEv5yfweX8rCtUpz8/kUeTJ4GAalBkzAk0Gg386lbVI
	xURYIDJLOgTo/cTYkiPhW2PJsSmhNi3ZVWPdeZDzUrDLazd7LN0Ljy9OE1WdKHZ1aY8faK
	/ORDFlZM7CiIdswgtCAMdtEl9mSi6KXFvZ7zzUi/FwMrXgWC9iYiOVjzc733bwA3tdXqem
	V1Xn1rr+TdqDY+wxE86qlpR51qay8ZDMio2lRCZjP//3d3wI00xKemifZ7aLCRE/k0dgKR
	SfpPGjrjrTFf95ihDcAqxZICe2m+jzles+Cz0D7iGM9rtUYP6UHMdrTx2LyONw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
Date: Fri, 20 Feb 2026 17:10:08 +0100
Message-ID: <20260220161011.999642-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260220161011.999642-1-richard.genoud@bootlin.com>
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_081038_367444_48E629DB 
X-CRM114-Status: GOOD (  17.03  )
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

BBM is part of USER_DATA section, so we should remove it twice

This was working ok because we are on the safe size, advertising that
there was 2 bytes less available than reality.

But we can't change old platforms, since it may lead to a different ECC
strength, so, introduce a legacy flag for old platforms, and switch the
new platforms to the correct count.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9c6e0625e34f..99d305bbda53 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -281,6 +281,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @legacy_max_strength:If the maximize strength function was off by 2 bytes
+ *			NB: this should not be used in new controllers
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
@@ -310,6 +312,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool legacy_max_strength;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
@@ -1811,10 +1814,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 
-		/* Reserve 2 bytes for the BBM */
-		bytes = (mtd->oobsize - 2) / nsectors;
+		/*
+		 * The 2 BBM bytes should not be removed from the grand total,
+		 * because they are part of the USER_DATA_SZ.
+		 * But we can't modify that for older platform since it may
+		 * result in a stronger ECC at the end, and break the
+		 * compatibility.
+		 */
+		if (nfc->caps->legacy_max_strength)
+			bytes = (mtd->oobsize - 2) / nsectors;
+		else
+			bytes = mtd->oobsize / nsectors;
 
-		/* 4 non-ECC bytes are added before each ECC bytes section */
+		/*
+		 * USER_DATA_SZ non-ECC bytes are added before each ECC bytes
+		 * section, they contain the 2 BBM bytes
+		 */
 		bytes -= USER_DATA_SZ;
 
 		/* and bytes has to be even. */
@@ -2379,6 +2394,7 @@ static const u8 sunxi_user_data_len_h6[] = {
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.has_ecc_block_512 = true,
+	.legacy_max_strength = true,
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2400,6 +2416,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.has_ecc_block_512 = true,
+	.legacy_max_strength = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
