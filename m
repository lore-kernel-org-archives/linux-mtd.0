Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB28C79FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ka6ceLxgz8SVE2ub6ixaEL6q3ugCCkc0SDc4boAih4Y=; b=XvfkZjOnQNYNuo
	nQPoubEF2USHu8pHIw94Be+QZCqBGbb3HqTRCaogXppYxfS9XTZoVUIUJMAm1q8WxI1PMZPEpmdJt
	7m7QR41laalOnZamlvt7T8/lSTJneqVj070CmRiJU2epYuL2LXWGWCd/s7woQ+BEV5HbakuOjPgWF
	Yoh0QlbCitlKE4Fx4gk9CkW5wAkFwixiiupt+G9bTfTbpBLdhWhe3yoTSEiiIP+tNWa759u/52pva
	8AzTrhuTPzeADfGorzSblOgsBdFSVaEt9our42wnBJ5g9HQnLCAyFfilQFYuAtuhZja1S+oZ1z2+s
	80gcUTYUIpx3lGzM77ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhp-0000000B6Ix-2YYd;
	Wed, 09 Sep 2026 08:30:57 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhm-0000000B6Gd-2o24
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:30:56 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7f64ea07036so4942707a34.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942653; x=1789547453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87D8oi8Qz4sYFsjJ5uXw0JnqD9Cz19yUtQkLE1CMv/c=;
        b=sx5xHNYYXvm9uny+DcDp7P2ZxU1lB5XD8VMkzWddFT8YHsSMjPuS2WuXWtlr6r5pWu
         DtwaBAmKU6PcenqYPBQqp4Hge8EPNMOYgdVg7GxIA+iNfj71fp9g0o0xVp23AaQkpKem
         IZAk1T6EUfaMhj5Fr+WwxMArw3FrX5mZHMbSAmFHEexclfGmKuMtseSZy5OWFWAGdVJF
         0wqSN51K/0jce52NcpkJu3pdHlP9yC7rJRddcgYZicnLZD2Wk76rvJyPe/JefUCUj6Pf
         5e1nxfwwNRhB6HPNAxow6JVHpiy6LE6aFW7SpTKnbk/m0Ckg2l96wH1UEnOPSUP+YWT2
         sl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942653; x=1789547453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87D8oi8Qz4sYFsjJ5uXw0JnqD9Cz19yUtQkLE1CMv/c=;
        b=s0T+G3LJ1lC3ekw/doy4r7ukIDelSu6q4JXxVg9zXOqqzGUEUw2A6M4w5BcGFO5rVO
         djDUqPm1UF0Ojqkc/QKVB9frMNSktYm/zDZTO7MGkTncUA+6zFfnsMcQR1enekkxw4u4
         Vzm2KjPQDIJc0GWdEYCMf+91LenyikgyVbhWnR0UulBS4O/nOXUuHkTdTAq7gRVWcOGV
         MNjJ25J7DUXUs9/FRBIeFmbRhfOPK1vMA8O2JW2QH7Ww98ZxeK24k8hJQOZt58c6d7Pl
         NaEeKhZsQ14z1LKVcxmIm32oFz18N/e2yf9kSU2rObbvCShU5H+oM/A0El9KWnhIZ+ik
         fG3A==
X-Gm-Message-State: AFuF++mEuIB2KLqVqcSvWryHQmYof/LqE5NLaysEyQjP72nwp4ySqFY4
	hb9jAHrch9GOgaWPGBXI8M0FBCHUHiTbXsHf/vmwtSMtek9kVLOVUe6B
X-Gm-Gg: AYBFou0DSvl2v3WGXIMjNH/TdOktL9+JEPPGA/2cr2Ho3ezpGrFx7j93xO21TAS1PEK
	/fMfM58jo7w3OUcm7HUVKxXXnOmKvvOgql7SDEUjtZOn/VaHzOFDCIpf7qYXrZIz5EevN2FgPQp
	3QcDwX+ngrWSHZNrg8Q+QuFAtB6WmmdeTdHHuKzf+hAMtm++QQKE2BeXc1pj41BDMbhwwR8VzVK
	7NWOySQuNgo3iXnBd/ahXr1FwoS1c0THh+Q5/kNOg3G0KRt5jCcni3jV/JJZsty9SDdrpA/vH7f
	5RhrKPIxD0qdJH3YaY1EfKgV3mSq/aP3RkCVAHgC7KipYF7MFseIodt1F+fgM4A0/6oRttEJcQx
	uEn+aCm1DgrVcIVjAiusgFju6IHjKc7pk7kgE2JEt0i2lpGdCuRnHlnfJTS7eFk5AUMHyMVmxk6
	n1UczSgney/3HZg9hSKiiuMXK2cFyqgqZ/7G0VkflYfkCsn+3X6XX5NcjmPWlVHAF1wZABJuWos
	zwIAwTpuOfwbGOIl5+IAYiBV+I6TYLqzBIe/8fChOCnPJButShdeRUiJZKH+AnXg4Bt0yIWs5+Z
	v6L7BDGymPlJHrtWe+3e5+xq5R/0UF4JpZ8H1Jnbn6pcRgIn8iY9IJBP51LmIzsHjJJYsXLjJ8/
	lB6IuA6d6b6tJF3bvzxaT9cJuH2NrQw==
X-Received: by 2002:a05:6820:3107:b0:6b7:46fc:1df with SMTP id 006d021491bc7-6b746fc028cmr18530314eaf.62.1788942653399;
        Wed, 09 Sep 2026 01:30:53 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:34 -0600
Subject: [PATCH v3 01/15] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-1-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_013054_804147_F1217BB9 
X-CRM114-Status: GOOD (  13.77  )
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f41feebe4257..ab4003ea6fc4 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -999,11 +999,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
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
@@ -1057,11 +1057,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
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
 
@@ -1143,7 +1141,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1311,7 +1309,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1408,7 +1406,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1672,7 +1671,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
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
