Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B4C88E73
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PgtWFFnQCMWStcLjFQk36/u/Vh9ORNfMAXKrf8ALd8w=; b=cXDn+NhBSe13oT
	QNt368AxZ82kQbBW6ZeGlFJ9iTsdryFSXluKdP1Ba0nGo9yI8da4q6x8h4U12NKuaApa+EoDPp2TS
	NwYWy87jfkWjvfgaSyJOshMQZjQfIv5JEH7oegeDLz7Oo8R9RWkD2Gdj9quAo9UKwqSGKrkQxfjo4
	LnNoIr4h/OAM4TFAYch7MAmHxLnESNKb/R+q6sN/+Sm2RB4tLJq/mRoTJftPt/OmExBzfaiNeFiaw
	b4yl+YTArb2YT/+i2EAtV59Veca/T89WRlx0VD/N7AD5y0w3WM3FYWsXb+LyiX+PsR/1L/VCooQaM
	0BX4I5NGLUq2TQKNG2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwg-00000004g8N-10vs;
	Mon, 14 Sep 2026 21:10:34 +0000
Received: from mail-oo2-x0d.google.com ([2607:f8b0:4864:31::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwP-00000004fj4-3Yqf
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:20 +0000
Received: by mail-oo2-x0d.google.com with SMTP id 006d021491bc7-6b1ae739df5so718604eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420217; x=1790025017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=FYX2b9hmOmVLOvDQvBDOus0V+shVcjtA+tFHoH3dmOO4y0SDXUyICOLfdwNDo85p7J
         BT8i0vZpdFy27QuVUztplT2wiVc7R9wbo7ln6LlpP1/sLNPr+QbHZvOt2jt3GMmYkUa8
         +s4gOFVHGi32PAjAYTD5f/Rv6gnu+nNrwkkmYYjAKhVrtxi33UxlB7NrIiXhsJFF/KFj
         EHZPpjbBZ4XNhdcVAxPdRhb9th2YoL/Y7W7gn+X6X0nvYUQJ6ok/THNE+sUtzPADUudi
         d3jo+A6YZBnhfhCAg6CIQM9kwANLIGK7hZ+rgxtoWukKSZWiZ71SI1+ydut1LywUmZK2
         6uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420217; x=1790025017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XwVosOtOADwbw6wxbVAGv82uPNwv85si6C2vLS4JkM=;
        b=HZphvkSSUs9USkmK+Z5JbDO/mY4/UP6hR3KhprZoFDDLRESjXebzx0BwktIJyXEGQu
         N8mzo3Of5cSBC9Q3Tp0C+WH0Aa1QsdZtfCqM1ULKkZdA3w2msjatULUYT0nJFoVjvM1n
         6klym7LENknGYfJqJiA6br7914Ev6ZvDxaXXws4SH1SGNmORHbj7nC99Ci161Lb5Rrbr
         5viaFOthBSVJddVaeyTmuLgYBB/mkemFmsVALZROSGgUWdln5eCEnk+SYxid6836R34W
         PMgAoiE+v32jjUMapKzxocD+k8C8+6tpyt5S2qycCSF3V9ZNuneC4duMs13J3f6GI25e
         jsFg==
X-Gm-Message-State: AFuF++nZRtbEUwKzSmwnCnZM16+jFtKJnUF5/9IAI1eW3UM0+P8WuxKI
	c4DvCeR9vRAmxu5hbMbYWA6/cEhstpiOmG3tzeC7So86wsS0pt4bLEcw
X-Gm-Gg: AYBFou3Q38fP8L1bFayhfuJktsl8k+bEu7Wwjel9bzfBDyHugRz+IAtTwhySMGPTYQK
	AOnwuSm8th+nhK0mAQzymC6mfTNHzIpKT6Ff07PjqJJ91wQn5xEjQHceSdx6V1YvEtjHRdMG4Le
	4Bn0LYimsfArr+/NdGVf2g13exgaBJRn9+JvXodKcfjpacgkVfSlyEQvMBZTI+y/tJHkweC4d+q
	0ELtccbkI+A1YB5TnAdNxOE0TRHqFYjNBDJB2tdDrW4DReQUzd8NG/DpLW6YQQJlayh9d+egr0A
	yzqqVDAuqJhI3grkYeXmIwmOW7G+eKpGxImwjMxEEetM25jsvNTeqAPm+XxYaOGfA1wrWi3I0Dc
	Xv5ljozuZa/y3DmeNcdYaOLyV1y0JsztXQrPe95Kaa8LbGAzB7Q16XC4ttxMhpByZfHdZUqq6VG
	Vc3g94fbXAGcIMfGnF3E6XUrR7Ix5lutHDt4avJgJXZFJtciKbatvYgGkpjxjpD39VcsnMhFBDa
	3Mv5wdMZRlzZIihWrkjHdCLrKCd4Sh4kdGbZSdDmm/27yBWn1IyQUiJDxK8sdgHm30VQ6w03dcs
	WEmlK2Mwctuyf6LJYLLbpEn1GBenPPsR5nZ8aSZgZRNu5/DX362f9ZFLaNu5y0szR9Ncfbm/5uk
	ESVJklJdr0nuS/tsCtDHmjSLGpTw0
X-Received: by 2002:a05:6820:1890:b0:6b5:ec3f:497b with SMTP id 006d021491bc7-6c639498c9bmr552266eaf.22.1789420217054;
        Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:02 -0600
Subject: [PATCH v6 16/18] mtd: rawnand: sunxi: avoid duplicate chip setup
 before page commands
MIME-Version: 1.0
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-16-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141017_932393_DC03BB75 
X-CRM114-Status: GOOD (  10.36  )
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

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

Keep explicit selection in the DMA write callback: it accesses controller
registers and prepares DMA before issuing the program-begin operation.
Do not cache controller state or change selection after a controller reset.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index f3234d2831ea..773ba55ecc07 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1808,8 +1808,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	int ret, i, cur_off = 0;
 	bool erased_chunk_found = false;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1858,8 +1856,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1888,8 +1884,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	if (sunxi_nand->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page(nand, bufpoi, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1930,8 +1924,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	if (to_sunxi_nand(nand)->randomized_oob)
 		return sunxi_nfc_hw_ecc_read_page_dma(nand, buf, false, page);
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1955,8 +1947,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -2000,8 +1990,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
