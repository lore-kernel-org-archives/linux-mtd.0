Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C9C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 23:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5XMZ60OhaVeSRFXIRlKtpihElysJy7ztKyvDyWrfIgI=; b=td1QCtJ3fENNtR
	DlhuN9EDah5aZNYc8hz4+4vLLraUNBkXIB/Xb8gd+7Xi/bmrUTx2onhPu0nrwDgD2cAD7QfA6uUTv
	/1jwkpXwlfAoVKMGg/7TH/iUAa6oOXnlXgiMtuKmhJmQqry6YP5K8GRID1OtYm+znqTsWd95c2/b+
	PHzLTSMQktB94nMyhHcXwNU0HWe3SCAbnTVlAb2BdW+nsu8QJka/GKgM47Z7Vx6UZDit1mrJddDkv
	Y+qLCp0kZ/di1JjKReIHp2786nsqV0eCC+9Yn158Yk9T0RcsQxUQznJ16xbW2B1H1aljGjJ437A3w
	lubxzyJ9UvKj0ZrR/5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPty-0000000AXcp-3MbO;
	Mon, 13 Jul 2026 23:17:30 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPtw-0000000AXbY-0yiu
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 23:17:29 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-381ed661712so4229639a91.2
        for <linux-mtd@lists.infradead.org>; Mon, 13 Jul 2026 16:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783984644; x=1784589444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+FL5XSAFXC/lBCBY2+tuXGzEqpVa/8UNV4Ia4+5Gn4U=;
        b=Hvnkt2VsJgc0zsQEYVVqMNbH7kZN7NjjLKxSF2Yk3hI/kqh49Nj2R7wr0BWF4ESK3v
         llw5o8g1loNpfIVxHqFCIvMAoz1fFuqWo8ud0FHTdcSTBuGUsWwn0khl+VX/5QmD+wfh
         zWbSgvma18aRK1N341SkGaCTJXiGWL3gkSKS3YnOrLaSD+9C1v8RnmXmuTnFkvgFVz8U
         CqbJgMxYV0nbk4NVcMjq5Z5DgGbzFcX2TfWn2h6qzcnbpD6FLOSerSGmDPbwIWba8EdN
         BXMcg8lEz4VSPr46PdxDtbaN2sp3GBN6p7UnKGs3AbzoiNJskh5UUxUkXV6NANt3c+em
         Qo2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783984644; x=1784589444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FL5XSAFXC/lBCBY2+tuXGzEqpVa/8UNV4Ia4+5Gn4U=;
        b=K9C4BEKEz8ddgwMf5nEXPcxANne6ZgHZ3OKcBzu656W3hrUvc0S4GGwkICh2vL06d/
         y6HpWpivk1PdMEp7Nm0ywrOkeMgPI6wN2xbqeMQPgXsF8ciiP0Q+CcF9LqX/0xfZplLr
         Zlu8xftliuRbb54IgtfRFHLoHv2wUAUqaPTdrojvIxmHSubOaEThr5q9uy3gsVPSVqqb
         kkacq0fa4g+zsp32ViaSPYsCZDO1G9r15SO4iifqWkDQQ0t7hzihp3E+8L3Kmwsi170V
         xueKLNFBDDAj4IGD8UlS4mkzQdoMCBAveytLl2djE9ZJHDhBerPvu3b27alb8yvuoR/d
         R/yA==
X-Gm-Message-State: AOJu0YxJ6m+ZCp+PkebHfNxpSJV4V2pGR0Bc8EyZ4opmAlbdFVpnZhvC
	hh3JLWCosKDzRq3glG7wpQixYj9jIs5SO47X5mcdEaEXQAKlIYzCPd/H1bsI36a9
