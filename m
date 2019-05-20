Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B178C04E87
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:30:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12571208C3
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AQDbRlio";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOLXMAJf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12571208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEMX34f9uivwmzAOLiF8tV6tUfhSURN4pxZORQ354N4=; b=AQDbRlioOl0/O4
	E/BO+/qilr+BzQ6Qt0ed/ejJmYZVBbt5/DQ2TLxINens30sTLV3wOaSzbIXQ/5fWkrgZaT1ltLPI7
	Zgp0xt2CSMNy2kHwj4PZmJjalh1dJtDyaRBe/dBLzR0ouwslDF14xbzPMGZWjUkJrSRskUVym7i08
	GCf8bgfBClZOSz8Im44BaHfUfFBKVtazzsaJYotxICjbd4UOgIN6VWiLLPJoMnLHC9eiY3me/7ALW
	100NsaD/r3R5yg8lC5yGZlKyme9KI0M/QoIWFDPIcDgDj7Fuc2CRHJKTN68amwpjxpRUI8hdxHFRz
	OCV83f2EK6/8EV0V6tUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSm6u-0001zX-1R; Mon, 20 May 2019 17:30:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSm5i-0000DO-Ad
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 17:28:56 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF1BE2173C;
 Mon, 20 May 2019 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558373330;
 bh=9bZ907bN7SrxZe9508a+up5AYfWTaDxO7xb9s52p4AU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DOLXMAJfKO2DSfQD5BTfDW9q1cXdrC5FPSJcWrE34eIhI383lN4AEIF0gwTLm2e4F
 LzFFZXc5ByaSzUmvAfmcPBg8ZN9ih3ElPNsKT51ErFSNQvLq8BjsRBxUW130HG9TVo
 KZpAr4DGILkB5U3gV5LuNvmr9+IeyunprsoCVdRE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v6 09/16] fscrypt: add an HKDF-SHA512 implementation
Date: Mon, 20 May 2019 10:25:45 -0700
Message-Id: <20190520172552.217253-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520172552.217253-1-ebiggers@kernel.org>
References: <20190520172552.217253-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_102850_607309_9530F0F4 
X-CRM114-Status: GOOD (  23.37  )
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Add an implementation of HKDF (RFC 5869) to fscrypt, for the purpose of
deriving additional key material from the fscrypt master keys for v2
encryption policies.  HKDF is a key derivation function built on top of
HMAC.  We choose SHA-512 for the underlying unkeyed hash, and use an
"hmac(sha512)" transform allocated from the crypto API.

We'll be using this to replace the AES-ECB based KDF currently used to
derive the per-file encryption keys.  While the AES-ECB based KDF is
believed to meet the original security requirements, it is nonstandard
and has problems that don't exist in modern KDFs such as HKDF:

1. It's reversible.  Given a derived key and nonce, an attacker can
   easily compute the master key.  This is okay if the master key and
   derived keys are equally hard to compromise, but now we'd like to be
   more robust against threats such as a derived key being compromised
   through a timing attack, or a derived key for an in-use file being
   compromised after the master key has already been removed.

2. It doesn't evenly distribute the entropy from the master key; each 16
   input bytes only affects the corresponding 16 output bytes.

3. It isn't easily extensible to deriving other values or keys, such as
   a public hash for securely identifying the key, or per-mode keys.
   Per-mode keys will be immediately useful for Adiantum encryption, for
   which fscrypt currently uses the master key directly, introducing
   unnecessary usage constraints.  Per-mode keys will also be useful for
   hardware inline encryption, which is currently being worked on.

HKDF solves all the above problems.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/Kconfig           |   2 +
 fs/crypto/Makefile          |   1 +
 fs/crypto/fscrypt_private.h |  15 +++
 fs/crypto/hkdf.c            | 178 ++++++++++++++++++++++++++++++++++++
 4 files changed, 196 insertions(+)
 create mode 100644 fs/crypto/hkdf.c

diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index f0de238000c02..c160598a9fe2c 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -7,6 +7,8 @@ config FS_ENCRYPTION
 	select CRYPTO_XTS
 	select CRYPTO_CTS
 	select CRYPTO_SHA256
