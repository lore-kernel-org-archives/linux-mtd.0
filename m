Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8DCC64E75
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A7D221E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 13:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbaftc2r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T24et5TX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82A7D221E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ECRdJMxKufX5G5lfQoZ/yuFOIvT6j5nuVYHroQHDYDA=; b=jbaftc2r04PUkG5Cu7x5JCBHD
	UbxPD459QAR6mVRaksLC8v9nshaPk79Klo8Pl6GJ0Hl7jLdMtti5mRp8sIyWcvvs9XTFx1M2+8LnV
	YuHiFZBmJEOe4sftCYaLYF8FGP65e16qKIkiVfAYaOm9bfzFGIrf68q7UKPrfTJ1Q5le9ao3iJ21a
	IHoGTZD6h7Tu9aC5kh+/9hIGdN+GtnZYjPe4HuKncwC81lk1jHY4paV3e9mcPxwTpxxcTrF0qeh+J
	XqrqhLmNnaHxOzIu6GV83Fp3/lu4hBpGRC3+hR3Il2UioiDK2UhvDNp7Weivk/YycpF6ZnyXZ4pf6
	H+l87v6Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiGzN-00087U-7d; Thu, 26 Nov 2020 13:07:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGyt-00080T-UE
 for linux-mtd@merlin.infradead.org; Thu, 26 Nov 2020 13:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XnXdcQtajIOk6W1AjzTgGSRfD1WpR1y99lVXhBEiUaA=; b=T24et5TXruOuaLikxde8zjbFq2
 alZbvSGO8obX2HcQfQIUHBwxKBu//tTldFMU7kivVnN2YXfNGaruEWmEYBXmafcW39quZNdieUmmW
 8gapO5pqJQ+oYJLHTVo8kH6afQIN4CIwUEKigO6kJ4rwfPpsHyd0rtj2fDeQTWQjswJjDqv0djcI7
 NLOHaBT3nYHtkp54MPBjj8GQJfByZy+kD81CknCcdEJOFbaGX70dZTWrLXn9s++hmkP5TW0f2H1aF
 pdej/bw1qMMXVOH/CpM5Fj/qt2Unj9fnskMzEmPNsgwLChtTSLyjjGwt8J7dOflqco0Y2YRaY3guW
 s52OEbrQ==;
Received: from [2001:4bb8:18c:1dd6:27b8:b8a1:c13e:ceb1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGys-0003wR-ME; Thu, 26 Nov 2020 13:06:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/44] fs: remove get_super_thawed and
 get_super_exclusive_thawed
Date: Thu, 26 Nov 2020 14:03:41 +0100
Message-Id: <20201126130422.92945-4-hch@lst.de>
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
 Hannes Reinecke <hare@suse.de>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Just open code the wait in the only caller of both functions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 fs/internal.h      |  2 ++
 fs/quota/quota.c   | 31 +++++++++++++++++++++-------
 fs/super.c         | 51 ++--------------------------------------------
 include/linux/fs.h |  4 +---
 4 files changed, 29 insertions(+), 59 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index a7cd0f64faa4ab..47be21dfeebef5 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -114,7 +114,9 @@ extern struct file *alloc_empty_file_noaccount(int, const struct cred *);
  */
 extern int reconfigure_super(struct fs_context *);
 extern bool trylock_super(struct super_block *sb);
+struct super_block *__get_super(struct block_device *bdev, bool excl);
 extern struct super_block *user_get_super(dev_t);
+void put_super(struct super_block *sb);
 extern bool mount_capable(struct fs_context *);
 
 /*
diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 9af95c7a0bbe3c..f3d32b0d9008f2 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -20,6 +20,7 @@
 #include <linux/writeback.h>
 #include <linux/nospec.h>
 #include "compat.h"
+#include "../internal.h"
 
 static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
 				     qid_t id)
@@ -868,6 +869,7 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 	struct block_device *bdev;
 	struct super_block *sb;
 	struct filename *tmp = getname(special);
+	bool excl = false, thawed = false;
 
 	if (IS_ERR(tmp))
 		return ERR_CAST(tmp);
@@ -875,17 +877,32 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 	putname(tmp);
 	if (IS_ERR(bdev))
 		return ERR_CAST(bdev);
-	if (quotactl_cmd_onoff(cmd))
-		sb = get_super_exclusive_thawed(bdev);
-	else if (quotactl_cmd_write(cmd))
-		sb = get_super_thawed(bdev);
-	else
-		sb = get_super(bdev);
+
+	if (quotactl_cmd_onoff(cmd)) {
+		excl = true;
+		thawed = true;
+	} else if (quotactl_cmd_write(cmd)) {
+		thawed = true;
+	}
+
+retry:
+	sb = __get_super(bdev, excl);
+	if (thawed && sb && sb->s_writers.frozen != SB_UNFROZEN) {
+		if (excl)
+			up_write(&sb->s_umount);
+		else
+			up_read(&sb->s_umount);
+		wait_event(sb->s_writers.wait_unfrozen,
+			   sb->s_writers.frozen == SB_UNFROZEN);
+		put_super(sb);
+		goto retry;
+	}
+
 	bdput(bdev);
 	if (!sb)
 		return ERR_PTR(-ENODEV);
-
 	return sb;
+
 #else
 	return ERR_PTR(-ENODEV);
 #endif
diff --git a/fs/super.c b/fs/super.c
index 98bb0629ee108e..343e5c1e538d2a 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -307,7 +307,7 @@ static void __put_super(struct super_block *s)
  *	Drops a temporary reference, frees superblock if there's no
  *	references left.
  */
