Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7911CC04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:32:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3951220815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HT3X/kIh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItmYUDpu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3951220815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZeTLyBZG2NbXlOaMbRRedKv6Fg7UYlVwP1Fjrz5DlI=; b=HT3X/kIh8S6h3R
	TwQaWjRVeRpxrkb42jUtVtniu7ak/5xb+ETrMtvm8qELv0Dbzr0K0qohujRojOBrASNmVmH1cjaai
	hr/lwsjGLlgW/uQFEm6t0ThghX3Y5QzK0v/VBd40MQWBpBKeB6sF6fbnXsoy+Rr+xrAy9cDILSNJU
	4+Adc18YnZzA/bgQE4hZeHSUU/2AtQuz/eOtIeym9y/jDU4aRU7TaIPCDw5sVOrx6FGd3/ti8jAvu
	m3aIuESgU2wglhpOJi/uAa0tuw0whtRYYTVcRBQxDN4pcB1YsXkvF8EPcJSvjOq+kJb8/j+1fd53v
	wOCZYopMxk1g2lPK58fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlCv-0005g8-R3; Mon, 20 May 2019 16:32:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlBA-00036P-NN
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 16:30:30 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C852621744;
 Mon, 20 May 2019 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369824;
 bh=Cp2ESAfDj/HVxHCEM+s4Pwds+GJgxCmhBhAP50lPZjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItmYUDpuu5DYNarsTLaOVPOaPhwq3r3eWHN6em2jAOqDlWhuuErIo+yQxmCW3DPJ2
 eie0Tyg7oct43KHYJwQJ9Ml/ZiLiqzAbs4NnnsONfUddSXay+Go9TplvYF0MKt/3pp
 tHCMm9QiNW32Crl85y/sh/eNqI0Dtei++w33G82c=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 09/14] fscrypt: support decrypting multiple filesystem
 blocks per page
Date: Mon, 20 May 2019 09:29:47 -0700
Message-Id: <20190520162952.156212-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_093024_934748_B81593AF 
X-CRM114-Status: GOOD (  18.13  )
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

Rename fscrypt_decrypt_page() to fscrypt_decrypt_pagecache_blocks() and
redefine its behavior to decrypt all filesystem blocks in the given
region of the given page, rather than assuming that the region consists
of just one filesystem block.  Also remove the 'inode' and 'lblk_num'
parameters, since they can be retrieved from the page as it's already
assumed to be a pagecache page.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

This is based on work by Chandan Rajendra.

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c         |  3 +--
 fs/crypto/crypto.c      | 46 ++++++++++++++++++++++++++++-------------
 fs/ext4/inode.c         |  7 +++----
 include/linux/fscrypt.h | 12 +++++------
 4 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index f9111ffa12ffd..61da06fda45cc 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -33,8 +33,7 @@ static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
 
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		struct page *page = bv->bv_page;
-		int ret = fscrypt_decrypt_page(page->mapping->host, page,
-				PAGE_SIZE, 0, page->index);
+		int ret = fscrypt_decrypt_pagecache_blocks(page, PAGE_SIZE, 0);
 
 		if (ret)
 			SetPageError(page);
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 2e6fb5e4f7a7f..dcf630d7e4460 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -282,29 +282,47 @@ int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
 EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
 
 /**
- * fscrypt_decrypt_page() - Decrypts a page in-place
- * @inode:     The corresponding inode for the page to decrypt.
- * @page:      The page to decrypt. Must be locked.
- * @len:       Number of bytes in @page to be decrypted.
- * @offs:      Start of data in @page.
- * @lblk_num:  Logical block number.
+ * fscrypt_decrypt_pagecache_blocks() - Decrypt filesystem blocks in a pagecache page
+ * @page:      The locked pagecache page containing the block(s) to decrypt
+ * @len:       Total size of the block(s) to decrypt.  Must be a nonzero
+ *		multiple of the filesystem's block size.
+ * @offs:      Byte offset within @page of the first block to decrypt.  Must be
+ *		a multiple of the filesystem's block size.
  *
- * Decrypts page in-place using the ctx encryption context.
+ * The specified block(s) are decrypted in-place within the pagecache page,
+ * which must still be locked and not uptodate.  Normally, blocksize ==
+ * PAGE_SIZE and the whole page is decrypted at once.
  *
- * Called from the read completion callback.
+ * This is for use by the filesystem's ->readpages() method.
  *
- * Return: Zero on success, non-zero otherwise.
+ * Return: 0 on success; -errno on failure
  */
