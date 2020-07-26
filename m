Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668B0C43459
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 15:04:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3562020759
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 15:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/bpiguh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YMWzVCgz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3562020759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jMUWFGe+MjeaHDXffjovjJzBKZ6o2Ey572YTFpsNTCw=; b=c/bpiguhpgLU5+2zc05z4kiU0
	5faNgWU9eylyA2CNJ6v9VqNMB6GekSgakG0CSR/QDccbnx4OMBbpdKilLYWNAl5Xwk09H9E2S9d8A
	vSLR3Qrc03SJJRCVYLRCbALf+rZHD35wwt5gmHV8+YjENqiyyIc4/+ftP3HuDLLNVbfrKBCNk94yw
	hOFxINBcFZDZPIxChtwhHJ0JCjqvQM3bMb6I4pPK1KhU1dqWoaJpXl/52p3WdVJhnoTuHDLK32r3g
	bVjyOYUgx3kSFYW/CmvH8CCvHJ52giPDah49t9BYfvsKfT/ccbZo+dCoH24FMbhVg8n3CfkCGlH9z
	9LggHPFzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jziBr-00035j-CE; Sun, 26 Jul 2020 15:03:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jziBi-00032r-T8
 for linux-mtd@merlin.infradead.org; Sun, 26 Jul 2020 15:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=S8Ttwcc94B0Xl9tEeP23NWmZAdd1Fm0GDSqESxJAyFs=; b=YMWzVCgzX29h5w6kZFM6oUoNMr
 9gXLP/Ib5QVPfsZG0AAn/rXKE+D/N2C8DnBZzhv3p4q+7Hvzj4rXtmv1GWAV6nNCHkYnow6VnUeGb
 tfg7+LutO+I7qgJihKfLNV0bioQiwOd7ue+CPYdTYIJKpWq+05hnuInoQy1ujJQexg4BRsGSlIz2Z
 YZ7J8pfIWExlvsv9pgxeI1cIQvPqFjaJ3zRlmz7+bHnAJieME2sgtOnGvFS+Opg0XaNy/I+HY6ox/
 qofchlkyZcbtNwfFSRr4nu6fEXNekMBd5Rs/0KLFlzA4MdQTFmHHa3ICI8wvaZJWqiBY1fFhGVFrd
 8CX0M/+w==;
Received: from [2001:4bb8:18c:2acc:2375:88ff:9f84:118d] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jziBh-0005g2-F1; Sun, 26 Jul 2020 15:03:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
Date: Sun, 26 Jul 2020 17:03:22 +0200
Message-Id: <20200726150333.305527-4-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726150333.305527-1-hch@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
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
 Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This case isn't ever used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/block/drbd/drbd_req.c | 4 ----
 include/linux/drbd.h          | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 674be09b2da94a..4d944f2eb56efa 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -901,13 +901,9 @@ static bool drbd_may_do_local_read(struct drbd_device *device, sector_t sector,
 static bool remote_due_to_read_balancing(struct drbd_device *device, sector_t sector,
 		enum drbd_read_balancing rbm)
 {
-	struct backing_dev_info *bdi;
 	int stripe_shift;
 
 	switch (rbm) {
-	case RB_CONGESTED_REMOTE:
-		bdi = device->ldev->backing_bdev->bd_disk->queue->backing_dev_info;
-		return bdi_read_congested(bdi);
 	case RB_LEAST_PENDING:
 		return atomic_read(&device->local_cnt) >
 			atomic_read(&device->ap_pending_cnt) + atomic_read(&device->rs_pending_cnt);
diff --git a/include/linux/drbd.h b/include/linux/drbd.h
index 5755537b51b114..6a8286132751df 100644
--- a/include/linux/drbd.h
+++ b/include/linux/drbd.h
@@ -94,7 +94,6 @@ enum drbd_read_balancing {
 	RB_PREFER_REMOTE,
 	RB_ROUND_ROBIN,
 	RB_LEAST_PENDING,
-	RB_CONGESTED_REMOTE,
 	RB_32K_STRIPING,
 	RB_64K_STRIPING,
 	RB_128K_STRIPING,
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
