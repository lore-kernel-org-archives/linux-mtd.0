Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92994C56201
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:34:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFA9205ED
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:34:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N5QEBJEe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UbR0rqfE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFA9205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=znNuTnEH1M3Nf8C+jb1jXFB7qjIYfb92ExlgXy86lR0=; b=N5QEBJEef9fmkqr8Qt2FuRRNR
	peDKuA57aGybccDVcRSfXMK0VHWpPVsYpA6sTTvZH3YbW+SbD2XQyWVgtjEuPbB2flNMmdEnqstWq
	G1vdfPdftGev/G/xyUZzdF6G4hD2X5bUuNVmlmw5AU7yNAANI2KpfY6ZhsUZM1hu+Mbvl6I/beIT9
	cXWfiW2zuk1lKFwjsCUNKyouz9SD/aIM/AxwaD0oudXo5vw3dR/eww6s9gL9iwR7NK8di+Nju2Zip
	dcOHs5erJ7sSNWHU0sR2NiLTSled5xwRNTnVg+PYMvUg7JrU6JxstvYvEUPfDsURryuGn1kF0fuVH
	EI7VQIORw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYS6-0002PK-F8; Tue, 24 Nov 2020 13:33:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMs-00088r-77
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=haCO3X861N4gYeaBWGi7WpA4oycN+6CCoLtCh0jGV0A=; b=UbR0rqfEviC2A8JyLwBgBA5M5p
 +ivg+qHtDcLcBHMdD64n1DMXXEp3t8ybLC4npUOUn/qYfKCmt7Kr5p/jhadGMMWeJowrUm92nKPQz
 0DO6dAQGwlEARF+Tq0YvNLL9RIIo2Tuk36m6mPWI9mpe2ZrBZzeuv6v2bnWEH/X0m1YkmNAGXk04j
 mo6XzNihgFi5lQUd3e3kT5gVdg8KsVapZp96LnJ5YCrBSloPSlJds/FevxYe3saLdUdlnf8vi4Ktr
 Ea1Au77+mqNyRWCMV4E1ZfyFZIEedVVP76a4K3XW3ZfINq8T12WQoSwsrZLF2tfsp147TOxDzEcif
 V/8iGe5Q==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMq-0006Yi-HT; Tue, 24 Nov 2020 13:28:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 20/45] block: refactor __blkdev_put
Date: Tue, 24 Nov 2020 14:27:26 +0100
Message-Id: <20201124132751.3747337-21-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
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
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reorder the code to have one big section for the last close, and to use
bdev_is_partition.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/block_dev.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 437f67e12b2838..88847839ef0102 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1738,22 +1738,22 @@ static void __blkdev_put(struct block_device *bdev, fmode_t mode, int for_part)
 		WARN_ON_ONCE(bdev->bd_holders);
 		sync_blockdev(bdev);
 		kill_bdev(bdev);
-
 		bdev_write_inode(bdev);
-	}
-	if (bdev->bd_contains == bdev) {
-		if (disk->fops->release)
+
+		if (!bdev_is_partition(bdev) && disk->fops->release)
 			disk->fops->release(disk, mode);
-	}
-	if (!bdev->bd_openers) {
+
 		disk_put_part(bdev->bd_part);
 		bdev->bd_part = NULL;
 		bdev->bd_disk = NULL;
-		if (bdev != bdev->bd_contains)
+		if (bdev_is_partition(bdev))
 			victim = bdev->bd_contains;
 		bdev->bd_contains = NULL;
 
 		put_disk_and_module(disk);
+	} else {
+		if (!bdev_is_partition(bdev) && disk->fops->release)
+			disk->fops->release(disk, mode);
 	}
 	mutex_unlock(&bdev->bd_mutex);
 	bdput(bdev);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
