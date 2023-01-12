Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87D5C54EBD
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Jan 2023 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=48SXKDbJPOrUw18XnRm8KTrreTfrNHIr710kFEpxfD8=; b=cRJBulwYKQjzYx
	gkwoXUlySwMUANc/4Kn83B6ONOgd+lknyWEyx/bMXsWaYJxo+ROq7dlvi22BFKcEeyMyZUdEsxfT+
	wx/BQCtI3KBCZwrknJSbhSpFV2nSNZyDKn6DVQQaE2IsJy2pR97tvXTebusoa6CLX6ohcU/4lw8hg
	k53tO4hr60/+lqclTw2FUWCJ/de72DPb/Yomj+CdV5apbMKzpXBPOsifENWxUKhrpVv+1GPlqzMmH
	gbCnv8gDul3cH5zycbNuy2OiX1K0rdzDqzQV2s3yxzo3IkXgahnkgI0BpI4CJtlpOihpXj+3Hsaim
	CiZaXluG2kfLNhL2nCbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG0F0-00Fopt-Lx; Thu, 12 Jan 2023 16:15:46 +0000
Received: from [2001:4bb8:181:656b:476d:b677:997f:e3ad] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG0Ew-00FooI-4o; Thu, 12 Jan 2023 16:15:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: block: set BLK_MQ_F_BLOCKING
Date: Thu, 12 Jan 2023 17:15:40 +0100
Message-Id: <20230112161540.1392231-1-hch@lst.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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

Set BLK_MQ_F_BLOCKING so that the block layer always calls ->queue_rq
from process context and drop the driver internal workqueue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/ubi/block.c | 97 ++++++++++++-----------------------------
 1 file changed, 28 insertions(+), 69 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 75eaecc8639f00..1f163c443f3049 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -35,7 +35,6 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/mtd/ubi.h>
-#include <linux/workqueue.h>
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
 #include <linux/hdreg.h>
@@ -62,7 +61,6 @@ struct ubiblock_param {
 };
 
 struct ubiblock_pdu {
-	struct work_struct work;
 	struct ubi_sgl usgl;
 };
 
@@ -82,8 +80,6 @@ struct ubiblock {
 	struct gendisk *gd;
 	struct request_queue *rq;
 
-	struct workqueue_struct *wq;
-
 	struct mutex dev_mutex;
 	struct list_head list;
 	struct blk_mq_tag_set tag_set;
@@ -181,20 +177,29 @@ static struct ubiblock *find_dev_nolock(int ubi_num, int vol_id)
 	return NULL;
 }
 
