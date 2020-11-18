Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA33C63697
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:53:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4791220719
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 08:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2unrJq4P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MH4CdclH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4791220719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a0RYRojY3do/gtdYXarzGjb/yVVOfkHKAb1y4+dQlUY=; b=2unrJq4PSnIgsKsPf9updvRoq
	CVzVeKpANdHcRatulSzZVxKFXAhyVprIEkch0DFwFqT3Ni1sS9DLPPQ/jn8EeaQnCjOmvV9TUJmlq
	n+eo1MD0oKUj/tbTy9w8v6JVOIgULiu03U6QQ1Tjtf702YDecimfI3rXUaxi3Va3ds1JgDGyEMtew
	XTwkXkx2lrZqP0V146PgJjtzU1nXJ4JVaJBwC2ESkJDachvKa2IOOsyhzkBX75OaXUCIWGtiW7Cz2
	WExeo3uzpg3uCQx7NtIQ1cemiP5paEajEs5UUZVGmFCOlSpEQfoinFm/InjCOaweNZuGlaNt+EN06
	7Wm4AyfGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJCJ-0001Y7-Uy; Wed, 18 Nov 2020 08:52:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8n-00086y-6d
 for linux-mtd@merlin.infradead.org; Wed, 18 Nov 2020 08:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Ax7Ev08zfe+k5fDLujW3aI+bgMMepj+7Q/YK24br9d4=; b=MH4CdclHDFODTjP9xnj5n+SLj0
 KgiBor4Efh0d9jME3EBQSx6adQqstkQTNDaZ2TizC50HfcaRgRLQhFlai8VIjVusfI7Z1sIv/ES2V
 yVYPpyv6TcX6IvPqvrcT6UuNlnH1RiFDoZeB5gewwtGWzxh8hzup0RNJSPK2mZL0Xv6zp19aHzSC6
 FD9BN9wevD0vXr+flfq6Rs+nbACPaGbwFMFYa5Rr9YH61lZzjJ7URnmHIkhz4Av1kbIuigOC3Ufc0
 Qb4rWt3d0clR8N8p05bFTRMhFV3wjTMS4l+SUARMu/uwttgDn3VZ8BLlS2HkkXll+sF4pZ22nbxux
 jd6zetXA==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8l-0007pS-Je; Wed, 18 Nov 2020 08:48:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 19/20] bcache: remove a superflous lookup_bdev all
Date: Wed, 18 Nov 2020 09:47:59 +0100
Message-Id: <20201118084800.2339180-20-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
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
Cc: linux-bcache@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Don't bother to call lookup_bdev for just a slightly different error
message without any functional change.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/bcache/super.c | 44 +--------------------------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index e5db2cdd114112..5c531ed7785280 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -2380,40 +2380,6 @@ kobj_attribute_write(register,		register_bcache);
 kobj_attribute_write(register_quiet,	register_bcache);
 kobj_attribute_write(pendings_cleanup,	bch_pending_bdevs_cleanup);
 
-static bool bch_is_open_backing(struct block_device *bdev)
-{
-	struct cache_set *c, *tc;
-	struct cached_dev *dc, *t;
-
-	list_for_each_entry_safe(c, tc, &bch_cache_sets, list)
-		list_for_each_entry_safe(dc, t, &c->cached_devs, list)
-			if (dc->bdev == bdev)
-				return true;
-	list_for_each_entry_safe(dc, t, &uncached_devices, list)
-		if (dc->bdev == bdev)
-			return true;
-	return false;
-}
-
-static bool bch_is_open_cache(struct block_device *bdev)
-{
-	struct cache_set *c, *tc;
-
-	list_for_each_entry_safe(c, tc, &bch_cache_sets, list) {
-		struct cache *ca = c->cache;
-
-		if (ca->bdev == bdev)
-			return true;
-	}
-
-	return false;
-}
-
-static bool bch_is_open(struct block_device *bdev)
-{
-	return bch_is_open_cache(bdev) || bch_is_open_backing(bdev);
-}
-
 struct async_reg_args {
 	struct delayed_work reg_work;
 	char *path;
@@ -2535,15 +2501,7 @@ static ssize_t register_bcache(struct kobject *k, struct kobj_attribute *attr,
 				  sb);
 	if (IS_ERR(bdev)) {
 		if (bdev == ERR_PTR(-EBUSY)) {
-			bdev = lookup_bdev(strim(path));
-			mutex_lock(&bch_register_lock);
-			if (!IS_ERR(bdev) && bch_is_open(bdev))
-				err = "device already registered";
-			else
-				err = "device busy";
-			mutex_unlock(&bch_register_lock);
-			if (!IS_ERR(bdev))
-				bdput(bdev);
+			err = "device busy";
 			if (attr == &ksysfs_register_quiet)
 				goto done;
 		}
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
