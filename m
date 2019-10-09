Return-Path: <SRS0=yFhR=YC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD49C47404
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2019 23:39:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C797520659
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2019 23:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCo0L79I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1gSSBjS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C797520659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wCQiLzuWJjVENkGYB7hRSB4Mn7TkyoUpkqp3vXVYPH8=; b=mCo0L79IzJJLht
	hYohisdcOaOmQnF0G0gZE1KouROoLULewaGUeMuL7TsC6jY/74q2OUU2hgBzDaRU7DXt/BjPQTHSB
	OOsk0cN+hpvIhiQohQGLxSWYleI42TOkAhbkxt0HaZVZ9sOga973J79othVqyYqBGolsuZLrPe98m
	7FF12hTEHB5mqLKAyyAhFr4DiFJQhVT+qnCqwbc/Ulum1pdtrjAIVSZpibyg5hmMCzDXwLLFlGWSP
	R73+EmXD8B6OPJVnDWTY8u+V55fd6bxntzkMsZUgoZuutRBSePVTQzvmVf4fTLpSwnXGpvPXOfzQM
	CuAHqPXnA/v/U9U2ZlgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iILYc-0005CN-Pk; Wed, 09 Oct 2019 23:39:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iILYZ-0005Bz-OQ
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2019 23:39:49 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51A6020659;
 Wed,  9 Oct 2019 23:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570664385;
 bh=Q/T8xsVWRWorwlYxy1MSpPnVmBkkjbYTlNrEpb7g494=;
 h=From:To:Cc:Subject:Date:From;
 b=T1gSSBjSeM9NWhzoHO3ynhx1SXPsIMCtWImEJzl4cRvoqD4jzTzdiTVezndaBR2TB
 rH+sJCb9SVS0HqE2qNpVzIqkhAbmKVYH7v6zXTArHTIXLMTxegFYIj64h/6n4TyKJ7
 XvF+buyIztSCSR9/wqXn+SA6N1NR7mG75k5M/uWg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH] fscrypt: invoke crypto API for ESSIV handling
