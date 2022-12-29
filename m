Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB55C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Dec 2022 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NxvCveQVdyIm78G+0QPOvjLQ81spQLLgKkWQ2fqjm58=; b=YllqyR/l8odAv5
	AgkQSITdoAoPvpNJVufZhWeLwnpqZsfPn8dylUniK1iiiqU4FWc+PXt5WhJqx7PFw1vPjQCOXO7JD
	f9dPo595tyNFRKlk4/uyguawk2l4MUsyAWN/G3ACs9EFddj/xbHGdA2F4Jbqwl6pEtLrZRCdGTFFY
	lkPSVmPy8ZihH13S+PDBFaXDRvL4YPe2ZcGmAZxRLcFH/3tY6R5DGmAQu2jqwZtpzOVGKuPXGk40C
	oQvczfqPfFNDwb7vkl7Xny7zTZ187vG/ZPw7n3XMjqTVWWs6hMpVeNi27TiID9Bj9cb4k3CeWL+LC
	PDQnBWyHJWqCVWNW4kMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxcA-000lqA-LI; Thu, 29 Dec 2022 18:26:51 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAxRV-000h1o-Ts; Thu, 29 Dec 2022 18:16:02 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 5352A32005C1;
	Thu, 29 Dec 2022 13:15:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 13:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672337747; x=1672424147; bh=cc
	VLhMcmGv5G5PBWQJoQHqPqbnjedt1DR07CNYuDpwA=; b=pimmPEMA0ZTHlPQkRY
	Sv9T3GMud0xar6KGf7/ExMGEvsE+gkLoPoe+4sOT5HAwQiOtWz+/+71stIsLbidu
	T2UnPPSI48XL7HI2wP78E4aMCVTT1E0oMRZdEXOU6hQhT/xusKadHyMtHoq3loaV
	wbC65/uq6HB1jVr9jNabrxHJCvAOzAt6UOobwwTyidvW1C6DNPtKoqoxdCi2uQNU
	FqbZKGEpO55oWcQzpajYQ5uMBX4o1oHJxdhnXci8eM+/j8IndhN9Za74blRDk99V
	4oPeYjF3vrkXrtXcrdhwUQVhMxVTVyU/CbGMpjy+RJNmHxhNf8XHN5bM8odYUj0o
	zDlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672337747; x=1672424147; bh=ccVLhMcmGv5G5
	PBWQJoQHqPqbnjedt1DR07CNYuDpwA=; b=ZV3DQMhC1MDoTmBTQY+7NpGmuviZ3
	c5+UXM65FJQmUpmCiQUzGlnk6s0Rspk0pI6/HaBhslmUPi44NCalVr0ER/ghgMpB
	LdMD79+mVdP1V/z6PFAcEfgLjLrWqvk2QaN0SHIwHT9nzIAk+oQgPsAmldugppma
	nE8P0L9+IsvCN/UslNnD0IvLwH+gJdLrOH9DGqviA0sOXahmGa4/ljVoJ++9HUsh
	PfYgBGr/Zvh7JBHTTQL0j+77Kp2SLTQjo3EXfjCM06mhu+OAwko/QzH25Qt6pvLP
	p1MXecAnMr36wY8NGMFh2f/8VB3JjBUyqxIWHeh8bWHSKNiHbZ2j/BMHA==
X-ME-Sender: <xms:U9mtY_mtAj2fwwS0EcUn9McDELUGkChlnJnEKzTGTxlE_pyASuu0-g>
    <xme:U9mtYy3l8_nsZ-2BYUJ-wjYiwQlUw0FkB9PXm_Ez96PBXjponQMiE6V7m4rdo37BC
    9gu-JamoqOM21WI5w>
X-ME-Received: <xmr:U9mtY1pam89qWLw3u1VRjR7EL_ANFHqtoKD1_5opK7ayB51697i13SW0TSsPwMwnjeY5cpehsz7F3iw0SVDgUCzB9M1Z6BrgsfeC9mXKDDPTrqS2PTqOxXTkVvsdcGcQzSlbRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:U9mtY3nALZS1qIcn2J0I7xtDVwwLkUVbBhIjlSqvY4MrJosiyY0LPQ>
    <xmx:U9mtY91tN8zO5TCiMGFi8sQAhE6BQFUleOp8MPmIdarpGFVT7ckp6w>
    <xmx:U9mtY2vx8C6hep4_oK8du6AfeqfZsiPCjD36CByi_T2Kvj4ucRqUww>
    <xmx:U9mtY2sxeYFdn8pnRYQislGo7sZiWDcyEalHvZIf5WuaKNtnBPshcg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:47 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 7/7] mtd: rawnand: sunxi: Precompute the ECC_CTL register value
Date: Thu, 29 Dec 2022 12:15:26 -0600
Message-Id: <20221229181526.53766-8-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229181526.53766-1-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_101600_844511_D800EDD7 
X-CRM114-Status: GOOD (  17.83  )
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

