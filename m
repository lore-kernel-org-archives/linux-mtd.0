Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BC9C169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:36:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B779D2229E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EqgkM+91";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y02Qfqc8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B779D2229E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKFaE96Og8/3X1VUci9Tv0XHr4mubSbpORWNdKlpSu4=; b=EqgkM+91uYHj3c
	VdPso+5qSvmHLhl4kZMv33FRJq03S+3N2IYERT2+sgFr93gqFKeBRrp7uBF3gQJ8pDkiueo2YvJUb
	6Fiv6V4JxtLQPCjHdodGVFWQCYKY5Kj4PworGlqoSxe29otJIUSrly+Kz1GKQbzb9KJJQs34zNHmn
	BjhqZBRiH5cj1gBOf8J5+Ohf0EHI8thtgd0HFyJeQOzMTY7LAifwn43SdKbucEw0cFO2qx73ncKzS
	TcS53izTn+OXQeX1nP77UBQZYxDa6pBmK0iQ2ZQBIkP7yt2x3QbTOPiHGCBOWBz2relbqv27WHGij
	BSlTrZ0VWh8/kvl2LSxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtFVl-0000AY-13; Mon, 11 Feb 2019 17:36:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFOk-0007GS-Az
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 17:29:42 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0646222A2;
 Mon, 11 Feb 2019 17:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549906178;
 bh=taDyezpNyZe5bsIuZuPYBviLDsjp0r7UQ9G1os5LcOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y02Qfqc8/u71BzsWwUaxeAc2O21AwFtpNDwRuSxVmjROdP2wsSkWGPBDbkGlPyNyJ
 zIlfSJbB4Bl9J2A0bYr0MOYBkFxpXUGrwQEP17+w/vKcagCQ0ZyUFO9a9Zu6OIJiI9
 Aic4dv8gpZLme2xsG6rrsHPxODul3kK6XJmX/NgM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v2 03/20] fscrypt: use FSCRYPT_* definitions, not FS_*
Date: Mon, 11 Feb 2019 09:27:21 -0800
Message-Id: <20190211172738.4633-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211172738.4633-1-ebiggers@kernel.org>
References: <20190211172738.4633-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_092938_409430_D3C2FE2C 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Update fs/crypto/ to use the new names for the UAPI constants rather
than the old names, then make the old definitions conditional on
!__KERNEL__.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c           |  2 +-
 fs/crypto/fname.c            |  2 +-
 fs/crypto/fscrypt_private.h  | 16 +++++------
 fs/crypto/keyinfo.c          | 53 ++++++++++++++++++------------------
 fs/crypto/policy.c           | 14 +++++-----
 include/uapi/linux/fscrypt.h |  2 ++
 6 files changed, 46 insertions(+), 43 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 4dc788e3bc96..8217a4434621 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -139,7 +139,7 @@ void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 	memset(iv, 0, ci->ci_mode->ivsize);
 	iv->lblk_num = cpu_to_le64(lblk_num);
 
-	if (ci->ci_flags & FS_POLICY_FLAG_DIRECT_KEY)
+	if (ci->ci_flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY)
 		memcpy(iv->nonce, ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE);
 
 	if (ci->ci_essiv_tfm != NULL)
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 7ff40a73dbec..37c26ad36d0e 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -187,7 +187,7 @@ bool fscrypt_fname_encrypted_size(const struct inode *inode, u32 orig_len,
 				  u32 max_len, u32 *encrypted_len_ret)
 {
 	int padding = 4 << (inode->i_crypt_info->ci_flags &
-			    FS_POLICY_FLAGS_PAD_MASK);
+			    FSCRYPT_POLICY_FLAGS_PAD_MASK);
 	u32 encrypted_len;
 
 	if (orig_len > max_len)
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 7da276159593..52e09ef40bfa 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -34,7 +34,7 @@ struct fscrypt_context {
 	u8 contents_encryption_mode;
 	u8 filenames_encryption_mode;
 	u8 flags;
-	u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 	u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 } __packed;
 
@@ -84,7 +84,7 @@ struct fscrypt_info {
 	u8 ci_data_mode;
 	u8 ci_filename_mode;
 	u8 ci_flags;
-	u8 ci_master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	u8 ci_master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 	u8 ci_nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 };
 
