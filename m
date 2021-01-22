Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F13C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76AE8235DD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76AE8235DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Oghq4ekqrg4fsYM6THA9t1lruU2qi31MIW+HA8bvOI=; b=X79f3kqi0cyEnwVvoY0oLRsOw
	+I4pTT9c/tujx4TAT7053lwUWlgspA5Iy/n79l9kRF2QWHarI3RF3p2zK/ZQE5dKKw9Oy4UgelFiK
	9yEvQxI4FbbxyZUxKGoBWrPCbdypN/IlADS2jWogGN3LJUU9y/UIMf17j9+w3/LzNVX5AGhnR1qTr
	w6gjy1BrYt/FDhgFaZX6a1Bd6vs57UnmzcmNQWndsmxnPPmqVfcUy8o4eGhl6qZBF+o3orBgApx89
	2dP70BVrgWN1f/jo4K8ooQYHiJeTzEve32QkHqlEXqK25hVS6Y43nO+ZDYfCQqFU4FtUpjbUcueaQ
	1Gs4r2Q8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2yAD-0006mN-RO; Fri, 22 Jan 2021 15:15:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2yA4-0006j1-O6
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 15:15:46 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA1-0004Bq-HD; Fri, 22 Jan 2021 16:15:41 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA0-0003qg-N6; Fri, 22 Jan 2021 16:15:40 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 1/8] quota: Allow to pass mount path to quotactl
Date: Fri, 22 Jan 2021 16:15:29 +0100
Message-Id: <20210122151536.7982-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122151536.7982-1-s.hauer@pengutronix.de>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_101544_828269_9BB36D55 
X-CRM114-Status: GOOD (  22.87  )
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

This patch introduces the Q_PATH flag to the quotactl cmd argument.
When given, the path given in the special argument to quotactl will
be the mount path where the filesystem is mounted, instead of a path
to the block device.
This is necessary for filesystems which do not have a block device as
backing store. Particularly this is done for upcoming UBIFS support.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/quota/quota.c           | 66 ++++++++++++++++++++++++++++----------
 include/uapi/linux/quota.h |  1 +
 2 files changed, 50 insertions(+), 17 deletions(-)

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 6d16b2be5ac4..f653b27a9a4e 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -17,6 +17,7 @@
 #include <linux/capability.h>
 #include <linux/quotaops.h>
 #include <linux/types.h>
+#include <linux/mount.h>
 #include <linux/writeback.h>
 #include <linux/nospec.h>
 #include "compat.h"
@@ -859,25 +860,10 @@ static bool quotactl_cmd_onoff(int cmd)
 		 (cmd == Q_XQUOTAON) || (cmd == Q_XQUOTAOFF);
 }
 
-/*
- * look up a superblock on which quota ops will be performed
- * - use the name of a block device to find the superblock thereon
- */
-static struct super_block *quotactl_block(const char __user *special, int cmd)
+static struct super_block *quotactl_sb(dev_t dev, int cmd)
 {
-#ifdef CONFIG_BLOCK
 	struct super_block *sb;
-	struct filename *tmp = getname(special);
 	bool excl = false, thawed = false;
-	int error;
-	dev_t dev;
-
-	if (IS_ERR(tmp))
-		return ERR_CAST(tmp);
-	error = lookup_bdev(tmp->name, &dev);
-	putname(tmp);
-	if (error)
-		return ERR_PTR(error);
 
 	if (quotactl_cmd_onoff(cmd)) {
 		excl = true;
@@ -901,12 +887,50 @@ static struct super_block *quotactl_block(const char __user *special, int cmd)
 		goto retry;
 	}
 	return sb;
+}
+
+/*
+ * look up a superblock on which quota ops will be performed
+ * - use the name of a block device to find the superblock thereon
+ */
+static struct super_block *quotactl_block(const char __user *special, int cmd)
+{
+#ifdef CONFIG_BLOCK
+	struct filename *tmp = getname(special);
+	int error;
+	dev_t dev;
 
+	if (IS_ERR(tmp))
+		return ERR_CAST(tmp);
+	error = lookup_bdev(tmp->name, &dev);
+	putname(tmp);
+	if (error)
+		return ERR_PTR(error);
+
+	return quotactl_sb(dev, cmd);
 #else
 	return ERR_PTR(-ENODEV);
 #endif
 }
 
+static struct super_block *quotactl_path(const char __user *special, int cmd)
+{
+	struct super_block *sb;
+	struct path path;
+	int error;
+
+	error = user_path_at(AT_FDCWD, special, LOOKUP_FOLLOW | LOOKUP_AUTOMOUNT,
+			   &path);
+	if (error)
+		return ERR_PTR(error);
+
+	sb = quotactl_sb(path.mnt->mnt_sb->s_dev, cmd);
+
+	path_put(&path);
+
+	return sb;
+}
+
 /*
  * This is the system call interface. This communicates with
  * the user-level programs. Currently this only supports diskquota
@@ -920,6 +944,7 @@ SYSCALL_DEFINE4(quotactl, unsigned int, cmd, const char __user *, special,
 	struct super_block *sb = NULL;
 	struct path path, *pathp = NULL;
 	int ret;
+	bool q_path;
 
 	cmds = cmd >> SUBCMDSHIFT;
 	type = cmd & SUBCMDMASK;
@@ -927,6 +952,9 @@ SYSCALL_DEFINE4(quotactl, unsigned int, cmd, const char __user *, special,
 	if (type >= MAXQUOTAS)
 		return -EINVAL;
 
+	q_path = cmds & Q_PATH;
+	cmds &= ~Q_PATH;
+
 	/*
 	 * As a special case Q_SYNC can be called without a specific device.
 	 * It will iterate all superblocks that have quota enabled and call
@@ -951,7 +979,11 @@ SYSCALL_DEFINE4(quotactl, unsigned int, cmd, const char __user *, special,
 			pathp = &path;
 	}
 
-	sb = quotactl_block(special, cmds);
+	if (q_path)
+		sb = quotactl_path(special, cmds);
+	else
+		sb = quotactl_block(special, cmds);
+
 	if (IS_ERR(sb)) {
 		ret = PTR_ERR(sb);
 		goto out;
diff --git a/include/uapi/linux/quota.h b/include/uapi/linux/quota.h
index f17c9636a859..e1787c0df601 100644
--- a/include/uapi/linux/quota.h
+++ b/include/uapi/linux/quota.h
@@ -71,6 +71,7 @@
 #define Q_GETQUOTA 0x800007	/* get user quota structure */
 #define Q_SETQUOTA 0x800008	/* set user quota structure */
 #define Q_GETNEXTQUOTA 0x800009	/* get disk limits and usage >= ID */
+#define Q_PATH     0x400000	/* quotactl special arg contains mount path */
 
 /* Quota format type IDs */
 #define	QFMT_VFS_OLD 1
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