This removes an unnecessary memory allocation, and avoids recomputing
the same register value every time ECC is enabled.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/sunxi_nand.c | 75 ++++++-------------------------
 1 file changed, 13 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index a3bc9f7f9e5a..5c5a567d8870 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -169,22 +169,13 @@ struct sunxi_nand_chip_sel {
 	s8 rb;
 };
 
-/**
- * struct sunxi_nand_hw_ecc - stores information related to HW ECC support
- *
- * @mode: the sunxi ECC mode field deduced from ECC requirements
- */
-struct sunxi_nand_hw_ecc {
-	int mode;
-};
-
 /**
  * struct sunxi_nand_chip - stores NAND chip device related information
  *
  * @node: used to store NAND chips into a list
  * @nand: base NAND chip structure
- * @ecc: ECC controller structure
  * @clk_rate: clk_rate required for this NAND chip
+ * @ecc_ctl: ECC_CTL register value for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
  * @nsels: number of CS lines required by the NAND chip
@@ -193,8 +184,8 @@ struct sunxi_nand_hw_ecc {
 struct sunxi_nand_chip {
 	struct list_head node;
 	struct nand_chip nand;
-	struct sunxi_nand_hw_ecc *ecc;
 	unsigned long clk_rate;
+	u32 ecc_ctl;
 	u32 timing_cfg;
 	u32 timing_ctl;
 	int nsels;
@@ -689,26 +680,15 @@ static void sunxi_nfc_hw_ecc_enable(struct nand_chip *nand)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	u32 ecc_ctl;
-
-	ecc_ctl = readl(nfc->regs + NFC_REG_ECC_CTL);
-	ecc_ctl &= ~(NFC_ECC_MODE_MSK | NFC_ECC_PIPELINE |
-		     NFC_ECC_BLOCK_SIZE_MSK);
-	ecc_ctl |= NFC_ECC_EN | NFC_ECC_MODE(sunxi_nand->ecc->mode) |
-		   NFC_ECC_EXCEPTION | NFC_ECC_PIPELINE;
-
-	if (nand->ecc.size == 512)
-		ecc_ctl |= NFC_ECC_BLOCK_512;
 
-	writel(ecc_ctl, nfc->regs + NFC_REG_ECC_CTL);
+	writel(sunxi_nand->ecc_ctl, nfc->regs + NFC_REG_ECC_CTL);
 }
 
 static void sunxi_nfc_hw_ecc_disable(struct nand_chip *nand)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	writel(readl(nfc->regs + NFC_REG_ECC_CTL) & ~NFC_ECC_EN,
-	       nfc->regs + NFC_REG_ECC_CTL);
+	writel(0, nfc->regs + NFC_REG_ECC_CTL);
 }
 
 static inline void sunxi_nfc_user_data_to_buf(u32 user_data, u8 *buf)
@@ -1626,11 +1606,6 @@ static const struct mtd_ooblayout_ops sunxi_nand_ooblayout_ops = {
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
@@ -1641,7 +1616,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_device *nanddev = mtd_to_nanddev(mtd);
 	int nsectors;
-	int ret;
 	int i;
 
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
@@ -1675,10 +1649,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (ecc->size != 512 && ecc->size != 1024)
 		return -EINVAL;
 
-	sunxi_nand->ecc = kzalloc(sizeof(*sunxi_nand->ecc), GFP_KERNEL);
-	if (!sunxi_nand->ecc)
-		return -ENOMEM;
-
 	/* Prefer 1k ECC chunk over 512 ones */
 	if (ecc->size == 512 && mtd->writesize > 512) {
 		ecc->size = 1024;
@@ -1699,12 +1669,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 	if (i >= ARRAY_SIZE(strengths)) {
 		dev_err(nfc->dev, "unsupported strength\n");
-		ret = -ENOTSUPP;
-		goto err;
+		return -ENOTSUPP;
 	}
 
-	sunxi_nand->ecc->mode = i;
-
 	/* HW ECC always request ECC bytes for 1024 bytes blocks */
 	ecc->bytes = DIV_ROUND_UP(ecc->strength * fls(8 * 1024), 8);
 
@@ -1713,10 +1680,14 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 	nsectors = mtd->writesize / ecc->size;
 
-	if (mtd->oobsize < ((ecc->bytes + 4) * nsectors)) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (mtd->oobsize < ((ecc->bytes + 4) * nsectors))
+		return -EINVAL;
+
+	sunxi_nand->ecc_ctl = NFC_ECC_MODE(i) | NFC_ECC_EXCEPTION |
+			      NFC_ECC_PIPELINE | NFC_ECC_EN;
+
+	if (ecc->size == 512)
+		sunxi_nand->ecc_ctl |= NFC_ECC_BLOCK_512;
 
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
@@ -1739,25 +1710,6 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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
@@ -1970,7 +1922,6 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
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
