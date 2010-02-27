Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NlAAD-0002RW-H8
	for linux-mtd@lists.infradead.org; Sat, 27 Feb 2010 00:04:14 +0000
Received: by fxm6 with SMTP id 6so681982fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Feb 2010 16:04:07 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: r852: Few fixes for problems that occur when card is
	rapidly inserted/removed.
Date: Sat, 27 Feb 2010 02:04:02 +0200
Message-Id: <1267229042-4405-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First don't enable card detection logic to early. Second be very carefull with
DMA engine, to be sure it doesn't write to kernel memory driver doesn't own.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/r852.c |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

I did some stress testing of hotplug, and found few problems.
Unfortunelly is still seems to be possible to crash the kernel with this:

<4>[ 1003.886420]  [<ffffffff8118b8fb>] ? elv_queue_empty+0x2b/0x30
<4>[ 1003.886434]  [<ffffffff81190009>] __make_request+0xf9/0x3f0
<4>[ 1003.886447]  [<ffffffff8118e201>] generic_make_request+0x1f1/0x3b0
<4>[ 1003.886463]  [<ffffffff81089630>] ? mempool_alloc_slab+0x10/0x20
<4>[ 1003.886477]  [<ffffffff810897ce>] ? mempool_alloc+0x5e/0x150
<4>[ 1003.886492]  [<ffffffff81087720>] ? sync_page_killable+0x0/0x40
<4>[ 1003.886506]  [<ffffffff8118e435>] submit_bio+0x75/0x100
<4>[ 1003.886521]  [<ffffffff810e7fb2>] submit_bh+0xf2/0x130
<4>[ 1003.886534]  [<ffffffff810ec2b6>] block_read_full_page+0x2b6/0x3c0
<4>[ 1003.886549]  [<ffffffff810ee390>] ? blkdev_get_block+0x0/0x70
<4>[ 1003.886563]  [<ffffffff81087642>] ? __lock_page_killable+0x62/0x70
<4>[ 1003.886579]  [<ffffffff810ef5a3>] blkdev_readpage+0x13/0x20
<4>[ 1003.886592]  [<ffffffff81089147>] generic_file_aio_read+0x1e7/0x660
<4>[ 1003.886607]  [<ffffffff810c0f02>] do_sync_read+0xd2/0x110
<4>[ 1003.886619]  [<ffffffff810ee890>] ? block_llseek+0x40/0xb0
<4>[ 1003.886631]  [<ffffffff810ee890>] ? block_llseek+0x40/0xb0
<4>[ 1003.886645]  [<ffffffff8105e6bd>] ? trace_hardirqs_on+0xd/0x10
<4>[ 1003.886660]  [<ffffffff810c1be5>] vfs_read+0xb5/0x1a0
<4>[ 1003.886672]  [<ffffffff810c1dac>] sys_read+0x4c/0x80
<4>[ 1003.886686]  [<ffffffff81002ceb>] system_call_fastpath+0x16/0x1b

In del_mtd_blktrans_dev I do the blk_start_queue, and then blk_cleanup_queue
similiar to what other drivers do, however the ->request seems to be called by other
thread after I call blk_cleanup_queue

I will ask that on LKML.

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 218a42d..0e11485 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -96,14 +96,21 @@ static void r852_dma_enable(struct r852_device *dev)
 	if (dev->dma_dir)
 		dma_reg |= R852_DMA_READ;
 
-	if (dev->dma_state == DMA_INTERNAL)
+	if (dev->dma_state == DMA_INTERNAL) {
 		dma_reg |= R852_DMA_INTERNAL;
-	else {
+		/* Precation to make sure HW doesn't write */
+			/* to random kernel memory */
+		r852_write_reg_dword(dev, R852_DMA_ADDR,
+			cpu_to_le32(dev->phys_bounce_buffer));
+	} else {
 		dma_reg |= R852_DMA_MEMORY;
 		r852_write_reg_dword(dev, R852_DMA_ADDR,
 			cpu_to_le32(dev->phys_dma_addr));
 	}
 
+	/* Precation: make sure write reached the device */
+	r852_read_reg_dword(dev, R852_DMA_ADDR);
+
 	r852_write_reg_dword(dev, R852_DMA_SETTINGS, dma_reg);
 
 	/* Set dma irq */
@@ -129,6 +136,11 @@ static void r852_dma_done(struct r852_device *dev, int error)
 	r852_write_reg_dword(dev, R852_DMA_SETTINGS, 0);
 	r852_write_reg_dword(dev, R852_DMA_IRQ_ENABLE, 0);
 
+	/* Precation to make sure HW doesn't write to random kernel memory */
+	r852_write_reg_dword(dev, R852_DMA_ADDR,
+		cpu_to_le32(dev->phys_bounce_buffer));
+	r852_read_reg_dword(dev, R852_DMA_ADDR);
+
 	dev->dma_error = error;
 	dev->dma_stage = 0;
 
@@ -579,6 +591,7 @@ void r852_card_update_present(struct r852_device *dev)
 void r852_update_card_detect(struct r852_device *dev)
 {
 	int card_detect_reg = r852_read_reg(dev, R852_CARD_IRQ_ENABLE);
+	dev->card_unstable = 0;
 
 	card_detect_reg &= ~(R852_CARD_IRQ_REMOVE | R852_CARD_IRQ_INSERT);
 	card_detect_reg |= R852_CARD_IRQ_GENABLE;
@@ -690,10 +703,10 @@ void r852_card_detect_work(struct work_struct *work)
 	struct r852_device *dev =
 		container_of(work, struct r852_device, card_detect_work.work);
 
-	r852_update_card_detect(dev);
+	r852_card_update_present(dev);
 	dev->card_unstable = 0;
 
-	/* false alarm */
+	/* False alarm */
 	if (dev->card_detected == dev->card_registred)
 		goto exit;
 
-- 
1.6.3.3
