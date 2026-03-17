Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433E7FD877F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfEwM32y4MGdi3xEek7JdsnOJt8TK373/RgXAIAoncg=; b=UGtMccErAgCYps
	1w2WHMkPJqbF0O60IdjYXK+xJTIYuj0Z22imdwx7fQICLY3MLKnuQq3ewBhM3MhM81GPhT5A1rro9
	llxOwrTO1Vbyjmsb24oypzy29kPvjsmeB4QHmZTttBCK58wW7A0D3jR8/n2ebJxkqSzTQL0hn806Q
	AncWkzRIR72ZQ+Jr/hPOWXsw3vZib2oaa7r0xsLi9QiXwvvSX1KCcAgmfn0qPfiT2gvuxAtfewf0O
	b0ppkCM+Os5B4R0YTXh72X5ypzBPX/HuPlFNiFUx5pxmQRB5hsDACvLjGexQtg4IKH1E6gmfimi1U
	8SZC6Cnrs032GdgGn8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VMG-00000006aCI-2myB;
	Tue, 17 Mar 2026 14:25:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VM5-00000006Zv3-1IiD
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 14:25:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7AB75C55074;
	Tue, 17 Mar 2026 14:25:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F07B1600E3;
	Tue, 17 Mar 2026 14:25:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02A65104505FC;
	Tue, 17 Mar 2026 15:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773757501; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=E9Emq20plq+XttwibzPiXgRgGpuD/bC1Ox5X5v41wYY=;
	b=bUHliGVSH0oSN8FNRlC8Bkn6KrZSPAfyb5lkLV/rZFRO9FMsDH2Wje4zvUKA0zLvK5daNl
	O/RxZ8GfMyS4lwKihMkdikbjE2o9Wduc4gM4yPOn4NBLEEo3K+ouE5NvEoILBVjtGLie7K
	G548RosVZC1f6IyWHtmXMbbx+YtNLUJ5y1qgl3YtTYD1hc7KhiFPw9/2msiS/Mk7+lP4cY
	lNwpaEbLvBIO0X6FXJFuex8msrG5WLJvchfLSEPhhyIAtLACUXc+cQY08aiw6QVNxF3eho
	gAhTc9srfLBTFtN41rkpadwnKDJVorv4JDkfIRbZqaYkaaqa77272UVJm7Itvw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 5/9] mtd: rawnand: sunxi: make the code more self-explanatory
Date: Tue, 17 Mar 2026 15:24:33 +0100
Message-ID: <20260317142437.580204-6-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072509_490441_9C72803E 
X-CRM114-Status: GOOD (  12.35  )
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

In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was forced to 0,
the reason is not trivial to get when reading the code.

The explanation is that, from the NAND flash controller perspective, we
are indeed at step 0 for user data length and ECC errors.

Just add a const value with an explanation to clarify things.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 0b0b5349f446..ca701c75cec5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -963,6 +963,8 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	u32 pattern_found;
 	bool erased;
 	int ret;
+	/* From the controller point of view, we are at step 0 */
+	const int nfc_step = 0;
 
 	if (*cur_off != data_off)
 		nand_change_read_column_op(nand, data_off, NULL, 0, false);
@@ -977,7 +979,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, 0);
+	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -993,10 +995,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
-	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL, 0,
-				       readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found,
-				       &erased);
+	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
+				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+				       pattern_found, &erased);
 	if (erased)
 		return 1;
 
@@ -1029,7 +1030,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 			sunxi_nfc_randomizer_read_buf(nand, oob, ecc->bytes + USER_DATA_SZ,
 						      true, page);
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, 0,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
 							    bbm, page);
 		}
 	}
@@ -1207,6 +1208,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret;
+	/* From the controller point of view, we are at step 0 */
+	const int nfc_step = 0;
 
 	if (data_off != *cur_off)
 		nand_change_write_column_op(nand, data_off, NULL, 0, false);
@@ -1223,8 +1226,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
-	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, 0);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, 0, bbm, page);
+	sunxi_nfc_set_user_data_len(nfc, USER_DATA_SZ, nfc_step);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