-static int ubiblock_read(struct ubiblock_pdu *pdu)
+static blk_status_t ubiblock_read(struct request *req)
 {
-	int ret, leb, offset, bytes_left, to_read;
-	u64 pos;
-	struct request *req = blk_mq_rq_from_pdu(pdu);
+	struct ubiblock_pdu *pdu = blk_mq_rq_to_pdu(req);
 	struct ubiblock *dev = req->q->queuedata;
+	u64 pos = blk_rq_pos(req) << 9;
+	int to_read = blk_rq_bytes(req);
+	int bytes_left = to_read;
+	/* Get LEB:offset address to read from */
+	int offset = do_div(pos, dev->leb_size);
+	int leb = pos;
+	struct req_iterator iter;
+	struct bio_vec bvec;
+	int ret;
 
-	to_read = blk_rq_bytes(req);
-	pos = blk_rq_pos(req) << 9;
+	blk_mq_start_request(req);
 
-	/* Get LEB:offset address to read from */
-	offset = do_div(pos, dev->leb_size);
-	leb = pos;
-	bytes_left = to_read;
+	/*
+	 * It is safe to ignore the return value of blk_rq_map_sg() because
+	 * the number of sg entries is limited to UBI_MAX_SG_COUNT
+	 * and ubi_read_sg() will check that limit.
+	 */
+	ubi_sgl_init(&pdu->usgl);
+	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
 
 	while (bytes_left) {
 		/*
@@ -206,14 +211,17 @@ static int ubiblock_read(struct ubiblock_pdu *pdu)
 
 		ret = ubi_read_sg(dev->desc, leb, &pdu->usgl, offset, to_read);
 		if (ret < 0)
-			return ret;
+			break;
 
 		bytes_left -= to_read;
 		to_read = bytes_left;
 		leb += 1;
 		offset = 0;
 	}
-	return 0;
+
+	rq_for_each_segment(bvec, req, iter)
+		flush_dcache_page(bvec.bv_page);
+	return errno_to_blk_status(ret);
 }
 
 static int ubiblock_open(struct block_device *bdev, fmode_t mode)
@@ -289,47 +297,15 @@ static const struct block_device_operations ubiblock_ops = {
 	.getgeo	= ubiblock_getgeo,
 };
 
-static void ubiblock_do_work(struct work_struct *work)
-{
-	int ret;
-	struct ubiblock_pdu *pdu = container_of(work, struct ubiblock_pdu, work);
-	struct request *req = blk_mq_rq_from_pdu(pdu);
-	struct req_iterator iter;
-	struct bio_vec bvec;
-
-	blk_mq_start_request(req);
-
-	/*
-	 * It is safe to ignore the return value of blk_rq_map_sg() because
-	 * the number of sg entries is limited to UBI_MAX_SG_COUNT
-	 * and ubi_read_sg() will check that limit.
-	 */
-	blk_rq_map_sg(req->q, req, pdu->usgl.sg);
-
-	ret = ubiblock_read(pdu);
-
-	rq_for_each_segment(bvec, req, iter)
-		flush_dcache_page(bvec.bv_page);
-
-	blk_mq_end_request(req, errno_to_blk_status(ret));
-}
-
 static blk_status_t ubiblock_queue_rq(struct blk_mq_hw_ctx *hctx,
 			     const struct blk_mq_queue_data *bd)
 {
-	struct request *req = bd->rq;
-	struct ubiblock *dev = hctx->queue->queuedata;
-	struct ubiblock_pdu *pdu = blk_mq_rq_to_pdu(req);
-
-	switch (req_op(req)) {
+	switch (req_op(bd->rq)) {
 	case REQ_OP_READ:
-		ubi_sgl_init(&pdu->usgl);
-		queue_work(dev->wq, &pdu->work);
-		return BLK_STS_OK;
+		return ubiblock_read(bd->rq);
 	default:
 		return BLK_STS_IOERR;
 	}
-
 }
 
 static int ubiblock_init_request(struct blk_mq_tag_set *set,
@@ -339,8 +315,6 @@ static int ubiblock_init_request(struct blk_mq_tag_set *set,
 	struct ubiblock_pdu *pdu = blk_mq_rq_to_pdu(req);
 
 	sg_init_table(pdu->usgl.sg, UBI_MAX_SG_COUNT);
-	INIT_WORK(&pdu->work, ubiblock_do_work);
-
 	return 0;
 }
 
@@ -401,7 +375,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->tag_set.ops = &ubiblock_mq_ops;
 	dev->tag_set.queue_depth = 64;
 	dev->tag_set.numa_node = NUMA_NO_NODE;
-	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
+	dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING;
 	dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
 	dev->tag_set.driver_data = dev;
 	dev->tag_set.nr_hw_queues = 1;
@@ -439,31 +413,18 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	dev->rq = gd->queue;
 	blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
 
-	/*
-	 * Create one workqueue per volume (per registered block device).
-	 * Remember workqueues are cheap, they're not threads.
-	 */
-	dev->wq = alloc_workqueue("%s", 0, 0, gd->disk_name);
-	if (!dev->wq) {
-		ret = -ENOMEM;
-		goto out_remove_minor;
-	}
-
 	list_add_tail(&dev->list, &ubiblock_devices);
 
 	/* Must be the last step: anyone can call file ops from now on */
 	ret = add_disk(dev->gd);
 	if (ret)
-		goto out_destroy_wq;
+		goto out_remove_minor;
 
 	dev_info(disk_to_dev(dev->gd), "created from ubi%d:%d(%s)",
 		 dev->ubi_num, dev->vol_id, vi->name);
 	mutex_unlock(&devices_mutex);
 	return 0;
 
-out_destroy_wq:
-	list_del(&dev->list);
-	destroy_workqueue(dev->wq);
 out_remove_minor:
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
 out_cleanup_disk:
@@ -482,8 +443,6 @@ static void ubiblock_cleanup(struct ubiblock *dev)
 {
 	/* Stop new requests to arrive */
 	del_gendisk(dev->gd);
-	/* Flush pending work */
-	destroy_workqueue(dev->wq);
 	/* Finally destroy the blk queue */
 	dev_info(disk_to_dev(dev->gd), "released");
 	put_disk(dev->gd);
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
