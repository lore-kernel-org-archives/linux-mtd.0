Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DC2C61DA4
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Feb 2023 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MKfh6/j+OQWxV10pHOCUXcPwoLFOJIR1Ryi1Pae3j4=; b=T4F1SfTzBuTRqk
	clq4E0yGY9FDhElAlF35/NVW3syyW7MpPW5cHjUfbpUX7WkGc5NFLTExWKLfxLoh28oSzJJ3gv19Z
	UhVc2Mq9jo5+fDJi2fqN7htsb8IcboMvqFUmj8h7QkJy9113dedGJQKNdROBkhh0cPDtgsmznR3nL
	iUYbElGqLSvx4bNwB7lW6AdFswOmQTmdZBVtuUQbms72AaIbEwsJHyRdpYID7eqTfS1q99+eYYx2j
	AY1S2MMgFS66pTsW/znrfkfeVjiHHNHBtAjLDQiOgcaU+Oxl8tYjFfB2v9X0P2KASmDrWXCMfBpAK
	VIs1dLSs8OWtCLYbOnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOJdv-005Bt1-G8; Sat, 04 Feb 2023 14:35:51 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOJdT-005BlS-1I; Sat, 04 Feb 2023 14:35:25 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C3EDA5C012A;
	Sat,  4 Feb 2023 09:35:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 04 Feb 2023 09:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1675521319; x=1675607719; bh=z8
	+r2WBFXUDnilpI4tJA/upCWvhtMve9E2bc0bx/InM=; b=BzP7c34VyWpM+TWZLt
	kWCITqpGjiDjHHl9cvQk+awGK4TbfJY3CJUMtNTU7vFA/qqEQJisyHd0mlSgI8Se
	M4X4YRgUlck5wtn63OdIE6uv4APVG5Ky5N7iS8NuncAd8zpGkvv2Xc+KAm3mgtK9
	wJaTSVNwPfwbSk8V0qJoNT8GMn9ZtgRvR7yN/MDb0RAij03j2msCBRNXSMTG1jxT
	qvUSzW3wL5YWkng35n+r1y6fpDOCkuPzqgiRq6mgV9459/aldVHspxQ8nqKSncfY
	iD6w51/18Frmmz0hVQPiWSakdBPG755WMxk4a5I69umHJx2e0lg8y9U5427GAo1J
	LgAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1675521319; x=1675607719; bh=z8+r2WBFXUDni
	lpI4tJA/upCWvhtMve9E2bc0bx/InM=; b=eVxxNR24iCwEyy7vPhoQR0TBUeS44
	BYZp4hTfsQ6EWpQBdKtPyYtfLiIaH+XGAbpP5guCcHb3HLIo1P+XgSR474GVjIbt
	/meB13cH89phgFXQMJKcztjvYofH6hLPeAiiulwGUHgqnIMhD88XfzOlFZDCvIJk
	VsbRkXhUGuveTBfuP0+/OJeHWMbgYoYpTihZNkCZTykwJaKf7RhAAKmsIlvdHz7O
	GNwMR+vegwMSi2qZx4qGnxrA5URsYlIwK1Wb1W90zSSM/JhZ1J3+5tcT3aGNhwCa
	HCL3oQ42EYN2vThwclHLm3Nrr4kWpm3Snd0npHVEbiBIuLMfDv3lgr9WQ==
X-ME-Sender: <xms:J23eY90XcnnlFNClXUu-xmu30ApA-kny4v2MfnyrCXOVCmoAufTpYQ>
    <xme:J23eY0HTtiR0YfpjpovzgwmbLLh_jAW3w-z5IOAg09hKAkSA9bRJh9C9n_Jsnb9MB
    4gYA3QsZXAIfwMMQQ>
X-ME-Received: <xmr:J23eY96w8PhW31NyHEh6v2PRVl1hfqeLUVc2HREuOdP-b0Qtlq1QRTtEOc6NOqmlq0Er0fk6jE3Pmo4_PusfH_0re1NmP0NF6LXwphjq2s0KBPF8DwTivDeNJZCR_IMVUwhg9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudegvddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:J23eY60u7hKt78efhnca3LhZkES-v_ylttMKdNmQPtvfppPpRc93hw>
    <xmx:J23eYwESGVfirjcDoHCrg9NNwNXtbILIUhArv84Mqqub01_D98FZQg>
    <xmx:J23eY78srJNOb7GK1k9GYYLv47xqBLlukHqamj7yXoAs-iPZMNBGLg>
    <xmx:J23eY7BUUM5iFiS5w82KeAqBX0LB-LTMSq5QwWRb2ldljtdQawrBvw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Feb 2023 09:35:19 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] mtd: rawnand: sunxi: Embed sunxi_nand_hw_ecc by value
