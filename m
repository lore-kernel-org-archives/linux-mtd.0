Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812ECC43463
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 08:09:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DF320874
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 08:09:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ztfh3ol2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EQwu/cR2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37DF320874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XfoX/cnw2wHGABXuLwEMGtLarE5HcchlXhLKt14WfPw=; b=ztfh3ol2TaH7df8JPCJE5GdTa
	wMeURjUxs3S5/taVu4cw7VwKngFWddk657H/JtpNu8kZFTAr3ViInoETtTZ85bWuFLVxTnxxQ7zgx
	7sxw7IoqOInEA/PfJvJS4kvmIbZuvEMir2wayKbivPpN1nSubsKh1Kx27vggiuaPmiHxVq/LhW+Va
	XwyZzHvbkP7xB3lm2VYEqmoD9tQ1boZkcXaLZ+k3YW3BSeg2jJAi11JyddRAhazc54GoQO3fEKKtu
	UE5dnp5+517cU+AtH9pYvqdWcAZvRgKmfsxhc2V2WJ51C0OBHIdZSmYExZ5k25y2WqAK+vQsudHaA
	y67xhE2+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGrZ-0004Gn-FR; Mon, 21 Sep 2020 08:07:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGrN-0004D0-KC
 for linux-mtd@merlin.infradead.org; Mon, 21 Sep 2020 08:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1Wl4CR3g3QHDQhZ33f8Oe6qI9aP7fMZeE5hKlObwJ0M=; b=EQwu/cR2LodCQaFHG05hYNpozm
 U++iiQM/OeP2AkVo1WTUpU+dI2Dxy9PU9SMGZkQIchixHl5Jx7a0QZk5QjsM3mKR+reWMYdC5dYVn
 1/RyKrVkK9YLy3fmeQEtMZdYZZY5sO+JS6B15u1VfcYsZYeIJhvelBd9tWQF1KMWdpSxOaOX7AQ3C
 wizDdm3VvY8FkkLVnDPzz1aL3YJazDYKgNWRltE/h20ULbz8zDeUg/9HS2R2SkDzVSLHKIMcr5zcW
 Ycx/mTaN0ejniWyn1jkIqStX3tT5JOPuH+P5WFBTHwcT/t8jMI83iRyfSIeaANZdLu8MwdwI6fNNq
 LsuftJjQ==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGrD-0006WA-MD; Mon, 21 Sep 2020 08:07:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/13] bcache: inherit the optimal I/O size
Date: Mon, 21 Sep 2020 10:07:24 +0200
Message-Id: <20200921080734.452759-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921080734.452759-1-hch@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
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
 Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Inherit the optimal I/O size setting just like the readahead window,
as any reason to do larger I/O does not apply to just readahead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/bcache/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 1bbdc410ee3c51..48113005ed86ad 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -1430,6 +1430,8 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
 	dc->disk.disk->queue->backing_dev_info->ra_pages =
 		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
 		    q->backing_dev_info->ra_pages);
+	blk_queue_io_opt(dc->disk.disk->queue,
+		max(queue_io_opt(dc->disk.disk->queue), queue_io_opt(q)));
 
 	atomic_set(&dc->io_errors, 0);
 	dc->io_disable = false;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
