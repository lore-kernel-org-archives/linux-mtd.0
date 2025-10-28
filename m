Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8F7CCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vE/h68Ovl9JmMMggm/zEr316mQ6eelkpBYSB0lp+0I=; b=Kc+Ey4swAKGVrl
	cVbcx5p5EUclqa1fB+15NvCsvmPmYzRlPyYxAIoWo8USt13mxlKTUOer9vXWBZcw6sspD2xAEYyNk
	z0D7e/QdbMs8mx78Urr2FnKQp3MZwS4w3I1Jd0GnMbYZIftLweev+5Q0jpTDfO5oxhgv4E4ElBT/0
	O+wzaRrKuLFxKPNLwc/VzYo1lBmpDupD6QFHI8rBmzgykJ7PxZf+sUDwPN34tTk0geLI4btMi7WBo
	mos1jbLPDBDEa5++EdQXXP5dJIMfT/LtMNGeGF9FMdr6W7ANXgV+/HD1CgkJ2zoYCm9KUKQYIR4dk
	GJUTwWqT/4JIqbd07gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeGd-0000000FRn4-2e0y;
	Tue, 28 Oct 2025 07:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFw-0000000FQuE-0daH;
	Tue, 28 Oct 2025 07:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qOHo3aRp7GtpdjzeP4ruBh5PWxRJgRSodXbxJiaPuAQ=; b=T1/iR8WYHYzWYEMrv4wzUP2sU8
	ftNqiA3IknrQ/fBjs/jQqRl/Gv5t2mYmy4FiuK5m7GcntrvrRFcWxY5y8JxVnk/9NQgG4xehHVqGL
	RGVjXb/jHL0BZAjMrIAOiDb9uuEge/F/vl6q/ARv1Nu1m9hvBL25EjQ1IPDIWayNlw80ZmH01TrTa
	3iytgO4ImC0+iAV/eSxAr/ia/jftg4mQP8zIWX82+ScPtq3/J5zUIFTEWvgyEA6zGevN0QCKJY/kb
	qvNq5DZQZkhsYXW4sl4pPZDr2IclELzmyReHVaD35HNYBB1ApcF225GsLZsX+wIxX7IK6/AfuzIbc
	lrlTCK0g==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdO7-00000003ozk-44SL;
	Tue, 28 Oct 2025 06:41:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D1E2C0BE9C;
	Tue, 28 Oct 2025 07:36:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A91EB606AB;
	Tue, 28 Oct 2025 07:36:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75DDA102F2523;
	Tue, 28 Oct 2025 08:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636983; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qOHo3aRp7GtpdjzeP4ruBh5PWxRJgRSodXbxJiaPuAQ=;
	b=zROxmF+t5NB7LNAk+4RYv97xeOLnM46T6i12IYbwD0TSnXemOw/rpvAWpZlvZC6zlUcEfC
	0SkebY5LVTUA84sG2L2UtotiqfF07saxrsH7Q+m+/fKuoKtDgpuwNfH3XWcYYiHQyJ49zS
	VxQAESuqxMWNTB7WY2r1iX6tcmAgWqk+HbaEcxM2/uqf1Kwp+mnWD0RtsdepKMzFpz1Wt5
	tZieka6QPtCudg08w45pPvz30AiPlhCDpYBRiw2Bvs0pMOLs9Pn9ekZp6CGnDUTQA5Dyg5
	Lb5Z8lHIa/0hMj2brD8Jsh3+8JbotjPfvqrRpOAYOhSGrHdDBpXTk8C6wAJeZg==
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
Subject: [PATCH v4 11/16] mtd: rawnand: sunxi: introduce reg_pat_id in sunxi_nfc_caps
Date: Tue, 28 Oct 2025 08:35:04 +0100
Message-ID: <20251028073534.526992-12-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_064100_072568_28291CFD 
X-CRM114-Status: GOOD (  12.55  )
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
index 7dfc50a788e2..3cb84e502ad7 100644
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
@@ -238,6 +239,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
  * @reg_user_data:	User data register
+ * @reg_pat_id:		Pattern ID Register
  * @reg_pat_found:	Data Pattern Status Register
  * @random_en_mask:	RANDOM_EN mask in NFC_ECC_CTL register
  * @random_dir_mask:	RANDOM_DIRECTION mask in NFC_ECC_CTL register
@@ -253,6 +255,7 @@ struct sunxi_nfc_caps {
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
 	unsigned int reg_user_data;
+	unsigned int reg_pat_id;
 	unsigned int reg_pat_found;
 	unsigned int random_en_mask;
 	unsigned int random_dir_mask;
@@ -813,7 +816,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -2233,6 +2236,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
 	.random_dir_mask = BIT(10),
@@ -2249,6 +2253,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
 	.reg_user_data = NFC_REG_A10_USER_DATA,
+	.reg_pat_id = NFC_REG_A10_PAT_ID,
 	.reg_pat_found = NFC_REG_ECC_ST,
 	.random_en_mask = BIT(9),
 	.random_dir_mask = BIT(10),
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
