Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7ABC83F21
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSCHGbYhvblrl39CieEBIT6ZiKBpKX7nuw1zRU9KGSw=; b=Z8nYKW3sWdAZ57
	VMlA99frCm1+csgTO1agyeVqcufNhdpjtOnP1p9k5qNM2NCcyxojG/vpC6aPbR3QjoBIfE6CKk04L
	Az/7ODCHnv6/LkhbgjCaHD/7Ze2KbZrNheUnbexRgEBM5RBrj3/9H5LI54lnWdQvMrDKyvb2ADyjj
	YyTN/oK3pvAZx7KXUs7adoVV8XlIWJS9HQuAcMDI8zptO9kCZW5M1vdoXSNLqyUUh3JCm7oYIqwxw
	gyGiNsYd5Sl2MMV/n25vz6IjM8gRH9tJyoWI7Y4htegAOf/E6pXCQteR0KK9r6at0Ba/9+LqJMaA4
	sCFbmBW54Uqfxj227Tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlV3-0000000AyKV-1xGA;
	Thu, 10 Jul 2025 07:15:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkTv-0000000AolN-0YZP
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 06:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76363A5410D;
	Thu, 10 Jul 2025 06:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117B6C4CEF5;
	Thu, 10 Jul 2025 06:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752127806;
	bh=ISOZqqMIoJ6Bo5XTcKQL1qoCe0p7TsANa33nW9/riCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PYovnpkzkt5PCA7vwOfL7C9eve152diJJlXfQx15ECLzlSRHlPsJXGI7QIgDzWuoP
	 KudQTYDaakvkIV42pmfVyvPlJa9ZF74H5TewLj2ilLCEeTo3pna7RkK0mGcIk6yvvo
	 5FxRLBVr6R79yOMb1tCqOk6u+95B63IVaZeFE/rwBYd1ch+ESB5jj1VHX08Y4jhOBH
	 59teAf9H1O4Ztnx0cJeZWnu+2mUyKUeAvwwofKB9C4FLCdRinGdO5fULHMSzLgu93W
	 p7TdAuxyh4mVuB10S9v+8y+T03k3vfl/ITOeeGJufJA03zOH7HGV8ORpz3aoe4a4ca
	 hJl5D/+QR0cJw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Yuwen Chen <ywen.chen@foxmail.com>,
	linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 6/6] ceph: Remove gfp_t argument from ceph_fscrypt_encrypt_*()
Date: Wed,  9 Jul 2025 23:07:53 -0700
Message-ID: <20250710060754.637098-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710060754.637098-1-ebiggers@kernel.org>
References: <20250710060754.637098-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231007_302127_C9A6301E 
X-CRM114-Status: GOOD (  17.44  )
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

This argument is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ceph/crypto.c | 10 ++++------
 fs/ceph/crypto.h | 10 ++++------
 fs/ceph/file.c   |  3 +--
 fs/ceph/inode.c  |  3 +--
 4 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
