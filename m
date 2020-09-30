Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C334C4727C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 15:41:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B5220738
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 15:41:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XH9eMhXu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B5220738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5oRxULA4DowKjU9a2fWHJA2gGfH+Ix9MA2InDAYGq9Q=; b=XH9eMhXulXTNlTL5ekg1+EEw8
	mmiNNYQzd6FcJqN2nE8DWhUjRzC3I32tWY+GhWD/FnNpdmWPP9v9a/Vin5MAT/LUz43jyq8K9a87M
	kbFOM8tBrr5ycL/pMI6CuaLPbfE1xNaDVlplLWnSPPH9ib4w8YMisKxT20WrPqhWhqezwAjKtEy8T
	wKXNz5tvJXC7v4EVF5/0jwUcQJxRsu6fN9eIT+RXpKYMREBdBMSJAsOO05/bs4g+7Lzj+BgwRyvor
	4oan6dujO4c6CvZfCYCQr5KifFmwTPVyulq6UTEplmFV4nJuKFAJktT8jdN0YcAFLiCjLc9EM7GIl
	N+SOYpaRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNeEU-0007iJ-O9; Wed, 30 Sep 2020 15:41:30 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNeEK-0007fd-4n
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 15:41:21 +0000
X-Originating-IP: 77.205.53.71
Received: from localhost.localdomain (71.53.205.77.rev.sfr.net [77.205.53.71])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6C7351C0014;
 Wed, 30 Sep 2020 15:41:18 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/5] mtd: spinand: Fill a default ECC provider/algorithm
Date: Wed, 30 Sep 2020 17:41:09 +0200
Message-Id: <20200930154109.3922-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930154109.3922-1-miquel.raynal@bootlin.com>
References: <20200930154109.3922-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_114120_420070_1CD58FAE 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Julien Su <juliensu@mxic.com.tw>, ycllin@mxic.com.tw,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The SPI-NAND layer default is on-die ECC because until now it was the
only one supported. New SPI-NAND chip flavors might use something else
as ECC engine provider but this will always be the default if the user
does not choose explicitly something else.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 668441d483e3..916335c510d3 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -309,7 +309,7 @@ static struct nand_ecc_engine_ops spinand_ondie_ecc_engine_ops = {
 	.finish_io_req = spinand_ondie_ecc_finish_io_req,
 };
 
-static __maybe_unused struct nand_ecc_engine spinand_ondie_ecc_engine = {
+static struct nand_ecc_engine spinand_ondie_ecc_engine = {
 	.ops = &spinand_ondie_ecc_engine_ops,
 };
 
@@ -1134,6 +1134,10 @@ static int spinand_init(struct spinand_device *spinand)
 	if (ret)
 		goto err_manuf_cleanup;
 
+	/* SPI-NAND default ECC engine is on-die */
+	nand->ecc.defaults.engine_type = NAND_ECC_ENGINE_TYPE_ON_DIE;
+	nand->ecc.ondie_engine = &spinand_ondie_ecc_engine;
+
 	/*
 	 * Right now, we don't support ECC, so let the whole oob
 	 * area available for the user.
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
