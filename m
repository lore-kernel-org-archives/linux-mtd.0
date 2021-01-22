Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08605C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2EE9235DD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 15:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2EE9235DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YsGM9Q4jxnBEenom1ydAv3D8uSaarY4S+GCKAk7MI/g=; b=WRZT0gjR9RKnCfLsEpNQKlePD
	GGw6iNurvGWkyrDTALnEyLtuxQuN8ttp2sgL3s/9Au70P8NQGaRO+2Czjwaml83QEWq6bIc4uCuNW
	iE13GDv2cJndd9e4zEzRXOwrbyErbCip15QpF6oCMi6+byMZtjSHH1FqfLRPkYFgioEmShpY/ZkxP
	6YYdZ8DJxrQ5E+lhS5Ftr5R+TBuQaphel6fObd8i3WulMIOxyvuCUKCl1wZ2MATuwATHy/ecdHP46
	gVnrWf1TxCNtEEWEAnHNjoUfu11+3pJ69mk9N71Fq91Fsjy5XAWueliCDwkIN5Jwb/wJNfDI2MWwM
	ZZG+SNsnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2yAn-00072P-3H; Fri, 22 Jan 2021 15:16:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2yAh-0006zK-0Y
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2021 15:16:24 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA1-0004Bs-HA; Fri, 22 Jan 2021 16:15:41 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1l2yA0-0003ql-OG; Fri, 22 Jan 2021 16:15:40 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 2/8] ubifs: move checks and preparation into setflags()
Date: Fri, 22 Jan 2021 16:15:30 +0100
Message-Id: <20210122151536.7982-3-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20210122_101623_095882_943DDDFA 
X-CRM114-Status: GOOD (  18.15  )
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

setflags() can be reused for upcoming FS_IOC_FS[SG]ETXATTR ioctl support.
In preparation for that move the checks and preparation into that
function so we can reuse them as well.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/ioctl.c | 46 +++++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 4363d85a3fd4..b64a9cec7d47 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -101,18 +101,35 @@ static int ubifs2ioctl(int ubifs_flags)
 	return ioctl_flags;
 }
 
-static int setflags(struct inode *inode, int flags)
+static int setflags(struct file *file, int flags)
 {
 	int oldflags, err, release;
+	struct inode *inode = file_inode(file);
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct ubifs_budget_req req = { .dirtied_ino = 1,
 					.dirtied_ino_d = ui->data_len };
 
-	err = ubifs_budget_space(c, &req);
+	if (IS_RDONLY(inode))
+		return -EROFS;
+
+	if (!inode_owner_or_capable(inode))
+		return -EACCES;
+
+	/*
+	 * Make sure the file-system is read-write and make sure it
+	 * will not become read-only while we are changing the flags.
+	 */
+	err = mnt_want_write_file(file);
 	if (err)
 		return err;
 
+	dbg_gen("set flags: %#x, i_flags %#x", flags, inode->i_flags);
+
+	err = ubifs_budget_space(c, &req);
+	if (err)
+		goto out_drop;
+
 	mutex_lock(&ui->ui_mutex);
 	oldflags = ubifs2ioctl(ui->flags);
 	err = vfs_ioc_setflags_prepare(inode, oldflags, flags);
@@ -131,11 +148,17 @@ static int setflags(struct inode *inode, int flags)
 		ubifs_release_budget(c, &req);
 	if (IS_SYNC(inode))
 		err = write_inode_now(inode, 1);
+
+	mnt_drop_write_file(file);
+
 	return err;
 
 out_unlock:
 	mutex_unlock(&ui->ui_mutex);
 	ubifs_release_budget(c, &req);
+out_drop:
+	mnt_drop_write_file(file);
+
 	return err;
 }
 
@@ -152,12 +175,6 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return put_user(flags, (int __user *) arg);
 
 	case FS_IOC_SETFLAGS: {
-		if (IS_RDONLY(inode))
-			return -EROFS;
-
-		if (!inode_owner_or_capable(inode))
-			return -EACCES;
-
 		if (get_user(flags, (int __user *) arg))
 			return -EFAULT;
 
@@ -168,17 +185,8 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (!S_ISDIR(inode->i_mode))
 			flags &= ~FS_DIRSYNC_FL;
 
-		/*
-		 * Make sure the file-system is read-write and make sure it
-		 * will not become read-only while we are changing the flags.
-		 */
-		err = mnt_want_write_file(file);
-		if (err)
-			return err;
-		dbg_gen("set flags: %#x, i_flags %#x", flags, inode->i_flags);
-		err = setflags(inode, flags);
-		mnt_drop_write_file(file);
-		return err;
+
+		return setflags(file, flags);
 	}
 	case FS_IOC_SET_ENCRYPTION_POLICY: {
 		struct ubifs_info *c = inode->i_sb->s_fs_info;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
