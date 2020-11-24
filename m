Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FB9C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:31:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF409204EC
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:31:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zjJNZD0/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iay1UgkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF409204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bpm91THHnLXXOMdn2IUApvaS3+bcI1SUqnGxX1fT3Qw=; b=zjJNZD0/NWCXrjdkBlMvH0yUS
	ShcQXYRM6GizLKPfgZlY1r9qlf9GxFO7vpmcItrnK5k67QQu4exP6NUisiWbtMV03FaMIocTFNAK1
	wYAvVxozkXnyF2nSC825K67Id5mN2bedQ2qKjnyXFx3vJYFJ7yExnmA8gdxkr7ZLW8RWr4XsaoSYI
	+9rF+5kwgVX/cE95oPHCzW5hCXrVXYnQCqQ1GAp0oFXFceW2Er6+hDqDY/W3mlkRj0jFT2Ir4eQPU
	T5p51ckJ06RAF3I7DyifDC5xpl2EZ7hkBVuhpJk18hgGkEflaxEeDhRq5XsLrx6LF0VpCvxofis7a
	B/n71mGPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYP1-0000rL-1c; Tue, 24 Nov 2020 13:30:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMe-00084Z-Fn
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Ya7mNl614k8cPEx//1LbBwD1mBTI6q+TUS2d4XeT6DY=; b=iay1UgkMtKfQ94ufwnWzk2T1it
 c3R7eVYN9ml3Ywzgas/Gd9buHnKumjaigSbyg1fPjmWGpoRxU/Ek5+fXa/aVGF5IwolH6uhPeyqXg
 DL3BpGdtWlvBlZGgRl6YFd9TchAoOKNQ3CQdeKQsVAHkF4KVJlc5U5b1Es0gwwJlxLXKhao0DIH4f
 I6Z9XFgDf5i76KLycjVCRbd6nn4p6eFYr5DszA7JqBQnbOk9oqwKjl/u9Cj1QKjlzfSam/1Xl0WBh
 o3Zpx2Uoye0mnaezi08x9l1pycXROgv4ksjzY0neMwRpaXspy5GWJjavFXe45MHLxT+eJ+V5whCq4
 kvpN+7fQ==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMc-0006W0-RY; Tue, 24 Nov 2020 13:28:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/45] block: remove a duplicate __disk_get_part prototype
Date: Tue, 24 Nov 2020 14:27:17 +0100
Message-Id: <20201124132751.3747337-12-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 include/linux/genhd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 46553d6d602563..22f5b9fd96f8bf 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -250,7 +250,6 @@ static inline dev_t part_devt(struct hd_struct *part)
 	return part_to_dev(part)->devt;
 }
 
-extern struct hd_struct *__disk_get_part(struct gendisk *disk, int partno);
 extern struct hd_struct *disk_get_part(struct gendisk *disk, int partno);
 
 static inline void disk_put_part(struct hd_struct *part)
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
