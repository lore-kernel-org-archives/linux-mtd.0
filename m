Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3F0C43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 22:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FDD2075E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 22:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uetnFn5F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRdjWLho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FDD2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SClLtYNCfH/Q6X6m7QeChbtctZlsYsvtBzDim/5PTzw=; b=uetnFn5FEwFmOI
	o7Kq61NeCFbSl8X+rAsWIDUpncnyRgYrDPB6DB2UoMcPZGg5kN0pZlQ/WxQOXlqfCy9/HfrcOrOgB
	zPAc464KDpvxixAIBiFIDassYE1e+0Eap8bMx+dBSHFfHd5fi+RTrpcVEvSbIvcQ6LRNZLkOqjNy3
	iK5R0IIiZIiXmrohwd0KCuMWJIzQsBfUSalg2UmBZsZF+VGwT+V6BxUrTeKZSuxr7I0I1lXrJdMlv
	mTecbq3gfjlISWdwQKckPoHra/nAzyq8x5YcKdjN8uosLHgqfmwBIpU4Krp+gnqHWBTYqq4f3Q/We
	QaWhhM8o1bc0bjD6sl+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLy0S-0007e2-Fe; Wed, 01 May 2019 22:47:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLxzL-00066c-O1
 for linux-mtd@lists.infradead.org; Wed, 01 May 2019 22:46:13 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4971721743;
 Wed,  1 May 2019 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556750767;
 bh=op7neLGMp7Te1ALKc0V1hrozSTyp60fX7lfPi8NT21I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CRdjWLhoP/2CDy++MB+DZ6bT7iYuP96VSERBpNyyeOoagRC5/h/KUUaulTlY9qRE9
 OzpIJgd/i+De5yeFj7QKy1Z0lnJjdMsbCrwouf7LdHIcBgrXMZp/aDMEMns2t/s13m
 PRfIqJmq35X+LbjE9K9bIsFqNNdfU+aRPEO4CrFw=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 08/13] fscrypt: introduce fscrypt_decrypt_block_inplace()
Date: Wed,  1 May 2019 15:45:10 -0700
Message-Id: <20190501224515.43059-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190501224515.43059-1-ebiggers@kernel.org>
References: <20190501224515.43059-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_154607_944064_C187BBB9 
X-CRM114-Status: GOOD (  14.85  )
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
 linux-mtd@lists.infradead.org, Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

fscrypt_decrypt_page() behaves very differently depending on whether the
filesystem set FS_CFLG_OWN_PAGES in its fscrypt_operations.  This makes
the function difficult to understand and document.  It also makes it so
that all callers have to provide inode and lblk_num, when fscrypt could
determine these itself for pagecache pages.

Therefore, move the FS_CFLG_OWN_PAGES behavior into a new function
fscrypt_decrypt_block_inplace().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c      | 31 +++++++++++++++++++++++++++----
 fs/ubifs/crypto.c       |  7 ++++---
 include/linux/fscrypt.h | 11 +++++++++++
 3 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 7bdb985126d97..2e6fb5e4f7a7f 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -284,8 +284,7 @@ EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
 /**
  * fscrypt_decrypt_page() - Decrypts a page in-place
  * @inode:     The corresponding inode for the page to decrypt.
- * @page:      The page to decrypt. Must be locked in case
- *             it is a writeback page (FS_CFLG_OWN_PAGES unset).
+ * @page:      The page to decrypt. Must be locked.
  * @len:       Number of bytes in @page to be decrypted.
  * @offs:      Start of data in @page.
  * @lblk_num:  Logical block number.
@@ -299,8 +298,7 @@ EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
 int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 			unsigned int len, unsigned int offs, u64 lblk_num)
 {
-	if (WARN_ON_ONCE(!PageLocked(page) &&
-			 !(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES)))
+	if (WARN_ON_ONCE(!PageLocked(page)))
 		return -EINVAL;
 
 	return fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page, page,
@@ -308,6 +306,31 @@ int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
 
+/**
+ * fscrypt_decrypt_block_inplace() - Decrypt a filesystem block in-place
+ * @inode:     The inode to which this block belongs
+ * @page:      The page containing the block to decrypt
+ * @len:       Size of block to decrypt.  Doesn't need to be a multiple of the
+ *		fs block size, but must be a multiple of FS_CRYPTO_BLOCK_SIZE.
+ * @offs:      Byte offset within @page at which the block to decrypt begins
+ * @lblk_num:  Filesystem logical block number of the block, i.e. the 0-based
+ *		number of the block within the file
+ *
+ * Decrypt a possibly-compressed filesystem block that is located in an
+ * arbitrary page, not necessarily in the original pagecache page.  The @inode
+ * and @lblk_num must be specified, as they can't be determined from @page.
+ *
+ * Return: 0 on success; -errno on failure
+ */
+int fscrypt_decrypt_block_inplace(const struct inode *inode, struct page *page,
+				  unsigned int len, unsigned int offs,
+				  u64 lblk_num)
+{
+	return fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page, page,
+				   len, offs, GFP_NOFS);
+}
+EXPORT_SYMBOL(fscrypt_decrypt_block_inplace);
+
 /*
  * Validate dentries in encrypted directories to make sure we aren't potentially
  * caching stale dentries after a key has been added.
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 032efdad2e668..22be7aeb96c4f 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -64,10 +64,11 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 	}
 
 	ubifs_assert(c, dlen <= UBIFS_BLOCK_SIZE);
-	err = fscrypt_decrypt_page(inode, virt_to_page(&dn->data), dlen,
-			offset_in_page(&dn->data), block);
+	err = fscrypt_decrypt_block_inplace(inode, virt_to_page(&dn->data),
+					    dlen, offset_in_page(&dn->data),
+					    block);
 	if (err) {
-		ubifs_err(c, "fscrypt_decrypt_page failed: %i", err);
+		ubifs_err(c, "fscrypt_decrypt_block_inplace() failed: %d", err);
 		return err;
 	}
 	*out_len = clen;
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 39229fcdfac5c..f4890870ca984 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -114,6 +114,9 @@ extern int fscrypt_encrypt_block_inplace(const struct inode *inode,
 					 gfp_t gfp_flags);
 extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
 				unsigned int, u64);
+extern int fscrypt_decrypt_block_inplace(const struct inode *inode,
+					 struct page *page, unsigned int len,
+					 unsigned int offs, u64 lblk_num);
 
 static inline bool fscrypt_is_bounce_page(struct page *page)
 {
@@ -310,6 +313,14 @@ static inline int fscrypt_decrypt_page(const struct inode *inode,
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_decrypt_block_inplace(const struct inode *inode,
+						struct page *page,
+						unsigned int len,
+						unsigned int offs, u64 lblk_num)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline bool fscrypt_is_bounce_page(struct page *page)
 {
 	return false;
-- 
2.21.0.593.g511ec345e18-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
