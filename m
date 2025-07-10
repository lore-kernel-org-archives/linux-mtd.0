Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3099C83F1E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6BJtLM6dxVxw5jH/ALJMlTJkInEpwdwSmt9NAg94Ic=; b=iv3xsFL8zfFzfW
	/uKfUOotveKeYuV5+x8dR5PTrCfQO2MJizaj79ic0kxF3f9GBjTEUb+E8Zq0TfW3JyDfP7GqjFIps
	mR4ST25oSpw4oo1JcCQQSCiX+a3u89S2FgjK8CBm0URjlenK9Q03H6+paej2flVb6SREW5AK2ZFa9
	WFutKyS4hZfJBwwarpiDKiVHcpcqIJ5H808vBe5ZT+ZPxr25H5o4DbHydZCeXmDgVNhl2oxX6NYBw
	yooMJmGPrD03JjA7H92QDczqDuyjBh6G0EPnai5bmZqYjOb+ts7ltctjFKAzY3Yw2yXeHIb1uoDVz
	HjuPCJ17CRc1H1U3pO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlV2-0000000AyKK-3xXZ;
	Thu, 10 Jul 2025 07:15:20 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkTu-0000000Aoke-1jIz
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 06:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B98F2A5403D;
	Thu, 10 Jul 2025 06:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EA1C4CEF7;
	Thu, 10 Jul 2025 06:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752127805;
	bh=qDZA3q6MtJW6bQsPm9daCNoU1IFqN8412dZMoCnn0Nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNn2rCNHY0NRRm1MIqGuPjwXrcH5FXxY27IDshq9VsRnJdBWbB/ZAj8iZwoOsexLh
	 VbKneDzh4Ggfq30V0oCFgLPSUY7YiBkKNxBy7z8LC463pGS5vMXvfgopgj/DqkGmbc
	 xQSTO9QIi1cevXJVksNpcRmPMOFaj0mvNSIMO60rjeEfKN7HlA8kTS0voOSsRhHWGJ
	 6VIyQD7waoS5wiRl9frOl4GczOLR+mCezepQvGDFQAOs5EMej4c9jp6SBpQEvQCBAx
	 2aKzO+7+Qo5OgQrkjgGSSMP/Y46E1B35NCkAu+WSlzH4FANfyPLkB2x2QijZcIF5BK
	 +prBB4Nl0q/Ng==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Yuwen Chen <ywen.chen@foxmail.com>,
	linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 4/6] fscrypt: Remove gfp_t argument from fscrypt_crypt_data_unit()
Date: Wed,  9 Jul 2025 23:07:51 -0700
Message-ID: <20250710060754.637098-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710060754.637098-1-ebiggers@kernel.org>
References: <20250710060754.637098-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_231006_604087_87510CD9 
X-CRM114-Status: GOOD (  11.68  )
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
 fs/crypto/bio.c             |  3 +--
 fs/crypto/crypto.c          | 14 +++++---------
 fs/crypto/fscrypt_private.h |  3 +--
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 13ad2dd771b64..486fcb2ecf13e 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -165,12 +165,11 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		i = 0;
 		offset = 0;
 		do {
 			err = fscrypt_crypt_data_unit(ci, FS_ENCRYPT, du_index,
 						      ZERO_PAGE(0), pages[i],
-						      du_size, offset,
-						      GFP_NOFS);
+						      du_size, offset);
 			if (err)
 				goto out;
 			du_index++;
 			sector += 1U << (du_bits - SECTOR_SHIFT);
 			du_remaining--;
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 646b1831e6831..bab0aacd4da36 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -108,12 +108,11 @@ void fscrypt_generate_iv(union fscrypt_iv *iv, u64 index,
 
 /* Encrypt or decrypt a single "data unit" of file contents. */
 int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
 			    fscrypt_direction_t rw, u64 index,
 			    struct page *src_page, struct page *dest_page,
-			    unsigned int len, unsigned int offs,
-			    gfp_t gfp_flags)
+			    unsigned int len, unsigned int offs)
 {
 	struct crypto_sync_skcipher *tfm = ci->ci_enc_key.tfm;
 	SYNC_SKCIPHER_REQUEST_ON_STACK(req, tfm);
 	union fscrypt_iv iv;
 	struct scatterlist dst, src;
@@ -195,11 +194,11 @@ struct page *fscrypt_encrypt_pagecache_blocks(struct folio *folio,
 		return ERR_PTR(-ENOMEM);
 
 	for (i = offs; i < offs + len; i += du_size, index++) {
 		err = fscrypt_crypt_data_unit(ci, FS_ENCRYPT, index,
 					      &folio->page, ciphertext_page,
-					      du_size, i, gfp_flags);
+					      du_size, i);
 		if (err) {
 			fscrypt_free_bounce_page(ciphertext_page);
 			return ERR_PTR(err);
 		}
 	}
@@ -233,12 +232,11 @@ int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
 				  u64 lblk_num, gfp_t gfp_flags)
 {
 	if (WARN_ON_ONCE(inode->i_sb->s_cop->supports_subblock_data_units))
 		return -EOPNOTSUPP;
 	return fscrypt_crypt_data_unit(inode->i_crypt_info, FS_ENCRYPT,
-				       lblk_num, page, page, len, offs,
-				       gfp_flags);
+				       lblk_num, page, page, len, offs);
 }
 EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
 
 /**
  * fscrypt_decrypt_pagecache_blocks() - Decrypt data from a pagecache folio
@@ -274,12 +272,11 @@ int fscrypt_decrypt_pagecache_blocks(struct folio *folio, size_t len,
 
 	for (i = offs; i < offs + len; i += du_size, index++) {
 		struct page *page = folio_page(folio, i >> PAGE_SHIFT);
 
 		err = fscrypt_crypt_data_unit(ci, FS_DECRYPT, index, page,
-					      page, du_size, i & ~PAGE_MASK,
-					      GFP_NOFS);
+					      page, du_size, i & ~PAGE_MASK);
 		if (err)
 			return err;
 	}
 	return 0;
 }
@@ -308,12 +305,11 @@ int fscrypt_decrypt_block_inplace(const struct inode *inode, struct page *page,
 				  u64 lblk_num)
 {
 	if (WARN_ON_ONCE(inode->i_sb->s_cop->supports_subblock_data_units))
 		return -EOPNOTSUPP;
 	return fscrypt_crypt_data_unit(inode->i_crypt_info, FS_DECRYPT,
-				       lblk_num, page, page, len, offs,
-				       GFP_NOFS);
+				       lblk_num, page, page, len, offs);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_block_inplace);
 
 /**
  * fscrypt_initialize() - allocate major buffers for fs encryption.
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index bffeb14501fd0..d8b485b9881c5 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -335,12 +335,11 @@ typedef enum {
 extern struct kmem_cache *fscrypt_inode_info_cachep;
 int fscrypt_initialize(struct super_block *sb);
 int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
 			    fscrypt_direction_t rw, u64 index,
 			    struct page *src_page, struct page *dest_page,
-			    unsigned int len, unsigned int offs,
-			    gfp_t gfp_flags);
+			    unsigned int len, unsigned int offs);
 struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags);
 
 void __printf(3, 4) __cold
 fscrypt_msg(const struct inode *inode, const char *level, const char *fmt, ...);
 
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
