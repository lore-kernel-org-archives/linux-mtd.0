Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B151C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 14:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3937A218A2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 14:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YdldbT/z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XluSWKTW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3937A218A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KVAN+YMzqVYo7o2tb+i2dAgVSRgbHZ2KUIhoCQwHHJQ=; b=Ydl
	dbT/zXC5/L6N4zmxHRxs0k+UMG/k4h84KHxGJgKRDZxQGP7fpCRpwLBxPAzasoRPzqYv6VLNq5Swm
	meiIYVpDN8co2weR/1hyVHeZI7fQnlaOhvnL9NkFfK+wrS7rLVypGiAkIztV586ci9qKVhwBugcKY
	VWv7yiuUmttsb90ap0J7WNJ5QrKKD9LYQww98oVJI8jzzCWD2jWNcsY1wDhR+VkEjMhJ44pkNrT8Z
	zRYElSV8ZbN4RjwqH7BUOhMcmxx1mLppMdzrYzI99wotT495fM752LHyG22k9e9oxhJvm76M9kRcd
	SA1SVBT3vwSF9QLqECiEUjpYcwFAl2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmgLv-0008KS-DT; Thu, 24 Jan 2019 14:51:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmgLr-0008K4-VP
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 14:51:34 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E76A218A2;
 Thu, 24 Jan 2019 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548341491;
 bh=60HdcI4yRvLAyyJUEqjuWGNIo8MNM32GHVdMNqwyByc=;
 h=From:To:Cc:Subject:Date:From;
 b=XluSWKTWI5Gncn0jjvWMK8RpfVK/QEZOq/F9FpdnSSVqMMz+PTu5ykv+DHOo2nNtq
 ZebmmWRAQWUwgosG393QEk9krEV1Y8apo7xKEvfEAvYFyD4NNKLXoBEOhTdUc/woQN
 Ozldyi5qJ/Fds46LZyqNsHLTxVvPZxnl3iXFvs2E=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v4] mtd: spinand: Use the spi-mem dirmap API
Date: Thu, 24 Jan 2019 15:51:21 +0100
Message-Id: <20190124145121.28089-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_065132_054629_D31394C1 
X-CRM114-Status: GOOD (  22.58  )
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
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

Make use of the spi-mem direct mapping API to let advanced controllers
optimize read/write operations when they support direct mapping.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Stefan Roese <sr@denx.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Note that this patch now depends on [1] and [2] and should not be
queued for 5.1 but for 5.2.

[1]https://patchwork.kernel.org/patch/10772067/
[2]http://patchwork.ozlabs.org/patch/1030479/

Changes in v4:
- Fix various bugs reported by Stefan
- Use devm_spi_mem_dirmap_create() to simplify the error/remove path
- Drop Miquel's R-b as a few important things have changed in this v4

Changes in v3:
- Add Miquel's R-b

Changes in v2:
- New patch
---
 drivers/mtd/nand/spi/core.c | 168 ++++++++++++++++++------------------
 include/linux/mtd/spinand.h |   7 ++
 2 files changed, 91 insertions(+), 84 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index fa87ae28cdfe..fa54fe446b2d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -19,21 +19,6 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 
