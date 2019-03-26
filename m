Return-Path: <SRS0=gzro=R5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C34E8C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:53:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E04320828
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2019 07:53:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmMTYv7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E04320828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTXNEJbMK19HpWG7U1VZIPSnyPyCrsE7Z1W0UHpN+K4=; b=BmMTYv7vsMhVgb
	iK/V/4C5axj7hbT4sNIz3R/XBTiN7rwQCD07Yh9XP52fRuXgBoDumkGb4p4x7io8Zmnc5RcTHr+BQ
	4GZOy1SmfkvKF1ww2sNUhn0jniO8D73yyywrvcAViYlQz+yYQCMnlkXL/bDty5VxwEpCdAtiOLNQa
	gSHYBNqnQH+JWCmX5JtjFS6eIesn7hceWUaD3+Yqoidllh0Z/OaqiZEVGG/YtSw7K8xZ9xJ2GZTub
	/fvoRLlnSmMlwDbgDr6mdDAUy2H5JJqFdHj4B2bqLc0OFbt0WZ4LzzQAQGbpVRpo0RRjxoZ+zRc5d
	ElGlwkmHFaZnPa+nIqGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8gtG-0002td-Ut; Tue, 26 Mar 2019 07:52:58 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8gt8-0002lA-Rw
 for linux-mtd@lists.infradead.org; Tue, 26 Mar 2019 07:52:52 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1h8gss-0004MS-Ic; Tue, 26 Mar 2019 08:52:34 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1h8gsr-00038R-NQ; Tue, 26 Mar 2019 08:52:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] ubifs: Remove #ifdef around CONFIG_FS_ENCRYPTION
Date: Tue, 26 Mar 2019 08:52:31 +0100
Message-Id: <20190326075232.11717-2-s.hauer@pengutronix.de>
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
X-CRM114-CacheID: sfid-20190326_005251_226970_8DE51220 
X-CRM114-Status: GOOD (  15.78  )
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

ifdefs reduce readablity and compile coverage. This removes the ifdefs
around CONFIG_FS_ENCRYPTION by using IS_ENABLED and relying on static
inline wrappers. A new static inline wrapper for setting sb->s_cop is
introduced to allow filesystems to unconditionally compile in their
s_cop operations.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/ioctl.c        | 11 +----------
 fs/ubifs/sb.c           |  7 ++++---
 fs/ubifs/super.c        |  4 +---
 include/linux/fscrypt.h | 11 +++++++++++
 4 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 82e4e6a30b04..6b05b3ec500e 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -193,7 +193,6 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		return err;
 	}
 	case FS_IOC_SET_ENCRYPTION_POLICY: {
-#ifdef CONFIG_FS_ENCRYPTION
 		struct ubifs_info *c = inode->i_sb->s_fs_info;
 
 		err = ubifs_enable_encryption(c);
@@ -201,17 +200,9 @@ long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 			return err;
 
 		return fscrypt_ioctl_set_policy(file, (const void __user *)arg);
-#else
-		return -EOPNOTSUPP;
-#endif
 	}
-	case FS_IOC_GET_ENCRYPTION_POLICY: {
-#ifdef CONFIG_FS_ENCRYPTION
+	case FS_IOC_GET_ENCRYPTION_POLICY:
 		return fscrypt_ioctl_get_policy(file, (void __user *)arg);
-#else
-		return -EOPNOTSUPP;
-#endif
-	}
 
 	default:
 		return -ENOTTY;
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 67fac1e8adfb..2afc8b1d4c3b 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -748,14 +748,12 @@ int ubifs_read_superblock(struct ubifs_info *c)
 		goto out;
 	}
 
-#ifndef CONFIG_FS_ENCRYPTION
-	if (c->encrypted) {
+	if (!IS_ENABLED(CONFIG_UBIFS_FS_ENCRYPTION) && c->encrypted) {
 		ubifs_err(c, "file system contains encrypted files but UBIFS"
 			     " was built without crypto support.");
 		err = -EINVAL;
 		goto out;
 	}
-#endif
 
 	/* Automatically increase file system size to the maximum size */
 	c->old_leb_cnt = c->leb_cnt;
@@ -943,6 +941,9 @@ int ubifs_enable_encryption(struct ubifs_info *c)
 	int err;
 	struct ubifs_sb_node *sup = c->sup_node;
 
+	if (!IS_ENABLED(CONFIG_UBIFS_FS_ENCRYPTION))
+		return -EOPNOTSUPP;
+
 	if (c->encrypted)
 		return 0;
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 8dc2818fdd84..e6da7fc0e2a4 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2146,9 +2146,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 #ifdef CONFIG_UBIFS_FS_XATTR
 	sb->s_xattr = ubifs_xattr_handlers;
 #endif
-#ifdef CONFIG_FS_ENCRYPTION
-	sb->s_cop = &ubifs_crypt_operations;
-#endif
+	fscrypt_set_ops(sb, &ubifs_crypt_operations);
 
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e5194fc3983e..9a5792dac16a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -230,6 +230,11 @@ extern int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 extern const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 				       unsigned int max_size,
 				       struct delayed_call *done);
+static inline void fscrypt_set_ops(struct super_block *sb,
+				   const struct fscrypt_operations *s_cop)
+{
+	sb->s_cop = s_cop;
+}
 #else  /* !CONFIG_FS_ENCRYPTION */
 
 static inline bool fscrypt_has_encryption_key(const struct inode *inode)
@@ -446,6 +451,12 @@ static inline const char *fscrypt_get_symlink(struct inode *inode,
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
+
+static inline void fscrypt_set_ops(struct super_block *sb,
+				   const struct fscrypt_operations *s_cop)
+{
+}
+
 #endif	/* !CONFIG_FS_ENCRYPTION */
 
 /**
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
