Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66623C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:13:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B2A21D46
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4jtN2WL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FvaOkU4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4B2A21D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B4mFc5eK+ttkiOAmCK+8RSWz7qKwsFvIOnu/ezn6DlY=; b=s4jtN2WLdnjFZilfd3eC6R+oi
	gSBx36+9jX8HBU5ircuqGxwCGdEsmjmzc6Hvk+I1EanbjaRoBfPNR0bQdfi71RXvS8dB2tpK7AWk6
	gWecWHD0NZReSZ1OnANrx2w9V+8r7AkvlUKvJoCLg9iwqakXYv/UfHuAZ0wQZld0VGjv+1PMffNZo
	bAdQkwAX0ap6yzqnoGe8z9U3EhPerj3s82AdvHALvl0yKEUkR4gz5IIIOQqVMJ6E+JsHJJnDO+hT+
	vQa5Z+9CTRcz8AIsnKGzBTWqa0216lsJhtSPr2rEBQ2k31E7CDSoxoUdMzSclzK5iSovlneKg+FwU
	IRAkIAwAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH4H-0000N0-C8; Thu, 26 Nov 2020 13:12:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzJ-00086V-F3
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nM9OOc09jMaYn13UV1xnGqzKik4TLLc3/ktZdtaCR0w=; b=FvaOkU4kHXBfdVMOB12oBu42Hv
 2Q6c93H7622fyezJLxcX1lNn6/+eBm1N4BO6MUqga76cjNXsxq+yP9INBhup2opIJdInRULSN9aDv
 GXbI+5/8/S8q0EEQqeJMGpAxYRc9Bouh85ULoV7h2+YJtrqWK591lWcqICJoIMhn+6U32lVibdG6c
 zdzfdXIPDC9Gr8O03nTWJEA0xUmb3isXObNWRHLOLN9RLVwU4MUy3AIKq3kZuzMn+AmgsOgUThrS/
 AH8fDByu5LV7WH3TMt6wI71LLeECxnAiCKy4fsXHiDZZN9KarAZRFuaXs+F2IoEGCuauV4qgnSctF
 1Pk0KJbA==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzI-00042P-5Y; Thu, 26 Nov 2020 13:07:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 22/44] block: opencode devcgroup_inode_permission
Date: Thu, 26 Nov 2020 14:04:00 +0100
Message-Id: <20201126130422.92945-23-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126130422.92945-1-hch@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Just call devcgroup_check_permission to avoid various superflous checks
and a double conversion of the access flags.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Tejun Heo <tj@kernel.org>
---
 fs/block_dev.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index d0783c55a0ce65..b12ab68297baf3 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1516,15 +1516,13 @@ static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
 	struct block_device *claiming;
 	bool unblock_events = true;
 	struct gendisk *disk;
-	int perm = 0;
 	int partno;
 	int ret;
 
-	if (mode & FMODE_READ)
-		perm |= MAY_READ;
-	if (mode & FMODE_WRITE)
-		perm |= MAY_WRITE;
-	ret = devcgroup_inode_permission(bdev->bd_inode, perm);
+	ret = devcgroup_check_permission(DEVCG_DEV_BLOCK,
+			imajor(bdev->bd_inode), iminor(bdev->bd_inode),
+			((mode & FMODE_READ) ? DEVCG_ACC_READ : 0) |
+			((mode & FMODE_WRITE) ? DEVCG_ACC_WRITE : 0));
 	if (ret)
 		goto bdput;
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