X-Gm-Gg: AfdE7cnZSmng44mJRPxpTG85ZOME2hO5Q6HqKvT6g3ruj6BOjZEKl6pS9zlC/niiVmC
	fU+IH4PsNnu+m0qpd8hTT/j7i34GkJ2iz6952RPQ6EqszWZvD1oLHhRokvT8/6vBcBnU/PHbpZM
	Mv3R/1CK2tIZkLbTFHmcTj2exDK8Q58Gnv09EA6W78RKUMkygmfebBli0iJk0tsKmehIRkX9wzf
	gMaOtP7HStiFVNBxxNvm6/R1dsmSVrtuz+79qHkFQvL2dOpDxdv/CNZ/zUsovlbhOyIeMNMG4NH
	5dQmTf0YR7EPMKptBX6YwFQA4YziIU/XanjsO3cIw23zm+NGBdS50hB/wyKXSQJpxcYO2o0uIZN
	1rLMFWXmVyyDPr1GBEB40Wn/M73XHFhUZ17jlenrd2ebMyGhQbg91B+Il0QGZu9m0uN1DEXftmm
	KjxLVOyMP/pMIMqK2c9dLXnDKDYdTXPWKMUZ/LezdzxbtciH3j0NAQJa0RF+KG5jl3URboj2gEc
	FCMACOsMIS5nuKyGbgudpp9d3Fb2G8BTH5GeqhU+pX7lEyxBZatCZ4a/pe+s8h7qg==
X-Received: by 2002:a17:90b:3cc4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38e1add8aeemr101308a91.7.1783984644079;
        Mon, 13 Jul 2026 16:17:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b8020sm518328a91.3.2026.07.13.16.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:17:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mtd: mpc5121_nfc: use platform for irq and ioremap
Date: Mon, 13 Jul 2026 16:17:22 -0700
Message-ID: <20260713231722.1095470-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_161728_274903_D0099073 
X-CRM114-Status: GOOD (  16.22  )
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

Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
and devm_ioremap() sequence with a single devm_platform_ioremap_resource()
call, which folds the resource lookup, region reservation and mapping into
one step and returns an ERR_PTR on failure, checked with IS_ERR() and
propagated via PTR_ERR().

Switch IRQ acquisition from irq_of_parse_and_map() to platform_get_irq(),
which only retrieves the interrupt the OF/platform core has already set up
rather than transferring mapping ownership to the driver. Drop the now
unneeded of_irq.h include.

This is behaviorally equivalent: the driver already reserved the region
with devm_request_mem_region(), so the non-overlapping reg requirement of
devm_platform_ioremap_resource() was already satisfied.

Drop the now-unused regs_paddr / regs_size locals, which previously only
fed the open-coded request/ioremap calls. Keep the linux/of_address.h
include, as of_iomap() is still used elsewhere in the driver.

Built for PowerPC (mpc512x_defconfig + CONFIG_MTD_NAND_MPC5121_NFC) with
LLVM=1; drivers/mtd/nand/raw/mpc5121_nfc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 39 +++++++++---------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index 97b4e7f3e1bb..e6594548b7e0 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -23,7 +23,6 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
 #include <asm/mpc5121.h>
@@ -618,14 +617,14 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	struct clk *clk;
 	struct device *dev = &op->dev;
 	struct mpc5121_nfc_prv *prv;
-	struct resource res;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
-	unsigned long regs_paddr, regs_size;
 	const __be32 *chips_no;
+	void __iomem *regs;
 	int resettime = 0;
 	int retval = 0;
 	int rev, len;
+	int irq;
 
 	/*
 	 * Check SoC revision. This driver supports only NFC
@@ -637,6 +636,14 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	regs = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(op, 0);
+	if (irq < 0)
+		return irq;
+
 	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
 	if (!prv)
 		return -ENOMEM;
@@ -660,17 +667,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return retval;
 	}
 
-	prv->irq = irq_of_parse_and_map(dn, 0);
-	if (!prv->irq) {
-		dev_err(dev, "Error mapping IRQ!\n");
-		return -EINVAL;
-	}
-
-	retval = of_address_to_resource(dn, 0, &res);
-	if (retval) {
-		dev_err(dev, "Error parsing memory region!\n");
-		return retval;
-	}
+	prv->irq = irq;
 
 	chips_no = of_get_property(dn, "chips", &len);
 	if (!chips_no || len != sizeof(*chips_no)) {
@@ -678,19 +675,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -EINVAL;
 	}
 
-	regs_paddr = res.start;
-	regs_size = resource_size(&res);
-
-	if (!devm_request_mem_region(dev, regs_paddr, regs_size, DRV_NAME)) {
-		dev_err(dev, "Error requesting memory region!\n");
-		return -EBUSY;
-	}
-
-	prv->regs = devm_ioremap(dev, regs_paddr, regs_size);
-	if (!prv->regs) {
-		dev_err(dev, "Error mapping memory region!\n");
-		return -ENOMEM;
-	}
+	prv->regs = regs;
 
 	mtd->name = "MPC5121 NAND";
 	chip->legacy.dev_ready = mpc5121_nfc_dev_ready;
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
