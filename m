Return-Path: <SRS0=uqc5=GK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC7C6C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 08:39:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E872311E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jan 2021 08:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E872311E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A2NJNcYQXpNTn+wJmPgqIw40/IIVNKDbEUqY8NnTMgM=; b=MiYELMGURnY6NRgAfiW9YY3N9S
	w5dOCBJJKW76voo74EldoqEHIpouXEimH+UXjufjPVsrLOlH6CVfAC6PrSAUbd/KtIyBMa/Gwgevi
	24VHmhZ3ZMHnMPktyvHyQZoqB6YVEtJuTrSEcYbHCPAty2Za9/ktWEtaz0fav8KFkXfi3oz2F8amF
	ZKbgNH5zrqnca5O2c9PhNLeKD63ljFVBYBBPZJCHqUcFbJglbK2KeHJBvbmbpHb7m73uhabtCublB
	Aj8zHZzS/5YyZQoY9u3TzDFGAk2hWe9DM9wlY633it5DiCuHAuitvvUeD0CBz2zfjyFcZYEE1PiBN
	EL1f8P/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxQoH-00016u-NO; Thu, 07 Jan 2021 08:38:21 +0000
Received: from relay13.mail.gandi.net ([217.70.178.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxQoE-00016Y-RY
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2021 08:38:19 +0000
Received: from localhost.localdomain
 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr [90.89.98.255])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay13.mail.gandi.net (Postfix) with ESMTPSA id 1340B80007;
 Thu,  7 Jan 2021 08:38:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spinand: Fix MTD_OPS_AUTO_OOB requests
Date: Thu,  7 Jan 2021 09:38:13 +0100
Message-Id: <20210107083813.24283-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_033819_003924_298D4C50 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Felix Fietkau <nbd@nbd.name>, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The initial change breaking the logic is
commit 3d1f08b032dc ("mtd: spinand: Use the external ECC engine logic")
It inadvertently dropped proper OOB support while doing something
else.

Shortly later, half of it got re-integrated by
commit 868cbe2a6dce ("mtd: spinand: Fix OOB read")
(pointing by the way to a  more early change which had nothing to do
with the issue). Problem is, this commit failed to revert the faulty
change entirely and missed the logic handling MTD_OPS_AUTO_OOB
requests.

Let's fix this mess by re-inserting the missing part now.

Fixes: 868cbe2a6dce ("mtd: spinand: Fix OOB read")
Reported-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8ea545bb924d..61d932c1b718 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -343,6 +343,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 				      const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
 	struct spi_mem_dirmap_desc *rdesc;
 	unsigned int nbytes = 0;
 	void *buf = NULL;
@@ -382,9 +383,16 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
 		       req->datalen);
 
-	if (req->ooblen)
-		memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
-		       req->ooblen);
+	if (req->ooblen) {
+		if (req->mode == MTD_OPS_AUTO_OOB)
+			mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
+						    spinand->oobbuf,
+						    req->ooboffs,
+						    req->ooblen);
+		else
+			memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
+			       req->ooblen);
+	}
 
 	return 0;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
