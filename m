Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CE9C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4B820815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gTml+kcJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7pAok8I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4B820815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mz18MShlgZkU3bXc0kNZ5vh8QLc+tr4oWUBU0GDsCLc=; b=gTml+kcJ5ScGoo
	Ko9V1ogDZCCaVMpqQKgnwaq0CSopcwJxLZNB+oJpzRVKSdpmVrIVh61uHzzvmvPZCNGMIag1Z2pz9
	LrqMuzXJGt6KDyAVfdF9CiOxOqls1HY7mn0xqTLdY7pggeHII37po5gvJ4qI+FqmueH/agmJlymU3
	qRDonT7YXRzUQQTsidAGxh2LgYhvotIDg3Hq4p0c3DpGr8HOkXvHw0iuoWJ3sDBEDWBYXYvtAJxHc
	6s1z0LMx906GemIxToK8yc4mf3UE3aCkbyLr1eL3Awihlu7i2MrQWBbgsKlQSS35RridPY6q1ATqu
	4FJV3XsBKN/FlR0q4B8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlBz-0004Hk-67; Mon, 20 May 2019 16:31:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlB9-00034x-BF
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 16:30:25 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75E952173C;
 Mon, 20 May 2019 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369822;
 bh=YFNzSvg/+MDLitcd1QNpcVpA4+wyTUZ+/r0vkLTqq0k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O7pAok8IEBV5OA3zUbAW5iySnocSDF3dhyW8Rs8LYjILJ5FvABSYFGTSBZ58+cDGu
 S2zJ0aE0WC89S1owYpzQSV3tpJLo9BPKDbwRstlx76JVH15V5vHz1XPlsSn65NzymM
 1eqHXVBf5ot+HAmebVIHFTRF/zGf3VEA+tAXaVQg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 05/14] fscrypt: introduce fscrypt_encrypt_block_inplace()
Date: Mon, 20 May 2019 09:29:43 -0700
Message-Id: <20190520162952.156212-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_093023_469810_129A84A9 
X-CRM114-Status: GOOD (  19.93  )
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

fscrypt_encrypt_page() behaves very differently depending on whether the
filesystem set FS_CFLG_OWN_PAGES in its fscrypt_operations.  This makes
the function difficult to understand and document.  It also makes it so
that all callers have to provide inode and lblk_num, when fscrypt could
determine these itself for pagecache pages.

Therefore, move the FS_CFLG_OWN_PAGES behavior into a new function
fscrypt_encrypt_block_inplace().

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c      | 50 +++++++++++++++++++++++++----------------
 fs/ubifs/crypto.c       | 12 +++++-----
 include/linux/fscrypt.h | 13 +++++++++++
 3 files changed, 50 insertions(+), 25 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 9cda0147fca95..6877b7c6165de 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -199,8 +199,7 @@ int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
 /**
  * fscypt_encrypt_page() - Encrypts a page
  * @inode:     The inode for which the encryption should take place
- * @page:      The page to encrypt. Must be locked for bounce-page
- *             encryption.
+ * @page:      The page to encrypt. Must be locked.
  * @len:       Length of data to encrypt in @page and encrypted
  *             data in returned page.
  * @offs:      Offset of data within @page and returned
@@ -210,10 +209,9 @@ int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
  *             previously written data.
  * @gfp_flags: The gfp flag for memory allocation
  *
- * Encrypts @page.  If the filesystem set FS_CFLG_OWN_PAGES, then the data is
- * encrypted in-place and @page is returned.  Else, a bounce page is allocated,
- * the data is encrypted into the bounce page, and the bounce page is returned.
- * The caller is responsible for calling fscrypt_free_bounce_page().
+ * Encrypts @page.  A bounce page is allocated, the data is encrypted into the
+ * bounce page, and the bounce page is returned.  The caller is responsible for
+ * calling fscrypt_free_bounce_page().
  *
  * Return: A page containing the encrypted data on success, else an ERR_PTR()
  */
@@ -224,24 +222,12 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 				u64 lblk_num, gfp_t gfp_flags)
 
 {
-	struct page *ciphertext_page = page;
+	struct page *ciphertext_page;
 	int err;
 
-	if (inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES) {
-		/* with inplace-encryption we just encrypt the page */
-		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num, page,
-					  ciphertext_page, len, offs,
-					  gfp_flags);
-		if (err)
-			return ERR_PTR(err);
-
-		return ciphertext_page;
-	}
-
 	if (WARN_ON_ONCE(!PageLocked(page)))
 		return ERR_PTR(-EINVAL);
 
