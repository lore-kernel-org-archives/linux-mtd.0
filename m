Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF235C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E3EA235DD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E3EA235DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L6LbQlQpRft9oHtW2q5vAFVuDdiZsMtvWd50Ji2BBYA=; b=OtL6rzGXQabCb4U1NNo0Mmwfz
	FAvE2jzsbzL5K+77USo4r9uqGyMh+W9j0U7yao8K+gqA6uMo9oR+91nnxWD/L9ZmWBOVcrivEKANl
	wzjT2Vc244+xcfBIrtzEcXrGMz6veS/ei80PWVQjhVUUx4qoAaOekprt/BHV5i+qgWm+C/qALNIei
	jN6aL1dig8fQkSdIVH/yhfix9Hh9fqGxObsxVwGX7Llrpg0Mq9BcAMWsYyBq/5y8aips6QyhG2HGD
	mv4QH//N4EhMYGJVQTHwPyL1wwLrSysuFMhjlXeo7d4/GcqTFgyn2sTlMmXn2Kb0S+ZpK2EjAXBHJ
	fml9SmrIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2yAS-0006ta-EU; Fri, 22 Jan 2021 15:16:08 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2yAI-0006qH-W5
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 15:16:00 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA1-0004Bt-HH; Fri, 22 Jan 2021 16:15:41 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA0-0003qr-QC; Fri, 22 Jan 2021 16:15:40 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 3/8] ubifs: Add support for FS_IOC_FS[SG]ETXATTR ioctls
Date: Fri, 22 Jan 2021 16:15:31 +0100
Message-Id: <20210122151536.7982-4-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20210122_101559_088644_B00B6C96 
X-CRM114-Status: GOOD (  19.32  )
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

The FS_IOC_FS[SG]ETXATTR ioctls are an alternative to FS_IOC_[GS]ETFLAGS
with additional features. This patch adds support for these ioctls.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/ioctl.c | 107 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index b64a9cec7d47..5977edd4d185 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -101,9 +101,46 @@ static int ubifs2ioctl(int ubifs_flags)
 	return ioctl_flags;
 }
 
-static int setflags(struct file *file, int flags)
+/* Transfer xflags flags to internal */
+static unsigned long ubifs_xflags_to_iflags(__u32 xflags)
 {
-	int oldflags, err, release;
+	unsigned long iflags = 0;
+
+	if (xflags & FS_XFLAG_SYNC)
+		iflags |= UBIFS_SYNC_FL;
+	if (xflags & FS_XFLAG_IMMUTABLE)
+		iflags |= UBIFS_IMMUTABLE_FL;
+	if (xflags & FS_XFLAG_APPEND)
+		iflags |= UBIFS_APPEND_FL;
+
+        return iflags;
+}
+
+/* Transfer internal flags to xflags */
+static __u32 ubifs_iflags_to_xflags(unsigned long flags)
+{
+	__u32 xflags = 0;
+
+	if (flags & UBIFS_SYNC_FL)
+		xflags |= FS_XFLAG_SYNC;
+	if (flags & UBIFS_IMMUTABLE_FL)
+		xflags |= FS_XFLAG_IMMUTABLE;
+	if (flags & UBIFS_APPEND_FL)
+		xflags |= FS_XFLAG_APPEND;
+
+        return xflags;
+}
+
+static void ubifs_fill_fsxattr(struct inode *inode, struct fsxattr *fa)
+{
+	struct ubifs_inode *ui = ubifs_inode(inode);
+
+	simple_fill_fsxattr(fa, ubifs_iflags_to_xflags(ui->flags));
+}
+
+static int setflags(struct file *file, int flags, struct fsxattr *fa)
+{
+	int ubi_flags, oldflags, err, release;
 	struct inode *inode = file_inode(file);
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -116,6 +153,13 @@ static int setflags(struct file *file, int flags)
 	if (!inode_owner_or_capable(inode))
 		return -EACCES;
 
+	ubifs_assert(c, !(flags && fa));
+
+	if (fa)
+		ubi_flags = ubifs_xflags_to_iflags(fa->fsx_xflags);
+	else
+		ubi_flags = ioctl2ubifs(flags);
+
 	/*
 	 * Make sure the file-system is read-write and make sure it
 	 * will not become read-only while we are changing the flags.
@@ -132,12 +176,24 @@ static int setflags(struct file *file, int flags)
 
 	mutex_lock(&ui->ui_mutex);
 	oldflags = ubifs2ioctl(ui->flags);
-	err = vfs_ioc_setflags_prepare(inode, oldflags, flags);
+	err = vfs_ioc_setflags_prepare(inode, oldflags, ubifs2ioctl(ubi_flags));
 	if (err)
 		goto out_unlock;
 
 	ui->flags &= ~ioctl2ubifs(UBIFS_SETTABLE_IOCTL_FLAGS);
-	ui->flags |= ioctl2ubifs(flags);
+
+	if (fa) {
+		struct fsxattr old_fa;
+
+		ubifs_fill_fsxattr(inode, &old_fa);
+
+		err = vfs_ioc_fssetxattr_check(inode, &old_fa, fa);
+		if (err)
+			goto out_unlock;
+	}
+
+	ui->flags |= ubi_flags;
+
 	ubifs_set_inode_flags(inode);
 	inode->i_ctime = current_time(inode);
 	release = ui->dirty;
@@ -162,6 +218,41 @@ static int setflags(struct file *file, int flags)
 	return err;
 }
 
+static int ubifs_ioc_fsgetxattr(struct file *file, void __user *arg)
+{
+	struct inode *inode = file_inode(file);
+	struct fsxattr fa;
+
+	ubifs_fill_fsxattr(inode, &fa);
+
+	if (copy_to_user(arg, &fa, sizeof(fa)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int check_xflags(unsigned int flags)
+{
+	if (flags & ~(FS_XFLAG_SYNC | FS_XFLAG_IMMUTABLE | FS_XFLAG_APPEND))
+		return -EOPNOTSUPP;
+	return 0;
+}
+
+static int ubifs_ioc_fssetxattr(struct file *file, const void __user *arg)
+{
+	struct fsxattr fa;
+	int err;
+
+	if (copy_from_user(&fa, (struct fsxattr __user *)arg, sizeof(fa)))
+		return -EFAULT;
+
+	err = check_xflags(fa.fsx_xflags);
+	if (err)
+		return err;
+
+	return setflags(file, 0, &fa);
+}
+
 long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	int flags, err;
@@ -186,7 +277,7 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			flags &= ~FS_DIRSYNC_FL;
 
 
-		return setflags(file, flags);
+		return setflags(file, flags, NULL);
 	}
 	case FS_IOC_SET_ENCRYPTION_POLICY: {
 		struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -218,6 +309,12 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC_GET_ENCRYPTION_NONCE:
 		return fscrypt_ioctl_get_nonce(file, (void __user *)arg);
 
+	case FS_IOC_FSGETXATTR:
+		return ubifs_ioc_fsgetxattr(file, (void __user *)arg);
+
+	case FS_IOC_FSSETXATTR:
+		return ubifs_ioc_fssetxattr(file, (const void __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
