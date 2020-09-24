Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68683C47428
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:53:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBDAD23772
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="diZTnIzz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="L6rYs9Sg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBDAD23772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ms/qTvE8bKvhD7KKLDUR9/DqPnLvBpD0E/6BO6dFJqc=; b=diZTnIzzVNDTvE9a9kTKlQDpR
	O8tH4OqtqBwDCbg1/58YfMQwgnBhejDHXgYOc7WLU4dpfdGrdPUqdqZRpsqUen2RlaAImBlDz09SM
	Abaaax4RTSKWjS5QC3uUwo9TveGRA3QGHz/gVGCD2Snm3/2CdsgnJxy46c7Xi8OFz3QJ0q+Oc5VQl
	ln9cmpMvTWBkM9vGVXtD+K4Vhm678oVxX8bsKj0noDtmc3rsHU0ncDKnOIxrlgUh1KjLv0fI/cwZa
	qMyA1mdg74SmkDlQan7pG4wxjzkqHm78gi4QYgCSh/bXgNkK52/8Np7FRwMnKOfzyDBl6F55yV0sP
	2UJNP79Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLL6n-0004pa-W3; Thu, 24 Sep 2020 06:52:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6a-0004le-SX
 for linux-mtd@merlin.infradead.org; Thu, 24 Sep 2020 06:51:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=g9xVnmRLNXPehcB4PdT7j+hjYku/j4udzyGtMh1GMwg=; b=L6rYs9SgfbS93bAxFavESPGoy0
 /v4w1xHKzUlgbK7M4J4CfEklqmTuP2Z/b95hBWtxRTKXZM2PVUt7f4/gSSAFoLGN2git2oF5dLDwh
 TSLtJUhfBUrAXO9zkv+5p3NWTXtFLm3D8EMaWzzFlgrsHn61ZVCByA0wmc8fkLa3okgAXVOozzmiS
 4rdy3q4Io0SIE7nJ6FE9igOCKmRGmE5Lv5ZKxomzwPp1dYsWWeKuiPxEpUh/iDHCQAft+lM3+BSxP
 MCvW3VsvvRaDMI9viLfFCmAnA8bzSX6j3m2/KNgIrWab8PfiT3CagUBPdUVzdoZvWuLIrBAc0ghF8
 EWnVjA0w==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6X-00019u-Ek; Thu, 24 Sep 2020 06:51:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/13] aoe: set an optimal I/O size
Date: Thu, 24 Sep 2020 08:51:31 +0200
Message-Id: <20200924065140.726436-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924065140.726436-1-hch@lst.de>
References: <20200924065140.726436-1-hch@lst.de>
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
 Justin Sanders <justin@coraid.com>, Jan Kara <jack@suse.cz>,
 Minchan Kim <minchan@kernel.org>,
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

aoe forces a larger readahead size, but any reason to do larger I/O
is not limited to readahead.  Also set the optimal I/O size, and
remove the local constants in favor of just using SZ_2G.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 drivers/block/aoe/aoeblk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index 5ca7216e9e01f3..d8cfc233e64b93 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -347,7 +347,6 @@ aoeblk_gdalloc(void *vp)
 	mempool_t *mp;
 	struct request_queue *q;
 	struct blk_mq_tag_set *set;
-	enum { KB = 1024, MB = KB * KB, READ_AHEAD = 2 * MB, };
 	ulong flags;
 	int late = 0;
 	int err;
@@ -407,7 +406,8 @@ aoeblk_gdalloc(void *vp)
 	WARN_ON(d->gd);
 	WARN_ON(d->flags & DEVFL_UP);
 	blk_queue_max_hw_sectors(q, BLK_DEF_MAX_SECTORS);
-	q->backing_dev_info->ra_pages = READ_AHEAD / PAGE_SIZE;
+	q->backing_dev_info->ra_pages = SZ_2M / PAGE_SIZE;
+	blk_queue_io_opt(q, SZ_2M);
 	d->bufpool = mp;
 	d->blkq = gd->queue = q;
 	q->queuedata = d;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