-static void spinand_cache_op_adjust_colum(struct spinand_device *spinand,
-					  const struct nand_page_io_req *req,
-					  u16 *column)
-{
-	struct nand_device *nand = spinand_to_nand(spinand);
-	unsigned int shift;
-
-	if (nand->memorg.planes_per_lun < 2)
-		return;
-
-	/* The plane number is passed in MSB just above the column address */
-	shift = fls(nand->memorg.pagesize);
-	*column |= req->pos.plane << shift;
-}
-
 static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 {
 	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(reg,
@@ -227,27 +212,21 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 static int spinand_read_from_cache_op(struct spinand_device *spinand,
 				      const struct nand_page_io_req *req)
 {
-	struct spi_mem_op op = *spinand->op_templates.read_cache;
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
-	struct nand_page_io_req adjreq = *req;
+	struct spi_mem_dirmap_desc *rdesc;
 	unsigned int nbytes = 0;
 	void *buf = NULL;
 	u16 column = 0;
-	int ret;
+	ssize_t ret;
 
 	if (req->datalen) {
-		adjreq.datalen = nanddev_page_size(nand);
-		adjreq.dataoffs = 0;
-		adjreq.databuf.in = spinand->databuf;
 		buf = spinand->databuf;
-		nbytes = adjreq.datalen;
+		nbytes = nanddev_page_size(nand);
+		column = 0;
 	}
 
 	if (req->ooblen) {
-		adjreq.ooblen = nanddev_per_page_oobsize(nand);
-		adjreq.ooboffs = 0;
-		adjreq.oobbuf.in = spinand->oobbuf;
 		nbytes += nanddev_per_page_oobsize(nand);
 		if (!buf) {
 			buf = spinand->oobbuf;
@@ -255,28 +234,19 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		}
 	}
 
-	spinand_cache_op_adjust_colum(spinand, &adjreq, &column);
-	op.addr.val = column;
+	rdesc = spinand->dirmaps[req->pos.plane].rdesc;
 
-	/*
-	 * Some controllers are limited in term of max RX data size. In this
-	 * case, just repeat the READ_CACHE operation after updating the
-	 * column.
-	 */
 	while (nbytes) {
-		op.data.buf.in = buf;
-		op.data.nbytes = nbytes;
-		ret = spi_mem_adjust_op_size(spinand->spimem, &op);
-		if (ret)
+		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
+		if (ret < 0)
 			return ret;
 
-		ret = spi_mem_exec_op(spinand->spimem, &op);
-		if (ret)
-			return ret;
+		if (!ret || ret > nbytes)
+			return -EIO;
 
-		buf += op.data.nbytes;
-		nbytes -= op.data.nbytes;
-		op.addr.val += op.data.nbytes;
+		nbytes -= ret;
+		column += ret;
+		buf += ret;
 	}
 
 	if (req->datalen)
@@ -300,14 +270,12 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 static int spinand_write_to_cache_op(struct spinand_device *spinand,
 				     const struct nand_page_io_req *req)
 {
-	struct spi_mem_op op = *spinand->op_templates.write_cache;
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
-	struct nand_page_io_req adjreq = *req;
+	struct spi_mem_dirmap_desc *wdesc;
+	unsigned int nbytes, column = 0;
 	void *buf = spinand->databuf;
-	unsigned int nbytes;
-	u16 column = 0;
-	int ret;
+	ssize_t ret;
 
 	/*
 	 * Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
@@ -318,12 +286,6 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	 */
 	nbytes = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
 	memset(spinand->databuf, 0xff, nbytes);
-	adjreq.dataoffs = 0;
-	adjreq.datalen = nanddev_page_size(nand);
-	adjreq.databuf.out = spinand->databuf;
-	adjreq.ooblen = nanddev_per_page_oobsize(nand);
-	adjreq.ooboffs = 0;
-	adjreq.oobbuf.out = spinand->oobbuf;
 
 	if (req->datalen)
 		memcpy(spinand->databuf + req->dataoffs, req->databuf.out,
@@ -340,42 +302,19 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 			       req->ooblen);
 	}
 
-	spinand_cache_op_adjust_colum(spinand, &adjreq, &column);
+	wdesc = spinand->dirmaps[req->pos.plane].wdesc;
 
-	op = *spinand->op_templates.write_cache;
-	op.addr.val = column;
-
-	/*
-	 * Some controllers are limited in term of max TX data size. In this
-	 * case, split the operation into one LOAD CACHE and one or more
-	 * LOAD RANDOM CACHE.
-	 */
 	while (nbytes) {
-		op.data.buf.out = buf;
-		op.data.nbytes = nbytes;
-
-		ret = spi_mem_adjust_op_size(spinand->spimem, &op);
-		if (ret)
+		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
+		if (ret < 0)
 			return ret;
 
-		ret = spi_mem_exec_op(spinand->spimem, &op);
-		if (ret)
-			return ret;
+		if (!ret || ret > nbytes)
+			return -EIO;
 
-		buf += op.data.nbytes;
-		nbytes -= op.data.nbytes;
-		op.addr.val += op.data.nbytes;
-
-		/*
-		 * We need to use the RANDOM LOAD CACHE operation if there's
-		 * more than one iteration, because the LOAD operation might
-		 * reset the cache to 0xff.
-		 */
-		if (nbytes) {
-			column = op.addr.val;
-			op = *spinand->op_templates.update_cache;
-			op.addr.val = column;
-		}
+		nbytes -= ret;
+		column += ret;
+		buf += ret;
 	}
 
 	return 0;
@@ -755,6 +694,59 @@ static int spinand_mtd_block_isreserved(struct mtd_info *mtd, loff_t offs)
 	return ret;
 }
 
+static int spinand_create_dirmap(struct spinand_device *spinand,
+				 unsigned int plane)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	struct spi_mem_dirmap_info info = {
+		.length = nanddev_page_size(nand) +
+			  nanddev_per_page_oobsize(nand),
+	};
+	struct spi_mem_dirmap_desc *desc;
+
+	/* The plane number is passed in MSB just above the column address */
+	info.offset = plane << fls(nand->memorg.pagesize);
+
+	info.op_tmpl = *spinand->op_templates.update_cache;
+	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
+					  spinand->spimem, &info);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	spinand->dirmaps[plane].wdesc = desc;
+
+	info.op_tmpl = *spinand->op_templates.read_cache;
+	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
+					  spinand->spimem, &info);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	spinand->dirmaps[plane].rdesc = desc;
+
+	return 0;
+}
+
+static int spinand_create_dirmaps(struct spinand_device *spinand)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+	int i, ret;
+
+	spinand->dirmaps = devm_kzalloc(&spinand->spimem->spi->dev,
+					sizeof(*spinand->dirmaps) *
+					nand->memorg.planes_per_lun,
+					GFP_KERNEL);
+	if (!spinand->dirmaps)
+		return -ENOMEM;
+
+	for (i = 0; i < nand->memorg.planes_per_lun; i++) {
+		ret = spinand_create_dirmap(spinand, i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1012,6 +1004,14 @@ static int spinand_init(struct spinand_device *spinand)
 		goto err_free_bufs;
 	}
 
+	ret = spinand_create_dirmaps(spinand);
+	if (ret) {
+		dev_err(dev,
+			"Failed to create direct mappings for read/write operations (err = %d)\n",
+			ret);
+		goto err_manuf_cleanup;
+	}
+
 	/* After power up, all blocks are locked, so unlock them here. */
 	for (i = 0; i < nand->memorg.ntargets; i++) {
 		ret = spinand_select_target(spinand, i);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index b92e2aa955b6..507f7e289bd1 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -302,6 +302,11 @@ struct spinand_info {
 		__VA_ARGS__						\
 	}
 
+struct spinand_dirmap {
+	struct spi_mem_dirmap_desc *wdesc;
+	struct spi_mem_dirmap_desc *rdesc;
+};
+
 /**
  * struct spinand_device - SPI NAND device instance
  * @base: NAND device instance
@@ -341,6 +346,8 @@ struct spinand_device {
 		const struct spi_mem_op *update_cache;
 	} op_templates;
 
+	struct spinand_dirmap *dirmaps;
+
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
 	unsigned int cur_target;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
