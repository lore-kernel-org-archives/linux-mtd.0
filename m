Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDFAC61CE8
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Jun 2025 04:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=luyrG2PYL2x/t9eqpOlGDKfVSNyPjw8s84+S0y5X1lM=; b=F3hJGzyCNoFQUv
	A/LKbU9zTO/tOOOje8J3l6NpQqBng9lCSqRaboML4aDeGyrgBcBUWyLCQbt2R2osjj6PYHUhKUVPz
	LucRgUWhh+UaFBfhQgHoyN6Olt5vZxWiFXhRhbe+Gj2DT1TjoHppApHa+0qpLwz5f47QnJiMVdrS1
	1753Yfj+O2ARRkpu0X8K9CQAb9QYGwpu++HyFm9V5XG+lGzO7phOSPUmIUDCKabIJCHhOFaiyl6vL
	fYTymG6VJKQ5AHW87A7A5jgSVmarY/oKkFYyPHfZfCMJmJ0s27/iQfSRsDyk1+6nRBIJRjX6pX8M+
	Yj3d7QoSl+EMM9PC1yiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQfNP-00000002EaL-1qcD;
	Sun, 15 Jun 2025 04:53:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQfNM-00000002EZx-12r4
	for linux-mtd@lists.infradead.org;
	Sun, 15 Jun 2025 04:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAA0B4A7A8;
	Sun, 15 Jun 2025 04:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560C4C4CEE3;
	Sun, 15 Jun 2025 04:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749963225;
	bh=jKskpqcoXOguF1H1TjZ0pWmBZVDnOT0/xNqcoD0cSAE=;
	h=From:To:Cc:Subject:Date:From;
	b=Ho4jYYIKxZ5jOqawvrhaEPBhEZPCrM8ChRozSncyaAqNV+riPwKkyanQnMEwAdbVm
	 /XRV6xyzV0raa/vd5Vhy6VpZ8GrTZtwKLpy7aNs7hKsQojtsMYvTe4DMgacX8pDInr
	 a0nfAZcxldXCif58iYfsInWiFqV6glddb5yOs9caUGyMCurbwn84kg4SOsvfVqmUGB
	 Wo3qxBpEPl9p0JEvf41ii0/lxxoogeSXHuFEhDZ2/SG3fUxUxujR9c7exo5bBPUZzE
	 GPlWpZSiPtJDcT+Br/m9zwgcOyyBKtPXd8G/lx6adWU0CoQnHdvVGNZu/NSTRtgW+q
	 /J7vgLI1jS06A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	ceph-devel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] fscrypt: don't use problematic non-inline crypto accelerators
Date: Sat, 14 Jun 2025 21:51:45 -0700
Message-ID: <20250615045145.224567-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_215348_329142_1BF66B78 
X-CRM114-Status: GOOD (  26.92  )
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

From: Eric Biggers <ebiggers@google.com>

Make fscrypt no longer use Crypto API drivers for non-inline crypto
accelerators, even when the Crypto API prioritizes them over CPU-based
code (which unfortunately it often does).  These drivers tend to be
really problematic, especially for fscrypt's synchronous workload.

Specifically, exclude drivers that have CRYPTO_ALG_KERN_DRIVER_ONLY or
CRYPTO_ALG_ALLOCATES_MEMORY set.  (Later, CRYPTO_ALG_ASYNC should be
excluded too.  That's omitted for now to keep this commit backportable,
since until recently some CPU-based code had CRYPTO_ALG_ASYNC set.)

There are two major issues with these drivers: bugs and performance.

First, these drivers tend to be buggy.  They're fundamentally much more
error-prone and harder to test than the CPU-based code, and they often
don't get tested before kernel releases.  Released drivers have
en/decrypted data incorrectly.  These bugs cause real issues for fscrypt
users who often didn't even want to use these drivers, for example:

- https://github.com/google/fscryptctl/issues/32
- https://github.com/google/fscryptctl/issues/9
- https://lore.kernel.org/r/PH0PR02MB731916ECDB6C613665863B6CFFAA2@PH0PR02MB7319.namprd02.prod.outlook.com

These drivers have also caused issues for dm-crypt users, including data
corruption and deadlocks.  Since Linux v5.10, dm-crypt has disabled most
of these drivers by excluding CRYPTO_ALG_ALLOCATES_MEMORY.