Date: Wed,  9 Oct 2019 16:38:40 -0700
Message-Id: <20191009233840.224128-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_163947_840237_5F13A56C 
X-CRM114-Status: GOOD (  18.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-crypto@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Instead of open-coding the calculations for ESSIV handling, use an ESSIV
skcipher which does all of this under the hood.  ESSIV was added to the
crypto API in v5.4.

This is based on a patch from Ard Biesheuvel, but reworked to apply
after all the fscrypt changes that went into v5.4.

Tested with 'kvm-xfstests -c ext4,f2fs -g encrypt', including the
ciphertext verification tests for v1 and v2 encryption policies.

Originally-from: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst |   5 +-
 fs/crypto/crypto.c                    |   4 -
 fs/crypto/fscrypt_private.h           |   7 --
 fs/crypto/keysetup.c                  | 110 +++-----------------------
 fs/crypto/keysetup_v1.c               |   4 -
 5 files changed, 14 insertions(+), 116 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 8a0700af95967..6ec459be3de16 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -308,8 +308,9 @@ If unsure, you should use the (AES-256-XTS, AES-256-CTS-CBC) pair.
 
 AES-128-CBC was added only for low-powered embedded devices with
 crypto accelerators such as CAAM or CESA that do not support XTS.  To
-use AES-128-CBC, CONFIG_CRYPTO_SHA256 (or another SHA-256
-implementation) must be enabled so that ESSIV can be used.
+use AES-128-CBC, CONFIG_CRYPTO_ESSIV and CONFIG_CRYPTO_SHA256 (or
+another SHA-256 implementation) must be enabled so that ESSIV can be
+used.
 
 Adiantum is a (primarily) stream cipher-based mode that is fast even
 on CPUs without dedicated crypto instructions.  It's also a true
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 32a7ad0098cc2..6bc3e4f1e657e 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -27,7 +27,6 @@
 #include <linux/ratelimit.h>
 #include <linux/dcache.h>
 #include <linux/namei.h>
-#include <crypto/aes.h>
 #include <crypto/skcipher.h>
 #include "fscrypt_private.h"
 
@@ -143,9 +142,6 @@ void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 
 	if (fscrypt_is_direct_key_policy(&ci->ci_policy))
 		memcpy(iv->nonce, ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE);
-
-	if (ci->ci_essiv_tfm != NULL)
-		crypto_cipher_encrypt_one(ci->ci_essiv_tfm, iv->raw, iv->raw);
 }
 
 /* Encrypt or decrypt a single filesystem block of file contents */
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index e84efc01512e4..76c64297ce187 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -163,12 +163,6 @@ struct fscrypt_info {
 	/* The actual crypto transform used for encryption and decryption */
 	struct crypto_skcipher *ci_ctfm;
 
-	/*
-	 * Cipher for ESSIV IV generation.  Only set for CBC contents
-	 * encryption, otherwise is NULL.
-	 */
-	struct crypto_cipher *ci_essiv_tfm;
-
 	/*
 	 * Encryption mode used for this inode.  It corresponds to either the
 	 * contents or filenames encryption mode, depending on the inode type.
@@ -444,7 +438,6 @@ struct fscrypt_mode {
 	int keysize;
 	int ivsize;
 	bool logged_impl_name;
-	bool needs_essiv;
 };
 
 static inline bool
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index d71c2d6dd162a..8eb5a0e762ec6 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -8,15 +8,11 @@
  * Heavily modified since then.
  */
 
-#include <crypto/aes.h>
-#include <crypto/sha.h>
 #include <crypto/skcipher.h>
 #include <linux/key.h>
 
 #include "fscrypt_private.h"
 
-static struct crypto_shash *essiv_hash_tfm;
-
 static struct fscrypt_mode available_modes[] = {
 	[FSCRYPT_MODE_AES_256_XTS] = {
 		.friendly_name = "AES-256-XTS",
@@ -31,11 +27,10 @@ static struct fscrypt_mode available_modes[] = {
 		.ivsize = 16,
 	},
 	[FSCRYPT_MODE_AES_128_CBC] = {
-		.friendly_name = "AES-128-CBC",
-		.cipher_str = "cbc(aes)",
+		.friendly_name = "AES-128-CBC-ESSIV",
+		.cipher_str = "essiv(cbc(aes),sha256)",
 		.keysize = 16,
 		.ivsize = 16,
-		.needs_essiv = true,
 	},
 	[FSCRYPT_MODE_AES_128_CTS] = {
 		.friendly_name = "AES-128-CTS-CBC",
@@ -111,97 +106,16 @@ struct crypto_skcipher *fscrypt_allocate_skcipher(struct fscrypt_mode *mode,
 	return ERR_PTR(err);
 }
 
-static int derive_essiv_salt(const u8 *key, int keysize, u8 *salt)
-{
-	struct crypto_shash *tfm = READ_ONCE(essiv_hash_tfm);
-
-	/* init hash transform on demand */
-	if (unlikely(!tfm)) {
-		struct crypto_shash *prev_tfm;
-
-		tfm = crypto_alloc_shash("sha256", 0, 0);
-		if (IS_ERR(tfm)) {
-			if (PTR_ERR(tfm) == -ENOENT) {
-				fscrypt_warn(NULL,
-					     "Missing crypto API support for SHA-256");
-				return -ENOPKG;
-			}
-			fscrypt_err(NULL,
-				    "Error allocating SHA-256 transform: %ld",
-				    PTR_ERR(tfm));
-			return PTR_ERR(tfm);
-		}
-		prev_tfm = cmpxchg(&essiv_hash_tfm, NULL, tfm);
-		if (prev_tfm) {
-			crypto_free_shash(tfm);
-			tfm = prev_tfm;
-		}
-	}
-
-	{
-		SHASH_DESC_ON_STACK(desc, tfm);
-		desc->tfm = tfm;
-
-		return crypto_shash_digest(desc, key, keysize, salt);
-	}
-}
-
-static int init_essiv_generator(struct fscrypt_info *ci, const u8 *raw_key,
-				int keysize)
-{
-	int err;
-	struct crypto_cipher *essiv_tfm;
-	u8 salt[SHA256_DIGEST_SIZE];
-
-	if (WARN_ON(ci->ci_mode->ivsize != AES_BLOCK_SIZE))
-		return -EINVAL;
-
-	essiv_tfm = crypto_alloc_cipher("aes", 0, 0);
-	if (IS_ERR(essiv_tfm))
-		return PTR_ERR(essiv_tfm);
-
-	ci->ci_essiv_tfm = essiv_tfm;
-
-	err = derive_essiv_salt(raw_key, keysize, salt);
-	if (err)
-		goto out;
-
-	/*
-	 * Using SHA256 to derive the salt/key will result in AES-256 being
-	 * used for IV generation. File contents encryption will still use the
-	 * configured keysize (AES-128) nevertheless.
-	 */
-	err = crypto_cipher_setkey(essiv_tfm, salt, sizeof(salt));
-	if (err)
-		goto out;
-
-out:
-	memzero_explicit(salt, sizeof(salt));
-	return err;
-}
-
-/* Given the per-file key, set up the file's crypto transform object(s) */
+/* Given the per-file key, set up the file's crypto transform object */
 int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
 {
-	struct fscrypt_mode *mode = ci->ci_mode;
-	struct crypto_skcipher *ctfm;
-	int err;
-
-	ctfm = fscrypt_allocate_skcipher(mode, derived_key, ci->ci_inode);
-	if (IS_ERR(ctfm))
-		return PTR_ERR(ctfm);
+	struct crypto_skcipher *tfm;
 
-	ci->ci_ctfm = ctfm;
+	tfm = fscrypt_allocate_skcipher(ci->ci_mode, derived_key, ci->ci_inode);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
 
-	if (mode->needs_essiv) {
-		err = init_essiv_generator(ci, derived_key, mode->keysize);
-		if (err) {
-			fscrypt_warn(ci->ci_inode,
-				     "Error initializing ESSIV generator: %d",
-				     err);
-			return err;
-		}
-	}
+	ci->ci_ctfm = tfm;
 	return 0;
 }
 
@@ -388,13 +302,11 @@ static void put_crypt_info(struct fscrypt_info *ci)
 	if (!ci)
 		return;
 
-	if (ci->ci_direct_key) {
+	if (ci->ci_direct_key)
 		fscrypt_put_direct_key(ci->ci_direct_key);
-	} else if ((ci->ci_ctfm != NULL || ci->ci_essiv_tfm != NULL) &&
-		   !fscrypt_is_direct_key_policy(&ci->ci_policy)) {
+	else if (ci->ci_ctfm != NULL &&
+		 !fscrypt_is_direct_key_policy(&ci->ci_policy))
 		crypto_free_skcipher(ci->ci_ctfm);
-		crypto_free_cipher(ci->ci_essiv_tfm);
-	}
 
 	key = ci->ci_master_key;
 	if (key) {
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index ad1a36c370c3f..5298ef22aa859 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -270,10 +270,6 @@ static int setup_v1_file_key_direct(struct fscrypt_info *ci,
 		return -EINVAL;
 	}
 
-	/* ESSIV implies 16-byte IVs which implies !DIRECT_KEY */
-	if (WARN_ON(mode->needs_essiv))
-		return -EINVAL;
-
 	dk = fscrypt_get_direct_key(ci, raw_master_key);
 	if (IS_ERR(dk))
 		return PTR_ERR(dk);
-- 
2.23.0.581.g78d2f28ef7-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
