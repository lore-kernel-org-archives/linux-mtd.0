Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9455C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:31:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 905EB20815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cWFC97lp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hn9O1LhV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 905EB20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Hqa5acz7EHfEweY1nYf0TfVD7KHCnNAtXnnu2tfyCs=; b=cWFC97lpoXWMHD
	iRs8ISs3bPYDWqKATQTLXHFs2gk8RP1tfleO8ygdhhqhsFJ4woB91HiF86mcejTAYwDIXNf8vhh2y
	M/vJJ5VmgPiyj1McQifhZqcdr8Y4UcUJo6z01H3PzGWKEWBdm+4NV/URz5tg1K7Oy8tIayXScm8PU
	39beLbSeCHSEz71bEYiXqOIGZ/eVx5dPaPHlZzicXuKlrkX8/0RGYZfSQGdDa2HZDjKd2N3dNWIJA
	e2hndgI8Sogum+SjLXqv+8AmkmPZ8V4n4yTETzEOxFElBGaBS9JAm4L4zAxiZvNsN1hdraXXGy7D8
	EiG4EX+EVz3SrifhXfyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlBo-00042y-W7; Mon, 20 May 2019 16:31:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlB8-00034R-8N
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 16:30:24 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7F352173B;
 Mon, 20 May 2019 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369822;
 bh=SOcJbbqhRxdEFcK2jyoo821iyc6Vy9fOspmpjn/YoXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hn9O1LhVuFFUT6+gwic7GUq8fqtk7NLzwu97zIhC4CeEhGyFFm6ycdbEusitDGwKS
 rYTkbj78aIizPi1kdSZbf+s17paPdWO2K3HLebLco/XyWwkGlZVPEN1UCgLIeclM5A
 PiDcirluP255kpj8n6TkIJmxTTLJWTWYtgyZWceE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 03/14] fscrypt: rename fscrypt_do_page_crypto() to
 fscrypt_crypt_block()
Date: Mon, 20 May 2019 09:29:41 -0700
Message-Id: <20190520162952.156212-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_093022_325805_971CE2E4 
X-CRM114-Status: GOOD (  12.66  )
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

fscrypt_do_page_crypto() only does a single encryption or decryption
operation, with a single logical block number (single IV).  So it
actually operates on a filesystem block, not a "page" per se.  To
reflect this, rename it to fscrypt_crypt_block().

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c             |  6 +++---
 fs/crypto/crypto.c          | 24 ++++++++++++------------
 fs/crypto/fscrypt_private.h | 11 +++++------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index c534253483874..92b2d5da5d8e1 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -83,9 +83,9 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		return -ENOMEM;
 
 	while (len--) {
-		err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk,
-					     ZERO_PAGE(0), ciphertext_page,
-					     PAGE_SIZE, 0, GFP_NOFS);
+		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
+					  ZERO_PAGE(0), ciphertext_page,
+					  PAGE_SIZE, 0, GFP_NOFS);
 		if (err)
 			goto errout;
 
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index ebfa13cfecb7d..e6802d7aca3c7 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -147,10 +147,11 @@ void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 		crypto_cipher_encrypt_one(ci->ci_essiv_tfm, iv->raw, iv->raw);
 }
 
-int fscrypt_do_page_crypto(const struct inode *inode, fscrypt_direction_t rw,
-			   u64 lblk_num, struct page *src_page,
-			   struct page *dest_page, unsigned int len,
-			   unsigned int offs, gfp_t gfp_flags)
+/* Encrypt or decrypt a single filesystem block of file contents */
+int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
+			u64 lblk_num, struct page *src_page,
+			struct page *dest_page, unsigned int len,
+			unsigned int offs, gfp_t gfp_flags)
 {
 	union fscrypt_iv iv;
 	struct skcipher_request *req = NULL;
@@ -227,9 +228,9 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 
 	if (inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES) {
 		/* with inplace-encryption we just encrypt the page */
-		err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk_num, page,
-					     ciphertext_page, len, offs,
-					     gfp_flags);
+		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num, page,
+					  ciphertext_page, len, offs,
+					  gfp_flags);
 		if (err)
 			return ERR_PTR(err);
 
@@ -243,9 +244,8 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 	if (!ciphertext_page)
 		return ERR_PTR(-ENOMEM);
 
-	err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk_num,
-				     page, ciphertext_page, len, offs,
-				     gfp_flags);
+	err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num, page,
+				  ciphertext_page, len, offs, gfp_flags);
 	if (err) {
 		fscrypt_free_bounce_page(ciphertext_page);
 		return ERR_PTR(err);
@@ -277,8 +277,8 @@ int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 	if (!(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES))
 		BUG_ON(!PageLocked(page));
 
-	return fscrypt_do_page_crypto(inode, FS_DECRYPT, lblk_num, page, page,
-				      len, offs, GFP_NOFS);
+	return fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page, page,
+				   len, offs, GFP_NOFS);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
 
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 4122ee1a0b7b1..8978eec9d766d 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -116,12 +116,11 @@ static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
 /* crypto.c */
 extern struct kmem_cache *fscrypt_info_cachep;
 extern int fscrypt_initialize(unsigned int cop_flags);
-extern int fscrypt_do_page_crypto(const struct inode *inode,
-				  fscrypt_direction_t rw, u64 lblk_num,
-				  struct page *src_page,
-				  struct page *dest_page,
-				  unsigned int len, unsigned int offs,
-				  gfp_t gfp_flags);
+extern int fscrypt_crypt_block(const struct inode *inode,
+			       fscrypt_direction_t rw, u64 lblk_num,
+			       struct page *src_page, struct page *dest_page,
+			       unsigned int len, unsigned int offs,
+			       gfp_t gfp_flags);
 extern struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags);
 extern const struct dentry_operations fscrypt_d_ops;
 
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
