Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD07CD5BAC
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQs2m5sO+BjptbjXBIg4hy/EVyluEzF7km4eAzUfJbI=; b=AEzj5nxfi/QIxB
	U0mq2L0PXRAT3MHOEZVZXnvqY4P3nghomfyFPsGdkadCw2ZE2IvvR7icApU0xwmcqxBo834S5ZQ2D
	oy7D+0aXktYXYYLhAHkBWoZPXnFQCBsuvaA+YU8U412CNs7FlVgr8aT3TBNF8Sryy1KfcKMH6+bb5
	d4Co3xHY6GbAix9H0D9llcZYI+tuPu1PeBTqPPou2L21w+jq01CkSJ/1Eqj+CAz5qv8/9278XUIYd
	GJex7hGS6xBOV9Q0GAnNwXAcmavVktpxkp0z5rLkLe/cTk/aYTk3g3Om88xOQMFLQHsJ5yV5e0Fqp
	+uzj4qO8iTFQwPNitAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM13-0000000AIrW-19Ng;
	Fri, 22 May 2026 09:18:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQM0y-0000000AIq2-0X7n
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 09:17:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D941C2C659;
	Fri, 22 May 2026 09:18:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D57A66003C;
	Fri, 22 May 2026 09:17:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE350107E8CBE;
	Fri, 22 May 2026 11:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779441472; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=FNh9PbUFw0y8n4VZS9elUUNUsx9zmDx7kTYLGF/MKro=;
	b=UURgC33wRCtt1VS8ImlGdysv+4UWxeXOCNYp2bQ0RjApNx3qZFrR27uf6wKSMIE6W9JucL
	ySp7h+tq/Q2YyBiPaEu+dtCyNasbmqtnIle2MdibJFfqWp5pdFPTfQyiYyQaY2QtrKrX1i
	V/hf+mbE5JNVWyfiow424lWsfYMl0NFLICs5RCMLECDjh8LJB0E6UcZzP3F+dhfqvqv0QT
	87Yk5i0AW4IG41VFBOUncoOqyQg45mOgfba7i6ukYI2vm2Jy5Ww5krqMRMbGX731ddMWjW
	xfcG0f7cuzmMOFdWI9LVUBz7EaVnEZsoV/zWaLFn+HXm5AJFBiS7tlXxIuhZiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrea Scian <andrea.scian@dave.eu>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Pause continuous reads at block boundaries
Date: Fri, 22 May 2026 11:17:39 +0200
Message-ID: <20260522091739.2789664-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_021756_366497_8301BBD1 
X-CRM114-Status: GOOD (  11.19  )
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

Some chips do not support sequential cached reads past block
boundaries, like Winbond. In practice when using UBI, this should very
rarely happen, but let's make sure it never happens.

Cc: stable@vger.kernel.org
Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d6d3e17ab407..cccd5655e638 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1216,32 +1216,32 @@ static int nand_lp_exec_read_page_op(struct nand_chip *chip, unsigned int page,
 	return nand_exec_op(chip, &op);
 }
 
-static unsigned int rawnand_last_page_of_lun(unsigned int pages_per_lun, unsigned int lun)
+static unsigned int rawnand_last_page_of_block(unsigned int ppb, unsigned int block)
 {
-	/* lun is expected to be very small */
-	return (lun * pages_per_lun) + pages_per_lun - 1;
+	/* block is expected to be very small */
+	return (block * ppb) + ppb - 1;
 }
 
 static void rawnand_cap_cont_reads(struct nand_chip *chip)
 {
 	struct nand_memory_organization *memorg;
-	unsigned int ppl, first_lun, last_lun;
+	unsigned int ppb, first_block, last_block;
 
 	memorg = nanddev_get_memorg(&chip->base);
-	ppl = memorg->pages_per_eraseblock * memorg->eraseblocks_per_lun;
-	first_lun = chip->cont_read.first_page / ppl;
-	last_lun = chip->cont_read.last_page / ppl;
+	ppb = memorg->pages_per_eraseblock;
+	first_block = chip->cont_read.first_page / ppb;
+	last_block = chip->cont_read.last_page / ppb;
 
-	/* Prevent sequential cache reads across LUN boundaries */
-	if (first_lun != last_lun)
-		chip->cont_read.pause_page = rawnand_last_page_of_lun(ppl, first_lun);
+	/* Prevent sequential cache reads across block boundaries */
+	if (first_block != last_block)
+		chip->cont_read.pause_page = rawnand_last_page_of_block(ppb, first_block);
 	else
 		chip->cont_read.pause_page = chip->cont_read.last_page;
 
 	if (chip->cont_read.first_page == chip->cont_read.pause_page) {
 		chip->cont_read.first_page++;
 		chip->cont_read.pause_page = min(chip->cont_read.last_page,
-						 rawnand_last_page_of_lun(ppl, first_lun + 1));
+						 rawnand_last_page_of_block(ppb, first_block + 1));
 	}
 
 	if (chip->cont_read.first_page >= chip->cont_read.last_page)
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
