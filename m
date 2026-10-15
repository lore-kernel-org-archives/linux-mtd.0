Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21822CC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ol9tQgkIVHJQI59LbrhzMqCnFgcWAYlwaFIA0j+OPSw=; b=PJlKasl5VQ2YXX
	gILScxHqbizh8h6QnSp/3ZPvV5tW5ki/hW0eO90rhGJQOPnqb+iS8URsBo+8+S6LLZ+89uiUOAT1i
	b0Nrt2BwtzLDGdWi4EwdxIVdtrW0mRff60kIIhfxnWOS8SNWybwh4J+Dhg0z414qpT7ETrzmO3ivC
	+38eMp4CqUrQWV0Foty0c+hoVydXVdRJ0mh4PZunq/YQVBvpRXz8dRezoo3jJl3Jd5HANQO0ikIkk
	vrud7CjciZbM1Ywzrgoa/N9N4On4A8Sg+yN5jOe98auwqsEusPIRU+G6ZFHJuy3MJatGpIo9RBlhz
	KHtY0ombWqEqwfBye2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKAM-000000002zo-0Jhu;
	Thu, 15 Oct 2026 12:02:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKAK-000000002z6-0DLf
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 12:02:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so30189175ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065751; x=1792670551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApNHjCttumEMl6K7MdkUpNjEISJlLnpsoD/T2Ism33Y=;
        b=sugGePOuhQHoWyv4Hbk9s13lYYs1x5YJCQPkM2t1o4Xp2FUU841rdhLBHfxnWAZPZH
         k9lO4EVVDlNU8r6iLeZDoXolfjulA+hz8+uiNqK4bYHQ7N6GuFberX6/6zbHNC122sIO
         qM1218WC3xSjXiKhd1PwSUmXPR2j97/ibqHvtKXEeDyxjC2M/s6fD4zBOmwDo+UB+E24
         PB2vszoUd5goKiGGydrTcdMioL1bryaF+BJSFfvNYeVK5Ys7cu04EdhHasx499izvwS5
         vMQyVJoX8B05BdaU5KqGFmfy+HL6g3VOzxtTdW1Gy656XWEkqvhkFg0yYT1husjL7B23
         CiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065751; x=1792670551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApNHjCttumEMl6K7MdkUpNjEISJlLnpsoD/T2Ism33Y=;
        b=ivjKqakHZf1Cm24fw7zhm5+myzXJA1Har7c95rjsqkcZ4rYfL/9og6sdKr0OO3lDoH
         0cAMfcdFctyor0xOvTDn7vbq/se68J6AO/Hl4U/GlwtLek5VhdTN8xMLMaFFsZraI3XV
         dj5VS3LgKt52FS1ztIu2C1boPbVPkPLPx9oBP4x9SJ7Pfs+j/zw0irr6GnLAeF1xlj9n
         PF3KigKQLAzJ6/akgHhpHJgWPJRJP7kandkeutCubfFUdNclvUSSUW+jbfftCzlSEPO8
         goniccXC6OeFwmeMOrnc307o2AJ6aFjKgiTdbAAtJI1BQQC3hfyzduD+mn9jwbfsRtvW
         wM3A==
X-Gm-Message-State: AFq9FYIlFs64kAlnAMMxW4n/zfa48zpT5TUfo4E69IrMv3MlH+w5xji0
	dQFcVF6RMluBnsG6TgjVS5/uzo9GGe/+OeSIkzZREmhywOVbwRcMa0DFYmXAKuj19IPt+w==
X-Gm-Gg: AYBFou2tAUeDjosDS7rAp7Pd8jRbwRH4CdSfW5zWg9uDOILsS62bE/6FLw9RQY/2G4w
	ydR2Qlm7ORh600b8FlWxpT4c1kJatxvtduu+JzAyMppu8aYx/gUccZe/F/KLoUNEA8MzfldbUxo
	wz12Gn0iulVsqM3pM0a0ZQM63SjqsK+7EVw/RJ8v6HdQFv/qMENN9+60ru68iP9XXNSGdFySk0J
	YirAR72D8/7d7Z177PtKGoMs+H5XycugG5kE5BODhX1JO5DooiYWbv0V1WC5IGa9ulrboFpOctT
	odxU4Tsuau9EMlL040IPPEZEt0Sc40jCWtdTqR3bhAGOWQL/NuFX/+2FfCMBL+4J/7NdZU+E/YL
	/q34lVyQwAN7Yi9B9Ig0+E+Jeq+I076UUUYlmteBXGPz40DMwJiJo3zr3qO3DJPrFvv4Xt/ELeL
	wer+K+2zpTXpi8SgPa3nAxkuZcAIq0mqTE74dZAjRmM15MJ/bd8134f5ooMtHKTFD7jK7kgnEUn
	cYdGa/djr32j4Y/fQ==
X-Received: by 2002:a17:903:19e7:b0:2e6:1a6c:abcd with SMTP id d9443c01a7336-2e84280a68fmr186355835ad.3.1792065749469;
        Thu, 15 Oct 2026 05:02:29 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1807sm80886315ad.43.2026.10.15.05.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:02:28 -0700 (PDT)
