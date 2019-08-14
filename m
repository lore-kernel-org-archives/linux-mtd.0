Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65D0C32753
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:19:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB96206C1
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JgaCRFFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AB96206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+rBjo9k4jeTwSo47K2LIGWv6BaysLSzgyUY2A/fqU4=; b=JgaCRFFbHmlE7S
	Ia0mLdFp/6+rgtAoyDzRGddNAEJ3yzSyFo1K98vR0HHL5xU9DYZmePw+HYtJ0s0EsccjdCyw/2kHA
	hSr6UroUZ3/DiAYev2Oy6ex4nOCJDnhD7xj7eAhYkY+E+ugzSnr2TMe+r4GOriUs6dTDL++MPAYT8
	16lRqbsVtdhZlHcmuO0pxKGVQTHaVvu7WLAhiBIEdyyOqB+wyf5y+JsXGQ674iqIWR3e5RnvLIttt
	Z9zI9nlLBPm1+imKo9PscpneQ2J92MvW3OjTxc75sXqgMOL2eBFwNg9d8dVAYk9+YvJt5jMjHi/pA
	RE7LV7wNIqkwfERaPcnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxsFm-0001bF-JQ; Wed, 14 Aug 2019 12:19:46 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxsEy-0000bl-U4
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 12:18:58 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hxsEp-0005kD-EW; Wed, 14 Aug 2019 14:18:47 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hxsEm-00081Z-NC; Wed, 14 Aug 2019 14:18:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 04/11] fs,
 quota: introduce wait_super_thawed() to wait until a superblock is
 thawed
Date: Wed, 14 Aug 2019 14:18:27 +0200
Message-Id: <20190814121834.13983-5-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814121834.13983-1-s.hauer@pengutronix.de>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_051857_170937_C05925B6 
X-CRM114-Status: GOOD (  18.55  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

quota uses three different functions to get a superblock from a
block_device. Instead, retrieve the superblock always with get_super()
and introduce wait_super_thawed() which is then used to wait until the
superblock is thawed. This way the code can better be shared with the
code introduced in the next step: We want to add quota support for
filesystems without a block_device, so here functions around a
block_device can't be used.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/quota.c   | 30 +++++++++++++++----
 fs/super.c         | 72 +++++++++++++++++-----------------------------
 include/linux/fs.h |  4 +--
 3 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index cb13fb76dbee..64a212576a72 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -791,6 +791,16 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 	struct block_device *bdev;
 	struct super_block *sb;
 	struct filename *tmp = getname(special);
+	bool thawed = false, exclusive;
+	int ret;
+
+	if (quotactl_cmd_onoff(cmd)) {
+		thawed = true;
+		exclusive = true;
+	} else if (quotactl_cmd_write(cmd)) {
+		thawed = true;
+		exclusive = false;
+	}
 
 	if (IS_ERR(tmp))
 		return ERR_CAST(tmp);
@@ -798,16 +808,24 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
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
 	bdput(bdev);
+
+	sb = get_super(bdev);
 	if (!sb)
 		return ERR_PTR(-ENODEV);
 
+	if (thawed) {
+		ret = wait_super_thawed(sb, exclusive);
+		if (ret) {
+			if (exclusive)
+				drop_super_exclusive(sb);
+			else
+				drop_super(sb);
+			return ERR_PTR(ret);
+		}
+	}
+
 	return sb;
 #else
 	return ERR_PTR(-ENODEV);
diff --git a/fs/super.c b/fs/super.c
index f85d1ea194ae..13380ffcbd8d 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -783,61 +783,41 @@ struct super_block *get_super(struct block_device *bdev)
 }
 EXPORT_SYMBOL(get_super);
 
-static struct super_block *__get_super_thawed(struct block_device *bdev,
-					      bool excl)
+/**
+ *	wait_super_thawed - wait for a superblock being thawed
+ *	@sb: superblock to wait for
+ *	@excl: if true, get s_umount semaphore exclusively
+ *
+ * Wait until the superblock is thawed. s_umount semaphore must be released on
+ * entry and will be held when returning.
+ */
+int wait_super_thawed(struct super_block *sb, bool excl)
 {
-	struct super_block *s = __get_super(bdev, excl);
-	if (!s)
-		return NULL;
+	up_read(&sb->s_umount);
 
 	while (1) {
-		if (s->s_writers.frozen == SB_UNFROZEN)
-			return s;
-
-		if (!excl)
-			up_read(&s->s_umount);
+		if (excl)
+			down_write(&sb->s_umount);
 		else
-			up_write(&s->s_umount);
+			down_read(&sb->s_umount);
 
-		wait_event(s->s_writers.wait_unfrozen,
-			   s->s_writers.frozen == SB_UNFROZEN);
+		/* still alive? */
+		if (!sb->s_root || !(sb->s_flags & SB_BORN))
+			return -ENODEV;
 
-		if (!excl)
-			down_read(&sb->s_umount);
-		else
-			down_write(&sb->s_umount);
-	}
-}
+		if (sb->s_writers.frozen == SB_UNFROZEN)
+			return 0;
 
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
+		if (excl)
+			up_write(&sb->s_umount);
+		else
+			up_read(&sb->s_umount);
 
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
+		wait_event(sb->s_writers.wait_unfrozen,
+			   sb->s_writers.frozen == SB_UNFROZEN);
+	}
 }
-EXPORT_SYMBOL(get_super_exclusive_thawed);
+EXPORT_SYMBOL(wait_super_thawed);
 
 /**
  * get_active_super - get an active reference to the superblock of a device
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 997a530ff4e9..59d9ea62942a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3220,9 +3220,9 @@ extern struct file_system_type *get_filesystem(struct file_system_type *fs);
 extern void put_filesystem(struct file_system_type *fs);
 extern struct file_system_type *get_fs_type(const char *name);
 extern struct super_block *get_super(struct block_device *);
-extern struct super_block *get_super_thawed(struct block_device *);
-extern struct super_block *get_super_exclusive_thawed(struct block_device *bdev);
+extern int wait_super_thawed(struct super_block *sb, bool excl);
 extern struct super_block *get_active_super(struct block_device *bdev);
+extern int super_wait_thawed(struct super_block *sb, bool excl);
 extern void drop_super(struct super_block *sb);
 extern void drop_super_exclusive(struct super_block *sb);
 extern void iterate_supers(void (*)(struct super_block *, void *), void *);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
