Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888ABC88E7B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKjcSA3nJIgk9lcWtEFHxu52S97LOAhTG2cWMW318T0=; b=fA+QGtrb013How
	bMgRQfGmws9lJZfhMWKCNSIfJgOiutkxoKS0JiJIVJqqzjx8wFuwGwwyd87iEhdUh0rZUi4Ar+jVm
	AvIz/xT7OmiKlOsPr0nvu4tx91CJtIHssc8iD3Rl0SaScEH1KNkRtWAeHpVQED3bc1Vog2d9f8TnY
	S8HLBZvXSUEaGgNcZA4F3VKJ+G7e1fjIK47Jn6pzCffZBXoVb2oMkwFlYr3Z5YEuLkbZgOiWaicCE
	xifcX8JwLN3NmYfu7ukHcGNU26NdLNMEobydLNbjf3dnD/KcQ7PzmtvUffqdGqLldzQWfyr8tmU9S
	ruOdxDoVbalgeX/OQlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fQN-3eR0;
	Mon, 14 Sep 2026 21:10:01 +0000
Received: from mail-oo2-x14.google.com ([2607:f8b0:4864:31::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw6-00000004fN8-2vv6
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:00 +0000
Received: by mail-oo2-x14.google.com with SMTP id 46e09a7af769-805bf8c2661so1711370a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420198; x=1790024998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=L22SgSPvQ7XR8oNDTE+kRM00iIF5xYGufjjku5/MXgr4ImvjRNUJ994GP6LFLDXy1Y
         +461ZGXb7jE9ZBqS2MS+fsHUKJhw00nSRvy5uBvZEHWcTJXhxLj8yXuUjLtHQM9u1NcX
         Sc47DauE3qLjLAtjJCKIq8qh2oVU6WG+w3Y2p4Dfrt4asRPQoQOSVGSbumlXGSR55MUn
         Me+CSYwLeY90xQIWaZM47sZmMwcpzGxNvQxzf9XUwftO1pnFxU8cY9djQaeomB3Y7Fzl
         bvTN3J3JW0tJgqGa1AMpN1oiUjQbL1IoBX0n/voEw2EAnSANGrprvX1o8nsOEacIsJ4c
         W0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420198; x=1790024998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2QJ/YfTCDyKu7jznVj9GPPyAB75HsBI8sl5USMlUvk=;
        b=Q+uvmHnj5GrtLZxAYD2EBzawwzGXnY3AC3TMcXSbhkUbgBOFrxuMhRUTxuTP/yh+kK
         QUqtSUdiNXLcRCjuZh+QO/Vmnik8tsg/x9Oh9TQGBOfA1tMKKvYDFcAn4ye24Ohb+R7r
         Xgef1wusqJjdWgVn3sKLyGhsF9NuxxEf8wu0kb9h3+lzrsu4x8ce3Ojpdx1FjZzN6ws5
         Z3p/zAnBhA9C1nQICY6l8XyYnmVF770Vt3bvUJcxLBuQJxp/YEXbhPorvnenHegwgnw8
         S/NmJOMXSWlVuIHrwzm9XCH2q3jF7zwf+Lp2rJmsLbC1OFBnD6RXagzzD/i9JdzxBUDI
         CPfA==
X-Gm-Message-State: AFuF++nSVW43+OphpVMvk57cGczeNfoFMzj2fBypJMtVTxa8lb0seUTx
	Rbcs3LUc0lvmnuW1uMP/j+KPSOw476DO5YooSF1w9DHBVutTY3KciGnS
X-Gm-Gg: AYBFou2bbMUu0eKNu3m2Nz8bpt02YS9dPuCkmLQZJZaAuHv7rsa6ub9Q53F+LYYq4Bl
	+ryzu6750oLm5kH1S3NvwzVC9SFfZeYoBGS/f/XZ5eIVV8l7LiWnkStx7ehttWYbCzx2k1JNkXo
	azSY1RYzi3sefRC9VW+eTNPBYsD3tEyL4FFfdtBTfgzAhs+U5PddsICnfgUIpuNmgNjQmEF6r9G
	L6VCr1jzZUZvBBFHwEGRjsYUgK2u7n0kWeNTe2IOCEF8AbVEbWzO3SuUfzXxweI1UDO49kCZvhf
	k7o2qwK7DQlrUZZtPY7zgu0mfxcJaavqNLZtCsoApHtlsG62ZnLQgkgrUGd2G9jph7yYuf8bsWY
	qyInuijvaQ1Xd7sD/w/Mq73D3N/tn6VnrkxKngyK2WA6WRzMZ+zgTIoMlLG5sO5kTBabqZjuPGf
	lCupnEgdwzljiuCZgW2qEBOGi4Hdw8dv7Uf5RI2/BBx+gXxhuAWoD4T6mMDg4L/ZHXTxdHIwFlR
	J/lOk/ps52lDWzERedVVy9RjTlQlZT/FmZDEvJZvCefo2Lg++ZPzozwHjnx1BYwoDcV+A21iCFK
	G2GLo3ifmybBZH9QZya90Bmk25PhRf6s13Ov7LGSJNjZrhTGtpwYJms/N3izqGzGmzKaQIa4ExC
	sLZDS8JPUahd2SOgYTNtdfnsLHSqg
X-Received: by 2002:a05:6820:98e:b0:6c1:c628:b0bf with SMTP id 006d021491bc7-6c53f44bc19mr2434309eaf.13.1789420197732;
        Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:48 -0600
Subject: [PATCH v6 02/18] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-2-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_140958_807693_B5A2D77B 
X-CRM114-Status: GOOD (  13.43  )
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
