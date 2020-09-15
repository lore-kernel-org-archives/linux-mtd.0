Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E0FC433E2
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 15:28:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9EF820756
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 15:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OAdiuWsP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vkcvNvrA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9EF820756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cmKAsAKmqQ6k4MyFigcrrGW9vpbnHfMh8W4IRdMc+Po=; b=OAdiuWsP4DCYKCktMV62j+IkB
	zT2AsNIy0THojIbc0Zw7V4aiOc8ruTDfs+Xq4Fr51aGw7FweY8AyLloWNjEtIiog/WetfG906by7O
	TNY/I51x98Pj/bTa7Logb0+p9wSN1Y52E1YDVgO9YQw/325UH7l3xHb+mvb3aV4GrLx/N1KxsJpVu
	ZSyPgDdcouE+cV6c3ywEeK+6HsYCY4RNavmfeZrn7axK5RVay9q9R5Z+zXPkTJ+T6vnsxiBqsdzvt
	DkoGvD3UVMiTVVfvhEt6t9VkWfymUY1D85KNPg0DsL++rAo8eR8nQqxIB4+fS0u4CI1/HvSmWyDkl
	AEmcUQOZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICrY-0000ed-AU; Tue, 15 Sep 2020 15:27:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICrW-0000dz-QM
 for linux-mtd@merlin.infradead.org; Tue, 15 Sep 2020 15:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Y4tkWtiLArM5ZtpwjGyv2ND3RgxFSGIzR5QDPUf60TY=; b=vkcvNvrAlfkpjgC6PLHdCcE+Rt
 rVJhEc5LvegHmwyCNl+Jp1ZvzkxadlEJeRvmlI+paiq2Xw90Vk1EKkFLuOLon9UBw7bf5O+d1APq9
 lUfd4Ij5H9rc6mwCtjWSocnPHXmDvPMY1jXFvzyo/ohoQjxH3pNyLhn93bHHi4S8FJYokwjh7afBg
 VdnV6ovjwCi6bz7tc9Dsp5emWgQsT/+RvvI2EIEN7ME6GaruCkOpQBu3l2bgNoLkB273IebNiu4L1
 Eiq/0XQ/xTWB36/gDGzmAL3gAHWN+XRKtB5xAzCQGf2SajsuwNGzkL5FmdrT+wuay5vKexMNetnWk
 l0MLo90Q==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICrS-0001S0-U3; Tue, 15 Sep 2020 15:27:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/12] drbd: remove RB_CONGESTED_REMOTE
Date: Tue, 15 Sep 2020 17:18:20 +0200
Message-Id: <20200915151829.1767176-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915151829.1767176-1-hch@lst.de>
References: <20200915151829.1767176-1-hch@lst.de>
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
 Minchan Kim <minchan@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Song Liu <song@kernel.org>, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 drbd-dev@lists.linbit.com
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
index 5c975af9c15fb8..481bc34fcf386a 100644
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
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
