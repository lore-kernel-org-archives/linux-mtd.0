Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AFAC5B570
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BixIb5dXzOedjXskqo0ckUn1ShRq25xseZrUnoLmefc=; b=pvNmmSu/wtcDt8
	JVyFY5OcHYoSlugRM40YLEVwRUCJhTLmC/wRGqOQHORvjxXKonFAOFuKpX51Qs+RPTw6pMk5g/1dR
	77Hm/vvIxEfZZvvHTzFPqlIog6Gjaw8AKoIpNSEl/8L8tasvK9TaIKTO4tuOEkMXVYNvPTqwz6dLL
	paaP1MCYRdu1UFFJjcAhC2lKb//ueCgUSNuEFEufjF2MHwBmFhXoGR1Thc4ee7YjrvO0zwTK4naJ4
	36z++pJDK9aajvxvn3Hsje4BnE9ik3pzid6OdNI2l2Jz0tpeVZ6zDRW01t+89FLYf0N85c0qWzvE0
	2izJKka0ZRKCjzKrJxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3M-0000000D0KE-3rZ1;
	Mon, 10 Aug 2026 23:05:08 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3I-0000000D0GS-2Uak
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 23:05:07 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso362490a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403104; x=1787007904; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgRrZ9Syd42HBAGwa14VS7M9xbVwRyd/vuhJqBFFn7w=;
        b=LRRf7l1W5laoGEUGzSjZzeE7sbjufKNKjtp7q7VE3fXyxdfqcWQinGbqdoWS5PCy2d
         0aBH4rzW3KoS7Rfxy3tWDA45ipzqe/lmTHvKeV2KeHUX1xxqs7TF9wg7acsodSflEPyE
         XB7b+tz/xNJRFMXd0R2jUdv8Rxczp/uv4Utjun30q6UMXKKclcwNU0hjDFCOidtJ0Rlw
         3+/9pG2DnGx3wUhNbdkgstVrQ+T6IllDKjNmEFMN7BFsbOHNNHf2kBj5UI9cxkLDNp0I
         l3ebs02nx63yqpqeFcCjEOO9GO+HonI4QWFKM2FZiIDPqF35TbRfzp79hgndtGtC4sTu
         4qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403104; x=1787007904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgRrZ9Syd42HBAGwa14VS7M9xbVwRyd/vuhJqBFFn7w=;
        b=Nir0LFlLrP+ISHQJDxIm+LsK/Vx4zSpp0EbfR9eVVTwEBKxBuBwZ1wQ4CW/siGXz7E
         qXeKpCj6dYQ6/zXiTI6yqnyEj1LJ0z9xyD3R8WPZ9mv4/HG9nV+kauvvj40dLMNdadfi
         SL/1oivf4NmNBK5Ylz+5Dtp3QWNy3ni75sxy9YS5kXlg8WxVdURvLZFZ90xs4ylzW8p3
         JgRTZUp9exYICvCJ+NYXeTZ9o6ncaBr2AQIFfDOZTC69TY4GfO488DKP+pdexujvcIRO
         MdXVAEjyKMxhrzpqReCv+mcQ4ulQ8L24eNpNOTDv/QN5nW4IzWBSGm9DRmvk6pbJrlEI
         mbLw==
X-Gm-Message-State: AOJu0Yzc45Oz11afUnD4hITLTiY0OC3P3rqt0mUT9e9MwzlWPHZAeQJ2
	crNCKGHDV/3hmo9eTVnhyj+r/J2TbWbPEfBq04GVHB7Z2nsf739Cn2I5
X-Gm-Gg: AR+sD13W0T9JxPhleIefqO1ky2CBSOtuxJc1X/6LxeWhF3dWoCSXAjwXDnVHO3Zu66i
	V19TQNLg9yNifEO5l74t52+rmy1BQ9iMDUWb0iZaablqBHp5mKUoa9bB3Qty31S5Oth9h8+y1Yy
	AQDEe1gtwg47ezWXhuGxHleIGZjcclOuk/o+MiDfVJhSS3cqbdFOf+EEQLvioKJzwVYKkC0z+KR
	CYAn3hZXhjSsLmJqncOnWXaK2Vy3Ehltefm5b/qNAtgErXhZhvypc9PL2K8GMKK1VmFu+5PO7Is
	PGXSwPpDNZk4C0wfcIBjRXwHIxPa338Jz3gPaCkxhiIh54JTvIIMQY2EXrkTq73omm16X4Sz2VD
	1Tw/EiQvhntPfeENIdyRUYU2THjJNA+IVWikVkP9jBWZOoW9xwRIgjGzCVZRypcKfFzr7qwPDLr
	WTxcEcAPC8TgIckCP2fbQobAej4YvU3cYaXyv7/CItsfTwge1aYPMdZlyZv+r6ucl+PoRL7ZQ7T
	RSnhwgMwte3bKd42SS5dN/xHf1dVk5zC9ikDB36GbcaUb88zA1CK+S7XnDI+p28ZkbkfopjeQKy
	57gEnVgMK98oVMHEFYrM+BiY2Uy+DclZX1b3wh+hHdK7DtEXkgEaa7aUhlGihnisfbuyqYHTQ2U
	mYYqLa+E8I2YmDKeZmiXWS7cOmH4=
X-Received: by 2002:a05:6830:ed2:b0:7e9:f6b7:7752 with SMTP id 46e09a7af769-7f3a12ff443mr383041a34.12.1786403103828;
        Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:50 -0600
Subject: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
MIME-Version: 1.0
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_160504_649906_F31F0F9F 
X-CRM114-Status: GOOD (  19.39  )
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

The controller randomizer covers the bad block marker along with the
rest of the OOB data. The driver currently compensates the marker bytes
before writes and after reads so that they remain plain on flash.

Allwinner NAND firmware instead stores the marker through the
randomizer. Media using that format appears to contain bad blocks unless
the randomizer is enabled while reading the marker.

Honor the allwinner,randomized-oob property by unconditionally enabling
page scrambling and leaving the marker in the randomizer data stream.
Keep the existing plain marker behavior when the property is absent.
This changes marker handling on all supported controllers; the H6/H616
protected user-data placement is handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..92b26371a6d1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -264,6 +264,7 @@ struct sunxi_nfc_timings {
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @randomized_oob: use the randomized normal-page OOB format
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
@@ -276,6 +277,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool randomized_oob;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -945,7 +947,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	}
 
 	/* De-randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1006,7 +1009,8 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	u8 *user_data = NULL;
 
 	/* Randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		user_data = kmalloc(user_data_sz, GFP_KERNEL);
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
@@ -2219,6 +2223,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2228,6 +2233,9 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
+	if (sunxi_nand->randomized_oob)
+		nand->options |= NAND_NEED_SCRAMBLING;
+
 	if (nand->options & NAND_NEED_SCRAMBLING)
 		nand->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -2457,6 +2465,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
