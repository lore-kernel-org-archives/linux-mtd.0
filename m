Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4DBC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:52:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BE120828
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jRFZdJPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6BE120828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuhANcJ/4lrnHy/Xzu1x9RH+0LtGDuADWuT2Fj+D5pg=; b=jRFZdJPzmMi1KR
	4VJDsSvdcrtitun/jCAJWDMb4oHVyIkhV153u4sIM6qcQJ9qr0D4ENx4KPxpbgV7mhIWLtOt8yC42
	MNWbDCZN43K0R5fK0hqwYN3oAe4Fnr1BG8CresdTLFWiDQAVFt8DUSJDG8wMSQhNe9lLghnfGFJz2
	shbuZw+urI0fM2PmtMViGYgEGCsO94FqFk8H1RK1POeJhrZZpUg7e+OPgEWWSeFj9Yp/CdgiG7HB/
	htV0DGuvo8NEQcIhKjK1iEsZHG0yCr1ncELe4J/HWXsX+W/qWGHDrIRXMNhFSUef6DVT8Lp0gFiUn
	rZync56rRlxgX5VJ4swA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8gtB-0002mn-78; Tue, 26 Mar 2019 07:52:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8gt8-0002lV-KU
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 07:52:52 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1h8gss-0004MR-Ic; Tue, 26 Mar 2019 08:52:34 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1h8gsr-00038T-O5; Tue, 26 Mar 2019 08:52:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] ubifs: Remove ifdefs around CONFIG_UBIFS_ATIME_SUPPORT
Date: Tue, 26 Mar 2019 08:52:32 +0100
Message-Id: <20190326075232.11717-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190326075232.11717-1-s.hauer@pengutronix.de>
References: <20190326075232.11717-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_005251_000150_B7461BC3 
X-CRM114-Status: GOOD (  15.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ifdefs reduce readability and compile coverage. This removes the ifdefs
around CONFIG_UBIFS_ATIME_SUPPORT by replacing them with IS_ENABLED()
where applicable. The fs layer would fall back to generic_update_time()
when .update_time doesn't exist. We do this fallback explicitly now.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/dir.c   |  2 --
 fs/ubifs/file.c  | 16 +++++++---------
 fs/ubifs/super.c | 16 ++++++++--------
 fs/ubifs/ubifs.h |  2 --
 4 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5767b373a8ff..cb286fd075fc 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1652,9 +1652,7 @@ const struct inode_operations ubifs_dir_inode_operations = {
 #ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
 #endif
-#ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
-#endif
 	.tmpfile     = ubifs_tmpfile,
 };
 
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5d2ffb1a45fc..512e7d9c60cd 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1375,7 +1375,6 @@ static inline int mctime_update_needed(const struct inode *inode,
 	return 0;
 }
 
-#ifdef CONFIG_UBIFS_ATIME_SUPPORT
 /**
  * ubifs_update_time - update time of inode.
  * @inode: inode to update
@@ -1392,6 +1391,9 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
 	int iflags = I_DIRTY_TIME;
 	int err, release;
 
+	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
+		return generic_update_time(inode, time, flags);
+
 	err = ubifs_budget_space(c, &req);
 	if (err)
 		return err;
@@ -1414,7 +1416,6 @@ int ubifs_update_time(struct inode *inode, struct timespec64 *time,
 		ubifs_release_budget(c, &req);
 	return 0;
 }
-#endif
 
 /**
  * update_mctime - update mtime and ctime of an inode.
@@ -1623,9 +1624,10 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	if (err)
 		return err;
 	vma->vm_ops = &ubifs_file_vm_ops;
-#ifdef CONFIG_UBIFS_ATIME_SUPPORT
-	file_accessed(file);
-#endif
+
+	if (IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
+		file_accessed(file);
+
 	return 0;
 }
 
@@ -1663,9 +1665,7 @@ const struct inode_operations ubifs_file_inode_operations = {
 #ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
 #endif
-#ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
-#endif
 };
 
 const struct inode_operations ubifs_symlink_inode_operations = {
@@ -1675,9 +1675,7 @@ const struct inode_operations ubifs_symlink_inode_operations = {
 #ifdef CONFIG_UBIFS_FS_XATTR
 	.listxattr   = ubifs_listxattr,
 #endif
-#ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
-#endif
 };
 
 const struct file_operations ubifs_file_operations = {
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e6da7fc0e2a4..2c647d66e48e 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -129,9 +129,10 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 		goto out_ino;
 
 	inode->i_flags |= S_NOCMTIME;
-#ifndef CONFIG_UBIFS_ATIME_SUPPORT
-	inode->i_flags |= S_NOATIME;
-#endif
+
+	if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
+		inode->i_flags |= S_NOATIME;
+
 	set_nlink(inode, le32_to_cpu(ino->nlink));
 	i_uid_write(inode, le32_to_cpu(ino->uid));
 	i_gid_write(inode, le32_to_cpu(ino->gid));
@@ -2248,11 +2249,10 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
 			goto out_deact;
 		/* We do not support atime */
 		sb->s_flags |= SB_ACTIVE;
-#ifndef CONFIG_UBIFS_ATIME_SUPPORT
-		sb->s_flags |= SB_NOATIME;
-#else
-		ubifs_msg(c, "full atime support is enabled.");
-#endif
+		if (IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
+			ubifs_msg(c, "full atime support is enabled.");
+		else
+			sb->s_flags |= SB_NOATIME;
 	}
 
 	/* 'fill_super()' opens ubi again so we must close it here */
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 1ae12900e01d..69dfd64d3d00 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1996,9 +1996,7 @@ int ubifs_calc_dark(const struct ubifs_info *c, int spc);
 /* file.c */
 int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 int ubifs_setattr(struct dentry *dentry, struct iattr *attr);
-#ifdef CONFIG_UBIFS_ATIME_SUPPORT
 int ubifs_update_time(struct inode *inode, struct timespec64 *time, int flags);
-#endif
 
 /* dir.c */
 struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