@@ -99,16 +99,16 @@ typedef enum {
 static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
 					   u32 filenames_mode)
 {
-	if (contents_mode == FS_ENCRYPTION_MODE_AES_128_CBC &&
-	    filenames_mode == FS_ENCRYPTION_MODE_AES_128_CTS)
+	if (contents_mode == FSCRYPT_MODE_AES_128_CBC &&
+	    filenames_mode == FSCRYPT_MODE_AES_128_CTS)
 		return true;
 
-	if (contents_mode == FS_ENCRYPTION_MODE_AES_256_XTS &&
-	    filenames_mode == FS_ENCRYPTION_MODE_AES_256_CTS)
+	if (contents_mode == FSCRYPT_MODE_AES_256_XTS &&
+	    filenames_mode == FSCRYPT_MODE_AES_256_CTS)
 		return true;
 
-	if (contents_mode == FS_ENCRYPTION_MODE_ADIANTUM &&
-	    filenames_mode == FS_ENCRYPTION_MODE_ADIANTUM)
+	if (contents_mode == FSCRYPT_MODE_ADIANTUM &&
+	    filenames_mode == FSCRYPT_MODE_ADIANTUM)
 		return true;
 
 	return false;
diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index 1e11a683f63d..a8c1e886b0bc 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -21,7 +21,7 @@
 
 static struct crypto_shash *essiv_hash_tfm;
 
-/* Table of keys referenced by FS_POLICY_FLAG_DIRECT_KEY policies */
+/* Table of keys referenced by DIRECT_KEY policies */
 static DEFINE_HASHTABLE(fscrypt_master_keys, 6); /* 6 bits = 64 buckets */
 static DEFINE_SPINLOCK(fscrypt_master_keys_lock);
 
@@ -78,7 +78,7 @@ static int derive_key_aes(const u8 *master_key,
  */
 static struct key *
 find_and_lock_process_key(const char *prefix,
-			  const u8 descriptor[FS_KEY_DESCRIPTOR_SIZE],
+			  const u8 descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE],
 			  unsigned int min_keysize,
 			  const struct fscrypt_key **payload_ret)
 {
@@ -88,7 +88,7 @@ find_and_lock_process_key(const char *prefix,
 	const struct fscrypt_key *payload;
 
 	description = kasprintf(GFP_NOFS, "%s%*phN", prefix,
-				FS_KEY_DESCRIPTOR_SIZE, descriptor);
+				FSCRYPT_KEY_DESCRIPTOR_SIZE, descriptor);
 	if (!description)
 		return ERR_PTR(-ENOMEM);
 
@@ -106,7 +106,7 @@ find_and_lock_process_key(const char *prefix,
 	payload = (const struct fscrypt_key *)ukp->data;
 
 	if (ukp->datalen != sizeof(struct fscrypt_key) ||
-	    payload->size < 1 || payload->size > FS_MAX_KEY_SIZE) {
+	    payload->size < 1 || payload->size > FSCRYPT_MAX_KEY_SIZE) {
 		fscrypt_warn(NULL,
 			     "key with description '%s' has invalid payload",
 			     key->description);
@@ -130,32 +130,32 @@ find_and_lock_process_key(const char *prefix,
 }
 
 static struct fscrypt_mode available_modes[] = {
-	[FS_ENCRYPTION_MODE_AES_256_XTS] = {
+	[FSCRYPT_MODE_AES_256_XTS] = {
 		.friendly_name = "AES-256-XTS",
 		.cipher_str = "xts(aes)",
 		.keysize = 64,
 		.ivsize = 16,
 	},
-	[FS_ENCRYPTION_MODE_AES_256_CTS] = {
+	[FSCRYPT_MODE_AES_256_CTS] = {
 		.friendly_name = "AES-256-CTS-CBC",
 		.cipher_str = "cts(cbc(aes))",
 		.keysize = 32,
 		.ivsize = 16,
 	},
-	[FS_ENCRYPTION_MODE_AES_128_CBC] = {
+	[FSCRYPT_MODE_AES_128_CBC] = {
 		.friendly_name = "AES-128-CBC",
 		.cipher_str = "cbc(aes)",
 		.keysize = 16,
 		.ivsize = 16,
 		.needs_essiv = true,
 	},
-	[FS_ENCRYPTION_MODE_AES_128_CTS] = {
+	[FSCRYPT_MODE_AES_128_CTS] = {
 		.friendly_name = "AES-128-CTS-CBC",
 		.cipher_str = "cts(cbc(aes))",
 		.keysize = 16,
 		.ivsize = 16,
 	},
-	[FS_ENCRYPTION_MODE_ADIANTUM] = {
+	[FSCRYPT_MODE_ADIANTUM] = {
 		.friendly_name = "Adiantum",
 		.cipher_str = "adiantum(xchacha12,aes)",
 		.keysize = 32,
@@ -194,7 +194,7 @@ static int find_and_derive_key(const struct inode *inode,
 	const struct fscrypt_key *payload;
 	int err;
 
-	key = find_and_lock_process_key(FS_KEY_DESC_PREFIX,
+	key = find_and_lock_process_key(FSCRYPT_KEY_DESC_PREFIX,
 					ctx->master_key_descriptor,
 					mode->keysize, &payload);
 	if (key == ERR_PTR(-ENOKEY) && inode->i_sb->s_cop->key_prefix) {
@@ -205,7 +205,7 @@ static int find_and_derive_key(const struct inode *inode,
 	if (IS_ERR(key))
 		return PTR_ERR(key);
 
-	if (ctx->flags & FS_POLICY_FLAG_DIRECT_KEY) {
+	if (ctx->flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY) {
 		if (mode->ivsize < offsetofend(union fscrypt_iv, nonce)) {
 			fscrypt_warn(inode->i_sb,
 				     "direct key mode not allowed with %s",
@@ -269,14 +269,14 @@ allocate_skcipher_for_mode(struct fscrypt_mode *mode, const u8 *raw_key,
 	return ERR_PTR(err);
 }
 
-/* Master key referenced by FS_POLICY_FLAG_DIRECT_KEY policy */
+/* Master key referenced by DIRECT_KEY policy */
 struct fscrypt_master_key {
 	struct hlist_node mk_node;
 	refcount_t mk_refcount;
 	const struct fscrypt_mode *mk_mode;
 	struct crypto_skcipher *mk_ctfm;
-	u8 mk_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-	u8 mk_raw[FS_MAX_KEY_SIZE];
+	u8 mk_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
+	u8 mk_raw[FSCRYPT_MAX_KEY_SIZE];
 };
 
 static void free_master_key(struct fscrypt_master_key *mk)
@@ -317,13 +317,13 @@ find_or_insert_master_key(struct fscrypt_master_key *to_insert,
 	 * raw key, and use crypto_memneq() when comparing raw keys.
 	 */
 
-	BUILD_BUG_ON(sizeof(hash_key) > FS_KEY_DESCRIPTOR_SIZE);
+	BUILD_BUG_ON(sizeof(hash_key) > FSCRYPT_KEY_DESCRIPTOR_SIZE);
 	memcpy(&hash_key, ci->ci_master_key_descriptor, sizeof(hash_key));
 
 	spin_lock(&fscrypt_master_keys_lock);
 	hash_for_each_possible(fscrypt_master_keys, mk, mk_node, hash_key) {
 		if (memcmp(ci->ci_master_key_descriptor, mk->mk_descriptor,
-			   FS_KEY_DESCRIPTOR_SIZE) != 0)
+			   FSCRYPT_KEY_DESCRIPTOR_SIZE) != 0)
 			continue;
 		if (mode != mk->mk_mode)
 			continue;
@@ -367,7 +367,7 @@ fscrypt_get_master_key(const struct fscrypt_info *ci, struct fscrypt_mode *mode,
 		goto err_free_mk;
 	}
 	memcpy(mk->mk_descriptor, ci->ci_master_key_descriptor,
-	       FS_KEY_DESCRIPTOR_SIZE);
+	       FSCRYPT_KEY_DESCRIPTOR_SIZE);
 	memcpy(mk->mk_raw, raw_key, mode->keysize);
 
 	return find_or_insert_master_key(mk, raw_key, mode, ci);
@@ -446,8 +446,8 @@ void __exit fscrypt_essiv_cleanup(void)
 
 /*
  * Given the encryption mode and key (normally the derived key, but for
- * FS_POLICY_FLAG_DIRECT_KEY mode it's the master key), set up the inode's
- * symmetric cipher transform object(s).
+ * DIRECT_KEY mode it's the master key), set up the inode's symmetric cipher
+ * transform object(s).
  */
 static int setup_crypto_transform(struct fscrypt_info *ci,
 				  struct fscrypt_mode *mode,
@@ -457,7 +457,7 @@ static int setup_crypto_transform(struct fscrypt_info *ci,
 	struct crypto_skcipher *ctfm;
 	int err;
 
-	if (ci->ci_flags & FS_POLICY_FLAG_DIRECT_KEY) {
+	if (ci->ci_flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY) {
 		mk = fscrypt_get_master_key(ci, mode, raw_key, inode);
 		if (IS_ERR(mk))
 			return PTR_ERR(mk);
@@ -474,7 +474,7 @@ static int setup_crypto_transform(struct fscrypt_info *ci,
 	if (mode->needs_essiv) {
 		/* ESSIV implies 16-byte IVs which implies !DIRECT_KEY */
 		WARN_ON(mode->ivsize != AES_BLOCK_SIZE);
-		WARN_ON(ci->ci_flags & FS_POLICY_FLAG_DIRECT_KEY);
+		WARN_ON(ci->ci_flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY);
 
 		err = init_essiv_generator(ci, raw_key, mode->keysize);
 		if (err) {
@@ -524,9 +524,10 @@ int fscrypt_get_encryption_info(struct inode *inode)
 		/* Fake up a context for an unencrypted directory */
 		memset(&ctx, 0, sizeof(ctx));
 		ctx.format = FS_ENCRYPTION_CONTEXT_FORMAT_V1;
-		ctx.contents_encryption_mode = FS_ENCRYPTION_MODE_AES_256_XTS;
-		ctx.filenames_encryption_mode = FS_ENCRYPTION_MODE_AES_256_CTS;
-		memset(ctx.master_key_descriptor, 0x42, FS_KEY_DESCRIPTOR_SIZE);
+		ctx.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
+		ctx.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
+		memset(ctx.master_key_descriptor, 0x42,
+		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
 	} else if (res != sizeof(ctx)) {
 		return -EINVAL;
 	}
@@ -534,7 +535,7 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	if (ctx.format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
 		return -EINVAL;
 
-	if (ctx.flags & ~FS_POLICY_FLAGS_VALID)
+	if (ctx.flags & ~FSCRYPT_POLICY_FLAGS_VALID)
 		return -EINVAL;
 
 	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_NOFS);
@@ -545,7 +546,7 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	crypt_info->ci_data_mode = ctx.contents_encryption_mode;
 	crypt_info->ci_filename_mode = ctx.filenames_encryption_mode;
 	memcpy(crypt_info->ci_master_key_descriptor, ctx.master_key_descriptor,
-	       FS_KEY_DESCRIPTOR_SIZE);
+	       FSCRYPT_KEY_DESCRIPTOR_SIZE);
 	memcpy(crypt_info->ci_nonce, ctx.nonce, FS_KEY_DERIVATION_NONCE_SIZE);
 
 	mode = select_encryption_mode(crypt_info, inode);
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index bd7eaf9b3f00..1e0563cea1a5 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -22,7 +22,7 @@ static bool is_encryption_context_consistent_with_policy(
 				const struct fscrypt_policy *policy)
 {
 	return memcmp(ctx->master_key_descriptor, policy->master_key_descriptor,
-		      FS_KEY_DESCRIPTOR_SIZE) == 0 &&
+		      FSCRYPT_KEY_DESCRIPTOR_SIZE) == 0 &&
 		(ctx->flags == policy->flags) &&
 		(ctx->contents_encryption_mode ==
 		 policy->contents_encryption_mode) &&
@@ -37,13 +37,13 @@ static int create_encryption_context_from_policy(struct inode *inode,
 
 	ctx.format = FS_ENCRYPTION_CONTEXT_FORMAT_V1;
 	memcpy(ctx.master_key_descriptor, policy->master_key_descriptor,
-					FS_KEY_DESCRIPTOR_SIZE);
+					FSCRYPT_KEY_DESCRIPTOR_SIZE);
 
 	if (!fscrypt_valid_enc_modes(policy->contents_encryption_mode,
 				     policy->filenames_encryption_mode))
 		return -EINVAL;
 
-	if (policy->flags & ~FS_POLICY_FLAGS_VALID)
+	if (policy->flags & ~FSCRYPT_POLICY_FLAGS_VALID)
 		return -EINVAL;
 
 	ctx.contents_encryption_mode = policy->contents_encryption_mode;
@@ -126,7 +126,7 @@ int fscrypt_ioctl_get_policy(struct file *filp, void __user *arg)
 	policy.filenames_encryption_mode = ctx.filenames_encryption_mode;
 	policy.flags = ctx.flags;
 	memcpy(policy.master_key_descriptor, ctx.master_key_descriptor,
-				FS_KEY_DESCRIPTOR_SIZE);
+				FSCRYPT_KEY_DESCRIPTOR_SIZE);
 
 	if (copy_to_user(arg, &policy, sizeof(policy)))
 		return -EFAULT;
@@ -200,7 +200,7 @@ int fscrypt_has_permitted_context(struct inode *parent, struct inode *child)
 	if (parent_ci && child_ci) {
 		return memcmp(parent_ci->ci_master_key_descriptor,
 			      child_ci->ci_master_key_descriptor,
-			      FS_KEY_DESCRIPTOR_SIZE) == 0 &&
+			      FSCRYPT_KEY_DESCRIPTOR_SIZE) == 0 &&
 			(parent_ci->ci_data_mode == child_ci->ci_data_mode) &&
 			(parent_ci->ci_filename_mode ==
 			 child_ci->ci_filename_mode) &&
@@ -217,7 +217,7 @@ int fscrypt_has_permitted_context(struct inode *parent, struct inode *child)
 
 	return memcmp(parent_ctx.master_key_descriptor,
 		      child_ctx.master_key_descriptor,
-		      FS_KEY_DESCRIPTOR_SIZE) == 0 &&
+		      FSCRYPT_KEY_DESCRIPTOR_SIZE) == 0 &&
 		(parent_ctx.contents_encryption_mode ==
 		 child_ctx.contents_encryption_mode) &&
 		(parent_ctx.filenames_encryption_mode ==
@@ -255,7 +255,7 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
 	ctx.filenames_encryption_mode = ci->ci_filename_mode;
 	ctx.flags = ci->ci_flags;
 	memcpy(ctx.master_key_descriptor, ci->ci_master_key_descriptor,
-	       FS_KEY_DESCRIPTOR_SIZE);
+	       FSCRYPT_KEY_DESCRIPTOR_SIZE);
 	get_random_bytes(ctx.nonce, FS_KEY_DERIVATION_NONCE_SIZE);
 	BUILD_BUG_ON(sizeof(ctx) != FSCRYPT_SET_CONTEXT_MAX_SIZE);
 	res = parent->i_sb->s_cop->set_context(child, &ctx,
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index f9b99cc028bc..3bbc5dfbde21 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -53,6 +53,7 @@ struct fscrypt_key {
 /**********************************************************************/
 
 /* old names; don't add anything new here! */
+#ifndef __KERNEL__
 #define FS_KEY_DESCRIPTOR_SIZE		FSCRYPT_KEY_DESCRIPTOR_SIZE
 #define FS_POLICY_FLAGS_PAD_4		FSCRYPT_POLICY_FLAGS_PAD_4
 #define FS_POLICY_FLAGS_PAD_8		FSCRYPT_POLICY_FLAGS_PAD_8
@@ -74,5 +75,6 @@ struct fscrypt_key {
 #define FS_KEY_DESC_PREFIX		FSCRYPT_KEY_DESC_PREFIX
 #define FS_KEY_DESC_PREFIX_SIZE		FSCRYPT_KEY_DESC_PREFIX_SIZE
 #define FS_MAX_KEY_SIZE			FSCRYPT_MAX_KEY_SIZE
+#endif /* !__KERNEL__ */
 
 #endif /* _UAPI_LINUX_FSCRYPT_H */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
