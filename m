Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEC5C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 14:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE4A21872
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 14:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m54HZc69";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ob6DblVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE4A21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wu6NW2kxKJjUS5wT0huCyV+UDsvk06vYenyMy6AtvwU=; b=m54
	HZc69UOJJ8ZQdD2eFavD0Ma2RYfFF9a+421JdjWzo8HwGXgSt6fftdIpvL/Qk+l5a6IeLEfykNcH0
	M2Kvfgwi93fK2cDteLbSBJPA3yg5CIJrQRD2rcws2YC7uazXcsAq9imkf5H646mByfaY8PI5j2IQm
	YDJ/RsLECI4VNFpiyqR7G/Ss+kcbaMc4iWUX0T3mxXKguDQYIEEUje/FBJnVlg/1Jaf0/Cn3SCk2K
	DmUdN7TsiBvyBrWvUjIOeG1nZGrWqK2Vx7vzjL1zrBFbC2h4KCW6UwncWJRcnul32KjGGE+e/etdo
	xwsmohoGmMI7VxtVeqOvXx/PC7ubYGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmfrh-0005Su-Ag; Thu, 24 Jan 2019 14:20:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmfre-0005Sa-6T
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 14:20:19 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7576021872;
 Thu, 24 Jan 2019 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548339617;
 bh=ycveM8/CD+BQXXGkRLzRxuy/fx2MRf2LiPdlWMTCsQc=;
 h=From:To:Cc:Subject:Date:From;
 b=Ob6DblVUJkxRgBeZtP6+QoptwGuvAlsLY76oDvWVH8Bmi1npZtSLXX4D5Ceqzk6tG
 9caXnXkwP/uHFgnPPGLxWNAeM16l/TOdaQxDbYVufKZsEjhCY5ZhyONy7kSj5mBYfq
 MHC3XaITmRDD3/gL2A4y5dprbMwPnaMPqCF3GQhw=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spinand: Handle the case where PROGRAM LOAD does not
 reset the cache
Date: Thu, 24 Jan 2019 15:20:07 +0100
Message-Id: <20190124142007.11607-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_062018_271351_7D81E39B 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Stefan Roese <sr@denx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
the cache content to 0xFF (depends on vendor implementation), so we
must fill the page cache entirely even if we only want to program the
data portion of the page, otherwise we might corrupt the BBM or user
data previously programmed in OOB area.

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Reported-by: Stefan Roese <sr@denx.de>
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
 drivers/mtd/nand/spi/core.c | 42 ++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 479c2f2cf17f..8bf37da19663 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -304,24 +304,30 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
 	struct nand_page_io_req adjreq = *req;
-	unsigned int nbytes = 0;
-	void *buf = NULL;
+	void *buf = spinand->databuf;
+	unsigned int nbytes;
 	u16 column = 0;
 	int ret;
 
-	memset(spinand->databuf, 0xff,
-	       nanddev_page_size(nand) +
-	       nanddev_per_page_oobsize(nand));
+	/*
+	 * Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
+	 * the cache content to 0xFF (depends on vendor implementation), so we
+	 * must fill the page cache entirely even if we only want to program
+	 * the data portion of the page, otherwise we might corrupt the BBM or
+	 * user data previously programmed in OOB area.
+	 */
+	nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
+	memset(spinand->databuf, 0xff, nbytes);
+	adjreq.dataoffs = 0;
+	adjreq.datalen = nanddev_page_size(nand);
+	adjreq.databuf.out = spinand->databuf;
+	adjreq.ooblen = nanddev_per_page_oobsize(nand);
+	adjreq.ooboffs = 0;
+	adjreq.oobbuf.out = spinand->oobbuf;
 
-	if (req->datalen) {
+	if (req->datalen)
 		memcpy(spinand->databuf + req->dataoffs, req->databuf.out,
 		       req->datalen);
-		adjreq.dataoffs = 0;
-		adjreq.datalen = nanddev_page_size(nand);
-		adjreq.databuf.out = spinand->databuf;
-		nbytes = adjreq.datalen;
-		buf = spinand->databuf;
-	}
 
 	if (req->ooblen) {
 		if (req->mode == MTD_OPS_AUTO_OOB)
@@ -332,14 +338,6 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 		else
 			memcpy(spinand->oobbuf + req->ooboffs, req->oobbuf.out,
 			       req->ooblen);
-
-		adjreq.ooblen = nanddev_per_page_oobsize(nand);
-		adjreq.ooboffs = 0;
-		nbytes += nanddev_per_page_oobsize(nand);
-		if (!buf) {
-			buf = spinand->oobbuf;
-			column = nanddev_page_size(nand);
-		}
 	}
 
 	spinand_cache_op_adjust_colum(spinand, &adjreq, &column);
@@ -370,8 +368,8 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 
 		/*
 		 * We need to use the RANDOM LOAD CACHE operation if there's
-		 * more than one iteration, because the LOAD operation resets
-		 * the cache to 0xff.
+		 * more than one iteration, because the LOAD operation might
+		 * reset the cache to 0xff.
 		 */
 		if (nbytes) {
 			column = op.addr.val;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
