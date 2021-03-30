Return-Path: <SRS0=LUPw=I4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356D9C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:45:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C976E61985
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Mar 2021 10:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C976E61985
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bKHOG6JDP62c3sjxRFoB7c6q61gfFHW3+eam3E+VvS0=; b=Op6A/4AgRIUP4SULTv3FTy2W1
	WS38c4GRvkmJA4I3MGiY0yCXTAjHQmPPfubwsoI69BXB8dGE/4x5eTVL12vPUbjB7b9e2XxhOJr4O
	AVoue6sybNViKz/80murEvNy1XBoSbsUM1rsXLUwORmrNnNrt0KSRQDQyEA+3mqb8NNK0GzLM/+lX
	D6fgmYn/2dAM/8Fm3bAltebqDlPXGCQYQeeCRcBnhBaAiCZNVluekzKovT9iArdqICIq25ACoLxGb
	vO8o4y0gd1MCAgT3SmXYS7scwNh8PZD43T0D1TncFKZzivyJYzOxIix3rKP8v7owUUO7CeLNPnJDM
	9IKbuWl7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBrN-003RJ4-QE; Tue, 30 Mar 2021 10:44:33 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBr3-003REo-DJ
 for linux-mtd@lists.infradead.org; Tue, 30 Mar 2021 10:44:15 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lRBqu-0006SI-NQ; Tue, 30 Mar 2021 12:44:04 +0200
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lRBqt-0006OZ-QX; Tue, 30 Mar 2021 12:44:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de, Jan Kara <jack@suse.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/7] ubifs: move checks and preparation into setflags()
Date: Tue, 30 Mar 2021 12:43:45 +0200
Message-Id: <20210330104351.21328-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330104351.21328-1-s.hauer@pengutronix.de>
References: <20210330104351.21328-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_114413_746887_333F18F5 
X-CRM114-Status: GOOD (  17.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
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
index 2326d5122beb..89533f92b356 100644
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
+	if (!inode_owner_or_capable(&init_user_ns, inode))
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
-		if (!inode_owner_or_capable(&init_user_ns, inode))
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
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
