Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294AAC7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 23:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0229E2199C
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 23:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HUjWuq0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0229E2199C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lip6.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0Cuf/nzdoY7yY67NqfjbuSUn9skXtqq4gCM31ZSrY7o=; b=HUjWuq0nWy3S89
	/pD/ClO6B+3pE6LEJfMS2FzStX6pjCz2WEw1zqoZUQOpGyexhJyLD+91ErCVgNVGYUBFUbqQBczeH
	a4Ed/2lutc/0dg+1LQ/rGoj3TvfM1eFmwqZMv2B1numTKdDMar8qAoq1E9xBVdAshOCvfAvw1Wfkz
	2hWjT44/OaaqIj5fV29tNedL5O/Q17gbukpnQBy5XGXZBlrLuC2NSwMp52fEvGUkpL7nWugovgQ34
	Ct1Kea+O1O9MdKSaJOurva9PMO9aW3FRjAwgZRi8vMukaV+2PYDrvsOGKyWCfrYtxNvoYa6lGI86B
	4LOIA1kSmgjWe9J0xRxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpi3O-0004hx-5b; Mon, 22 Jul 2019 23:49:14 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpi3J-0004gM-GV
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 23:49:11 +0000
X-IronPort-AV: E=Sophos;i="5.64,296,1559512800"; d="scan'208";a="392905680"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 01:39:37 +0200
Date: Mon, 22 Jul 2019 18:39:34 -0500 (CDT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] mtd: rawnand: ingenic: fix
 devm_platform_ioremap_resource.cocci warnings
Message-ID: <alpine.DEB.2.21.1907221834570.3471@hadrien>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_164909_917863_865141DB 
X-CRM114-Status: GOOD (  10.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, kbuild-all@01.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, himanshujha199640@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: kbuild test robot <lkp@intel.com>

drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c:330:1-9: WARNING: Use devm_platform_ioremap_resource for cs -> base

 Use devm_platform_ioremap_resource helper which wraps
 platform_get_resource() and devm_ioremap_resource() together.

Generated by: scripts/coccinelle/api/devm_platform_ioremap_resource.cocci

Fixes: c403ec33b613 ("mtd: rawnand: ingenic: Fix ingenic_ecc dependency")
CC: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>
---

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b5cf701ea9c395c792e2a7e3b7caf4c68b87721
commit: c403ec33b613a15d9fd8dde37f246b79cd56b5df mtd: rawnand: ingenic: Fix ingenic_ecc dependency
:::::: branch date: 6 hours ago
:::::: commit date: 3 weeks ago

Please take the patch only if it's a positive warning. Thanks!

 ingenic_nand_drv.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -310,7 +310,6 @@ static int ingenic_nand_init_chip(struct
 	struct device *dev = &pdev->dev;
 	struct ingenic_nand *nand;
 	struct ingenic_nand_cs *cs;
-	struct resource *res;
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
 	const __be32 *reg;
@@ -326,8 +325,7 @@ static int ingenic_nand_init_chip(struct

 	jz4780_nemc_set_type(nfc->dev, cs->bank, JZ4780_NEMC_BANK_NAND);

-	res = platform_get_resource(pdev, IORESOURCE_MEM, chipnr);
-	cs->base = devm_ioremap_resource(dev, res);
+	cs->base = devm_platform_ioremap_resource(pdev, chipnr);
 	if (IS_ERR(cs->base))
 		return PTR_ERR(cs->base);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
