Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C92C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1362420848
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 10:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wkSDw7Up"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1362420848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UIf6tS1PKYXLRnu5uuODYFMgmz4mP562PMH3km87JqI=; b=wkSDw7UpUDAaPwPk3XJXJivpQ
	dA3iHidD668sflWZUrOJ+YPT0JVR6rkjPSA3udSOVE0B7+Ru+jIgd7ZDID8Rc6rIwiIfLFzYIjoQp
	og0tLuJQ+i7jQqzjP8UEBdUL6rpAzZ0n8L1LlPrOS0WJe7cLaXpoxnD+ttWeWSA7d9IK4RTChY0xo
	S2OQ5/WCGj7rQL90rl5zmcDit0zCnOn0gnxxRw0GymnzCnpcv+FNnnQkSL/EUkiOYIDFgRChx8kHG
	UXrJiFnB7SKfHeQwgEoWSSJOnW0LSto99NS8BOyuMXBicWrPlzlFvEWHjBGqHLfZ0f5pIC/jtLRX4
	PUvCvAkFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNvhS-0002i8-EC; Thu, 01 Oct 2020 10:20:34 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNvhI-0002ev-F0
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 10:20:26 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5FD4D24001C;
 Thu,  1 Oct 2020 10:20:22 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/6] mtd: spinand: Allow the case where there is no ECC engine
Date: Thu,  1 Oct 2020 12:20:12 +0200
Message-Id: <20201001102014.20100-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001102014.20100-1-miquel.raynal@bootlin.com>
References: <20201001102014.20100-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_062024_589956_7B86CA8A 
X-CRM114-Status: GOOD (  14.76  )
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Even if this is not supposed to happen, there is no reason to fail the
probe if it was explicitly requested to use no ECC engine at all (for
instance, during development). This condition is met by just
commenting out the error on the OOB free bytes count after the
assignation of an ECC engine if none was provided (any other situation
would error out much earlier anyway).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc.c      | 8 ++++----
 drivers/mtd/nand/spi/core.c | 8 +++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index 9afdde70824a..6c43dfda01d4 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -105,7 +105,7 @@
  */
 int nand_ecc_init_ctx(struct nand_device *nand)
 {
-	if (!nand->ecc.engine->ops->init_ctx)
+	if (!nand->ecc.engine || !nand->ecc.engine->ops->init_ctx)
 		return 0;
 
 	return nand->ecc.engine->ops->init_ctx(nand);
@@ -118,7 +118,7 @@ EXPORT_SYMBOL(nand_ecc_init_ctx);
  */
 void nand_ecc_cleanup_ctx(struct nand_device *nand)
 {
-	if (nand->ecc.engine->ops->cleanup_ctx)
+	if (nand->ecc.engine && nand->ecc.engine->ops->cleanup_ctx)
 		nand->ecc.engine->ops->cleanup_ctx(nand);
 }
 EXPORT_SYMBOL(nand_ecc_cleanup_ctx);
@@ -131,7 +131,7 @@ EXPORT_SYMBOL(nand_ecc_cleanup_ctx);
 int nand_ecc_prepare_io_req(struct nand_device *nand,
 			    struct nand_page_io_req *req)
 {
-	if (!nand->ecc.engine->ops->prepare_io_req)
+	if (!nand->ecc.engine || !nand->ecc.engine->ops->prepare_io_req)
 		return 0;
 
 	return nand->ecc.engine->ops->prepare_io_req(nand, req);
@@ -146,7 +146,7 @@ EXPORT_SYMBOL(nand_ecc_prepare_io_req);
 int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req)
 {
-	if (!nand->ecc.engine->ops->finish_io_req)
+	if (!nand->ecc.engine || !nand->ecc.engine->ops->finish_io_req)
 		return 0;
 
 	return nand->ecc.engine->ops->finish_io_req(nand, req);
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8a4d20e30edb..4a4c86d8eeb6 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1160,9 +1160,11 @@ static int spinand_init(struct spinand_device *spinand)
 	mtd->_erase = spinand_mtd_erase;
 	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
 
-	ret = mtd_ooblayout_count_freebytes(mtd);
-	if (ret < 0)
-		goto err_cleanup_ecc_engine;
+	if (nand->ecc.engine) {
+		ret = mtd_ooblayout_count_freebytes(mtd);
+		if (ret < 0)
+			goto err_cleanup_ecc_engine;
+	}
 
 	mtd->oobavail = ret;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
