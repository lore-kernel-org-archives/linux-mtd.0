Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7B5C433EB
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 15:05:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 550992065F
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 15:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b97xm6QR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gAQdwoJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 550992065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YUEMx8vTScijA+sx2eUSQGK/wdHqkXXASaZh5dgG5+M=; b=b97xm6QRf7olME7l8heqreode
	fZ4sfGN+/bDnZUn8pl3DQYdLqY4j9j9V81KvVoI3ODMH4rPDFQUKC/5DRlI8mkFdqZgWFpMto5mqg
	FwLUjzel9S07EjJbYtAb/R25BneA2oW7CfZYDhGyBepbyiiCnEPvBTdBnqpDXi+jn6FtElF1Owlis
	l2xKwQvCjVVu4yk9Cerb+1OBrlSnMVHgQ3nf3Urqd7BhJNcKR8GAhmQ3b422VDAuSsVDpZFvL+6Qq
	BWrB2Hb1ym5f2NiHvMbef1GJmgaO2oN4+KlKsZOOsw6FecwgW7uZTRZXonrAcj5VjXGJTHhz3yebr
	epANSGBxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jziCL-0003Jk-Ma; Sun, 26 Jul 2020 15:04:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jziBt-00036R-8R
 for linux-mtd@merlin.infradead.org; Sun, 26 Jul 2020 15:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kHUw0UuZXh62UTS5LwOFYLvTBhGcGjgSBKOEDgrpN1Q=; b=gAQdwoJR0RwHOOzUGKf5gRuKJH
 SUHUWWRDGtONpRgQ4GZ4DRENEY2n8zVX1HjkTyAgEofsK4HmtKj2KHmPDE1ygITYavbkbsvnLBMs5
 yRjBCNEB3LOCz0uXj0StMTJRp32PF7cH8kFGGa/JtdJ+BO+uLBlU8BuhBn+fnfBVNb3FYtxDOICB/
 frWV31IhoAKW5wiAcoyYaW1UASRXQXd0S8deBEwbmU3FX1thsFs6lxu7Pt122QpewuVu2hHLFjTiW
 RITnYd5c1tkt9i4bTwV3Oj+vAwOQYgMmHKazvZBZfqGDKVhaIUuzPorP0ehEaiQHdNIEDX60PimrU
 m3wB6QpQ==;
Received: from [2001:4bb8:18c:2acc:2375:88ff:9f84:118d] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jziBr-0005hl-Nc; Sun, 26 Jul 2020 15:03:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 10/14] bdi: remove BDI_CAP_SYNCHRONOUS_IO
Date: Sun, 26 Jul 2020 17:03:29 +0200
Message-Id: <20200726150333.305527-11-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726150333.305527-1-hch@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

BDI_CAP_SYNCHRONOUS_IO is only checked in the swap code, and used to
decided if ->rw_page can be used on a block device.  Just check up for
the method instead.  The only complication is that zram needs a second
set of block_device_operations as it can switch between modes that
actually support ->rw_page and those who don't.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/brd.c           |  1 -
 drivers/block/zram/zram_drv.c | 19 +++++++++++++------
 drivers/nvdimm/btt.c          |  2 --
 drivers/nvdimm/pmem.c         |  1 -
 include/linux/backing-dev.h   |  9 ---------
 mm/swapfile.c                 |  2 +-
 6 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index 2723a70eb85593..cc49a921339f77 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -403,7 +403,6 @@ static struct brd_device *brd_alloc(int i)
 	disk->flags		= GENHD_FL_EXT_DEVT;
 	sprintf(disk->disk_name, "ram%d", i);
 	set_capacity(disk, rd_size * 2);
-	brd->brd_queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
 
 	/* Tell the block layer that this is not a rotational device */
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, brd->brd_queue);
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 9100ac36670afc..d73ddf018fa65f 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -52,6 +52,9 @@ static unsigned int num_devices = 1;
  */
 static size_t huge_class_size;
 
+static const struct block_device_operations zram_devops;
+static const struct block_device_operations zram_wb_devops;
+
 static void zram_free_page(struct zram *zram, size_t index);
 static int zram_bvec_read(struct zram *zram, struct bio_vec *bvec,
 				u32 index, int offset, struct bio *bio);
@@ -408,8 +411,7 @@ static void reset_bdev(struct zram *zram)
 	zram->backing_dev = NULL;
 	zram->old_block_size = 0;
 	zram->bdev = NULL;
-	zram->disk->queue->backing_dev_info->capabilities |=
-				BDI_CAP_SYNCHRONOUS_IO;
+	zram->disk->fops = &zram_devops;
 	kvfree(zram->bitmap);
 	zram->bitmap = NULL;
 }
