Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508BDC63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:16:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4262075A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 15:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oLYGyw3n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jDIIQC7J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B4262075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GjJtm24JnoXWikgvsKvmAzoJwS7hWlWb/kaYXlOwvQc=; b=oLYGyw3nuyrGKC3D01pSw9Y23
	w4wFHGMTa/YGy8bUYfoZM2wVmDlwTHgwuclTcEmboedPAhJvKVlsxJVykvZnhJkRauhnzdkVL44u0
	p/uA49NDOkPhr6Lj+pv2puhDDPfe43Eiesm5SBeM7KSLjJ87+p3HdM0bHMjhF3aiwTKKGvVFiWpIq
	gY9qfsrbTZpog0M/oMCkXnpr1e+kqTWuaou50hVQfI/vyEFNonCcdCrzJmBOJPkoahhBi04P8p2/U
	ax9X0r7ao2pgdqtTBrtdTNc4eFpkyN8/6yeBNXsNS2g1y85k4imgQy7Th4SmGd9nBfz3atyH9kQv/
	0XnGRaPmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH1m-0000pm-NK; Thu, 26 Nov 2020 13:09:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGz7-00082e-AS
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=QGxJ1HD+iQwtllhLyJ4Xwx8w1+7WhF9jztK6ZcNRFkk=; b=jDIIQC7Jb1yVnQy4L2lbIMWIJZ
 bkckbo8WQyWwVDPc+oXpbNS3IMqCar6g729W2G3rceyXGMuytugZEPLpY3E0W+1/C/ydprBZY1Pi4
 Avw+fjNfUIXsJrY1Xep71WWWPqeVQso9FdoA6NHhS2z65+CydnqxYdvL2XTMsv8RQx87o9dIt9YOq
 gRhOyKNn79SNkzIspyPDK9q7PYIVQDXOROMz1lbl+d8g18TGgfKIK4jbzo4ArDcTsez2FmtGtax8t
 B1bdw31Zt0/8OgVAgLcXcd9stt7E2b7mN719CecQnYMHOHtVE+XiOquYOk/3OHr0STY9A71GKer+M
 Z/mCFTNA==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGz5-0003zr-C3; Thu, 26 Nov 2020 13:06:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 13/44] block: use disk_part_iter_exit in disk_part_iter_next
Date: Thu, 26 Nov 2020 14:03:51 +0100
Message-Id: <20201126130422.92945-14-hch@lst.de>
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

Call disk_part_iter_exit in disk_part_iter_next instead of duplicating
the functionality.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Acked-by: Tejun Heo <tj@kernel.org>
---
 block/genhd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 4e039524f92b8f..0bd9c41dd4cb69 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -227,8 +227,7 @@ struct hd_struct *disk_part_iter_next(struct disk_part_iter *piter)
 	int inc, end;
 
 	/* put the last partition */
-	disk_put_part(piter->part);
-	piter->part = NULL;
+	disk_part_iter_exit(piter);
 
 	/* get part_tbl */
 	rcu_read_lock();
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