index 6d04d528ed038..91e62db0c2050 100644
--- a/fs/ceph/crypto.c
+++ b/fs/ceph/crypto.c
@@ -514,12 +514,11 @@ int ceph_fscrypt_decrypt_block_inplace(const struct inode *inode,
 	return fscrypt_decrypt_block_inplace(inode, page, len, offs, lblk_num);
 }
 
 int ceph_fscrypt_encrypt_block_inplace(const struct inode *inode,
 				  struct page *page, unsigned int len,
-				  unsigned int offs, u64 lblk_num,
-				  gfp_t gfp_flags)
+				  unsigned int offs, u64 lblk_num)
 {
 	struct ceph_client *cl = ceph_inode_to_client(inode);
 
 	doutc(cl, "%p %llx.%llx len %u offs %u blk %llu\n", inode,
 	      ceph_vinop(inode), len, offs, lblk_num);
@@ -639,21 +638,20 @@ int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
  * ceph_fscrypt_encrypt_pages - encrypt an array of pages
  * @inode: pointer to inode associated with these pages
  * @page: pointer to page array
  * @off: offset into the file that the data starts
  * @len: max length to encrypt
- * @gfp: gfp flags to use for allocation
  *
- * Decrypt an array of cleartext pages and return the amount of
+ * Encrypt an array of cleartext pages and return the amount of
  * data encrypted. Any data in the page prior to the start of the
  * first complete block in the read is ignored. Any incomplete
  * crypto blocks at the end of the array are ignored.
  *
  * Returns the length of the encrypted data or a negative errno.
  */
 int ceph_fscrypt_encrypt_pages(struct inode *inode, struct page **page, u64 off,
-				int len, gfp_t gfp)
+				int len)
 {
 	int i, num_blocks;
 	u64 baseblk = off >> CEPH_FSCRYPT_BLOCK_SHIFT;
 	int ret = 0;
 
@@ -670,11 +668,11 @@ int ceph_fscrypt_encrypt_pages(struct inode *inode, struct page **page, u64 off,
 		unsigned int pgoffs = offset_in_page(blkoff);
 		int fret;
 
 		fret = ceph_fscrypt_encrypt_block_inplace(inode, page[pgidx],
 				CEPH_FSCRYPT_BLOCK_SIZE, pgoffs,
-				baseblk + i, gfp);
+				baseblk + i);
 		if (fret < 0) {
 			if (ret == 0)
 				ret = fret;
 			break;
 		}
diff --git a/fs/ceph/crypto.h b/fs/ceph/crypto.h
index d0768239a1c9c..6db28464ff803 100644
--- a/fs/ceph/crypto.h
+++ b/fs/ceph/crypto.h
@@ -153,19 +153,18 @@ static inline void ceph_fscrypt_adjust_off_and_len(struct inode *inode,
 int ceph_fscrypt_decrypt_block_inplace(const struct inode *inode,
 				  struct page *page, unsigned int len,
 				  unsigned int offs, u64 lblk_num);
 int ceph_fscrypt_encrypt_block_inplace(const struct inode *inode,
 				  struct page *page, unsigned int len,
-				  unsigned int offs, u64 lblk_num,
-				  gfp_t gfp_flags);
+				  unsigned int offs, u64 lblk_num);
 int ceph_fscrypt_decrypt_pages(struct inode *inode, struct page **page,
 			       u64 off, int len);
 int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
 				 u64 off, struct ceph_sparse_extent *map,
 				 u32 ext_cnt);
 int ceph_fscrypt_encrypt_pages(struct inode *inode, struct page **page, u64 off,
-			       int len, gfp_t gfp);
+			       int len);
 
 static inline struct page *ceph_fscrypt_pagecache_page(struct page *page)
 {
 	return fscrypt_is_bounce_page(page) ? fscrypt_pagecache_page(page) : page;
 }
@@ -244,12 +243,11 @@ static inline int ceph_fscrypt_decrypt_block_inplace(const struct inode *inode,
 	return 0;
 }
 
 static inline int ceph_fscrypt_encrypt_block_inplace(const struct inode *inode,
 					  struct page *page, unsigned int len,
-					  unsigned int offs, u64 lblk_num,
-					  gfp_t gfp_flags)
+					  unsigned int offs, u64 lblk_num)
 {
 	return 0;
 }
 
 static inline int ceph_fscrypt_decrypt_pages(struct inode *inode,
@@ -267,11 +265,11 @@ static inline int ceph_fscrypt_decrypt_extents(struct inode *inode,
 	return 0;
 }
 
 static inline int ceph_fscrypt_encrypt_pages(struct inode *inode,
 					     struct page **page, u64 off,
-					     int len, gfp_t gfp)
+					     int len)
 {
 	return 0;
 }
 
 static inline struct page *ceph_fscrypt_pagecache_page(struct page *page)
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index a7254cab44cc2..9b79da6d1aee7 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1990,12 +1990,11 @@ ceph_sync_write(struct kiocb *iocb, struct iov_iter *from, loff_t pos,
 			break;
 		}
 
 		if (IS_ENCRYPTED(inode)) {
 			ret = ceph_fscrypt_encrypt_pages(inode, pages,
-							 write_pos, write_len,
-							 GFP_KERNEL);
+							 write_pos, write_len);
 			if (ret < 0) {
 				doutc(cl, "encryption failed with %d\n", ret);
 				ceph_release_page_vector(pages, num_pages);
 				break;
 			}
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 06cd2963e41ee..fc543075b827a 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -2434,12 +2434,11 @@ static int fill_fscrypt_truncate(struct inode *inode,
 		memset(iov.iov_base + boff, 0, PAGE_SIZE - boff);
 
 		/* encrypt the last block */
 		ret = ceph_fscrypt_encrypt_block_inplace(inode, page,
 						    CEPH_FSCRYPT_BLOCK_SIZE,
-						    0, block,
-						    GFP_KERNEL);
+						    0, block);
 		if (ret)
 			goto out;
 	}
 
 	/* Insert the header */
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
