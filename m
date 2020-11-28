Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5114C63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:28:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E72246CA
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 16:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IWBxoWBR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Pzr1nja0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E72246CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BKx+U3V42/m2r2XqsZU+qZa0HpIezxhhyDoJQJmt1to=; b=IWBxoWBRfKWcjeP1Yy9PVhztx
	wFM9ZjU/ah19oJ/MiCIcqcl5ObvNYFA3xOeUrW0obzTZ6DoA8jJ9qUWQN7EYh3RUBrbI+7l3v3jA3
	Si49eijOaNq/Nn3mr0BdY0UasRMHO0iQ5fCKQQYCkQiRDTF8K0BsYvnrdQyDOnorQDcUOJrf+Acha
	dx8E5qI2CUzj19znz0R1B36HMux7svyWp4rbS176GPc8M2V2MeVg5DRdII2LN0B3uVzqFy1JrxlW0
	MspccRhNC1qrVGmQgdf5jya5PXtYqAyhhWASt5M8XtqpsmubBUoDOkPZkg/M1QMv471I0ecJgPh7M
	Gq8vH8f0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj34h-0000Lc-Uz; Sat, 28 Nov 2020 16:27:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2xh-0003Mz-N2
 for linux-mtd@merlin.infradead.org; Sat, 28 Nov 2020 16:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=coxIlFm7FcSMnYoHU+VRJv+WNmt8/1D9LTOeQ77ktrM=; b=Pzr1nja0AE7hr3st3239LMciL+
 t4cyDfRDhOoe4r2y8ZHb353ytAggEVHWwAwi/ZlnPjwj4FL+gDM++fXMGZbMJNrErgC7xreA8ubIe
 ceCoaJD5BcQz7KRYF1fwdUolUqwKhaTZAO8tB3TvKD3Yp1N3xfqnVjlPD6uwDIYM2QOB44Rj8gn+n
 EHMQLrTzqM15pCHqLBb00ZtS2/NcYv2/JFTbpYE6g+tsqYbNRtSLkHbi5geaHiRxp6qLHtPYPBxWC
 r1TuNrOW/6dxw2cgc4pat3wfudMxZQP/Ycjz7oXXMs7Gy3Dsf627oC3lTm9xA9kIw1k1vXGUsvUad
 Env84xzQ==;
Received: from 089144198196.atnat0007.highway.a1.net ([89.144.198.196]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj2xe-0000jX-Sg; Sat, 28 Nov 2020 16:20:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 35/45] block: move make_it_fail to struct block_device
Date: Sat, 28 Nov 2020 17:15:00 +0100
Message-Id: <20201128161510.347752-36-hch@lst.de>
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

Move the make_it_fail flag to struct block_device an turn it into a bool
in preparation of killing struct hd_struct.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
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