-static void put_super(struct super_block *sb)
+void put_super(struct super_block *sb)
 {
 	spin_lock(&sb_lock);
 	__put_super(sb);
@@ -740,7 +740,7 @@ void iterate_supers_type(struct file_system_type *type,
 
 EXPORT_SYMBOL(iterate_supers_type);
 
-static struct super_block *__get_super(struct block_device *bdev, bool excl)
+struct super_block *__get_super(struct block_device *bdev, bool excl)
 {
 	struct super_block *sb;
 
@@ -789,53 +789,6 @@ struct super_block *get_super(struct block_device *bdev)
 }
 EXPORT_SYMBOL(get_super);
 
-static struct super_block *__get_super_thawed(struct block_device *bdev,
-					      bool excl)
-{
-	while (1) {
-		struct super_block *s = __get_super(bdev, excl);
-		if (!s || s->s_writers.frozen == SB_UNFROZEN)
-			return s;
-		if (!excl)
-			up_read(&s->s_umount);
-		else
-			up_write(&s->s_umount);
-		wait_event(s->s_writers.wait_unfrozen,
-			   s->s_writers.frozen == SB_UNFROZEN);
-		put_super(s);
-	}
-}
-
-/**
- *	get_super_thawed - get thawed superblock of a device
- *	@bdev: device to get the superblock for
- *
- *	Scans the superblock list and finds the superblock of the file system
- *	mounted on the device. The superblock is returned once it is thawed
- *	(or immediately if it was not frozen). %NULL is returned if no match
- *	is found.
- */
-struct super_block *get_super_thawed(struct block_device *bdev)
-{
-	return __get_super_thawed(bdev, false);
-}
-EXPORT_SYMBOL(get_super_thawed);
-
-/**
- *	get_super_exclusive_thawed - get thawed superblock of a device
- *	@bdev: device to get the superblock for
- *
- *	Scans the superblock list and finds the superblock of the file system
- *	mounted on the device. The superblock is returned once it is thawed
- *	(or immediately if it was not frozen) and s_umount semaphore is held
- *	in exclusive mode. %NULL is returned if no match is found.
- */
-struct super_block *get_super_exclusive_thawed(struct block_device *bdev)
-{
-	return __get_super_thawed(bdev, true);
-}
-EXPORT_SYMBOL(get_super_exclusive_thawed);
-
 /**
  * get_active_super - get an active reference to the superblock of a device
  * @bdev: device to get the superblock for
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8667d0cdc71e76..a61df0dd4f1989 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1409,7 +1409,7 @@ enum {
 
 struct sb_writers {
 	int				frozen;		/* Is sb frozen? */
-	wait_queue_head_t		wait_unfrozen;	/* for get_super_thawed() */
+	wait_queue_head_t		wait_unfrozen;	/* wait for thaw */
 	struct percpu_rw_semaphore	rw_sem[SB_FREEZE_LEVELS];
 };
 
@@ -3132,8 +3132,6 @@ extern struct file_system_type *get_filesystem(struct file_system_type *fs);
 extern void put_filesystem(struct file_system_type *fs);
 extern struct file_system_type *get_fs_type(const char *name);
 extern struct super_block *get_super(struct block_device *);
-extern struct super_block *get_super_thawed(struct block_device *);
-extern struct super_block *get_super_exclusive_thawed(struct block_device *bdev);
 extern struct super_block *get_active_super(struct block_device *bdev);
 extern void drop_super(struct super_block *sb);
 extern void drop_super_exclusive(struct super_block *sb);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
