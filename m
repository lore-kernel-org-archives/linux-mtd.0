Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E62C43461
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0325207C3
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 08:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gNdETPtU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNXvgR5b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0325207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R2xsmD7829AE/pYtacpr6B3Z+AdNh2G2laKS5MPujiI=; b=gNdETPtUWcWRWIryhMCvbUz7N
	y5MAAWm/UoXuICKBRZXg5gimxSPTSWayS++crDeP+xJlcZfeSfRWA3Tbv/99r9vUh6/CMzJKtZJUw
	Raz/CtWDtFFa+b09oRoF9uW8NBS30gZOThBMoDopP9lAWTj33FjOH559fP8YEf4GG19PD3yauqOOc
	255KpUTaC3b5BJDp3t4stlUILVzC2y3fBmaMU/FLwRMXrwHkaSDU7zt2Yo/ki9QA1RGO5FliBVjaE
	qR4d9umnsF1RXyPaTz1clnMJ3pmDYbYCbA2BFTwL/NjnNbYKlHsy8fbeLdpjTIR4+UbhR6JwrcZFe
	P6JvJQvSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHNWd-000153-VD; Sun, 13 Sep 2020 08:38:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHNWM-000103-Sn
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 08:38:06 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0090E221E7;
 Sun, 13 Sep 2020 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986280;
 bh=MK+A5d7zq9Y3Zsp3oOCC55fP5PFX6LAy1zZJkGWXiO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BNXvgR5be/gzPpLGuUrvSdScKa/sWQTRwvtGRXdyLDV9JksHQuCd363gzeItv1NTO
 fe8DHiB/3NngDwFC1HJAMcMhn7T+d0fNkZRqLoTsAqiPgTyy1iW2iC1bdIXYivfggq
 BghRF3rUV5A5hGY+UX1g51VGbPjjlUjgDIdH+ssE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 08/11] fscrypt: stop pretending that key setup is nofs-safe
Date: Sun, 13 Sep 2020 01:36:17 -0700
Message-Id: <20200913083620.170627-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913083620.170627-1-ebiggers@kernel.org>
References: <20200913083620.170627-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_043803_074192_6374EB43 
X-CRM114-Status: GOOD (  17.07  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

fscrypt_get_encryption_info() has never actually been safe to call in a
context that needs GFP_NOFS, since it calls crypto_alloc_skcipher().

crypto_alloc_skcipher() isn't GFP_NOFS-safe, even if called under
memalloc_nofs_save().  This is because it may load kernel modules, and
also because it internally takes crypto_alg_sem.  Other tasks can do
GFP_KERNEL allocations while holding crypto_alg_sem for write.

The use of fscrypt_init_mutex isn't GFP_NOFS-safe either.

So, stop pretending that fscrypt_get_encryption_info() is nofs-safe.
I.e., when it allocates memory, just use GFP_KERNEL instead of GFP_NOFS.

Note, another reason to do this is that GFP_NOFS is deprecated in favor
of using memalloc_nofs_save() in the proper places.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/inline_crypt.c | 7 ++-----
 fs/crypto/keysetup.c     | 2 +-
 fs/crypto/keysetup_v1.c  | 8 ++++----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index faa25541ccb68..89bffa82ed74a 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -106,7 +106,7 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 	crypto_cfg.data_unit_size = sb->s_blocksize;
 	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
 	num_devs = fscrypt_get_num_devices(sb);
-	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_NOFS);
+	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
 	if (!devs)
 		return -ENOMEM;
 	fscrypt_get_devices(sb, num_devs, devs);
@@ -135,9 +135,8 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	struct fscrypt_blk_crypto_key *blk_key;
 	int err;
 	int i;
-	unsigned int flags;
 
-	blk_key = kzalloc(struct_size(blk_key, devs, num_devs), GFP_NOFS);
+	blk_key = kzalloc(struct_size(blk_key, devs, num_devs), GFP_KERNEL);
 	if (!blk_key)
 		return -ENOMEM;
 
@@ -166,10 +165,8 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 		}
 		queue_refs++;
 
-		flags = memalloc_nofs_save();
 		err = blk_crypto_start_using_key(&blk_key->base,
 						 blk_key->devs[i]);
-		memalloc_nofs_restore(flags);
 		if (err) {
 			fscrypt_err(inode,
 				    "error %d starting to use blk-crypto", err);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 5371eee8f4b30..7f5fbc2654d57 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -485,7 +485,7 @@ fscrypt_setup_encryption_info(struct inode *inode,
 	if (res)
 		return res;
 
-	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_NOFS);
+	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_KERNEL);
 	if (!crypt_info)
 		return -ENOMEM;
 
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index a3cb52572b05c..2762c53504323 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -60,7 +60,7 @@ static int derive_key_aes(const u8 *master_key,
 		goto out;
 	}
 	crypto_skcipher_set_flags(tfm, CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
-	req = skcipher_request_alloc(tfm, GFP_NOFS);
+	req = skcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req) {
 		res = -ENOMEM;
 		goto out;
@@ -99,7 +99,7 @@ find_and_lock_process_key(const char *prefix,
 	const struct user_key_payload *ukp;
 	const struct fscrypt_key *payload;
 
-	description = kasprintf(GFP_NOFS, "%s%*phN", prefix,
+	description = kasprintf(GFP_KERNEL, "%s%*phN", prefix,
 				FSCRYPT_KEY_DESCRIPTOR_SIZE, descriptor);
 	if (!description)
 		return ERR_PTR(-ENOMEM);
@@ -228,7 +228,7 @@ fscrypt_get_direct_key(const struct fscrypt_info *ci, const u8 *raw_key)
 		return dk;
 
 	/* Nope, allocate one. */
-	dk = kzalloc(sizeof(*dk), GFP_NOFS);
+	dk = kzalloc(sizeof(*dk), GFP_KERNEL);
 	if (!dk)
 		return ERR_PTR(-ENOMEM);
 	refcount_set(&dk->dk_refcount, 1);
@@ -272,7 +272,7 @@ static int setup_v1_file_key_derived(struct fscrypt_info *ci,
 	 * This cannot be a stack buffer because it will be passed to the
 	 * scatterlist crypto API during derive_key_aes().
 	 */
-	derived_key = kmalloc(ci->ci_mode->keysize, GFP_NOFS);
+	derived_key = kmalloc(ci->ci_mode->keysize, GFP_KERNEL);
 	if (!derived_key)
 		return -ENOMEM;
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