From: Ye Linfei <yelinfei66@gmail.com>
X-Google-Original-From: Ye Linfei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: chengzhihao1@huawei.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: ubi: block: forbid direct reclaim I/O during synchronous read
Date: Thu, 15 Oct 2026 20:01:59 +0800
Message-Id: <20261015120159.305277-1-yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1792046946.git.yelinfei@ruijie.com.cn>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_050232_111869_8089FD0C 
X-CRM114-Status: GOOD (  17.59  )
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

ubiblock implements ->queue_rq() synchronously: the task submitting the
bio executes the whole UBI/MTD read itself, from inside the block layer
submission loop (current->bio_list is non-empty) and while holding the
tag_set SRCU read lock (blk_mq_run_dispatch_ops(), taken for
BLK_MQ_F_BLOCKING drivers).

An allocation in that context may trigger direct reclaim, which with
GFP_NOFS - used by all UBI allocations - may synchronously write dirty
pages to swap.  On systems where swap is backed by a device with
BLK_FEAT_SYNCHRONOUS (zram), that ends in swap_writepage_bdev_sync()
-> submit_bio_wait().  The swap bio is only queued onto
current->bio_list, never dispatched: per submit_bio_noacct_nocheck(),
bios submitted while a submission loop is active are only collected on
current->bio_list, and their sole dispatcher is the task currently
executing ->queue_rq() - which is now sleeping waiting for the very
same bio's completion.  The task hangs forever, the pending SRCU read
lock freezes grace periods (blk_mq_timeout_work() -> synchronize_srcu()
never returns), and the unfinished request blocks all other I/O to the
device.

This was observed in the field on a 1 GiB RISC-V networking product
running squashfs-on-ubiblock with zram swap: 47 tasks stuck in disk
sleep for 600+ seconds, ending in a hung task panic.  The allocator
never reached the OOM decision point, because the task died inside
try_to_free_pages().

Mark the whole read with memalloc_noio_save()/memalloc_noio_restore()
so direct reclaim never issues block I/O while this driver executes:
reclaim is restricted to dropping clean page cache and shrinking slabs,
page (swap) reclaim is performed asynchronously by kswapd, and the
worst case is -ENOMEM, which propagates to the caller as an ordinary
recoverable I/O error - a recoverable read failure instead of a total
system hang.

This covers every allocation performed below ubi_read_sg(), including
lock-tree entries, VID buffers and I/O helpers, regardless of the gfp
flags they use internally.

Fixes: 9d54c8a33eec ("UBI: R/O block driver on top of UBI volumes")
Cc: stable@vger.kernel.org
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
---

Changes in v2:
- Drop the ltree GFP_NOIO patch: its allocation rides under
  ubiblock_read()'s memalloc_noio_save() scope, which already implies
  NOIO semantics, and the remaining ltree_add_entry() callers (cdev,
  update and wear-leveling paths) run in process context where swap
  I/O from direct reclaim can complete, so widening the flag change
  was unnecessary.  Suggested by Zhihao Cheng.
- Add Reviewed-by: Zhihao Cheng.

 drivers/mtd/ubi/block.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 29c0d6941a81..c9d42181bf64 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -38,6 +38,7 @@
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
 #include <linux/hdreg.h>
+#include <linux/sched/mm.h>
 #include <linux/scatterlist.h>
 #include <linux/idr.h>
 #include <asm/div64.h>
@@ -189,6 +190,7 @@ static blk_status_t ubiblock_read(struct request *req)
 	int leb = pos;
 	struct req_iterator iter;
 	struct bio_vec bvec;
+	unsigned int noio_flags;
 	int ret;
 
 	blk_mq_start_request(req);
@@ -201,6 +203,18 @@ static blk_status_t ubiblock_read(struct request *req)
 	ubi_sgl_init(&pdu->usgl);
 	blk_rq_map_sg(req, pdu->usgl.sg);
 
+	/*
+	 * This entire callback runs in the synchronous dispatch path of
+	 * blk-mq: submit_bio_noacct_nocheck() only queues a bio submitted
+	 * from here onto current->bio_list, and the sole dispatcher of
+	 * that list is this very task, busy inside ->queue_rq().  Any
+	 * block I/O issued from below would therefore deadlock against
+	 * itself (e.g. synchronous swap writeback reached via direct
+	 * reclaim).  Forbid it for the whole read instead of relying on
+	 * every callee using safe allocation flags.
+	 */
+	noio_flags = memalloc_noio_save();
+
 	while (bytes_left) {
 		/*
 		 * We can only read one LEB at a time. Therefore if the read
@@ -221,6 +235,7 @@ static blk_status_t ubiblock_read(struct request *req)
 
 	rq_for_each_segment(bvec, req, iter)
 		flush_dcache_page(bvec.bv_page);
+	memalloc_noio_restore(noio_flags);
 
 	blk_mq_end_request(req, errno_to_blk_status(ret));
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
