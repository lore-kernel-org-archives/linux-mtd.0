Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF16EF3092B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKHMFSwqpeWhP9mxW25TpcifTWrfk1BQgUip2twkW9E=; b=n08b5vVcHXGSOo
	J+2OnW/4f8zA8t4KzUcTBTkK3TMKDJl/nQ/4HEGtgG/3VeY6Uv6VTTkEAVHaIXpyCIer+5/9xHXRx
	o3boYqtvTke4HtUY9bSj/nDj0rKy8EmlTGk9OSudsbVVzjGi4y+48S229fI5slMrmSSzWcWaVeNGw
	KmLz6/awmXO48ZlmvkBc8B0Lbs9yfh3aYt5gWIbk/dFn0eYH5RPuu+hle/e2p5htj5JIQXdbZSynp
	R4+4CuZ7Cb+kDWjxyisYoXEjYrbct4+1j+dUsfGvYy1Nbt3/tvNasip4toc8QoKML5YCpi2rehhoD
	hTCNAmSAWmcVWQwzcDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X8-00000001UUQ-15XJ;
	Thu, 05 Mar 2026 10:02:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X5-00000001UOn-1epO;
	Thu, 05 Mar 2026 10:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EFWtYCwuiTAqb7Iuhvh3esPyqysUJUFJvc16hy8gPX4=; b=s0Wl/BFOwewAGjb+sqyJ9AcRIk
	58ZiuBzLwUFlxVUfVNOaroJET1d71UnZDeT+xQ6TZmPGXCnM8Ez4sRzJP165upUtJpmdXA6GfzFsw
	vTdwq+BPwdJUvHet7NWfHi+kCQ49SCTP82l9xXkSFB8y2BUd+/6y4a8ZwMU9KtyzxL9Tgldg4hwho
	Ap0upx6ioW22tZr+ixyVLJ31qx9bR2m1bwiZAKgNNsLGgaDNDH9eV8zgLH5vVT18TUizp78dcjiaN
	bwiYHO2GhplRYDagfGA6h/bz6NLcyqP+Xi99ddFkNfgV5g4ezhxaDdhtdxzNB9wQHe/RwOA1nPnom
	nKd92vrQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X2-0000000EnUC-2XqJ;
	Thu, 05 Mar 2026 10:02:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C9DB01A2CDD;
	Thu,  5 Mar 2026 10:02:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A060D5FDEB;
	Thu,  5 Mar 2026 10:02:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63BD010369865;
	Thu,  5 Mar 2026 11:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704928; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EFWtYCwuiTAqb7Iuhvh3esPyqysUJUFJvc16hy8gPX4=;
	b=iqXobXziyhbydna86VZHaBVfu8irXfP5fDZee0I30F7kKXcfJ6hSBPac2+UjdRn0JEK6Om
	E/Cpjd/Z3V9MN3btieZCRIi7EoaBpRVAbhH6RWoPixSboFc516gPbqVx9b4VbKbmGRyPLM
	tAiVC5yIWphevXdQZ47J+UsnsmMnGsbSRxOIB/NQxPOy0Iy4hs2MHkjAq2VLki3falVFDz
	dZiCM8QNunDfN38dj1SujD2fvZScPzIHNrq1/MMy7pro7Bgu7JDcr9+yhYVIcm17VmkNPk
	sbDxIPH76BrjMrRnLs4Z0EeXFywE1diLz75JQa2OWh00LafGichJqpI7U4pqrw==
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
Subject: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
Date: Thu,  5 Mar 2026 11:01:34 +0100
Message-ID: <20260305100137.2558423-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305100137.2558423-1-richard.genoud@bootlin.com>
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100212_772233_311C1E22 
X-CRM114-Status: GOOD (  17.22  )
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
there was 2 bytes less available than in reality.

But we can't change old platforms, since it may lead to a different ECC
strength, so, introduce a legacy flag for old platforms, and switch the
new platforms to the correct count.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8af449e548d4..d126dc18ef27 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -275,6 +275,8 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @has_ecc_block_512:	If the ECC can handle 512B or only 1024B chuncks
  * @has_ecc_clk:	If the controller needs an ECC clock.
  * @has_mbus_clk:	If the controller needs a mbus clock.
+ * @legacy_max_strength:If the maximize strength function was off by 2 bytes
+ *			NB: this should not be used in new controllers
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
@@ -304,6 +306,7 @@ struct sunxi_nfc_caps {
 	bool has_ecc_block_512;
 	bool has_ecc_clk;
 	bool has_mbus_clk;
+	bool legacy_max_strength;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
@@ -1805,10 +1808,22 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
@@ -2373,6 +2388,7 @@ static const u8 sunxi_user_data_len_h6[] = {
 
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.has_ecc_block_512 = true,
+	.legacy_max_strength = true,
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
@@ -2394,6 +2410,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
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
