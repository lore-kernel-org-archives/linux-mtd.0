Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D14D19501
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jan 2026 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lpsCyZMconZlWWzes0MMvqgKlsdJVDSE/MGtemstaA=; b=SATRSQsLMo7LM0
	EhAW3jPCSd0HmFi28Aa21TPQjJ3T3c8AMrTF1TwUNHx+nkJ2RMGIFpdAkWDYiq5K7/Z3XXL/823pR
	nUz2loW6RjTwDcjQ5sv323nVWoncmmKBlm9dtlgaqjvJxxBeuwFcSuToOJXOoSEx6+zQLiFujkBKF
	KrsGGi924utPmcc+0Cy3IA2++9ylr5ofWvS3ytzQpXMP5HIXT2oFExgu1EY8bOrXrQjheH6rina2i
	pA7/gEYLOVLWFbtRk952UXhTFbHjft1X2/ThcfPb4RZjKk+kBrQZBCpJngaAsTUSDEjwQBbtJ12Gy
	YhMp6EsMwRMAqoZsYlag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPve-0000000CuXP-337k;
	Mon, 26 Jan 2026 16:59:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPvc-0000000CuW3-4ATk
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jan 2026 16:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DC4740639;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68A67C2BC86;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769446743;
	bh=bsIoLFQq9aC2kNh8ij3SZOmwGTyMS6ISf2ZCS9RxiIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mlvZYsl+M3z5TyMiFIMbaEVLSwM6iLhhd7/3/zE2QRORY/oFW7roqyHPuIvX+J08e
	 ybV3TwINJluRYi/69nEhG851eKcLYopemSLYxGcoMJTmQBKKUPRdt5y5ABs/JPTBAO
	 07+K8UAWosTm3Mre7F4if5yBzZtvaKQtJ+g5QSQBrwfNc2VAOaa+5syzEV05ewr447
	 B3Q5XSb7u6p0gG2aHenKr1UvcX1sz/D2DB1Z8lJA+ZBlUxOyKtAaigWPfGJWzJKdIQ
	 rtt2gmQu27zd2P45W+B2NczsrPym0pcsH1GpIyWwg5ed3X+bHG3kf93/zFR+X3gPsA
	 2DDk96IB6Rcng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6213DD19506;
	Mon, 26 Jan 2026 16:59:03 +0000 (UTC)
From: Andrea Scian via B4 Relay <devnull+andrea.scian.dave.eu@kernel.org>
Date: Mon, 26 Jan 2026 17:58:56 +0100
Subject: [PATCH v2 2/2] mtd: rawnand: pl353: Add message about ECC mode
MIME-Version: 1.0
Message-Id: <20260126-pl353-soft-ecc-support-v2-2-fcd74b6e955f@dave.eu>
References: <20260126-pl353-soft-ecc-support-v2-0-fcd74b6e955f@dave.eu>
In-Reply-To: <20260126-pl353-soft-ecc-support-v2-0-fcd74b6e955f@dave.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Amit Kumar <amit.kumar-mahapatra@amd.com>, 
 Andrea Scian <andrea.scian@dave.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769446742; l=1273;
 i=andrea.scian@dave.eu; s=20260121; h=from:subject:message-id;
 bh=W54VDp3ZuMb3O2+EOIc9KMGJG7f9MGc6xwP0ApOENno=;
 b=0PXv3vemO7XV8diJRAX7vegCXBaskah1elabJYQNWe3Q7S3LuwMXE2yPJAjFxFnL/EORJsiRQ
 mVMyImAcEanBHy3xPkySpIIDoajRo7IENyT8qSfWnm+vriOqqLGvOTr
X-Developer-Key: i=andrea.scian@dave.eu; a=ed25519;
 pk=PMQL72nEsyoiJCobnq0uEXwUFpVmkwoWIx317WvaQOU=
X-Endpoint-Received: by B4 Relay for andrea.scian@dave.eu/20260121 with
 auth_id=613
X-Original-From: Andrea Scian <andrea.scian@dave.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_085905_058424_3A838427 
X-CRM114-Status: GOOD (  10.13  )
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
Reply-To: andrea.scian@dave.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Andrea Scian <andrea.scian@dave.eu>

This just add some information on kernel log about the selected ECC

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index fcb62b9ec947b..cbef4f0084844 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -970,16 +970,19 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_DIE:
+		dev_dbg(nfc->dev, "Using on-die ECC\n");
 		/* Keep these legacy BBT descriptors for ON_DIE situations */
 		chip->bbt_td = &bbt_main_descr;
 		chip->bbt_md = &bbt_mirror_descr;
 		fallthrough;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		dev_dbg(nfc->dev, "Using software ECC (Hamming 1-bit/512B)\n");
 		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		dev_dbg(nfc->dev, "Using hardware ECC\n");
 		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
 		if (ret)
 			return ret;

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
