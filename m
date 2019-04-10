Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B53C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 20:26:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24A862082E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 20:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aPzy06fs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xfxnsur+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24A862082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOKFg1BP2B0cJEQvvoShwSTjsKLsvma4m728yBJ8d7Y=; b=aPzy06fsJyjqRT
	2o2nCP4Cq+Sgk+NYeWh+bd2xiTtpDT4ZBnU/K56d0ePQWlpIam2jbZ5VvuKePMt15DtJTwjec+Woq
	T8mWAGM+54Q96wlLYo/gg7zyB1JPncNhwhpwFQHyrMRdb6WddMr1ZJ1FcGW8ttPlzSpGErqlMlYVO
	9C7wg5vzUDuyMYTImjcZOjZT+2G9zcEIBMn062gcrcp2D9tRppDq3sM+FvNsePKafaxfMtWepk4tI
	xbYs+1LTVw26keytomAb5cORxszeFakFADXISHhc9LuBK7nPsecCPZBh1yyWQ0nPQtH02jqYhYaUd
	tg12nzgOIypvrf9HL57Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEJnh-0000Wk-TE; Wed, 10 Apr 2019 20:26:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEJnN-0008Vz-I5
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 20:26:12 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E3D42133D;
 Wed, 10 Apr 2019 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554927969;
 bh=VDmT4xzZUjDkDpFHhejkkvkOiLKui48p6i+hZ0JUYRM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xfxnsur+xcfBjsUiulzuVBPdpTXd6yg3nR7qkYnmFRT4cqYMtxmDC96sFmi8pUyB8
 HA+0NPnEBn2jFvgHiEr6JjVF1OR63J6/cd9lNqUQXwAt9MK7F59ptW1QnevwBPVoJt
 xyOzSLomMYvHTIEMVMdseom1So0lXVJRzb6+g1vc=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 2/2] fscrypt: cache decrypted symlink target in ->i_link
Date: Wed, 10 Apr 2019 13:21:15 -0700
Message-Id: <20190410202115.64501-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
In-Reply-To: <20190410202115.64501-1-ebiggers@kernel.org>
References: <20190410202115.64501-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_132609_637484_A8C21E70 
X-CRM114-Status: GOOD (  19.99  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Path lookups that traverse encrypted symlink(s) are very slow because
each encrypted symlink needs to be decrypted each time it's followed.
This also involves dropping out of rcu-walk mode.

Make encrypted symlinks faster by caching the decrypted symlink target
in ->i_link.  The first call to fscrypt_get_symlink() sets it.  Then,
the existing VFS path lookup code uses the non-NULL ->i_link to take the
fast path where ->get_link() isn't called, and lookups in rcu-walk mode
remain in rcu-walk mode.

Also set ->i_link immediately when a new encrypted symlink is created.

To safely free the symlink target after an RCU grace period has elapsed,
introduce a new function fscrypt_free_inode(), and make the relevant
filesystems call it just before actually freeing the inode.

Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       | 40 +++++++++++++++++++++++++++++++++-------
 fs/crypto/keyinfo.c     | 21 +++++++++++++++++++++
 fs/ext4/super.c         |  3 +++
 fs/f2fs/super.c         |  3 +++
 fs/ubifs/super.c        |  3 +++
 include/linux/fscrypt.h |  5 +++++
 6 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 56debb1fcf5eb..0bbe88a4d4b3f 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -179,11 +179,9 @@ int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 	sd->len = cpu_to_le16(ciphertext_len);
 
 	err = fname_encrypt(inode, &iname, sd->encrypted_path, ciphertext_len);
-	if (err) {
-		if (!disk_link->name)
-			kfree(sd);
-		return err;
-	}
+	if (err)
+		goto err_free_sd;
+
 	/*
 	 * Null-terminating the ciphertext doesn't make sense, but we still
 	 * count the null terminator in the length, so we might as well
@@ -191,9 +189,20 @@ int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 	 */
 	sd->encrypted_path[ciphertext_len] = '\0';
 
+	/* Cache the plaintext symlink target for later use by get_link() */
+	err = -ENOMEM;
+	inode->i_link = kmemdup(target, len + 1, GFP_NOFS);
+	if (!inode->i_link)
+		goto err_free_sd;
+
 	if (!disk_link->name)
 		disk_link->name = (unsigned char *)sd;
 	return 0;
+
+err_free_sd:
+	if (!disk_link->name)
+		kfree(sd);
+	return err;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_encrypt_symlink);
 
@@ -202,7 +211,7 @@ EXPORT_SYMBOL_GPL(__fscrypt_encrypt_symlink);
  * @inode: the symlink inode
  * @caddr: the on-disk contents of the symlink
  * @max_size: size of @caddr buffer
- * @done: if successful, will be set up to free the returned target
+ * @done: if successful, will be set up to free the returned target if needed
  *
  * If the symlink's encryption key is available, we decrypt its target.
  * Otherwise, we encode its target for presentation.
