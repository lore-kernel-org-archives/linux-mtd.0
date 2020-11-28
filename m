Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA73C63777
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:18:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D55072467C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rzb+/Wak";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Sh9Kvg4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D55072467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pKvpNo9dUtARy20zaE6uBNe1nOykd1dhR7o/XI8u868=; b=rzb+/WakFQKXWflLqWx5KbRXJ
	mW0DWUXl0S7YRha9QBX0JMjl6gOmaeCRblht86dVUEsPH74U0sBoVkuvHabErTyDVGFnBBCx6Qc22
	8dxPI2J5a+B+ThL+EVlsEOPbQH5zq0/u/wu9CngBgaMWnQF213P67S814nBPb1U0OKT+ghqE/d/3H
	eRTTm2aQAykYG2URW4rMMEpQehNBiBHlH1xNN0PZNohESOTaBnDhZR6LtzxRiRJnSj98JACbiRgos
	ayrVdaFQ+E6GDKGKByoez5OV9LItj1w8SJ5UcRxXKOhEuYN4IxISPlPQN+VUxjFBIX1VwxaF4Mk0O
	fjbh+rIkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2v9-0001uB-IN; Sat, 28 Nov 2020 16:17:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2st-0000pH-I7
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+N9nj4aeGcaY7E1cQ0C8G5//2Sxe7PPFKlTYCp379Nc=; b=Sh9Kvg4mkZ4XkPadEWLnVIdZ3T
 saZLEqTiDzaNBysUYvfcJruhwPbuksCUFc+ke5gwjhVFkndBZ57UQ7fn4y7YpckR8b4ZDwiQukngD
 3h/QoUNnAjcd3Kh+WVbHZCWu4czXKsHXG2oNQ/C57Y7zLCfqJvaPsuSEwog3vAo4qKbHYDBeHNS05
 j0CdaOXRTKvrHx3+Vjw2wphhy2k7x7Rqdy6fTts7RjMxuXtZEmSClWEQYqBDZpRO+fKBAa4QqDo4M
 WYpyRFXXAZlz172qFqypLsbK3XlhKzPxNn+C11J542iRyoxaNNArlsXG8/JrIEaIBLhF136iBBo3g
 l+1fCoyg==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sr-0000G4-Tr; Sat, 28 Nov 2020 16:15:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 16/45] block: switch bdgrab to use igrab
Date: Sat, 28 Nov 2020 17:14:41 +0100
Message-Id: <20201128161510.347752-17-hch@lst.de>
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

All of the current callers already have a reference, but to prepare for
additional users ensure bdgrab returns NULL if the block device is beeing
freed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index d707ab376da86e..962fabe8a67b83 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -894,10 +894,14 @@ static struct block_device *bdget(dev_t dev)
 /**
  * bdgrab -- Grab a reference to an already referenced block device
  * @bdev:	Block device to grab a reference to.
+ *
+ * Returns the block_device with an additional reference when successful,
+ * or NULL if the inode is already beeing freed.
  */
 struct block_device *bdgrab(struct block_device *bdev)
 {
-	ihold(bdev->bd_inode);
+	if (!igrab(bdev->bd_inode))
+		return NULL;
 	return bdev;
 }
 EXPORT_SYMBOL(bdgrab);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
