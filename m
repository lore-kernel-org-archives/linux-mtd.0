Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B069ACA0ECE
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 08:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MhyZI/tpedSy05na3kSPKceU9m7hCjjlPkRiT0iGfg=; b=xEDVCZJgjuZg2x
	RONgqY/k6cWqGpY7ZFwcM2GJMwKYb8sYf7Dydmu0ZC+m/OlfFZv2JJtXxDljzL9qxw2N+aXUtUXOt
	/fyGYFVbyCBw+8RXx+2m6ypczoBzKIUxBx69rfFY0PXAmWDm+3vX65lx06bf0KPszRFwMgTXQ/fOG
	eb+3hLDiKy7tVC0gP8A4MdeUohmGIfxahAbP8PRXdGa0nja6F9IjIi/w12S2m+CHpWoc4HS6xVbBo
	ZVKpvYP50sh9J0p4KF3fn07Ep68Qul5ZT6tAbfXwqfXSWJVwRHXTTtlOHmEa9VgTaMk7lYkLeHhyQ
	Ngi9otXl4Q3tVm4Kow2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yU-00000005QGr-0drs;
	Sun, 10 Aug 2025 08:00:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul0yQ-00000005QDt-26ve
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 08:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A92C945C4B;
	Sun, 10 Aug 2025 08:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F1C4CEF8;
	Sun, 10 Aug 2025 08:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754812808;
	bh=ossxhMeSbwY+wc2tM721ufEUUVQRG1Whjx9eAY7YJ6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OW/zUlnBbQ7Jo0JuB6qdtgbwVsVNx453zwl2DG6HVYyVJTrGu063zpBzQbFhPrsZ6
	 au10ujIrnCZpr3HEqJR25fuT36dy0DRn9uey8ZjNr0QeuX5dv4XVowx6VsccH2qBHO
	 goMmM9St0FRUa3rjciKNQtQaFwr/ufF+HRRCI/poVHyN31KjK3kmRCeZgowDcJ3TjN
	 TY4Ytqhr5xyhSrPo9CEG/cD7s76Xe3jPjWL3eYDpp1+oICAd5ksadNBIlh1cA60FrT
	 XFN5CzLOo8YDJraV56raSg9L3gMelruMe10kSenGqsTg4yKBJcyRbS3ovFwoxyd6HC
	 iT7J0xjLQV5lg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v5 02/13] fscrypt: add support for info in fs-specific part of inode
Date: Sun, 10 Aug 2025 00:56:55 -0700
Message-ID: <20250810075706.172910-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_010010_591640_2976267E 
X-CRM114-Status: GOOD (  37.30  )
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

Add an inode_info_offs field to struct fscrypt_operations, and update
fs/crypto/ to support it.  When set to a nonzero value, it specifies the
offset to the fscrypt_inode_info pointer within the filesystem-specific
part of the inode structure, to be used instead of inode::i_crypt_info.

Since this makes inode::i_crypt_info no longer necessarily used, update
comments that mentioned it.