Date: Sat,  4 Feb 2023 08:35:19 -0600
Message-Id: <20230204143520.9682-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230204143520.9682-1-samuel@sholland.org>
References: <20230204143520.9682-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_063523_396727_4FF6ADA0 
X-CRM114-Status: GOOD (  16.92  )
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

The sunxi_nand_hw_ecc object is not shared, and it has the same lifetime
as the sunxi_nand_chip which points to it, so we can embed it in the
outer structure instead of using a pointer. This removes an unnecessary
memory allocation and simplifies the error handling code.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Keep `struct sunxi_nand_hw_ecc` but change the pointer to a value
 - New patch for v2

 drivers/mtd/nand/raw/sunxi_nand.c | 45 +++++--------------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3c32d31f20aa..a0d0cb17c150 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -193,7 +193,7 @@ struct sunxi_nand_hw_ecc {
 struct sunxi_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
-	struct sunxi_nand_hw_ecc *ecc;
+	struct sunxi_nand_hw_ecc ecc;
 	unsigned long clk_rate;
 	u32 timing_cfg;
 	u32 timing_ctl;
@@ -694,7 +694,7 @@ static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
 	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
 	ecc_ctl &= ~(NFC_ECC_MODE_MSK | NFC_ECC_PIPELINE |
 		     NFC_ECC_BLOCK_SIZE_MSK);
-	ecc_ctl |= NFC_ECC_EN | NFC_ECC_MODE(sunxi_nand->ecc->mode) |
+	ecc_ctl |= NFC_ECC_EN | NFC_ECC_MODE(sunxi_nand->ecc.mode) |
 		   NFC_ECC_EXCEPTION | NFC_ECC_PIPELINE;
 
 	if (nand->ecc.size == 512)
@@ -1626,11 +1626,6 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
 	.free = sunxi_nand_ooblayout_free,
 };
 
-static void sunxi_nand_hw_ecc_ctrl_cleanup(struct sunxi_nand_chip *sunxi_nand)
-{
-	kfree(sunxi_nand->ecc);
-}
-
 static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				       struct nand_ecc_ctrl *ecc,
 				       struct device_node *np)
@@ -1641,7 +1636,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	int nsectors;
-	int ret;
 	int i;
 
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
@@ -1676,10 +1670,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (ecc->size != 512 && ecc->size != 1024)
 		return -EINVAL;
 
-	sunxi_nand->ecc = kzalloc(sizeof(*sunxi_nand->ecc), GFP_KERNEL);
-	if (!sunxi_nand->ecc)
-		return -ENOMEM;
-
 	/* Prefer 1k ECC chunk over 512 ones */
 	if (ecc->size == 512 && mtd->writesize > 512) {
 		ecc->size = 1024;
@@ -1700,11 +1690,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 	if (i >= ARRAY_SIZE(strengths)) {
 		dev_err(nfc->dev, "unsupported strength\n");
-		ret = -ENOTSUPP;
-		goto err;
+		return -ENOTSUPP;
 	}
 
-	sunxi_nand->ecc->mode = i;
+	sunxi_nand->ecc.mode = i;
 
 	/* HW ECC always request ECC bytes for 1024 bytes blocks */
 	ecc->bytes = DIV_ROUND_UP(ecc->strength * fls(8 * 1024), 8);
@@ -1714,10 +1703,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 	nsectors = mtd->writesize / ecc->size;
 
-	if (mtd->oobsize < ((ecc->bytes + 4) * nsectors)) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (mtd->oobsize < ((ecc->bytes + 4) * nsectors))
+		return -EINVAL;
 
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
@@ -1740,25 +1727,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob_raw = nand_write_oob_std;
 
 	return 0;
-
-err:
-	kfree(sunxi_nand->ecc);
-
-	return ret;
-}
-
-static void sunxi_nand_ecc_cleanup(struct sunxi_nand_chip *sunxi_nand)
-{
-	struct nand_ecc_ctrl *ecc = &sunxi_nand->nand.ecc;
-
-	switch (ecc->engine_type) {
-	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		sunxi_nand_hw_ecc_ctrl_cleanup(sunxi_nand);
-		break;
-	case NAND_ECC_ENGINE_TYPE_NONE:
-	default:
-		break;
-	}
 }
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
@@ -1971,7 +1939,6 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
 		nand_cleanup(chip);
-		sunxi_nand_ecc_cleanup(sunxi_nand);
 		list_del(&sunxi_nand->node);
 	}
 }
-- 
2.37.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
