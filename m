Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB94C88E56
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQGc8xJc+A0VmmgHzzlQJUtdEdmdh8aMckF4llsZP1k=; b=fPYXrGJvRQCJ2X
	r5+L81Si/PtGLA8g3as4vWBPkiN3/eiPxsyg2qvbisRvGkoXkcJ4xHn+B/nGhtxyx9prWltNnlrK3
	RbqkzuBBIElSyMe7PaZtwA/YYtGM76D4s1sh8lTQNlI+wkRiQwWrkqhltbCwcpRFzBDpBWilEQhgq
	/4RdvIa3JZDGfHf/lfRKSNOTJDNJ4JXGYghN2yo+Tmkgsz2bPqoA/VBNBJ+DRHKCehEbM3fHfuFwT
	Ubz6RKvho2NLGd1qmUbbsvUllksvOnQd3L4PpevWz8TzKNrJ7WVQf1lomgrWQ50/V+jQ3ZpU0joG0
	tlx3DywZ3My7jU5aqvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSx-00000001MHL-0s8W;
	Sun, 13 Sep 2026 04:05:19 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSo-00000001MB5-40M0
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:12 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a368895so591611b6e.3
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272310; x=1789877110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=AwErAS7z9wNczsPRc6xedQjOhDKGtHSUby29FMfWRrrrtBmn5nZ3i7SXWeUNxTwJ+u
         Z+1G0sfHgQI3jf7n+dYDB3uV4yuhmBS9+r68m9Pk0JaBc+QBYqJFPTds2xEObPN9h7wA
         7vmEI4uHIzkZy3cFTOmRVB8YGDpv08q/UWoFIlBEOgbApGWjxDlr3Ltq7GHhd89FbSj7
         IRU62WJKaMnOCWVdhfUVYlCex0j5O5B14iNeeelAxK6AxKMXfNvVEjooq+3TYZb7LQMa
         VOSelcPTrmHWCJa8gKmUSRzRtikVRaYbt/xFWaflx9Jgurr9TRtmEUe3LGppaRIZNIqk
         /ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272310; x=1789877110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=jLRsT26yuW0jaBgLgIUFyWn/8lgRld4S4I/Ecv7w1VN0r//wKJfKhFTzxc9D6ZFPlL
         ezjTewonGR/X8NUjTlFhjMe9F9dmYsbDQJ4v5ArfAkfkpbQPYI6+f4sQBp8CJBq7x5RP
         BXbUAGX/dvlRgLL9UdHHDTXEYC7c390UxhQ6RKbjUX3fb3uVEjR4s3nb/PtghMeLjdxd
         TTkgEVlCXRxI4DUEGwwZgdskLGfSWpTmJR4O9eL4b/D+e0BicQlvJmGDqnOtZz8TAUCv
         9tPnhXUcmCWpWnb9RSIu1TjTqyq00TmNZomXc+3ZffshBjeLvsXpJHOttg3/wxJIpRmP
         DCMQ==
X-Gm-Message-State: AFuF++m5Rii7k3v3zvDDbbBpMdyLNYvZ3JOHyWapB0vLs2uCYdfBBdzn
	CV+k9LAzsP0CdE5HV2+7p5upTAkZAAPzXK5Cobp4yRIyA/OiuBzDHQhY
X-Gm-Gg: AYBFou1f5dpBFsWsfzTT2PmP1JDQvNRHQWElDDGf2EOh+twR++PdBlvWMA3ukWWPr49
	nRaCGWPuakai+UGsba1sLmirMb7NK49mLJEKs4ju17gnCemYXj0uDq39xPaDHnE4AGiAB81mqg8
	DbAJ+VnRpCfJc1lgXM69NdysLhBUx+xpeJi5TX8c6r7kuzshLjP71hkajzAFnzjjhzJytvpaVPt
	vLjuLhm+fS7v3p0/13IMtWQ0PBeMZOglfbO8j3fzv1rRQLoO1lBEUQ1PNMQZIDFO44wbwNIAF93
	8AmI8knJrM+ce0xmVsWDyu05687qs1a1b8B8T+7EL0H5PWGvnilIOQI+Yb62mcunS8kgd83GhVB
	dbr/Fhb6tDVFasNVn7WZzBf+TE9r6YysA01pspZjexLl1cElJkU1hvWNMb19Sc/j/P+5YJctCA0
	ofySDhnattpBzwi8YbQ1v0N8ehSHjKntxn207AYiwepR+1JIEWRtxpNbfbxIaPGHrITayf0QWbF
	ky4m1oWqyYNEUYsmQRQ1bnevt2RnQy3h9CWBmbQ+WpkFsQJWcEbBRJ+Trhus4HkxiR6dZaBhpEl
	ebJ3Cf/Wum+0ue5Oj/iIlW3g36MCt55K6rs2IOU238WMNzfG3XwTZ8HozFkipv8mQE/rHPMe5+0
	eJ53GQJGGtnTGo1tDWw/fbMgb1NJylA==
X-Received: by 2002:a05:6808:13cc:b0:4b9:a8ac:489 with SMTP id 5614622812f47-4c31c8306c5mr7319934b6e.39.1789272310145;
        Sat, 12 Sep 2026 21:05:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:53 -0600
Subject: [PATCH v4 02/17] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-2-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210511_015929_0ADAB5BB 
X-CRM114-Status: GOOD (  13.09  )
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
