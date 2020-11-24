Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837F2C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:37:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E4420708
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U2RGSsQN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Dsx0SI5F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E4420708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ovUpgsTBugsjg1RVlBV0/wdZB+1hNyQwTurY4Lmg5y8=; b=U2RGSsQNdNHCUZMIkp/x64RVU
	zeG/d00CiX2cRPbymkINya4yDYBuWatq6YWRPMF7YIGzWncenYfjdeWdOvKyfZVb5USELVXwXdITY
	rLOgUb/C+w0NRIPd/WI1T5nqn+wiS/a9lx/GkE5KM3Er1X8gpMtYFRcR65uceztvMmzO8dCLXYA8X
	5vSYVudpxcDt/8f7cnXZUUKEE6qfRnlQf7ToQdHSsBuQZdoWh2a3kj4PpWR67hWRhTuTGwEXShyxO
	c7sO0nqUXrZlA1J4H9OBepqoknrhOBTGeKrVxQuoei2rSAAXUaDofk78H5gsixLzZSEL4aFnqcUyW
	PwY2NVRhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYV1-0003xg-7I; Tue, 24 Nov 2020 13:36:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYN9-0008Gy-QH
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IQo7+3FqwGn+nveEvbMImUHejQ6B6iul3lBAGXRT6S0=; b=Dsx0SI5F7fK6yGFNHizYK2Luqs
 OwGWEA5YdR00VnJlh8sw0Mn6T+j7LB7jv8MhUDWibdIObFF6A/ZF43bZIWLBCgxRKYGFNUkJJ7lCX
 9uBkrERnn2jWXDLuUpDe59yHT0uXNScCDoyaocQmmAzQjXpKlE4KAKPbpyUe8oYhjDaCLacF1DCg9
 9yAbwO/HOM5BkHkFS4np8Nd9Fd6Or5Eb6xBaCRgf0KNMcbJFJUCb3s3f0OWWQOleSUCquZS1yGdOP
 AQYd9fB3rQkdijuOCSdOSZ4uOqYuxhOl5dj8wm8XxGDymP9DbEN9XvguCVt7lDx0KagQxCdhTuk1a
 i/kX79lg==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYN7-0006dU-9l; Tue, 24 Nov 2020 13:28:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 28/45] block: simplify part_to_disk
Date: Tue, 24 Nov 2020 14:27:34 +0100
Message-Id: <20201124132751.3747337-29-hch@lst.de>
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

Now that struct hd_struct has a block_device pointer use that to
find the disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/genhd.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index d068e46f9086ae..dcf86a3d4dedc4 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -219,13 +219,9 @@ struct gendisk {
 
 static inline struct gendisk *part_to_disk(struct hd_struct *part)
 {
-	if (likely(part)) {
-		if (part->partno)
-			return dev_to_disk(part_to_dev(part)->parent);
-		else
-			return dev_to_disk(part_to_dev(part));
-	}
-	return NULL;
+	if (unlikely(!part))
+		return NULL;
+	return part->bdev->bd_disk;
 }
 
 static inline int disk_max_parts(struct gendisk *disk)
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
