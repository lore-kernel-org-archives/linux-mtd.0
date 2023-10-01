Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5887E748E9
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Oct 2023 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mKCY0ZPLkbisTU20hdg6/HND45+sAMfyZXr6PAkNjiY=; b=xRlFKMaAO6pAOq
	oIRfTlGMsjPKzceDdvbyWw0S9NfIfkFPq36V3H9nBclCojtF2owNJcqKyV+pcxoyO4CtaTWBOKj4R
	+bU/5g4U60r2HQhkFGTUDeTgR3TmOmjqdEd1dg5RS3mEokA+e/iY4SCwSVqvQjl5YZ4bSnS5bgRh1
	sraTq862ax2YL5G/iKDZCCo4qPDUl5Fe+P82zG8XfuL0Ps97YV3RhTb7ed69UYCpGttnhU2ldR5SI
	2MO0essnUvrDpKQ62vdPtYu79ZeUOVZORGY4rX0KU3O+p3eat4G+HT+EVEgTirTE1cU0UdhmMTXrA
	PeWuNIOcZP4Tu1jEFNOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmr7m-00AiFU-1w;
	Sun, 01 Oct 2023 07:44:22 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmr7i-00AiEA-0A
	for linux-mtd@lists.infradead.org;
	Sun, 01 Oct 2023 07:44:21 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id mr7WqrKgVBuYSmr7WqgwKV; Sun, 01 Oct 2023 09:44:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1696146249;
	bh=Lh4Gb5zv5Lb8ZWaUBSVtVqXkD3aAwWj7aSRzIFudknA=;
	h=From:To:Cc:Subject:Date;
	b=tARfd9pL5l6goRYfpkXD4TKuCYNR9qfYDZclZw2NvhvzAI+6L1i/4samAyFBMaPqA
	 keFShjXpLMdUxQJLMBQE9F0nMNs8RC+WNlUr4mhQ3RCNAtmmjGRFMhembtafGCGiwN
	 IzUX2Xav5NVCBinR1CnJxRnvNoivk6mwZP9xCIRORrRXCiw62bIPTYwn9sV7/F1VWl
	 uWiknbsaq/hJbJ9U2dV5iufGtW1YI6XsfsaXEzrOrBB+sDkpa8zCh4uXtmS/kuJ6Lf
	 QPjOrtfjXWuYsTC1xHnwSC15nQZBrmP0Xwc8fDzvKhuA3h0OAti6wtH5cjNLen9CrV
	 rx8jRh5pe69xQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 01 Oct 2023 09:44:09 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] mtd: rawnand: rockchip: Use struct_size()
Date: Sun,  1 Oct 2023 09:44:04 +0200
Message-Id: <481721c2c7fe570b4027dbe231d523961c953d5a.1696146232.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_004418_222574_849CF1BF 
X-CRM114-Status: GOOD (  11.82  )
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

Use struct_size() instead of hand writing it.
This is less verbose and more robust.

While at it, prepare for the coming implementation by GCC and Clang of the
__counted_by attribute. Flexible array members annotated with __counted_by
can have their accesses bounds-checked at run-time checking via
CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
strcpy/memcpy-family functions).

Also remove a useless comment about the position of a flex-array in a
structure.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch is part of a work done in parallel of what is currently worked
on by Kees Cook.

My patches are only related to corner cases that do NOT match the
semantic of his Coccinelle script[1].

In this case, struct_size() was not used to compute the size needed for the
structure and its flex array.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 5bc90ffa721f..596cf9a78274 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -158,8 +158,7 @@ struct rk_nfc_nand_chip {
 	u32 timing;
 
 	u8 nsels;
-	u8 sels[];
-	/* Nothing after this field. */
+	u8 sels[] __counted_by(nsels);
 };
 
 struct rk_nfc {
@@ -1119,7 +1118,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, sizeof(*rknand) + nsels * sizeof(u8),
+	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
 			      GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
