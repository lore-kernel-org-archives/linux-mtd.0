Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB2CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mD0nvHVGjGPhqiY39DF/twn9kogCd4BWHQfnipjto5o=; b=ns4nCB46p5YodK
	hzXUqmUzfYYYL09Fb2+iX9ZFtoxRyS2D5/v2FdeN9a3zgQP77pNjfTBhJWwa2vHTIKcNNmfRmSvjw
	EIimFNkErXK1+i2F0ToLhyuPd5Pboc6IDTU31/uAZW2h9GYMryQU1oz3alKElbS5f0qUHyYK7Hxbx
	tK4kUYygKcbzu22ZTWUNkFsCreWfVrgO5xKdHN6D+h69StieHevrMncAI+Ki9pBacBLjhkE6ZcBoF
	sGFKyJp2p3PKBiV7OI4+QoQFTUFlLCDSF0gTS/LMPmYORzZ0/zu3MMl7ovqaAaC/PsEtLxkIAGYYF
	pZIQsRG+d/Rj9/WIDa9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFyE-0000000H2a1-2NpR;
	Thu, 15 Oct 2026 07:33:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFyA-0000000H2Z7-1yxg
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 07:33:44 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2626886a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792049621; x=1792654421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDV5CdvDDo6YswEAFIGrF4lABKfaTV0Zi1WVMCT/JHk=;
        b=DLTDRRTNPqtIh8CaOF+IX+VQwHBapiotekvKL7inpr09IInsgjY0xP8qjTncOjfOqq
         WtT09W6t7M3ckV2/6qddz4xNoeDAGXUba7rckeAwase/KR+I/OxWnfD87ejleEdxMsZ1
         ykUmeFuG00uhiFyc6vi/B1KcpO5iOPhLIFGN8lIg6gvBK22hfN/xdyV8it1EFACpMoS6
         u3h+ppQiDw9TvV/vMzhqDKD9jICEJBQn0h6fVyF9oCiqZOlRdtveJb5bcWc+e9Wbcy6N
         opDbZnm5/cj4zqGVInhSSFE4mGJKMEgk89i0SZTlCvASKjA22l4/CwXIewFDbj4XOJZG
         HpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049621; x=1792654421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDV5CdvDDo6YswEAFIGrF4lABKfaTV0Zi1WVMCT/JHk=;
        b=YdXh2vFDhFqsEkCCnxAsR6bgjgUnv6wRGI+LVsVDU8WZ+SgQ90wcFD2wsblSgYsiB6
         kkaPsVMgV6symRVIC4VwcdAZgae+Icv2e6nE6ciS7zYVZ7wzUoeEdHZoV+3/W/rJDLvr
         DCAvYu1j1OiqIGH/bb/CtLfaBthKvsE5UEF6XyqRmj5lzoW0ZzOfn9IEIE+05AuMtbEl
         PwQPZrUa0wKUNEFCKjMjBSJrjS9DC5YTBNFIvfQaZIMtwbxFcRiBusPVw0xieG1XwfkP
         td4YgVh2WdMJIdPNsBqN7qwS9toxsd9ZtluAaOKDmIkvdUe6Ga7Cxz1FswrphjFhI/35
         CVMA==
X-Gm-Message-State: AFq9FYLaI2/qpG7EEDFcio7rZiCY7zYW/XehjzcCr65vpFmUw8r6NWwe
	AWVurgLgtE0zDWT6eqB2xPlwNHU5eduWiyu9IgqiH5KRCkbW751NawkaLLuL/tyGxDnQFA==
X-Gm-Gg: AYBFou1n+0UTcrUb2IqiGA+syTXzCXfxSO3njMOEteNQuYcVpJ/Qi2XGtEvsW+72jZ8
	7HlFooVlvQOifzf0VAbp6boF0NPE4FLifekRepowayby2wEpcKxeVb9SkoescuCIuvSRy7fyEop
	c7p+W2gj2vq3gYzcbQl/QUBgeHr4tH5fb7EtETO0DpRgQJ2RH6GAzi0uPlQkq+MXSOyZQgTUOCw
	WvTJfBUp45t0jonsnAkNQq35L31XBALT4qEkUg2plkMhJSGC0ns+UaXcpyODxALcJ0F4Rvo/dCu
	Wqe+frswf+cTY1KzkMtoQQOqUETLvW8SGHBLyc81y/1GOy6YUzJ9mno2B+UDjMBbxuvNxT+nk1X
	/ZnuxG6+QGWtaUCuTc2laGL4MqbY89X+XcTgvSXlUwizzildWuCy9xhct2yRdnGACO2K23mSBBr
	JbHr/vCBKY5wPUptsUpGXzpCvIc0PvZhxYlfYLgho5I+6OrsbwqIzQeJM0BfBN9S538PrDG9REV
	wCNqkCZZUL//6px
X-Received: by 2002:a17:90b:2d06:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ab3acdf2e1mr13286209a91.42.1792049621389;
        Thu, 15 Oct 2026 00:33:41 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94748c6csm3066274a91.10.2026.10.15.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:33:41 -0700 (PDT)
From: Yelin Fei <yelinfei66@gmail.com>
X-Google-Original-From: Yelin Fei <yelinfei@ruijie.com.cn>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: ubi: block: forbid direct reclaim I/O during synchronous read
Date: Thu, 15 Oct 2026 15:33:20 +0800
Message-Id: <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1792046946.git.yelinfei@ruijie.com.cn>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_003342_817847_E72003E7 
X-CRM114-Status: GOOD (  16.86  )
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

From: Ye Linfei <yelinfei@ruijie.com.cn>

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
Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
---
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
