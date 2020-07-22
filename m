Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447C5C43466
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 06:27:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B663208E4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 06:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D3hA86Z3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tn4xalF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B663208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iL8Rg8iSFu/rsTnTSM7O2B2x50V6/MNozRHWD+P7ScI=; b=D3hA86Z3qhu1oyi1tCdG7zafj
	7iM3iAFoI87tG6XFnH+pxx/CXC98jX37iNwmeMd3k5PI52wJMlqhD64d0On52KoVTkPf/05GPkseI
	DNjyN0ZWbS4ZEdYcR+AmAwlHw/DOKgu46Qc9/Nh/ficTyvPdHY9Yap6QKgxAm/aMRNoLRe6GJyvb8
	wU+I6X4bdcvvF5mJfCNvMd5GWB1O/yt+6rFzjyVnsLOvaKQjjNnuvGt+M73suKoU/RlpXW8+/q3TV
	6jEdbYUUds9cQCr0ieCsLPeO1q0Fp7V7uqISymwXH9+TM5n1pgCKg8mswARLvJUtrMyqKH3uvTfir
	7eNUdSZ3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy8Cx-0000sJ-4B; Wed, 22 Jul 2020 06:26:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8Cr-0000qq-N6
 for linux-mtd@merlin.infradead.org; Wed, 22 Jul 2020 06:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=toLJ0vqGJpB+m2DWzx8OUV3mzNvbIyso0hs1e0NzMQw=; b=Tn4xalF1YN7Wqp1NXQJpA/hlZ3
 Zzeym0fSToI0ZjtblIQF0KaR8LI/0QKwnX317OWhJ4RanjyvysIbdqI0KEXF4q9cdGzPwj8fs+ft9
 C6M4D+H0TBRp0o6dYj8TwKrHaf5XOhXj+8e9RcuISGAUSLHAkBYcWdvL4Vy14GO3fI/Bq3XgHW1xo
 3YDKwttuYSv4GlmUbJUyoOWATp5d4Hb8TuN1sOYwHIl2jcXF11h/9Vl8LfXE3faJ8dJY0Bu5m6We5
 Bsojk10wIqdaLJmYRWg3Fa/bZBTq9m0Z+VZ6ls1UGmgfGGrNwdefM52lMe0Xd5NkLZOPrEXfOdYHE
 3WaQDsUw==;
Received: from [2001:4bb8:18c:2acc:e75:d48f:65ef:e944] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8Cp-0004m8-AG; Wed, 22 Jul 2020 06:26:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
Date: Wed, 22 Jul 2020 08:25:41 +0200
Message-Id: <20200722062552.212200-4-hch@lst.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722062552.212200-1-hch@lst.de>
References: <20200722062552.212200-1-hch@lst.de>
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
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This case isn't ever used.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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