-int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
-			unsigned int len, unsigned int offs, u64 lblk_num)
+int fscrypt_decrypt_pagecache_blocks(struct page *page, unsigned int len,
+				     unsigned int offs)
 {
+	const struct inode *inode = page->mapping->host;
+	const unsigned int blockbits = inode->i_blkbits;
+	const unsigned int blocksize = 1 << blockbits;
+	u64 lblk_num = ((u64)page->index << (PAGE_SHIFT - blockbits)) +
+		       (offs >> blockbits);
+	unsigned int i;
+	int err;
+
 	if (WARN_ON_ONCE(!PageLocked(page)))
 		return -EINVAL;
 
-	return fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page, page,
-				   len, offs, GFP_NOFS);
+	if (WARN_ON_ONCE(len <= 0 || !IS_ALIGNED(len | offs, blocksize)))
+		return -EINVAL;
+
+	for (i = offs; i < offs + len; i += blocksize, lblk_num++) {
+		err = fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page,
+					  page, blocksize, i, GFP_NOFS);
+		if (err)
+			return err;
+	}
+	return 0;
 }
-EXPORT_SYMBOL(fscrypt_decrypt_page);
+EXPORT_SYMBOL(fscrypt_decrypt_pagecache_blocks);
 
 /**
  * fscrypt_decrypt_block_inplace() - Decrypt a filesystem block in-place
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 82298c63ea6d6..34fda4864c0eb 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1232,8 +1232,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 	if (unlikely(err))
 		page_zero_new_buffers(page, from, to);
 	else if (decrypt)
-		err = fscrypt_decrypt_page(page->mapping->host, page,
-				PAGE_SIZE, 0, page->index);
+		err = fscrypt_decrypt_pagecache_blocks(page, PAGE_SIZE, 0);
 	return err;
 }
 #endif
@@ -4066,8 +4065,8 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
 			BUG_ON(blocksize != PAGE_SIZE);
-			WARN_ON_ONCE(fscrypt_decrypt_page(page->mapping->host,
-						page, PAGE_SIZE, 0, page->index));
+			WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
+						page, PAGE_SIZE, 0));
 		}
 	}
 	if (ext4_should_journal_data(inode)) {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 315affc99b050..bd8f207a2fb68 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -112,8 +112,9 @@ extern int fscrypt_encrypt_block_inplace(const struct inode *inode,
 					 struct page *page, unsigned int len,
 					 unsigned int offs, u64 lblk_num,
 					 gfp_t gfp_flags);
-extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
-				unsigned int, u64);
+
+extern int fscrypt_decrypt_pagecache_blocks(struct page *page, unsigned int len,
+					    unsigned int offs);
 extern int fscrypt_decrypt_block_inplace(const struct inode *inode,
 					 struct page *page, unsigned int len,
 					 unsigned int offs, u64 lblk_num);
@@ -310,10 +311,9 @@ static inline int fscrypt_encrypt_block_inplace(const struct inode *inode,
 	return -EOPNOTSUPP;
 }
 
-static inline int fscrypt_decrypt_page(const struct inode *inode,
-				       struct page *page,
-				       unsigned int len, unsigned int offs,
-				       u64 lblk_num)
+static inline int fscrypt_decrypt_pagecache_blocks(struct page *page,
+						   unsigned int len,
+						   unsigned int offs)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