@@ -217,12 +226,18 @@ const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 {
 	const struct fscrypt_symlink_data *sd;
 	struct fscrypt_str cstr, pstr;
+	bool has_key;
 	int err;
 
 	/* This is for encrypted symlinks only */
 	if (WARN_ON(!IS_ENCRYPTED(inode)))
 		return ERR_PTR(-EINVAL);
 
+	/* If the decrypted target is already cached, just return it. */
+	pstr.name = READ_ONCE(inode->i_link);
+	if (pstr.name)
+		return pstr.name;
+
 	/*
 	 * Try to set up the symlink's encryption key, but we can continue
 	 * regardless of whether the key is available or not.
@@ -230,6 +245,7 @@ const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 	err = fscrypt_get_encryption_info(inode);
 	if (err)
 		return ERR_PTR(err);
+	has_key = fscrypt_has_encryption_key(inode);
 
 	/*
 	 * For historical reasons, encrypted symlink targets are prefixed with
@@ -261,7 +277,17 @@ const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 		goto err_kfree;
 
 	pstr.name[pstr.len] = '\0';
-	set_delayed_call(done, kfree_link, pstr.name);
+
+	/*
+	 * Cache decrypted symlink targets in i_link for later use.  Don't cache
+	 * symlink targets encoded without the key, since those become outdated
+	 * once the key is added.  This pairs with the READ_ONCE() above and in
+	 * the VFS path lookup code.
+	 */
+	if (!has_key ||
+	    cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
+		set_delayed_call(done, kfree_link, pstr.name);
+
 	return pstr.name;
 
 err_kfree:
diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index 322ce9686bdba..34c4682f23bee 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -584,9 +584,30 @@ int fscrypt_get_encryption_info(struct inode *inode)
 }
 EXPORT_SYMBOL(fscrypt_get_encryption_info);
 
+/**
+ * fscrypt_put_encryption_info - free most of an inode's fscrypt data
+ *
+ * Free the inode's fscrypt_info.  Filesystems must call this when the inode is
+ * being evicted.  An RCU grace period need not have elapsed yet.
+ */
 void fscrypt_put_encryption_info(struct inode *inode)
 {
 	put_crypt_info(inode->i_crypt_info);
 	inode->i_crypt_info = NULL;
 }
 EXPORT_SYMBOL(fscrypt_put_encryption_info);
+
+/**
+ * fscrypt_free_inode - free an inode's fscrypt data requiring RCU delay
+ *
+ * Free the inode's cached decrypted symlink target, if any.  Filesystems must
+ * call this after an RCU grace period, just before they free the inode.
+ */
+void fscrypt_free_inode(struct inode *inode)
+{
+	if (IS_ENCRYPTED(inode) && S_ISLNK(inode->i_mode)) {
+		kfree(inode->i_link);
+		inode->i_link = NULL;
+	}
+}
+EXPORT_SYMBOL(fscrypt_free_inode);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 6ed4eb81e6743..5b92054bf8ea0 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1110,6 +1110,9 @@ static int ext4_drop_inode(struct inode *inode)
 static void ext4_i_callback(struct rcu_head *head)
 {
 	struct inode *inode = container_of(head, struct inode, i_rcu);
+
+	fscrypt_free_inode(inode);
+
 	kmem_cache_free(ext4_inode_cachep, EXT4_I(inode));
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f2aaa2cc6b3e0..11b3a039a1881 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1003,6 +1003,9 @@ static void f2fs_dirty_inode(struct inode *inode, int flags)
 static void f2fs_i_callback(struct rcu_head *head)
 {
 	struct inode *inode = container_of(head, struct inode, i_rcu);
+
+	fscrypt_free_inode(inode);
+
 	kmem_cache_free(f2fs_inode_cachep, F2FS_I(inode));
 }
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 12628184772c0..19fd210987457 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -276,7 +276,10 @@ static void ubifs_i_callback(struct rcu_head *head)
 {
 	struct inode *inode = container_of(head, struct inode, i_rcu);
 	struct ubifs_inode *ui = ubifs_inode(inode);
+
 	kfree(ui->data);
+	fscrypt_free_inode(inode);
+
 	kmem_cache_free(ubifs_inode_slab, ui);
 }
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e5194fc3983e9..9215fca9fd835 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -114,6 +114,7 @@ extern int fscrypt_inherit_context(struct inode *, struct inode *,
 /* keyinfo.c */
 extern int fscrypt_get_encryption_info(struct inode *);
 extern void fscrypt_put_encryption_info(struct inode *);
+extern void fscrypt_free_inode(struct inode *);
 
 /* fname.c */
 extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
@@ -322,6 +323,10 @@ static inline void fscrypt_put_encryption_info(struct inode *inode)
 	return;
 }
 
+static inline void fscrypt_free_inode(struct inode *inode)
+{
+}
+
  /* fname.c */
 static inline int fscrypt_setup_filename(struct inode *dir,
 					 const struct qstr *iname,
-- 
2.21.0.392.gf8f6787159e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
