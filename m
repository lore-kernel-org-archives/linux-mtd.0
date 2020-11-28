Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38886C63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:20:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43082467C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:20:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N08omRi2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l9I7x+zf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43082467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xHEDroCPCM9W3rjU5QL3w4JH8kxZ0ML/8V7pGfgPyaw=; b=N08omRi2S7MhAnVIbVMjUHkv5
	cu1CG42R1pt9OfY/PoFa05HjsOt6uV01MILZJyYsLjYPU2k1CNN/NgJ3vj1uXiEHJJwK2OnAyqM6Q
	1YHgKCb1HuNggXcpUtzaRO61WmHz/ViENhQOjE1UxXNSwZwybzhrmZa6K+VFQjrc8SNEUTTQqe/z7
	bArovUOGViBviG+F7nFsS4qtMD3x7oSx39N73A713AJ6uH6Op8Lzt1dCjfY1g8SuO52+BBh6b8JZN
	5XBCFuE/HCRKWxyti/yX1AreWq4I+XbzOGitDVXxLACr5OaI7gTEud1yV+aQ9Xt/YGhz+hDdDHvxI
	hbuN4rluA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2x3-0002wF-Ob; Sat, 28 Nov 2020 16:19:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2t5-0000sa-Mq
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FsZkmK6a2hs6E6Z9B6tfmRfHQ191hKagU9+KV6WFNtM=; b=l9I7x+zfyYy3M2QfALdSBmMsHC
 /hZdHYin491tNVgPie7TBuJZzFyo091g3Z3RoFGD6dlAE+OUKJOtb7eRUIU4RB/bNzQl4e4qsssKH
 Ao1PN+wyfDizhgsZX2jn2PgmKF9CeOZGNuJziuLNr2ZLA/VbsOzHk4Cduo3Xe0xf/bEgEzGdZDClJ
 Ww+iO61t7F+pb2DRHDUPgaNeC9ZnPNxxmBB0rcLkfM8WGXapvAc4DpS34CnYnE+qOSSsQ3wMCWVaq
 gjRsfGbqT1SOQKUSbjLatxILGDXHnAsZgc+oh4AoexldboXuOdV5X8KWrVeCTXA5s77Y1BrobRQf6
 FDKVcGXA==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2t4-0000Jl-6t; Sat, 28 Nov 2020 16:15:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 23/45] block: opencode devcgroup_inode_permission
Date: Sat, 28 Nov 2020 17:14:48 +0100
Message-Id: <20201128161510.347752-24-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128161510.347752-1-hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de>
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
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/block_dev.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index a2d5050c97ee08..2b8c0586314fe2 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1520,15 +1520,13 @@ static int blkdev_get(struct block_device *bdev, fmode_t mode, void *holder)
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