@@ -528,8 +530,7 @@ static ssize_t backing_dev_store(struct device *dev,
 	 * freely but in fact, IO is going on so finally could cause
 	 * use-after-free when the IO is really done.
 	 */
-	zram->disk->queue->backing_dev_info->capabilities &=
-			~BDI_CAP_SYNCHRONOUS_IO;
+	zram->disk->fops = &zram_wb_devops;
 	up_write(&zram->init_lock);
 
 	pr_info("setup backing device %s\n", file_name);
@@ -1819,6 +1820,13 @@ static const struct block_device_operations zram_devops = {
 	.owner = THIS_MODULE
 };
 
+static const struct block_device_operations zram_wb_devops = {
+	.open = zram_open,
+	.submit_bio = zram_submit_bio,
+	.swap_slot_free_notify = zram_slot_free_notify,
+	.owner = THIS_MODULE
+};
+
 static DEVICE_ATTR_WO(compact);
 static DEVICE_ATTR_RW(disksize);
 static DEVICE_ATTR_RO(initstate);
@@ -1946,8 +1954,7 @@ static int zram_add(void)
 	if (ZRAM_LOGICAL_BLOCK_SIZE == PAGE_SIZE)
 		blk_queue_max_write_zeroes_sectors(zram->disk->queue, UINT_MAX);
 
-	zram->disk->queue->backing_dev_info->capabilities |=
-			(BDI_CAP_STABLE_WRITES | BDI_CAP_SYNCHRONOUS_IO);
+	zram->disk->queue->backing_dev_info->capabilities |= BDI_CAP_STABLE_WRITES;
 	device_add_disk(NULL, zram->disk, zram_disk_attr_groups);
 
 	strlcpy(zram->compressor, default_compressor, sizeof(zram->compressor));
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 412d21d8f64351..b4184dc9b41eb4 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1540,8 +1540,6 @@ static int btt_blk_init(struct btt *btt)
 	btt->btt_disk->private_data = btt;
 	btt->btt_disk->queue = btt->btt_queue;
 	btt->btt_disk->flags = GENHD_FL_EXT_DEVT;
-	btt->btt_disk->queue->backing_dev_info->capabilities |=
-			BDI_CAP_SYNCHRONOUS_IO;
 
 	blk_queue_logical_block_size(btt->btt_queue, btt->sector_size);
 	blk_queue_max_hw_sectors(btt->btt_queue, UINT_MAX);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 94790e6e0e4ce1..436b83fb24ad61 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -478,7 +478,6 @@ static int pmem_attach_disk(struct device *dev,
 	disk->queue		= q;
 	disk->flags		= GENHD_FL_EXT_DEVT;
 	disk->private_data	= pmem;
-	disk->queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
 	nvdimm_namespace_disk_name(ndns, disk->disk_name);
 	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
 			/ 512);
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 52583b6f2ea05d..860ea33571bce5 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -122,9 +122,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
  * BDI_CAP_NO_WRITEBACK:   Don't write pages back
  * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
  * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
- *
- * BDI_CAP_SYNCHRONOUS_IO: Device is so fast that asynchronous IO would be
- *			   inefficient.
  */
 #define BDI_CAP_NO_ACCT_DIRTY	0x00000001
 #define BDI_CAP_NO_WRITEBACK	0x00000002
@@ -132,7 +129,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
 #define BDI_CAP_STABLE_WRITES	0x00000008
 #define BDI_CAP_STRICTLIMIT	0x00000010
 #define BDI_CAP_CGROUP_WRITEBACK 0x00000020
-#define BDI_CAP_SYNCHRONOUS_IO	0x00000040
 
 #define BDI_CAP_NO_ACCT_AND_WRITEBACK \
 	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY | BDI_CAP_NO_ACCT_WB)
@@ -174,11 +170,6 @@ static inline int wb_congested(struct bdi_writeback *wb, int cong_bits)
 long congestion_wait(int sync, long timeout);
 long wait_iff_congested(int sync, long timeout);
 
-static inline bool bdi_cap_synchronous_io(struct backing_dev_info *bdi)
-{
-	return bdi->capabilities & BDI_CAP_SYNCHRONOUS_IO;
-}
-
 static inline bool bdi_cap_stable_pages_required(struct backing_dev_info *bdi)
 {
 	return bdi->capabilities & BDI_CAP_STABLE_WRITES;
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 6c26916e95fd4a..18eac97b10e502 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3230,7 +3230,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (bdi_cap_stable_pages_required(inode_to_bdi(inode)))
 		p->flags |= SWP_STABLE_WRITES;
 
-	if (bdi_cap_synchronous_io(inode_to_bdi(inode)))
+	if (p->bdev && p->bdev->bd_disk->fops->rw_page)
 		p->flags |= SWP_SYNCHRONOUS_IO;
 
 	if (p->bdev && blk_queue_nonrot(bdev_get_queue(p->bdev))) {
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
