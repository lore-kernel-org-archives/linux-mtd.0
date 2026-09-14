Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9298C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKjcSA3nJIgk9lcWtEFHxu52S97LOAhTG2cWMW318T0=; b=aaW/xpEWlv9g6q
	QRVMoaIvF2K6KoocIa8UTU/ImhETfsQB8/X871R9DKES8jUJdXXDjdQKXVZJ35vydD8MJhKskPGIh
	AM/s+jIRaITGTVhfODGwe9yhuCxukTE/HB3DxG4P20kdk+j5h1Mcg+kCCKJhpglfy/+HY7e1BsyaU
	T5zYllLSwfi7A2Tkvtnqmb+NVl/Dnoj2goKNsXOXz1BPzEFNMxwL/H0RQ/Bp1vBbwVLNmc6j3uAXN
	bXcHDSlHwj0hRm3YARaS3Ne7xTDNzwcUgdlZ4t0P5DIdat2CuFM3ZO8o0NWAqPRs+sA07eqyARrlh
	/Pa+8ahNhsxv2RfaagXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wx0-00000002Cef-1xuG;
	Mon, 14 Sep 2026 03:01:46 +0000
Received: from mail-oo2-x0c.google.com ([2607:f8b0:4864:31::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wwv-00000002CZY-29tW
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:01:42 +0000
Received: by mail-oo2-x0c.google.com with SMTP id 46e09a7af769-805c194bc92so1207135a34.1
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354900; x=1789959700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=lFF1bIsb6OtcVrkCZ98pYcpTZqDhCm61LeY2hWCV4EQUsZowWmMVK3uVnDrHmupY1v
         iOqGrkvoghO4YW+EBR3S9x7YtJJW+GaVE3Hk2/yVuNAeXTwmqx+S9UJpLLBBJ7MC6Zqq
         TjhcFYh6NLcfpLqKiCc1rJJYpfphU0Rd6gZ9cO6Ng+X6SKtiJLMjG2Zybm8gwfY6unTa
         hB2TyfHwY1pF2ExZiQmfR/TAGojIUJbS+olCBeJb0fomSNPdewa6suOZc1ywqvPdYX44
         6itvUvwBuvnFCNZcIdkUx/ne/+5GwIWsGMMQIFKDZbRbqS6MXCnLLKF8RJ9rTbxY7x0H
         H9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354900; x=1789959700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=C6Hw44uYPD4XAcLubZOIBh9vrXMG8MKwhCNhEtkC4jKl1jfWd28h9YIEblO8b212ms
         8DkDGjeahkL69JD2RbzyxoBvW9kgTuYge0vpBUC3dETJPmQVItBE+T8i72AgkbAAVwoQ
         B6gn/7kG/Z9FbKytQwt1m5nbyGbDNGmSi9Ojs9ExW3bZ7wh0GXsmf0bI84gBoAJ5rZSg
         +Gl4vTnNAli8XZVwiPzYUe4HTjlXELsM1FuyDq+B8+s30AnHrMds3lAeqm86IJR5SR4v
         ngs67TeAob92v09xk1C1y/txMw+zNwypOB/IXCdEztKfGhRKaL81HIozUSwD2UsvX4sp
         NJ3A==
X-Gm-Message-State: AFuF++m/GHH/W184cd6PnN5l4JnB8gGRNvSc34Faoc6QbRCpT+iZJOpb
	ZUERiI4VdJ8nbcKrj0Ga64JWfwSNKaVdGpb6cGwsSdvlFtk5oNeR0qnZ
X-Gm-Gg: AYBFou2/Bu44s6BcHfixGST9yjI9MfOrgl8e8Xy3ZiIGRhdAdYaz6iYCtdgQNkYmOrH
	r7fZz6iMXo/eL4JLwxT22pvKrWtDa0iF8DdaCDZbHnYRgtia+aetmul19IYOig51RQI9idhDjJ2
	DAdbmOkRkWJ0jaR9T1pFtBa8O5UgPGCwkBxujDW4Wf7wwboNKTRMELJ4F1DuTkZAi4asRKdRJfR
	zxrb+Vf9dAQ2/QvhYZtuZNG4qzLmxs8DzleVk61GlOu1NqquZ+8o99swFpF6GYldGJqSOUZws09
	Yxs1EPu7w/Zuj55uAC4urrUCmhqIZF7givANPrjsAqqBqKeLpJ/TIcYt/t5cHbP3R2+CAK25PWF
	PDQmQPxccAspqeX/9/haBW+KrQYM6QxZtBq2fvabGxD2V9K2YmY0Apei6bXRA5UtXhWDoC1b9+q
	y0hjnB9WtnbwvRIJmueyoZ09GE74/B5aLCrzxrfYxubvrm3mdEYJK2OECIthmCTCBCWRQrdRQyl
	xy0DXNVSqzpFJ2RF4RklOrdi2PXuXQNn0svVUh1M+KuhK1k26EnkfaDZNLG3MHm6wnV6BBcwpG5
	EbsJyieMPYmE8gcyAv4fhBO7DBU0InBp/02fVe2zi9liAmHp2qV7E5V5TOh3No5kLiogn+qyaHi
	yQuoxMRNVvoWrxySeM+aVX01uhuH4u74=
X-Received: by 2002:a05:6830:3892:b0:7f8:4ac8:bd2a with SMTP id 46e09a7af769-80899a529a4mr493322a34.12.1789354899758;
        Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:08 -0600
Subject: [PATCH v5 02/18] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-2-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200141_588096_B2214C4A 
X-CRM114-Status: GOOD (  13.28  )
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

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
