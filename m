Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB66C02185
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2025 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYHOM1eR3Oo+BoIw+n7ZboADYZuUgmZMXODxqB8/9EM=; b=ZLdQhV6y/imnV5
	D7K5tNEY32gXbWMV2vyVyb/GYC7wzRInyJgr1oAJG8FdVmJo+L89y07nIX4CcwB2zCp1sSgYBybEx
	mluam+2akulH0AgJ6uV7oA1du4vDAEln+BW6Jboc5uVG7xNe2x8K6l8vQJVqga5LlaHhiE7jdy7p7
	Fc6updTgCelWQPnCNWzziRm0I9VDmWPlppPiNCKH7HffQm/T4ak/wkfI/sB8POyNkQQ7wjnFRKLSk
	YzNvajcGbe2IvqPEvD54EZLWBukDWW8ChWaz2rcuqPskQikIr1WxLgQY5uMRal7F1GmIdqCPQQnRX
	TBcjdNpqHHXbWev9XzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYh2A-0000000HEDm-296h;
	Fri, 17 Jan 2025 07:44:50 +0000
Received: from 2a02-8389-2341-5b80-41c4-d87f-051e-5808.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:41c4:d87f:51e:5808] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYh28-0000000HECO-38Y1;
	Fri, 17 Jan 2025 07:44:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 1/2] loop: force GFP_NOIO for underlying file systems allocations
Date: Fri, 17 Jan 2025 08:44:07 +0100
Message-ID: <20250117074442.256705-2-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250117074442.256705-1-hch@lst.de>
References: <20250117074442.256705-1-hch@lst.de>
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

File systems can and often do allocate memory in the read-write path.
If these allocations are done with __GFP_IO or __GFP_FS set they can
recurse into the file system or swap device on top of the loop device
and cause deadlocks.  Prevent this by forcing a noio scope over the
calls into the file system.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 1ec7417c7f00..71eccc5cfffb 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1905,6 +1905,15 @@ static void loop_handle_cmd(struct loop_cmd *cmd)
 	int ret = 0;
 	struct mem_cgroup *old_memcg = NULL;
 	const bool use_aio = cmd->use_aio;
+	unsigned int memflags;
+
+	/*
+	 * We're calling into file system which could do be doing memory
+	 * allocations.  Ensure the memory reclaim does not cause I/O,
+	 * because that could end up in the user of this loop devices again and
+	 * deadlock.
+	 */
+	memflags = memalloc_noio_save();
 
 	if (write && (lo->lo_flags & LO_FLAGS_READ_ONLY)) {
 		ret = -EIO;
@@ -1942,6 +1951,7 @@ static void loop_handle_cmd(struct loop_cmd *cmd)
 		if (likely(!blk_should_fake_timeout(rq->q)))
 			blk_mq_complete_request(rq);
 	}
+	memalloc_noio_restore(memflags);
 }
 
 static void loop_process_work(struct loop_worker *worker,
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