+	select CRYPTO_SHA512
+	select CRYPTO_HMAC
 	select KEYS
 	help
 	  Enable encryption of files and directories.  This
diff --git a/fs/crypto/Makefile b/fs/crypto/Makefile
index accdd622c9083..4977b43479289 100644
--- a/fs/crypto/Makefile
+++ b/fs/crypto/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_FS_ENCRYPTION)	+= fscrypto.o
 
 fscrypto-y := crypto.o \
 	      fname.o \
+	      hkdf.o \
 	      hooks.o \
 	      keyring.o \
 	      keysetup.o \
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index cc1862c9baa1d..e2a65189eb578 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -175,6 +175,21 @@ extern bool fscrypt_fname_encrypted_size(const struct inode *inode,
 					 u32 orig_len, u32 max_len,
 					 u32 *encrypted_len_ret);
 
+/* hkdf.c */
+
+struct fscrypt_hkdf {
+	struct crypto_shash *hmac_tfm;
+};
+
+extern int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
+			     unsigned int master_key_size);
+
+extern int fscrypt_hkdf_expand(struct fscrypt_hkdf *hkdf, u8 context,
+			       const u8 *info, unsigned int infolen,
+			       u8 *okm, unsigned int okmlen);
+
+extern void fscrypt_destroy_hkdf(struct fscrypt_hkdf *hkdf);
+
 /* keyring.c */
 
 /*
diff --git a/fs/crypto/hkdf.c b/fs/crypto/hkdf.c
new file mode 100644
index 0000000000000..00178567be086
--- /dev/null
+++ b/fs/crypto/hkdf.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Implementation of HKDF ("HMAC-based Extract-and-Expand Key Derivation
+ * Function"), aka RFC 5869.  See also the original paper (Krawczyk 2010):
+ * "Cryptographic Extraction and Key Derivation: The HKDF Scheme".
+ *
+ * This is used to derive keys from the fscrypt master keys.
+ *
+ * Copyright 2019 Google LLC
+ */
+
+#include <crypto/hash.h>
+#include <crypto/sha.h>
+
+#include "fscrypt_private.h"
+
+/*
+ * HKDF supports any unkeyed cryptographic hash algorithm, but fscrypt uses
+ * SHA-512 because it is reasonably secure and efficient; and since it produces
+ * a 64-byte digest, deriving an AES-256-XTS key preserves all 64 bytes of
+ * entropy from the master key and requires only one iteration of HKDF-Expand.
+ */
+#define HKDF_HMAC_ALG		"hmac(sha512)"
+#define HKDF_HASHLEN		SHA512_DIGEST_SIZE
+
+/*
+ * HKDF consists of two steps:
+ *
+ * 1. HKDF-Extract: extract a pseudorandom key of length HKDF_HASHLEN bytes from
+ *    the input keying material and optional salt.
+ * 2. HKDF-Expand: expand the pseudorandom key into output keying material of
+ *    any length, parameterized by an application-specific info string.
+ *
+ * HKDF-Extract can be skipped if the input is already a pseudorandom key of
+ * length HKDF_HASHLEN bytes.  However, cipher modes other than AES-256-XTS take
+ * shorter keys, and we don't want to force users of those modes to provide
+ * unnecessarily long master keys.  Thus fscrypt still does HKDF-Extract.  No
+ * salt is used, since fscrypt master keys should already be pseudorandom and
+ * there's no way to persist a random salt per master key from kernel mode.
+ */
+
+/* HKDF-Extract (RFC 5869 section 2.2), unsalted */
+static int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
+			unsigned int ikmlen, u8 prk[HKDF_HASHLEN])
+{
+	static const u8 default_salt[HKDF_HASHLEN];
+	SHASH_DESC_ON_STACK(desc, hmac_tfm);
+	int err;
+
+	err = crypto_shash_setkey(hmac_tfm, default_salt, HKDF_HASHLEN);
+	if (err)
+		return err;
+
+	desc->tfm = hmac_tfm;
+	err = crypto_shash_digest(desc, ikm, ikmlen, prk);
+	shash_desc_zero(desc);
+	return err;
+}
+
+/*
+ * Compute HKDF-Extract using the given master key as the input keying material,
+ * and prepare an HMAC transform object keyed by the resulting pseudorandom key.
+ *
+ * Afterwards, the keyed HMAC transform object can be used for HKDF-Expand many
+ * times without having to recompute HKDF-Extract each time.
+ */
+int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
+		      unsigned int master_key_size)
+{
+	struct crypto_shash *hmac_tfm;
+	u8 prk[HKDF_HASHLEN];
+	int err;
+
+	hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, 0);
+	if (IS_ERR(hmac_tfm)) {
+		fscrypt_warn(NULL, "error allocating " HKDF_HMAC_ALG ": %ld",
+			     PTR_ERR(hmac_tfm));
+		return PTR_ERR(hmac_tfm);
+	}
+
+	BUG_ON(crypto_shash_digestsize(hmac_tfm) != sizeof(prk));
+
+	err = hkdf_extract(hmac_tfm, master_key, master_key_size, prk);
+	if (err)
+		goto err_free_tfm;
+
+	err = crypto_shash_setkey(hmac_tfm, prk, sizeof(prk));
+	if (err)
+		goto err_free_tfm;
+
+	hkdf->hmac_tfm = hmac_tfm;
+	goto out;
+
+err_free_tfm:
+	crypto_free_shash(hmac_tfm);
+out:
+	memzero_explicit(prk, sizeof(prk));
+	return err;
+}
+
+/*
+ * HKDF-Expand (RFC 5869 section 2.3).  This expands the pseudorandom key, which
+ * was already keyed into 'hkdf->hmac_tfm' by fscrypt_init_hkdf(), into 'okmlen'
+ * bytes of output keying material parameterized by the application-specific
+ * 'info' of length 'infolen' bytes, prefixed by "fscrypt" and the 'context'
+ * byte.  This is thread-safe and may be called by multiple threads in parallel.
+ *
+ * ('context' isn't part of the HKDF specification; it's just a prefix fscrypt
+ * adds to its application-specific info strings to guarantee that it doesn't
+ * accidentally repeat an info string when using HKDF for different purposes.)
+ */
+int fscrypt_hkdf_expand(struct fscrypt_hkdf *hkdf, u8 context,
+			const u8 *info, unsigned int infolen,
+			u8 *okm, unsigned int okmlen)
+{
+	SHASH_DESC_ON_STACK(desc, hkdf->hmac_tfm);
+	u8 prefix[9];
+	unsigned int i;
+	int err;
+	const u8 *prev = NULL;
+	u8 counter = 1;
+	u8 tmp[HKDF_HASHLEN];
+
+	if (WARN_ON(okmlen > 255 * HKDF_HASHLEN))
+		return -EINVAL;
+
+	desc->tfm = hkdf->hmac_tfm;
+
+	memcpy(prefix, "fscrypt\0", 8);
+	prefix[8] = context;
+
+	for (i = 0; i < okmlen; i += HKDF_HASHLEN) {
+
+		err = crypto_shash_init(desc);
+		if (err)
+			goto out;
+
+		if (prev) {
+			err = crypto_shash_update(desc, prev, HKDF_HASHLEN);
+			if (err)
+				goto out;
+		}
+
+		err = crypto_shash_update(desc, prefix, sizeof(prefix));
+		if (err)
+			goto out;
+
+		err = crypto_shash_update(desc, info, infolen);
+		if (err)
+			goto out;
+
+		BUILD_BUG_ON(sizeof(counter) != 1);
+		if (okmlen - i < HKDF_HASHLEN) {
+			err = crypto_shash_finup(desc, &counter, 1, tmp);
+			if (err)
+				goto out;
+			memcpy(&okm[i], tmp, okmlen - i);
+			memzero_explicit(tmp, sizeof(tmp));
+		} else {
+			err = crypto_shash_finup(desc, &counter, 1, &okm[i]);
+			if (err)
+				goto out;
+		}
+		counter++;
+		prev = &okm[i];
+	}
+	err = 0;
+out:
+	if (unlikely(err))
+		memzero_explicit(okm, okmlen); /* so caller doesn't need to */
+	shash_desc_zero(desc);
+	return err;
+}
+
+void fscrypt_destroy_hkdf(struct fscrypt_hkdf *hkdf)
+{
+	crypto_free_shash(hkdf->hmac_tfm);
+}
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
