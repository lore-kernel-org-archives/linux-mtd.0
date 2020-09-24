Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF085C47423
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:52:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A63D23772
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 06:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v8ov5U0e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GMHYT9gd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A63D23772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nE9mzesuIvcwsXwD77PKeXji57Ao6QOKof3ZlC34nPU=; b=v8ov5U0etuuNDQT8YPONTHEUC
	Yk09pXNtuOoUJoyFz6S1nVOq+ZMJhPVdLg2QD0wCnlYmKtyAGN7O1UrzmkocEoqrZMsWNrT0uPg0f
	/IBEkPz8EQ8biiUejS2emdSdIMqIj61bhrhvDP+SMWjcOV+pKNqj45BP65k2fr/QSiSrZc+AZAL+Z
	QaHIdBGfyrn4BaRNTr8kxp2L+4Zo0b21ezGZbNXp4Ji2A6Gou7rmi7LFuU1bA5uuN3riVWCBTg1eS
	/j5w17JZZp00DTrLayD5XvxiPaWlrsdSgE0aZMW+HgvL3N1rNCsTB0z6yOzXm6iV/Fh1zjy+qDzqV
	mIAFPQV0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLL6b-0004lv-Ux; Thu, 24 Sep 2020 06:51:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6W-0004kN-L0
 for linux-mtd@merlin.infradead.org; Thu, 24 Sep 2020 06:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eYXlp772S5NwgfYwqpisbRltSHIHkEperICR+k7yOF8=; b=GMHYT9gdfrgR/pQWvcEoG50qn/
 y04oH1GsNnXYIhYiNDKJQGmuANIpP4DJaWbT9z92cy2LJcXKZ2s4m8jlrBxOrA26fhRSX6DpxM8pc
 XWRgWqKhBnIokzG5erM05eghm4m2csytYIpCdMzHqasV/uLEZCIWAIWPpBWdKv2vUyxl2L9VdA2FN
 JD0/5FjtZ2evzlAlhFAHzYBoSnhfhGR51IgKiFSDt29taDeZoy+hT9KNsDHdFj195OoNg5Sl3kCb1
 K6UPuI579xxk80Jmisg/RsigHbDYYYLh/O5+C5sHX/oNUAJD8VJNheOzh0Hnz3cz1Hy0H8zfxfvRs
 ojhFFQNg==;
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLL6V-00019V-AR; Thu, 24 Sep 2020 06:51:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 02/13] drbd: remove dead code in device_to_statistics
Date: Thu, 24 Sep 2020 08:51:29 +0200
Message-Id: <20200924065140.726436-3-hch@lst.de>
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
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-bcache@vger.kernel.org,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ever since the switch to blk-mq, a lower device not used for VM
writeback will not be marked congested, so the check will never
trigger.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/block/drbd/drbd_nl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 43c8ae4d9fca81..aaff5bde391506 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -3370,7 +3370,6 @@ static void device_to_statistics(struct device_statistics *s,
 	if (get_ldev(device)) {
 		struct drbd_md *md = &device->ldev->md;
 		u64 *history_uuids = (u64 *)s->history_uuids;
-		struct request_queue *q;
 		int n;
 
 		spin_lock_irq(&md->uuid_lock);
@@ -3384,11 +3383,6 @@ static void device_to_statistics(struct device_statistics *s,
 		spin_unlock_irq(&md->uuid_lock);
 
 		s->dev_disk_flags = md->flags;
-		q = bdev_get_queue(device->ldev->backing_bdev);
-		s->dev_lower_blocked =
-			bdi_congested(q->backing_dev_info,
-				      (1 << WB_async_congested) |
-				      (1 << WB_sync_congested));
 		put_ldev(device);
 	}
 	s->dev_size = drbd_get_capacity(device->this_bdev);
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
