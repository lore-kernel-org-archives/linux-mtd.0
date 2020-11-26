Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4120C63697
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:19:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8F221D40
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:19:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ig1DT1Il";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kmAZCxAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8F221D40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fjxtDqzn9q7TKqN1s3Vk/k8f8o1wAxMN8gTGODvqr9M=; b=Ig1DT1IlR56oxWzm/5JNYqPP3
	qtkcCitod93H3Kin2kUdiIMin/4XRwLYbWVdfeLxA7f+h84yoXU6bN2TVHwUA0Tlk6/slsz0yysTq
	XLLvd0WaTSHq9J471comiaqY8wFv6nk38YvmdVETz6J3uItZZbaTzxNv9+TETlfmfFQYLcaGKf8vq
	X1mX2W40Cw5NBpmR9YG/Khat3CvLfzVitaWUlQnadviFD3CCaNwOj2/6WC3xprfDGHIHhmkbwPgkC
	iASRvhFaiEfRO2dp2Hro11seRMcYitmMz3Fn46DBFkpUQbJU3YpvYEN9i4AZO/v+a3ZDHfpXG6EJd
	/PnlZ0HpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiH9d-0002PF-Kj; Thu, 26 Nov 2020 13:17:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGzb-0008Ei-Ig
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1tcmRx2mjZ+Q0k6ARd6yRdSqtADfA0cYzHXyc7NNrVk=; b=kmAZCxAi6xcgTPP0Avv8cTDFbZ
 5PEFZnq11bNC0btirTZjpOAOBLClmL5HONBvtQAXOe0qcNAZDea75fJ5/1Lq/MxoYHED8oo5NOBJb
 3RZqC1kKyfgBlYiXqTQ13q2P2vlcz2E2GxokcO+X6K4okweXBRcqAGR4RxU1CFbRMRoepxVf5DoLa
 c34AZvB3wO/hXCwJbuJbHWkaLg2hbwrBHUvaNmwufYCRfkKyK/ZJ135+AwRzhKgg925DewueMIgtx
 K1UDnBNEDdgUJTol8+OMiQUSyRuFnphgnXq9JZ6HT5pIgOcxTSz1TS8dwvIJhFGF/U++k5f9W/XYh
 2UiV8+ug==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGza-00047X-3B; Thu, 26 Nov 2020 13:07:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 34/44] block: move make_it_fail to struct block_device
Date: Thu, 26 Nov 2020 14:04:12 +0100
Message-Id: <20201126130422.92945-35-hch@lst.de>
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

Move the make_it_fail flag to struct block_device an turn it into a bool
in preparation of killing struct hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-core.c          | 3 ++-
 block/genhd.c             | 4 ++--
 include/linux/blk_types.h | 3 +++
 include/linux/genhd.h     | 3 ---
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 9a3793d5ce38d4..9121390be97a76 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -668,7 +668,8 @@ __setup("fail_make_request=", setup_fail_make_request);
 
 static bool should_fail_request(struct hd_struct *part, unsigned int bytes)
 {
-	return part->make_it_fail && should_fail(&fail_make_request, bytes);
+	return part->bdev->bd_make_it_fail &&
+		should_fail(&fail_make_request, bytes);
 }
 
 static int __init fail_make_request_debugfs(void)
diff --git a/block/genhd.c b/block/genhd.c
index a964e7532fedd5..0371558ccde14c 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1284,7 +1284,7 @@ ssize_t part_fail_show(struct device *dev,
 {
 	struct hd_struct *p = dev_to_part(dev);
 
-	return sprintf(buf, "%d\n", p->make_it_fail);
+	return sprintf(buf, "%d\n", p->bdev->bd_make_it_fail);
 }
 
 ssize_t part_fail_store(struct device *dev,
@@ -1295,7 +1295,7 @@ ssize_t part_fail_store(struct device *dev,
 	int i;
 
 	if (count > 0 && sscanf(buf, "%d", &i) > 0)
-		p->make_it_fail = (i == 0) ? 0 : 1;
+		p->pdev->bd_make_it_fail = (i == 0) ? 0 : 1;
 
 	return count;
 }
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index c0591e52d7d7ce..b237f1e4081405 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -52,6 +52,9 @@ struct block_device {
 	struct super_block	*bd_fsfreeze_sb;
 
 	struct partition_meta_info *bd_meta_info;
+#ifdef CONFIG_FAIL_MAKE_REQUEST
+	bool			bd_make_it_fail;
+#endif
 } __randomize_layout;
 
 #define bdev_whole(_bdev) \
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index b4a5c05593b99c..349cf6403ccddc 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -56,9 +56,6 @@ struct hd_struct {
 	struct block_device *bdev;
 	struct device __dev;
 	int policy, partno;
-#ifdef CONFIG_FAIL_MAKE_REQUEST
-	int make_it_fail;
-#endif
 	struct rcu_work rcu_work;
 };
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
