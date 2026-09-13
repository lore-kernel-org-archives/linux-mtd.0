Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0ACC88E56
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJF9ul8c4gzC3zHFIgXO16bDYELFtx5U4yn08aV6yqg=; b=JmTbYvehOMW+fp
	Vp5u6kpVJx9Sqv4f42ou26YPyFoqikxWMK8IROZWCmxcMgrkg4LPmHQ+H3CEX6uFtw70nBavqaGny
	F01AEfTefCIpG2yloSpIM6QzMGreP0diXaNYhNE2pG7mCTbMwr+WJ46YzO1k/rICX+pucsDEvdMKw
	R36euHMV0khRUNAKZ6GmLyioNJiRSKVqlmEi65DsPYRwlpdgK7h/jJEejUTVxy6JXsCYZGYDhrjRw
	YAgoRD2UIAqAUAL3jNTCY3ZHdDehS6V6EPa6ZQuUvos74Jh9OIfZ66CA95OSmW/bFxdOTEaW2zOQz
	oF53rVd2+XgT2A4jL/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTJ-00000001MoQ-082w;
	Sun, 13 Sep 2026 04:05:41 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSy-00000001MIH-0PnJ
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:22 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-46a63c34533so1170831fac.1
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272319; x=1789877119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=OLdGp7oOiHHqYfnY+v2SUuaOKiUAxdSDlSGJwSsk29s+h8SKdRDtdNzHHXSRFPHVqj
         P8Li2eTn6odGh7flFyXiJ+mG/rZ5fDsWzCQ44R1ErQ1MQJUSeNM5QIW11r8ho2C2l8PR
         QUT3rYV4VmW0D90+HZ7oylzd8TjOVDwXdXrCZ+j//3OcsuqiLmVj4bezZGAVnWfwZS6K
         ZMGxeh1o9pUBMCpl/WrWAjr4thdvypJkTlPYjvKau4udp5f+lmq3B73uUzkOXNFTNb9a
         O+0w5oTt1+rzV26iMfuxdKSOuqgiuzzxPRdT+bWWkxyb3YhxtK3KlOL46fIsBfBEnoz9
         h4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272319; x=1789877119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=Nade3+kv/MHA/vKtpUhq8TRzJUDKWdBBtRW+7Md06cEHMYhOvPWk1kSRvMbif7+lAK
         jYR3XqnuRCNj257+U8YjYPbT51kX2A4EJ8T6GUxbnETY+fGSWsurZSYgdzgcm9kpIstY
         TDBVWQ0WmwJHzINfugjxIX/iypAJHMvF79VFgHI4LrFLK+pHcqnl4fopirmJqVjiW7DS
         PNPdNxqsDiAgewKyPQGGau9n9RzxQPOtKcjxc8H3Pr+EZVxmME1R89qH75b065V2JsDm
         uoR+9ulZl57YyPyLcNrGXD4ndJfw+shGmVj/xcMj5nf49WtJAj+oXgy4bsrI971NF2Qp
         QEhQ==
X-Gm-Message-State: AFuF++kyV5BmXzD3vQIW62qIUr8QdSGkNrpBb5vZHt94s85AOziR8g8X
	HyjEs1fA8WOFX07pRtQgLi6Jl9EF9xEiDZkkcWG8EEKPAwezTbJcea5g
X-Gm-Gg: AYBFou0dQzYvCpb9MG65UFCGkrt61icmWONPp0dMg1x9yKAYlW2h0kZhJ0zLwQN66FM
	vRSTp11DlbwDDRyuS+0TzUmt1XRSpoJvs54MIO4ml87KUPnryerePTIUJt2BCfPWUq2Ns6Ypi7D
	0oU0Jo22ZXEoFLGbtTwqdqcwOgMRJlojFnanT5NpBgrhYVe0Fnm5OqHXvEj1luVb6S0UdV/6DSU
	meM1P/DHvdgieD/bJlorzObGwVvSGE1eUwPNlwJNe9w6Vw8jJanrLDaEdz7UGfmYh/V39qO7Qlo
	Y/X3d0+D6hm9r06fSHH+5hhFhfR4nyfYwC7c4kVmkyDs1SDq8caSSCaImh7r0pdJvtLQZyrW17q
	6gO4YOYnXHEcMDHF3KrMqNcS7EI/wjqvKSlAmg91krPpWYPPVvjWuJ2ccHgHUPgg5MneMFAc+gN
	oKc02MCB398ynQ8wfl5/dlR9pVf5ZYhrj2rGJjnaGaTII8O6euMIgrL1NnB500ulNwCVXq+H4fR
	GmMYVRPQstV//yBnyuVnd2CAxEm2nRY3cm+z63Qs5AOO1ymJ0zhM3f+WErMVmbY7G8YgoNHyPJk
	gTNjcVKAwSbbcDb7iU5qQiHE/0k91ZpGni9Tcs2PUpCJ0A1OcgotTY+jF5X5plvj+0m0KExXkIs
	XmmGhHEdU9AlgwBz7Pg94+jOaL4jWSeO0J00hb5Yb
X-Received: by 2002:a05:6870:9386:b0:47b:7862:c1c6 with SMTP id 586e51a60fabf-47f59a2cc34mr2957205fac.23.1789272319247;
        Sat, 12 Sep 2026 21:05:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:59 -0600
Subject: [PATCH v4 08/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-8-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210520_233313_E2A4DCF0 
X-CRM114-Status: GOOD (  15.42  )
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

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
