Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDF5CCD18D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gNfGKpibg5bIvVU/uih/ZA2UIqMrBs1rQHySqvZiX8=; b=lqt2xITNDwuwGo
	2XjTJAtCbMvib+3eL8yFjHPLEgPPiP88nDzZe+gYaeRX7wTd8ikJ7MxynvxyVUKe+DwIj9xaM6cFp
	h53aRDpJazMVqAzTHENO5KmEOYyOZrHPWEifP0DiTN4h48BhWGFN02CkoEZvNvdw0vvgPi/s5k3aN
	jxitVm9OMERu/O/8mI4XYRk7kDRezfbTHBNYeL7KEMYPpKsfnhkxsexvcL/XtSYIDJoUzyC12Iw7z
	2b/vcCh6Rcf3eRebTJDtoptva2wQ5m9nqTL8Xg+f0CQBhD9tCrJgCTVe3Zukb3+/qjsTrhnLf1Psf
	1NltM5MsE0aH0W6VRdTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTC-0000000DfC5-1Wj1;
	Mon, 13 Oct 2025 15:28:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KT9-0000000Df5P-2aFU
	for linux-mtd@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RRPaMbfJAZI7RCNqN6ObTFqj0JMSPmSj/5WzMmnBcMY=; b=kVbKXaXXhO4hoB3Xb8xL0bo98U
	zg7XPekMNIZUa/wCaAQHtkZs3t5esvQEsfFZ8Rcr85pBIubeAWpCEM79Z2qxM37Y2hJP3m2hi2fop
	uvqv9ogB+sDuAubPLnO8H2+caLXu025iODa9BRgxWQm8gSGg6TUuRGPwl7DzER0kyPbGZH1NR1DHm
	4A1ST2CxwzKnmIgN+DplQz0WcTRhR80VFaUaCEnEfwCa670OxI1OzQxqIBn7C4gpdwQx11uKzUL+X
	ed2q5DdTrgdxsjKa70pSOYUQXB5valy1rH1NjLw16kXxdRlROUuJyVecX9XRkVd2M+2QkguyaP/xD
	vgNprw1Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KSr-00000004Pc5-1lxg
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:28:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D45A4E41063;
	Mon, 13 Oct 2025 15:27:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 429E26067B;
	Mon, 13 Oct 2025 15:27:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 208E8102F2277;
	Mon, 13 Oct 2025 17:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760369268; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=RRPaMbfJAZI7RCNqN6ObTFqj0JMSPmSj/5WzMmnBcMY=;
	b=apUQxUpHpg/ZIaP095w7QY+JMayDiqWv5qeSQ6JFegHHHw8Rw6o9wjsemo3m6GTAbwpxFt
	buLzQ7HelDLi88uJKSj6AlRoprXrjZbrSCkh9ji1zW8fj8l+gKLEcwZuojn3bsyzLEDJtL
	uXI3FvJ8HiQC6EOj7qRQzW2cUe23bKMjIo94QioiAHqaORj6Vt3PlnfRwKP/gDcolXjgYB
	s9muM/rWmp/k8owIK+3tfNpqls04E5f2cwjTsbQ9A3VhnygxjfnvXTwlBuq0UgatfHm6wC
	BDNggnFD3u8V59MenfFzV2xBUCHACE1cnwpm7Brs/74IENMM6vxq6VBWMqhOXw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 09/15] mtd: rawnand: sunxi: introduce reg_pat_id in sunxi_nfc_caps
Date: Mon, 13 Oct 2025 17:26:39 +0200
Message-ID: <20251013152645.1119308-10-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013152645.1119308-1-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_162758_434168_6A225275 
X-CRM114-Status: GOOD (  11.59  )
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

The H6/H616 pattern ID register is not at the same offset as the
A10/A23 one, so move its offset into sunxi_nfc_caps.

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3ccb7ea7cf17..e8c08f0139d2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -55,7 +55,8 @@
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_SPARE_AREA	0x00A0
-#define NFC_REG_PAT_ID		0x00A4
+#define NFC_REG_PAT_ID(nfc) (nfc->caps->reg_pat_id)
+#define NFC_REG_A10_PAT_ID	0x00A4
 #define NFC_REG_MDMA_ADDR	0x00C0
 #define NFC_REG_MDMA_CNT	0x00C4
 #define NFC_RAM0_BASE		0x0400
@@ -227,6 +228,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
+ * @reg_pat_id:		Pattern ID Register
  * @reg_pat_found:	Data Pattern Status Register
  * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
  * @random_dir_mask:	RANDOM_DIRECTION mask in NFC_ECC_CTL register
@@ -242,6 +244,7 @@ struct sunxi_nfc_caps {
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
+	unsigned int reg_pat_id;
 	unsigned int reg_pat_found;
 	unsigned int random_en_mask;
 	unsigned int random_dir_mask;
@@ -803,7 +806,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -2223,6 +2226,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
 	.random_dir_mask = BIT(10),
@@ -2239,6 +2243,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
 	.random_dir_mask = BIT(10),

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