This is a prerequisite for a later commit that removes
inode::i_crypt_info, saving memory and improving cache efficiency with
filesystems that don't support fscrypt.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/crypto/fscrypt_private.h |  4 ++--
 fs/crypto/keysetup.c        | 43 ++++++++++++++++++++++---------------
 include/linux/fscrypt.h     | 22 +++++++++++++++----
 3 files changed, 46 insertions(+), 23 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index d8b485b9881c5..245e6b84aa174 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -247,12 +247,12 @@ struct fscrypt_prepared_key {
 
 /*
  * fscrypt_inode_info - the "encryption key" for an inode
  *
  * When an encrypted file's key is made available, an instance of this struct is
- * allocated and stored in ->i_crypt_info.  Once created, it remains until the
- * inode is evicted.
+ * allocated and a pointer to it is stored in the file's in-memory inode.  Once
+ * created, it remains until the inode is evicted.
  */
 struct fscrypt_inode_info {
 
 	/* The key in a form prepared for actual encryption/decryption */
 	struct fscrypt_prepared_key ci_enc_key;
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 4f3b9ecbfe4e6..c1f85715c2760 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -640,19 +640,20 @@ fscrypt_setup_encryption_info(struct inode *inode,
 	res = setup_file_encryption_key(crypt_info, need_dirhash_key, &mk);
 	if (res)
 		goto out;
 
 	/*
-	 * For existing inodes, multiple tasks may race to set ->i_crypt_info.
-	 * So use cmpxchg_release().  This pairs with the smp_load_acquire() in
-	 * fscrypt_get_inode_info().  I.e., here we publish ->i_crypt_info with
-	 * a RELEASE barrier so that other tasks can ACQUIRE it.
+	 * For existing inodes, multiple tasks may race to set the inode's
+	 * fscrypt info pointer.  So use cmpxchg_release().  This pairs with the
+	 * smp_load_acquire() in fscrypt_get_inode_info().  I.e., publish the
+	 * pointer with a RELEASE barrier so that other tasks can ACQUIRE it.
 	 */
-	if (cmpxchg_release(&inode->i_crypt_info, NULL, crypt_info) == NULL) {
+	if (cmpxchg_release(fscrypt_inode_info_addr(inode), NULL, crypt_info) ==
+	    NULL) {
 		/*
-		 * We won the race and set ->i_crypt_info to our crypt_info.
-		 * Now link it into the master key's inode list.
+		 * We won the race and set the inode's fscrypt info to our
+		 * crypt_info.  Now link it into the master key's inode list.
 		 */
 		if (mk) {
 			crypt_info->ci_master_key = mk;
 			refcount_inc(&mk->mk_active_refs);
 			spin_lock(&mk->mk_decrypted_inodes_lock);
@@ -679,17 +680,17 @@ fscrypt_setup_encryption_info(struct inode *inode,
  *		       unrecognized encryption context) the same way as the key
  *		       being unavailable, instead of returning an error.  Use
  *		       %false unless the operation being performed is needed in
  *		       order for files (or directories) to be deleted.
  *
- * Set up ->i_crypt_info, if it hasn't already been done.
+ * Set up the inode's encryption key, if it hasn't already been done.
  *
- * Note: unless ->i_crypt_info is already set, this isn't %GFP_NOFS-safe.  So
+ * Note: unless the key setup was already done, this isn't %GFP_NOFS-safe.  So
  * generally this shouldn't be called from within a filesystem transaction.
  *
- * Return: 0 if ->i_crypt_info was set or was already set, *or* if the
- *	   encryption key is unavailable.  (Use fscrypt_has_encryption_key() to
+ * Return: 0 if the key is now set up, *or* if it couldn't be set up because the
+ *	   needed master key is absent.  (Use fscrypt_has_encryption_key() to
  *	   distinguish these cases.)  Also can return another -errno code.
  */
 int fscrypt_get_encryption_info(struct inode *inode, bool allow_unsupported)
 {
 	int res;
@@ -739,23 +740,23 @@ int fscrypt_get_encryption_info(struct inode *inode, bool allow_unsupported)
  * @dir: a possibly-encrypted directory
  * @inode: the new inode.  ->i_mode and ->i_blkbits must be set already.
  *	   ->i_ino doesn't need to be set yet.
  * @encrypt_ret: (output) set to %true if the new inode will be encrypted
  *
- * If the directory is encrypted, set up its ->i_crypt_info in preparation for
+ * If the directory is encrypted, set up its encryption key in preparation for
  * encrypting the name of the new file.  Also, if the new inode will be
- * encrypted, set up its ->i_crypt_info and set *encrypt_ret=true.
+ * encrypted, set up its encryption key too and set *encrypt_ret=true.
  *
  * This isn't %GFP_NOFS-safe, and therefore it should be called before starting
  * any filesystem transaction to create the inode.  For this reason, ->i_ino
  * isn't required to be set yet, as the filesystem may not have set it yet.
  *
  * This doesn't persist the new inode's encryption context.  That still needs to
  * be done later by calling fscrypt_set_context().
  *
- * Return: 0 on success, -ENOKEY if the encryption key is missing, or another
- *	   -errno code
+ * Return: 0 on success, -ENOKEY if a key needs to be set up for @dir or @inode
+ *	   but the needed master key is absent, or another -errno code
  */
 int fscrypt_prepare_new_inode(struct inode *dir, struct inode *inode,
 			      bool *encrypt_ret)
 {
 	const union fscrypt_policy *policy;
@@ -798,12 +799,20 @@ EXPORT_SYMBOL_GPL(fscrypt_prepare_new_inode);
  * Free the inode's fscrypt_inode_info.  Filesystems must call this when the
  * inode is being evicted.  An RCU grace period need not have elapsed yet.
  */
 void fscrypt_put_encryption_info(struct inode *inode)
 {
-	put_crypt_info(inode->i_crypt_info);
-	inode->i_crypt_info = NULL;
+	/*
+	 * Ideally we'd start with a lightweight IS_ENCRYPTED() check here
+	 * before proceeding to retrieve and check the pointer.  However, during
+	 * inode creation, the fscrypt_inode_info is set before S_ENCRYPTED.  If
+	 * an error occurs, it needs to be cleaned up regardless.
+	 */
+	struct fscrypt_inode_info **ci_addr = fscrypt_inode_info_addr(inode);
+
+	put_crypt_info(*ci_addr);
+	*ci_addr = NULL;
 }
 EXPORT_SYMBOL(fscrypt_put_encryption_info);
 
 /**
  * fscrypt_free_inode() - free an inode's fscrypt data requiring RCU delay
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 23c5198612d1a..d7ff53accbfef 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -59,10 +59,16 @@ struct fscrypt_name {
 
 #ifdef CONFIG_FS_ENCRYPTION
 
 /* Crypto operations for filesystems */
 struct fscrypt_operations {
+	/*
+	 * The offset of the pointer to struct fscrypt_inode_info in the
+	 * filesystem-specific part of the inode, relative to the beginning of
+	 * the common part of the inode (the 'struct inode').
+	 */
+	ptrdiff_t inode_info_offs;
 
 	/*
 	 * If set, then fs/crypto/ will allocate a global bounce page pool the
 	 * first time an encryption key is set up for a file.  The bounce page
 	 * pool is required by the following functions:
@@ -193,36 +199,44 @@ struct fscrypt_operations {
 };
 
 int fscrypt_d_revalidate(struct inode *dir, const struct qstr *name,
 			 struct dentry *dentry, unsigned int flags);
 
+static inline struct fscrypt_inode_info **
+fscrypt_inode_info_addr(const struct inode *inode)
+{
+	if (inode->i_sb->s_cop->inode_info_offs == 0)
+		return (struct fscrypt_inode_info **)&inode->i_crypt_info;
+	return (void *)inode + inode->i_sb->s_cop->inode_info_offs;
+}
+
 /*
  * Load the inode's fscrypt info pointer, using a raw dereference.  Since this
  * uses a raw dereference with no memory barrier, it is appropriate to use only
  * when the caller knows the inode's key setup already happened, resulting in
  * non-NULL fscrypt info.  E.g., the file contents en/decryption functions use
  * this, since fscrypt_file_open() set up the key.
  */
 static inline struct fscrypt_inode_info *
 fscrypt_get_inode_info_raw(const struct inode *inode)
 {
-	struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	struct fscrypt_inode_info *ci = *fscrypt_inode_info_addr(inode);
 
 	VFS_WARN_ON_ONCE(ci == NULL);
 	return ci;
 }
 
 static inline struct fscrypt_inode_info *
 fscrypt_get_inode_info(const struct inode *inode)
 {
 	/*
 	 * Pairs with the cmpxchg_release() in fscrypt_setup_encryption_info().
-	 * I.e., another task may publish ->i_crypt_info concurrently, executing
-	 * a RELEASE barrier.  We need to use smp_load_acquire() here to safely
+	 * I.e., another task may publish the fscrypt info concurrently,
+	 * executing a RELEASE barrier.  Use smp_load_acquire() here to safely
 	 * ACQUIRE the memory the other task published.
 	 */
-	return smp_load_acquire(&inode->i_crypt_info);
+	return smp_load_acquire(fscrypt_inode_info_addr(inode));
 }
 
 /**
  * fscrypt_needs_contents_encryption() - check whether an inode needs
  *					 contents encryption
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