Second, the CPU-based crypto tends to be faster, often *much* faster.
This may seem counterintuitive, but benchmarks clearly show it.  There's
a *lot* of overhead associated with going to a hardware driver, off the
CPU, and back again.  Measuring synchronous AES-256-XTS encryption of
4096-byte messages (fscrypt's workload) on two platforms with non-inline
crypto accelerators that I have access to:

  Intel Emerald Rapids server:

     xts-aes-vaes-avx512:  16171 MB/s  [CPU-based, Vector AES]
     xts(ecb(aes-generic)):  305 MB/s  [CPU-based, generic C code]
     qat_aes_xts:            289 MB/s  [Offload, Intel QuickAssist]

  Qualcomm SM8650 HDK:

     xts-aes-ce:            4301 MB/s  [CPU-based, ARMv8 Crypto Extensions]
     xts(ecb(aes-generic)):  265 MB/s  [CPU-based, generic C code]
     xts-aes-qce:             73 MB/s  [Offload, Qualcomm Crypto Engine]

So, using the "accelerators" is over 50 times slower than just using the
CPU.  Not only that, it's even slower than the generic C code, which
suggests that even on platforms whose CPUs lack AES instructions the
performance benefit of any accelerator would be marginal at best.

The usefulness of the accelerators could be improved with a different
software architecture that allows blocks to be efficiently en/decrypted
in parallel.  But fscrypt does not do that today, and even the async
support in the Crypto API isn't really all that efficient.  And even if
the accelerator was used perfectly efficiently, it seems unlikely to
help on small I/O requests, for which latency is really important.

As of this writing, the Crypto API prioritizes qat_aes_xts over
xts-aes-vaes-avx512.  Therefore, this commit greatly improves fscrypt
performance on Intel servers that have QAT and the QAT driver enabled.
qat_aes_xts is going to be deprioritized in the Crypto API (like I did
for xts-aes-qce recently too).  But as this seems to be a common pattern
with all the "accelerators", fscrypt should just disable all of them.

An argument that has been given in favor of non-inline crypto
accelerators is that they can protect keys in hardware.  But fscrypt
does not take advantage of that, so it is irrelevant.  (Also, it would
be quite difficult for fscrypt to do that.)

Note that fscrypt does support inline encryption engines, using raw or
hardware-wrapped keys.  These actually do work well and are widely used.
These do not use the "Crypto API" and are unaffected by this commit.

Fixes: b30ab0e03407 ("ext4 crypto: add ext4 encryption facilities")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Changed in v2:
- Improved commit message and comment
- Dropped CRYPTO_ALG_ASYNC from the mask, to make this patch
  backport-friendly
- Added Fixes and Cc stable

 fs/crypto/fscrypt_private.h | 16 ++++++++++++++++
 fs/crypto/hkdf.c            |  2 +-
 fs/crypto/keysetup.c        |  3 ++-
 fs/crypto/keysetup_v1.c     |  3 ++-
 4 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index c1d92074b65c5..0e95c7a095d49 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -43,10 +43,26 @@
  * hardware-wrapped keys has made it misleading as it's only for raw keys.
  * Don't use it in kernel code; use one of the above constants instead.
  */
 #undef FSCRYPT_MAX_KEY_SIZE
 
+/*
+ * This mask is passed as the third argument to the crypto_alloc_*() functions
+ * to prevent fscrypt from using the Crypto API drivers for non-inline crypto
+ * accelerators.  Those drivers have been problematic for fscrypt.  fscrypt
+ * users have reported hangs and even incorrect en/decryption with these
+ * drivers.  Since going to the driver, off CPU, and back again is really slow,
+ * such drivers can be over 50 times slower than the CPU-based code for
+ * fscrypt's synchronous workload.  Even on platforms that lack AES instructions
+ * on the CPU, any performance benefit is likely to be marginal at best.
+ *
+ * Note that fscrypt also supports inline encryption engines.  Those don't use
+ * the Crypto API and work much better than non-inline accelerators.
+ */
+#define FSCRYPT_CRYPTOAPI_MASK \
+	(CRYPTO_ALG_ALLOCATES_MEMORY | CRYPTO_ALG_KERN_DRIVER_ONLY)
+
 #define FSCRYPT_CONTEXT_V1	1
 #define FSCRYPT_CONTEXT_V2	2
 
 /* Keep this in sync with include/uapi/linux/fscrypt.h */
 #define FSCRYPT_MODE_MAX	FSCRYPT_MODE_AES_256_HCTR2
diff --git a/fs/crypto/hkdf.c b/fs/crypto/hkdf.c
index 0f3028adc9c72..5b9c21cfe2b45 100644
--- a/fs/crypto/hkdf.c
+++ b/fs/crypto/hkdf.c
@@ -56,11 +56,11 @@ int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
 	struct crypto_shash *hmac_tfm;
 	static const u8 default_salt[HKDF_HASHLEN];
 	u8 prk[HKDF_HASHLEN];
 	int err;
 
-	hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, 0);
+	hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, FSCRYPT_CRYPTOAPI_MASK);
 	if (IS_ERR(hmac_tfm)) {
 		fscrypt_err(NULL, "Error allocating " HKDF_HMAC_ALG ": %ld",
 			    PTR_ERR(hmac_tfm));
 		return PTR_ERR(hmac_tfm);
 	}
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 0d71843af9469..d8113a7196979 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -101,11 +101,12 @@ fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
 			  const struct inode *inode)
 {
 	struct crypto_skcipher *tfm;
 	int err;
 
-	tfm = crypto_alloc_skcipher(mode->cipher_str, 0, 0);
+	tfm = crypto_alloc_skcipher(mode->cipher_str, 0,
+				    FSCRYPT_CRYPTOAPI_MASK);
 	if (IS_ERR(tfm)) {
 		if (PTR_ERR(tfm) == -ENOENT) {
 			fscrypt_warn(inode,
 				     "Missing crypto API support for %s (API name: \"%s\")",
 				     mode->friendly_name, mode->cipher_str);
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index b70521c55132b..158ceae8a5bce 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -50,11 +50,12 @@ static int derive_key_aes(const u8 *master_key,
 {
 	int res = 0;
 	struct skcipher_request *req = NULL;
 	DECLARE_CRYPTO_WAIT(wait);
 	struct scatterlist src_sg, dst_sg;
-	struct crypto_skcipher *tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
+	struct crypto_skcipher *tfm =
+		crypto_alloc_skcipher("ecb(aes)", 0, FSCRYPT_CRYPTOAPI_MASK);
 
 	if (IS_ERR(tfm)) {
 		res = PTR_ERR(tfm);
 		tfm = NULL;
 		goto out;

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