-	/* The encryption operation will require a bounce page. */
 	ciphertext_page = fscrypt_alloc_bounce_page(gfp_flags);
 	if (!ciphertext_page)
 		return ERR_PTR(-ENOMEM);
@@ -258,6 +244,32 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 }
 EXPORT_SYMBOL(fscrypt_encrypt_page);
 
+/**
+ * fscrypt_encrypt_block_inplace() - Encrypt a filesystem block in-place
+ * @inode:     The inode to which this block belongs
+ * @page:      The page containing the block to encrypt
+ * @len:       Size of block to encrypt.  Doesn't need to be a multiple of the
+ *		fs block size, but must be a multiple of FS_CRYPTO_BLOCK_SIZE.
+ * @offs:      Byte offset within @page at which the block to encrypt begins
+ * @lblk_num:  Filesystem logical block number of the block, i.e. the 0-based
+ *		number of the block within the file
+ * @gfp_flags: Memory allocation flags
+ *
+ * Encrypt a possibly-compressed filesystem block that is located in an
+ * arbitrary page, not necessarily in the original pagecache page.  The @inode
+ * and @lblk_num must be specified, as they can't be determined from @page.
+ *
+ * Return: 0 on success; -errno on failure
+ */
+int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
+				  unsigned int len, unsigned int offs,
+				  u64 lblk_num, gfp_t gfp_flags)
+{
+	return fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num, page, page,
+				   len, offs, gfp_flags);
+}
+EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
+
 /**
  * fscrypt_decrypt_page() - Decrypts a page in-place
  * @inode:     The corresponding inode for the page to decrypt.
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 4aaedf2d7f442..032efdad2e668 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -29,8 +29,8 @@ int ubifs_encrypt(const struct inode *inode, struct ubifs_data_node *dn,
 {
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	void *p = &dn->data;
-	struct page *ret;
 	unsigned int pad_len = round_up(in_len, UBIFS_CIPHER_BLOCK_SIZE);
+	int err;
 
 	ubifs_assert(c, pad_len <= *out_len);
 	dn->compr_size = cpu_to_le16(in_len);
@@ -39,11 +39,11 @@ int ubifs_encrypt(const struct inode *inode, struct ubifs_data_node *dn,
 	if (pad_len != in_len)
 		memset(p + in_len, 0, pad_len - in_len);
 
-	ret = fscrypt_encrypt_page(inode, virt_to_page(&dn->data), pad_len,
-			offset_in_page(&dn->data), block, GFP_NOFS);
-	if (IS_ERR(ret)) {
-		ubifs_err(c, "fscrypt_encrypt_page failed: %ld", PTR_ERR(ret));
-		return PTR_ERR(ret);
+	err = fscrypt_encrypt_block_inplace(inode, virt_to_page(p), pad_len,
+					    offset_in_page(p), block, GFP_NOFS);
+	if (err) {
+		ubifs_err(c, "fscrypt_encrypt_block_inplace() failed: %d", err);
+		return err;
 	}
 	*out_len = pad_len;
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 1c7287f146a98..a9b2d26e615d5 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -106,6 +106,10 @@ extern void fscrypt_release_ctx(struct fscrypt_ctx *);
 extern struct page *fscrypt_encrypt_page(const struct inode *, struct page *,
 						unsigned int, unsigned int,
 						u64, gfp_t);
+extern int fscrypt_encrypt_block_inplace(const struct inode *inode,
+					 struct page *page, unsigned int len,
+					 unsigned int offs, u64 lblk_num,
+					 gfp_t gfp_flags);
 extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
 				unsigned int, u64);
 
@@ -293,6 +297,15 @@ static inline struct page *fscrypt_encrypt_page(const struct inode *inode,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+static inline int fscrypt_encrypt_block_inplace(const struct inode *inode,
+						struct page *page,
+						unsigned int len,
+						unsigned int offs, u64 lblk_num,
+						gfp_t gfp_flags)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int fscrypt_decrypt_page(const struct inode *inode,
 				       struct page *page,
 				       unsigned int len, unsigned int offs,
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
