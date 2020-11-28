Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0274C64E7A
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5190E2224D
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:16:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVUcbe8c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IRB8hjpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5190E2224D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hjc9RzxF/5kPRixK7CO1H/MB4TVEg6jbmJyNPKUwUpg=; b=pVUcbe8ciuQrxHcoFVSCEatvr
	YG/1HkUzMdVhOWmNckUIkARfTC3jWk+0vH7vYrU+sVBWHwAk849kf3BZ06zFASD1z9C79L+7Xbi4Z
	vU0apUubB6FguMoIJvTpNBtvCd4vaNyo+AHEPNfoo+7PozfsobEJ9Kpl/fvCURuBjbtUp5NhwdwXF
	4KJIvpWNb2AUPbAhTNX77zqo9ASSF4pooYu1gLzzsSrCM5vcftnox6jpY5Xx9h6KKuzgi2IX6B/M9
	75f9IDSJQiMz/WbfRF3GhMa7zOVD6xUGaxpaz/4zmOPDP/kAPx1pLkOCwkQtWFzDWyRczU66e5NTM
	59Kn6HQJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj2tP-00011m-MN; Sat, 28 Nov 2020 16:16:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2sf-0000lo-TL
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qOmzpRMb4vEzGwba4P3m5gENBKcm1ZKj8N5Pylgvbms=; b=IRB8hjpF/ywVtkPyjbqecQa7lq
 RssKcyx2Ok0vmgR1h3eaUGnGWMBY3poXzElQI/dHQOwjcnJrS3u4SJECUZJ+IQ7AhTmWuRnzHDIh0
 xnqQmSjjOdj7zKjMMmLGkvdhJLKymWsD3UOCxFnSw2Bv4VRAybQPIXVR+GZMs3dGc1+tlIWSlaj2e
 CpygcyrJP06LduiqjIS76IiB7B52RCce8WijP8xmYk0pcNCvs5viJUD4Dban0JeHr25yImXluOmVq
 4AqbV9WpcTe0tO3jNOuocp5V3JlkJIA2hTFOctikEisfiaM37Vw8g3P1KJR0KzhbJ+gjMX/TDtJnZ
 JnmKOF1w==;
Received: from [2001:4bb8:18c:1dd6:48f3:741a:602e:7fdd] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2se-0000Dq-Ja; Sat, 28 Nov 2020 16:15:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 08/45] dm: simplify flush_bio initialization in
 __send_empty_flush
Date: Sat, 28 Nov 2020 17:14:33 +0100
Message-Id: <20201128161510.347752-9-hch@lst.de>
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
