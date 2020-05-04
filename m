Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9605BC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:26:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DF9D20746
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZtuFl9O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DF9D20746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3VqQftrvrw2kwmHcIMTxi60kZmBlXanocD4GgCCpqU4=; b=cZtuFl9OiD3S9f
	2fqjnFlrq50YTbBJJ1ml7sd4E5KzWpodIILv5CC3J46ueaqEsJHfG6KCknzQAwj0l/mwStwxd5PXP
	TGs8bYLNQA/NhAqrR0xYR8TzBF/+pEZWbRLeMAEh6Ff7i9QwgvTLJtuZW7WUI96s3rz8dB+zmIBjf
	mQ4CWsU4XwTvNNdndCvXKcTw6ZFjHToKzWQ6BuXOobRkOxBl788d0dFUZjBmqyuevr8Toi4wcEk/x
	x7JS3uBaSDikvGEIARewqRwQkmW65LhoVw3RWORakLG5xupXCAT5UHbDfmocftq2vmEmiM+mYWNIc
	j3oXNAdK/SdFVIdNL6hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVWQS-0003mj-2K; Mon, 04 May 2020 08:26:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWP7-0000DT-18
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:24:48 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1A20BC0009;
 Mon,  4 May 2020 08:24:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 05/13] mtd: rawnand: Rename the use_bufpoi variables
Date: Mon,  4 May 2020 10:24:06 +0200
Message-Id: <20200504082414.7327-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504082414.7327-1-miquel.raynal@bootlin.com>
References: <20200504082414.7327-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_012445_344990_23F3D42D 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both in nand_do_read_ops() and nand_do_write_ops() there is a boolean
called use_bufpoi which is set to true in case of unaligned request or
when there is a need for a DMA-able buffer. It basically means "use a
bounce buffer".

Depending on the value of use_bufpoi, the bufpoi variable is always
used and will either point to the original buffer or to the nand_chip
structure "internal data buffer" (this buffer is allocated with
kmalloc() on purpose so that it will be DMA-compliant).

In all cases bufpoi is used so the boolean name is misleading. Rename
use_bufpoi to be use_bouce_buf to be more accurate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/nand_base.c | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index dfb4e9376990..efde1f0fe2a9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3166,7 +3166,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	uint32_t max_oobsize = mtd_oobavail(mtd, ops);
 
 	uint8_t *bufpoi, *oob, *buf;
-	int use_bufpoi;
+	int use_bounce_buf;
 	unsigned int max_bitflips = 0;
 	int retry_mode = 0;
 	bool ecc_fail = false;
@@ -3190,19 +3190,19 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 		aligned = (bytes == mtd->writesize);
 
 		if (!aligned)
-			use_bufpoi = 1;
+			use_bounce_buf = 1;
 		else if (chip->options & NAND_USES_DMA)
-			use_bufpoi = !virt_addr_valid(buf) ||
-				     !IS_ALIGNED((unsigned long)buf,
-						 chip->buf_align);
+			use_bounce_buf = !virt_addr_valid(buf) ||
+					 !IS_ALIGNED((unsigned long)buf,
+						     chip->buf_align);
 		else
-			use_bufpoi = 0;
+			use_bounce_buf = 0;
 
 		/* Is the current page in the buffer? */
 		if (realpage != chip->pagecache.page || oob) {
-			bufpoi = use_bufpoi ? chip->data_buf : buf;
+			bufpoi = use_bounce_buf ? chip->data_buf : buf;
 
-			if (use_bufpoi && aligned)
+			if (use_bounce_buf && aligned)
 				pr_debug("%s: using read bounce buffer for buf@%p\n",
 						 __func__, buf);
 
@@ -3223,7 +3223,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 				ret = chip->ecc.read_page(chip, bufpoi,
 							  oob_required, page);
 			if (ret < 0) {
-				if (use_bufpoi)
+				if (use_bounce_buf)
 					/* Invalidate page cache */
 					chip->pagecache.page = -1;
 				break;
@@ -3233,7 +3233,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 			 * Copy back the data in the initial buffer when reading
 			 * partial pages or when a bounce buffer is required.
 			 */
-			if (use_bufpoi) {
+			if (use_bounce_buf) {
 				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
 				    !(mtd->ecc_stats.failed - ecc_failures) &&
 				    (ops->mode != MTD_OPS_RAW)) {
@@ -4015,23 +4015,23 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 	while (1) {
 		int bytes = mtd->writesize;
 		uint8_t *wbuf = buf;
-		int use_bufpoi;
+		int use_bounce_buf;
 		int part_pagewr = (column || writelen < mtd->writesize);
 
 		if (part_pagewr)
-			use_bufpoi = 1;
+			use_bounce_buf = 1;
 		else if (chip->options & NAND_USES_DMA)
-			use_bufpoi = !virt_addr_valid(buf) ||
-				     !IS_ALIGNED((unsigned long)buf,
-						 chip->buf_align);
+			use_bounce_buf = !virt_addr_valid(buf) ||
+					 !IS_ALIGNED((unsigned long)buf,
+						     chip->buf_align);
 		else
-			use_bufpoi = 0;
+			use_bounce_buf = 0;
 
 		/*
 		 * Copy the data from the initial buffer when doing partial page
 		 * writes or when a bounce buffer is required.
 		 */
-		if (use_bufpoi) {
+		if (use_bounce_buf) {
 			pr_debug("%s: using write bounce buffer for buf@%p\n",
 					 __func__, buf);
 			if (part_pagewr)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
