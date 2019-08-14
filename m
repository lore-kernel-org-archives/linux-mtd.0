Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0481C32753
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9359C206C1
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFwznFpB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9359C206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPb451M7ZCY1fkJ3wGqu4ky6qaGz6H8zFkD8X+FokW0=; b=sFwznFpBQhMQO+
	TeCfOHrwjq5dvE1/DBvrpPttUNsw6deYfNqv3yvLeRwYmhN9ZdW4J+jwKAW8J7P+UV2PG1o0zvYs9
	AdGK8L1W4YV9jYlimSDUhNuU1NXbgEGI5ODMFxBLhZJTE4bsKW1mwoSnPgnw/GDvmLgmCJGC78cfF
	VVP5qGPsMz+5tMGlPFOTWvnvPCHsZvGaD/38Uku29lAm1MHZaJHiZIm9Wx+GJlb7jbtjsdQnGcwOX
	C9psPozwgCWhQwjk7l/8ukgFyMTMPQNd3KuuezLoQ9Ajy3qNAQiG5mMQZetH0Cuu113kYOy8Nwh9Q
	rrxr5iRQuhq6m5Wd9UKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxsHB-0004Ap-C0; Wed, 14 Aug 2019 12:21:13 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxsFM-00019S-Tf
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 12:19:22 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hxsEp-0005kE-Ee; Wed, 14 Aug 2019 14:18:47 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hxsEm-00081c-Nj; Wed, 14 Aug 2019 14:18:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 05/11] quota: Allow to pass quotactl a mountpoint
Date: Wed, 14 Aug 2019 14:18:28 +0200
Message-Id: <20190814121834.13983-6-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190814_051921_010867_51158982 
X-CRM114-Status: GOOD (  16.95  )
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

So far quotactl only allows a path to a block device to specify a
filesystem to work on. For filesystems that don't work on block devices
such as UBIFS there is no block device, so let quotactl take the
mountpoint as an alternative way.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/quota.c   | 69 ++++++++++++++++++++++++++++++++--------------
 fs/super.c         | 17 ++++++++++++
 include/linux/fs.h |  1 +
 3 files changed, 67 insertions(+), 20 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 64a212576a72..6d9807092ae1 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -19,6 +19,7 @@
 #include <linux/types.h>
 #include <linux/writeback.h>
 #include <linux/nospec.h>
+#include <linux/mount.h>
 
 static int check_quotactl_permission(struct super_block *sb, int type, int cmd,
 				     qid_t id)
@@ -781,16 +782,53 @@ static bool quotactl_cmd_onoff(int cmd)
 		 (cmd == Q_XQUOTAON) || (cmd == Q_XQUOTAOFF);
 }
 
+static struct super_block *quotactl_block(const char __user *special)
+{
+#ifdef CONFIG_BLOCK
+	struct block_device *bdev;
+	struct filename *tmp = getname(special);
+
+	if (IS_ERR(tmp))
+		return ERR_CAST(tmp);
+	bdev = lookup_bdev(tmp->name);
+	putname(tmp);
+	if (IS_ERR(bdev))
+		return ERR_CAST(bdev);
+
+	bdput(bdev);
+
+	return get_super(bdev);
+#else
+	return ERR_PTR(-ENODEV);
+#endif
+}
+
+static struct super_block *quotactl_path(const char __user *special)
+{
+	struct super_block *sb;
+	struct path path;
+	int ret;
+
+	ret = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW|LOOKUP_AUTOMOUNT, &path);
+	if (ret)
+		return ERR_PTR(ret);
+
+	sb = path.mnt->mnt_sb;
+
+	reference_super(sb);
+
+	path_put(&path);
+
+	return sb;
+}
+
 /*
  * look up a superblock on which quota ops will be performed
  * - use the name of a block device to find the superblock thereon
  */
-static struct super_block *quotactl_block(const char __user *special, int cmd)
+static struct super_block *quotactl_get_super(const char __user *special, int cmd)
 {
-#ifdef CONFIG_BLOCK
-	struct block_device *bdev;
 	struct super_block *sb;
-	struct filename *tmp = getname(special);
 	bool thawed = false, exclusive;
 	int ret;
 
@@ -802,18 +840,12 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 		exclusive = false;
 	}
 
-	if (IS_ERR(tmp))
-		return ERR_CAST(tmp);
-	bdev = lookup_bdev(tmp->name);
-	putname(tmp);
-	if (IS_ERR(bdev))
-		return ERR_CAST(bdev);
-
-	bdput(bdev);
-
-	sb = get_super(bdev);
-	if (!sb)
-		return ERR_PTR(-ENODEV);
+	sb = quotactl_block(special);
+	if (IS_ERR(sb)) {
+		sb = quotactl_path(special);
+		if (IS_ERR(sb))
+			return ERR_CAST(sb);
+	}
 
 	if (thawed) {
 		ret = wait_super_thawed(sb, exclusive);
@@ -827,9 +859,6 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 	}
 
 	return sb;
-#else
-	return ERR_PTR(-ENODEV);
-#endif
 }
 
 /*
@@ -873,7 +902,7 @@ int kernel_quotactl(unsigned int cmd, const char __user *special,
 			pathp = &path;
 	}
 
-	sb = quotactl_block(special, cmds);
+	sb = quotactl_get_super(special, cmds);
 	if (IS_ERR(sb)) {
 		ret = PTR_ERR(sb);
 		goto out;
diff --git a/fs/super.c b/fs/super.c
index 13380ffcbd8d..b23641f94557 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -819,6 +819,23 @@ int wait_super_thawed(struct super_block *sb, bool excl)
 }
 EXPORT_SYMBOL(wait_super_thawed);
 
+/**
+ * reference_super - get a reference to a given superblock
+ * @sb: superblock to get the reference from
+ *
+ * Takes a reference to a superblock. Can be used as when the superblock
+ * is known and leaves it in a state as if get_super had been called.
+ */
+void reference_super(struct super_block *sb)
+{
+	spin_lock(&sb_lock);
+	sb->s_count++;
+	spin_unlock(&sb_lock);
+
+	down_read(&sb->s_umount);
+}
+EXPORT_SYMBOL_GPL(reference_super);
+
 /**
  * get_active_super - get an active reference to the superblock of a device
  * @bdev: device to get the superblock for
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 59d9ea62942a..66aa9e5490d0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3223,6 +3223,7 @@ extern struct super_block *get_super(struct block_device *);
 extern int wait_super_thawed(struct super_block *sb, bool excl);
 extern struct super_block *get_active_super(struct block_device *bdev);
 extern int super_wait_thawed(struct super_block *sb, bool excl);
+extern void reference_super(struct super_block *sb);
 extern void drop_super(struct super_block *sb);
 extern void drop_super_exclusive(struct super_block *sb);
 extern void iterate_supers(void (*)(struct super_block *, void *), void *);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
