Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34542C56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:09:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B74D721D46
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fX0HjFdx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="frQf5+o7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B74D721D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hjc9RzxF/5kPRixK7CO1H/MB4TVEg6jbmJyNPKUwUpg=; b=fX0HjFdxykJROv9KnD7R6/XgN
	QBSaJ7vsoX8PO+TA/ZiTGwn6OqcCg9QquL5VR+UfBU3PfvuiAc+bDdHu8LQDX6ki41v8RMrkebbCT
	815tZ7re3GAGqkWoz2ZFpixejdli4Q+NRuVXrBrY4I+39aeia0P8a24pvPa3aLD+M8+mVooo/pocQ
	AWpCE9D8R+KPFNhg6BlDgjQyqYfhnyNInE7D+co5KHNfYlIBn95tcv6fP22yYdKcgsaqiq04+ngPf
	4ScmL5/32CKYxa2TTzwN+Ecrh+zG55ZuDCm/kfMPAve9kiXMTKfyfIRJszKFJrnrU33wC6O8+PvB8
	5ONqqCAhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH0g-0000J5-V8; Thu, 26 Nov 2020 13:08:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGz0-00081Y-3c
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qOmzpRMb4vEzGwba4P3m5gENBKcm1ZKj8N5Pylgvbms=; b=frQf5+o7/NEEwvyZN+t2Km5Ptl
 NbZc0zYkcrH+IirsiacpBTVbLlfEA1hzVC3a1JMUpYfnRBaxbcnseEGspGlij5gGLt/b1dXtWHRnW
 j7Nwk+zMr1rHM001tS7jauuj3xz4Ff7g5hqe72Jm8GhyTteC9Epan9fy6PzkAQHF3YoAGeCsN0JEb
 Vrp/UQrhUUKz3ZV4E1mpp5iyaIB3UfSxRhD9jTjfaSnJ+dPweTGrMJUxgZ7eV3Ksy18x0da98PCml
 3Wc0i0cpZBIwV780R1d+Ru6O+O+5N8Q0luFoj6zjTKcB+1kxHPewVhpv7sGiBRxlZBhTNS/mwFo0W
 vCkZ+Qkw==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGyy-0003xt-Re; Thu, 26 Nov 2020 13:06:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/44] dm: simplify flush_bio initialization in
 __send_empty_flush
Date: Thu, 26 Nov 2020 14:03:46 +0100
Message-Id: <20201126130422.92945-9-hch@lst.de>
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

We don't really need the struct block_device to initialize a bio.  So
switch from using bio_set_dev to manually setting up bi_disk (bi_partno
will always be zero and has been cleared by bio_init already).

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 50541d336c719b..ab0a8335f098d9 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1422,18 +1422,12 @@ static int __send_empty_flush(struct clone_info *ci)
 	 */
 	bio_init(&flush_bio, NULL, 0);
 	flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC;
+	flush_bio.bi_disk = ci->io->md->disk;
+	bio_associate_blkg(&flush_bio);
+
 	ci->bio = &flush_bio;
 	ci->sector_count = 0;
 
-	/*
-	 * Empty flush uses a statically initialized bio, as the base for
-	 * cloning.  However, blkg association requires that a bdev is
-	 * associated with a gendisk, which doesn't happen until the bdev is
-	 * opened.  So, blkg association is done at issue time of the flush
-	 * rather than when the device is created in alloc_dev().
-	 */
-	bio_set_dev(ci->bio, ci->io->md->bdev);
-
 	BUG_ON(bio_has_data(ci->bio));
 	while ((ti = dm_table_get_target(ci->map, target_nr++)))
 		__send_duplicate_bios(ci, ti, ti->num_flush_bios, NULL);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
