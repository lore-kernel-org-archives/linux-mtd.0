Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C475C982EA
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 01:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PqlQJSlZre/3hjxngDUh+ECOl++Ua3DkH4ts5TiCcPU=; b=FLP/LdmIhNCyot
	RQSXYB5G+EgiS2LaAT9CgkvZcdEAUjJCGON5suQfqRnW/cbIOz0e5bfZuWSPutxJZllM1Q2ZEbBOU
	IT8Ea0rvJaFix72UNvr49weUZxQB6c4Fje+HxsItaRmlaWOUHZrxcM5j3QCmJXjJ/JkcAk7aLdhKz
	TRMNybEbCe7fvG1X1ogPWipfdgEVymemDwIgYACQfuw2c8+fk3oPYbMeBIcksm9ktj8NqObO1IlhW
	k0d5c2ArX2IynM6y9MIkkZRzaLZ7b2Yu0WcUmSqFRIF7kjeQAaDg57Yr/sb0ukiElZ+dKJ4xcJhW/
	c5yLSIgEUqVyACJ1BOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8T9z-00000000hMt-0z0V;
	Mon, 21 Sep 2026 01:49:35 +0000
Received: from out-70.mta0.migadu.com ([2001:41d0:1004:224b::46] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8T9w-00000000hML-0VOc
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 01:49:33 +0000
X-Envelope-To: linux-mtd@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Zq4+vW7gLIfMp6nL7BJFMjrgjpLWJuH9xpY0ZGtQq7c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789955368; v=1; x=1790560168;
 b=esO4uJ5iw7umAH0rRD2ZiT5bHTPjzNXsLXImfEbor4MRKFVkxG1lGMcQiIp1N5MugIVq/ODb
 A66p3fI5FSid+npcyPpBj78R+fhEaLZ4Eui6uOKODP45vzp5DurWAzq5wbwSJ+14mMywygij+6E
 ctv8Ern5wBS2FsQb9fDF+5rY=
X-Envelope-To: linux-mtd@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 627428ec648c6623;
	Mon, 21 Sep 2026 01:49:28 +0000
X-Mizu-Trace-ID: 627428ec648c6623
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Qingfang Deng <qingfang.deng@linux.dev>,
	syzbot+e08e0a15269eefa87790@syzkaller.appspotmail.com
Subject: [PATCH] mtd: block: prevent reclaim I/O during request processing
Date: Mon, 21 Sep 2026 09:49:20 +0800
Message-ID: <20260921014921.78150-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_184932_345920_AF753D57 
X-CRM114-Status: GOOD (  10.96  )
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

The blktrans request callbacks run under dev->lock and may allocate
memory with GFP_KERNEL. For example, mtdblock_writesect() uses vmalloc()
to allocate its eraseblock cache. Direct reclaim can then recurse into
block I/O and deadlock on resources held by the request being processed.
syzbot reports a circular locking dependency involving the device mutex
and fs_reclaim.

Commit d5ba1c8ffd0b ("mtd: don't use PF_MEMALLOC") removed PF_MEMALLOC
from the MTD request thread. That flag had prevented direct reclaim,
so its removal made allocations during request processing eligible for
reclaim without excluding I/O.

Wrap request processing in mtd_queue_rq() in a NOIO scope. This covers
both the request and background callbacks, including allocations made
by lower MTD drivers, and prevents reclaim from initiating filesystem
or block I/O.

Fixes: d5ba1c8ffd0b ("mtd: don't use PF_MEMALLOC")
Assisted-by: Codex:gpt-6-astra
Reported-by: syzbot+e08e0a15269eefa87790@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e08e0a15269eefa87790
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
 drivers/mtd/mtd_blkdevs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 4d2e7b7774e9..42f250344f0c 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -18,6 +18,7 @@
 #include <linux/spinlock.h>
 #include <linux/hdreg.h>
 #include <linux/mutex.h>
+#include <linux/sched/mm.h>
 #include <linux/uaccess.h>
 
 #include "mtdcore.h"
@@ -167,6 +168,7 @@ static blk_status_t mtd_queue_rq(struct blk_mq_hw_ctx *hctx,
 				 const struct blk_mq_queue_data *bd)
 {
 	struct mtd_blktrans_dev *dev;
+	unsigned int noio_flags;
 
 	dev = hctx->queue->queuedata;
 	if (!dev) {
@@ -174,10 +176,13 @@ static blk_status_t mtd_queue_rq(struct blk_mq_hw_ctx *hctx,
 		return BLK_STS_IOERR;
 	}
 
+	/* Reclaim must not recurse into I/O while processing requests. */
+	noio_flags = memalloc_noio_save();
 	spin_lock_irq(&dev->queue_lock);
 	list_add_tail(&bd->rq->queuelist, &dev->rq_list);
 	mtd_blktrans_work(dev);
 	spin_unlock_irq(&dev->queue_lock);
+	memalloc_noio_restore(noio_flags);
 
 	return BLK_STS_OK;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
