Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E00C83F1F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDEgUc3A13uMufB80xa87AO983A7LX8TiRv0uQ0DPKA=; b=gdVtIpUj0KnY6y
	C5IuvIP2Qv+6tMOJLheG4SSMpf5g3yeobQVvsTEPOIClYqJUPVXA3gYVuLo7ZenpXwst61Z+wNYZ5
	KX3/5CqnCyMtc/dIR8EeWIaNXUKpNf/pR676JAHUDoJvaydGCVqnqJThSFGqQhGm5gix2k0GUElnc
	2+eRz88AW1kDyjMmGi94wy3id94J/avk+MEOwbpqIh/IBJtkFzNlu3hZLjzJ3fin1uePoPuOJDoke
	F+NKu35wgpNKOqM+UP5LrCW7wbMFzHbuPY5xaTK26z/kL+H/UJ/2RkVpRlpinnRtCxHzpXmVhU2VU
	FvgqeVWDUS6VNCxsvt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlV2-0000000AyKA-1rss;
	Thu, 10 Jul 2025 07:15:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkTu-0000000Aokr-29l2
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 06:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A5BB46E8C;
	Thu, 10 Jul 2025 06:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB96C4CEFE;
	Thu, 10 Jul 2025 06:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752127805;
	bh=rxPyY/T+UiU1XFDx1UIdsdBoQBGeiEvi+e66q05QgMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DLQ2tnzf0j5AB+ktyie53hSM7Vn0K0RU3O8yVIY1lRhX2YUV36H0Am6AR+O+g9cTk
	 vzIHITOndLhr0vcWN2Rbl+CC6Sgnk045fNoHw6uW7h0aRGo3/wvX8E8fNks2PRPAWs
	 XGIsWz6XqvESW//al3nR5uasGT9S5LSbuMhDUZofIHcAZmXeJWf5TzEmUGQ0t2cf54
	 5X8iHIAQfxO+EoBZKnJmVtUZXIa33MYsrZc5h+Ij8Ib5PGbh5bauPpqTBvAr47tl2l
	 nYkUQrvPcAkhi8JvrudnADYUvdT+xp9pMR1eBrsdaBszqY/oXF+NNPKRf7BWWHx6Xj
	 +vBsy/dj6RxFQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Yuwen Chen <ywen.chen@foxmail.com>,
	linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 5/6] fscrypt: Remove gfp_t argument from fscrypt_encrypt_block_inplace()
Date: Wed,  9 Jul 2025 23:07:52 -0700
Message-ID: <20250710060754.637098-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710060754.637098-1-ebiggers@kernel.org>
References: <20250710060754.637098-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231006_605380_DBAAC669 
X-CRM114-Status: GOOD (  14.51  )
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
 fs/ceph/crypto.c        | 3 +--
 fs/crypto/crypto.c      | 3 +--
 fs/ubifs/crypto.c       | 2 +-
 include/linux/fscrypt.h | 5 ++---
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
index 3b3c4d8d401ec..6d04d528ed038 100644
--- a/fs/ceph/crypto.c
+++ b/fs/ceph/crypto.c
@@ -521,12 +521,11 @@ int ceph_fscrypt_encrypt_block_inplace(const struct inode *inode,
 {
 	struct ceph_client *cl = ceph_inode_to_client(inode);
 
 	doutc(cl, "%p %llx.%llx len %u offs %u blk %llu\n", inode,
 	      ceph_vinop(inode), len, offs, lblk_num);
-	return fscrypt_encrypt_block_inplace(inode, page, len, offs, lblk_num,
-					     gfp_flags);
+	return fscrypt_encrypt_block_inplace(inode, page, len, offs, lblk_num);
 }
 
 /**
  * ceph_fscrypt_decrypt_pages - decrypt an array of pages
  * @inode: pointer to inode associated with these pages
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index bab0aacd4da36..b6ccab524fdef 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -215,11 +215,10 @@ EXPORT_SYMBOL(fscrypt_encrypt_pagecache_blocks);
  * @len:       Size of block to encrypt.  This must be a multiple of
  *		FSCRYPT_CONTENTS_ALIGNMENT.
  * @offs:      Byte offset within @page at which the block to encrypt begins
  * @lblk_num:  Filesystem logical block number of the block, i.e. the 0-based
  *		number of the block within the file
- * @gfp_flags: Memory allocation flags
  *
  * Encrypt a possibly-compressed filesystem block that is located in an
  * arbitrary page, not necessarily in the original pagecache page.  The @inode
  * and @lblk_num must be specified, as they can't be determined from @page.
  *
@@ -227,11 +226,11 @@ EXPORT_SYMBOL(fscrypt_encrypt_pagecache_blocks);
  *
  * Return: 0 on success; -errno on failure
  */
 int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
 				  unsigned int len, unsigned int offs,
-				  u64 lblk_num, gfp_t gfp_flags)
+				  u64 lblk_num)
 {
 	if (WARN_ON_ONCE(inode->i_sb->s_cop->supports_subblock_data_units))
 		return -EOPNOTSUPP;
 	return fscrypt_crypt_data_unit(inode->i_crypt_info, FS_ENCRYPT,
 				       lblk_num, page, page, len, offs);
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 921f9033d0d2d..fb5ac358077b1 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -49,11 +49,11 @@ int ubifs_encrypt(const struct inode *inode, struct ubifs_data_node *dn,
 	/* pad to full block cipher length */
 	if (pad_len != in_len)
 		memset(p + in_len, 0, pad_len - in_len);
 
 	err = fscrypt_encrypt_block_inplace(inode, virt_to_page(p), pad_len,
-					    offset_in_page(p), block, GFP_NOFS);
+					    offset_in_page(p), block);
 	if (err) {
 		ubifs_err(c, "fscrypt_encrypt_block_inplace() failed: %d", err);
 		return err;
 	}
 	*out_len = pad_len;
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 56fad33043d53..8d0e3ad89b940 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -312,11 +312,11 @@ void fscrypt_enqueue_decrypt_work(struct work_struct *);
 
 struct page *fscrypt_encrypt_pagecache_blocks(struct folio *folio,
 		size_t len, size_t offs, gfp_t gfp_flags);
 int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
 				  unsigned int len, unsigned int offs,
-				  u64 lblk_num, gfp_t gfp_flags);
+				  u64 lblk_num);
 
 int fscrypt_decrypt_pagecache_blocks(struct folio *folio, size_t len,
 				     size_t offs);
 int fscrypt_decrypt_block_inplace(const struct inode *inode, struct page *page,
 				  unsigned int len, unsigned int offs,
@@ -485,12 +485,11 @@ static inline struct page *fscrypt_encrypt_pagecache_blocks(struct folio *folio,
 }
 
 static inline int fscrypt_encrypt_block_inplace(const struct inode *inode,
 						struct page *page,
 						unsigned int len,
-						unsigned int offs, u64 lblk_num,
-						gfp_t gfp_flags)
+						unsigned int offs, u64 lblk_num)
 {
 	return -EOPNOTSUPP;
 }
 
 static inline int fscrypt_decrypt_pagecache_blocks(struct folio *folio,
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
