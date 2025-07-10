Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0966C83F1B
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEusLuxumYQrFQJr+pilRGaUSwPJRlTKAUzvcZBCLGk=; b=Otju+4WbI946ME
	nEj48m486VFrd6/P8aC11+M+k0ObGy8O9+uwv2wKsiHaURGutKOkE6tqJ/gumMv3iCxsVoJRLN00d
	4eSa+en6R+7605McOfL6XIEec9KItBU90F/kGPAdiqvU+MrdlqyBQ/6NG80NdB6r2LcWQz0JNgUE2
	WDgO5HikXHw/M6gqYSXJ2qPP45pYVCPcAMdgWW36JPxc4oGv6ZbR2Z5K2gtSSUQJKhqjpqFup4mo8
	WzILQwNd5Q5jt7YkivzXcLnbx2c/XkhVrMcfBrwyetUVo8emdHucz+dhgzYRUPlM3BOq1uv7MJjEM
	AL7zwOdDYk23Za7C88Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlV0-0000000AyJC-1dtP;
	Thu, 10 Jul 2025 07:15:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkTt-0000000Aojp-1a7y
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 06:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF2096145E;
	Thu, 10 Jul 2025 06:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3253FC4CEF4;
	Thu, 10 Jul 2025 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752127804;
	bh=zLqHswEdALQQG33DjYXOoqtVVEv8AVXTJwVwIILDSgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgGrS5zek5qD/iR7/psHqKB/OndvNlcjgJ/MERuR412fdLN75FF3xKUO0bmKRedcM
	 QIF6gwPeOIJyTFZcD8Zt2cy+LSuO5+rmuBs1c8xeUWffPL5sTyq4rIiRzKhkzFQTpr
	 jQ2s0TuDSI0CXiOkePRtXW7vdK5sckp+AdvBSfMmC2VcgWfG2DEcJP5fpSURqyeMu1
	 edqIixSuORVy+IRgP+SNTr6pHQ8cNLPS7JjF/r/CrMe57kk/KcR5RNuLzb66ClCEM3
	 D0uD4hGD0NeGLI99WwdFzbHCZUCrf9TywadcqopBiPDnE67he/r1bWn4jqHxMxgLif
	 tA99asZ+BaPQg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Yuwen Chen <ywen.chen@foxmail.com>,
	linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 1/6] fscrypt: Don't use asynchronous CryptoAPI algorithms
Date: Wed,  9 Jul 2025 23:07:48 -0700
Message-ID: <20250710060754.637098-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710060754.637098-1-ebiggers@kernel.org>
References: <20250710060754.637098-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

Now that fscrypt's incomplete support for non-inline crypto engines has
been removed, and none of the CPU-based algorithms have the
CRYPTO_ALG_ASYNC flag set anymore, there is no need to accommodate
asynchronous algorithms.  Therefore, explicitly allocate only
synchronous algorithms.  Then, remove the code that handled waiting for
asynchronous en/decryption operations to complete.

This commit should *not* be backported to kernels that lack commit
0ba6ec5b2972 ("crypto: x86/aes - stop using the SIMD helper"), as then
it would disable the use of the optimized AES code on x86.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/crypto/crypto.c          |  7 +++----
 fs/crypto/fname.c           | 18 ++++++++----------
 fs/crypto/fscrypt_private.h |  5 +++--
 fs/crypto/keysetup_v1.c     |  9 ++++-----
 4 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index ddf6991d46da2..43d1658e07cec 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -113,11 +113,10 @@ int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
 			    unsigned int len, unsigned int offs,
 			    gfp_t gfp_flags)
 {
 	union fscrypt_iv iv;
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist dst, src;
 	struct crypto_skcipher *tfm = ci->ci_enc_key.tfm;
 	int res = 0;
 
 	if (WARN_ON_ONCE(len <= 0))
@@ -131,21 +130,21 @@ int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
 	if (!req)
 		return -ENOMEM;
 
 	skcipher_request_set_callback(
 		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-		crypto_req_done, &wait);
+		NULL, NULL);
 
 	sg_init_table(&dst, 1);
 	sg_set_page(&dst, dest_page, len, offs);
 	sg_init_table(&src, 1);
 	sg_set_page(&src, src_page, len, offs);
 	skcipher_request_set_crypt(req, &src, &dst, len, &iv);
 	if (rw == FS_DECRYPT)
-		res = crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
+		res = crypto_skcipher_decrypt(req);
 	else
