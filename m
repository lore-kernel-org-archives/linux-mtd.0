Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F9EC56202
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF5B21D46
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wr1FhkMK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tFjT6IkZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF5B21D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gOw3x6WRuNbyLad7gaSKvFeH7HDJ2rzPtgPQQEZjj6E=; b=wr1FhkMKzZnr4EVa1KrUaOskK
	0ubFbnO3aBNqXhF1BX9Zq0SSd8Guy21CbYVC8UIXK6rqvugTXyl+kb0VlsUEoDP2/GLG3Ec/TyfH2
	uses6lZc1VY4+dNSBismCWwcDP0KrT6dcT5LMiNhHjx7+derQ9Xz2FwNtZALrrev2oPWzCC3FF30O
	UJLAsdC922TFP7oFCmSPrs2h3eqKAKrGaOK7X8ck4YCZyYj3C2hHi5J4ZluGkyh1FmriYPp6dxMra
	p/FRAbrgKrL6y9YQRPFCkLrVJ3mKBEyjtrWPBAha9vY+COv97ap/aroNWuhJdDVKqUje8J54QnMeG
	JCGc3zB8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH53-0000ZW-Vq; Thu, 26 Nov 2020 13:13:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzQ-00089O-PY
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7zJyA1+2dNtOVgFSOqRhBotQ/SGMaZPnGEludQAyDbM=; b=tFjT6IkZrllK1gCvx3sgLP9AIc
 OTjjaMfxu6Sr78eemKDudzxtJJ4WjsR32/1co/MX6KOHwzotcSZYQYFPChzT/4mkYwOqXV25Bcy+Y
 F+TiUT40riLcGeEXWkICD1YeOY0nPbUjgMfvQu6e7MfqeIZt3D/MHYQNWnos3sFcB/QTxugA73GvE
 bOBLPOUzeJ0hUQbECYWpjJijnkOXoRKZ4Sk3RrxllMGrBs7EmljV3+Y/0SAggChY5UdJjfy+oEncL
 t+l+Fo13Rr6SDL7fUpjTgkjRc/PT6UI1K0Ul/QrCTxzFl5uu22GSDh78VVi27hK/Bagqt9iF6YsoN
 2JG9EfAQ==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzP-000443-4a; Thu, 26 Nov 2020 13:07:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 27/44] block: simplify part_to_disk
Date: Thu, 26 Nov 2020 14:04:05 +0100
Message-Id: <20201126130422.92945-28-hch@lst.de>
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

Now that struct hd_struct has a block_device pointer use that to
find the disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Tejun Heo <tj@kernel.org>
---
 include/linux/genhd.h | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 42a51653c7303e..6ba91ee54cb2f6 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -218,13 +218,9 @@ struct gendisk {
 
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