-		res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+		res = crypto_skcipher_encrypt(req);
 	skcipher_request_free(req);
 	if (res) {
 		fscrypt_err(ci->ci_inode,
 			    "%scryption failed for data unit %llu: %d",
 			    (rw == FS_DECRYPT ? "De" : "En"), index, res);
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index fb01dde0f2e55..17edc24ccd42f 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -93,11 +93,10 @@ static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
  */
 int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 			  u8 *out, unsigned int olen)
 {
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
 	struct crypto_skcipher *tfm = ci->ci_enc_key.tfm;
 	union fscrypt_iv iv;
 	struct scatterlist sg;
 	int res;
@@ -116,18 +115,18 @@ int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 
 	/* Set up the encryption request */
 	req = skcipher_request_alloc(tfm, GFP_NOFS);
 	if (!req)
 		return -ENOMEM;
-	skcipher_request_set_callback(req,
-			CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-			crypto_req_done, &wait);
+	skcipher_request_set_callback(
+		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
+		NULL, NULL);
 	sg_init_one(&sg, out, olen);
 	skcipher_request_set_crypt(req, &sg, &sg, olen, &iv);
 
 	/* Do the encryption */
-	res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+	res = crypto_skcipher_encrypt(req);
 	skcipher_request_free(req);
 	if (res < 0) {
 		fscrypt_err(inode, "Filename encryption failed: %d", res);
 		return res;
 	}
@@ -149,33 +148,32 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_encrypt);
 static int fname_decrypt(const struct inode *inode,
 			 const struct fscrypt_str *iname,
 			 struct fscrypt_str *oname)
 {
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist src_sg, dst_sg;
 	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
 	struct crypto_skcipher *tfm = ci->ci_enc_key.tfm;
 	union fscrypt_iv iv;
 	int res;
 
 	/* Allocate request */
 	req = skcipher_request_alloc(tfm, GFP_NOFS);
 	if (!req)
 		return -ENOMEM;
-	skcipher_request_set_callback(req,
-		CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-		crypto_req_done, &wait);
+	skcipher_request_set_callback(
+		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
+		NULL, NULL);
 
 	/* Initialize IV */
 	fscrypt_generate_iv(&iv, 0, ci);
 
 	/* Create decryption request */
 	sg_init_one(&src_sg, iname->name, iname->len);
 	sg_init_one(&dst_sg, oname->name, oname->len);
 	skcipher_request_set_crypt(req, &src_sg, &dst_sg, iname->len, &iv);
-	res = crypto_wait_req(crypto_skcipher_decrypt(req), &wait);
+	res = crypto_skcipher_decrypt(req);
 	skcipher_request_free(req);
 	if (res < 0) {
 		fscrypt_err(inode, "Filename decryption failed: %d", res);
 		return res;
 	}
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 6e7164530a1e2..06fa8f2b2d081 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -57,12 +57,13 @@
  * Adiantum is faster still, and is the recommended option on such platforms...)
  *
  * Note that fscrypt also supports inline crypto engines.  Those don't use the
  * Crypto API and work much better than the old-style (non-inline) engines.
  */
-#define FSCRYPT_CRYPTOAPI_MASK \
-	(CRYPTO_ALG_ALLOCATES_MEMORY | CRYPTO_ALG_KERN_DRIVER_ONLY)
+#define FSCRYPT_CRYPTOAPI_MASK                            \
+	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY | \
+	 CRYPTO_ALG_KERN_DRIVER_ONLY)
 
 #define FSCRYPT_CONTEXT_V1	1
 #define FSCRYPT_CONTEXT_V2	2
 
 /* Keep this in sync with include/uapi/linux/fscrypt.h */
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 158ceae8a5bce..3fdf174384f3d 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -48,11 +48,10 @@ static int derive_key_aes(const u8 *master_key,
 			  const u8 nonce[FSCRYPT_FILE_NONCE_SIZE],
 			  u8 *derived_key, unsigned int derived_keysize)
 {
 	int res = 0;
 	struct skcipher_request *req = NULL;
-	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist src_sg, dst_sg;
 	struct crypto_skcipher *tfm =
 		crypto_alloc_skcipher("ecb(aes)", 0, FSCRYPT_CRYPTOAPI_MASK);
 
 	if (IS_ERR(tfm)) {
@@ -64,22 +63,22 @@ static int derive_key_aes(const u8 *master_key,
 	req = skcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req) {
 		res = -ENOMEM;
 		goto out;
 	}
-	skcipher_request_set_callback(req,
-			CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
-			crypto_req_done, &wait);
+	skcipher_request_set_callback(
+		req, CRYPTO_TFM_REQ_MAY_BACKLOG | CRYPTO_TFM_REQ_MAY_SLEEP,
+		NULL, NULL);
 	res = crypto_skcipher_setkey(tfm, nonce, FSCRYPT_FILE_NONCE_SIZE);
 	if (res < 0)
 		goto out;
 
 	sg_init_one(&src_sg, master_key, derived_keysize);
 	sg_init_one(&dst_sg, derived_key, derived_keysize);
 	skcipher_request_set_crypt(req, &src_sg, &dst_sg, derived_keysize,
 				   NULL);
-	res = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
+	res = crypto_skcipher_encrypt(req);
 out:
 	skcipher_request_free(req);
 	crypto_free_skcipher(tfm);
 	return res;
 }
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
