Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5E9C001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucqJY2RmlcplDfXf8wmmh9HtNm0tcdozT452BMAagbY=; b=bw/e5JxUnu3m1x
	jUyh7pbFQmRPa5XSAQXng38s/5m2PohPf8z6zwOidHwGZFNCueOtVAgQNBc+Kig+b03vVJj3Y2+TJ
	LXctUYEkcOIIe3/W3su5EKv6XDbkKzMzKegbce/Jqi9mqSrC1939UpG62x/aSNJGMBv7zH6h3y7Vh
	t79YHWlH3daxf7if/3hhXRvv3VnCf/bkV+3b2uYc7JucwAkyErIAGmq7jfNgVUX1lnIxqrz0vQOVC
	owS+rDHkCrXEIGLQvAZTqMv6hugyZWmeRjNaV0IDGe1UfOf0jc7cv7LEqyCitUVYsPovsp3NleByF
	t3O32pE7dtSr0fJY27fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2MA-006H4p-2I;
	Wed, 19 Jul 2023 08:16:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2M8-006H3Z-1A
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6OipNjMEHgtnPVgpdKFTj+KOn9MFX88d/2/VZEmLVAc=; b=Zxt01I2VxGZFsL/fgpHQYUt2GW
	Kgmj1DlZitaZExB4WlBgoaZwq1bCu9YvpxlQiRpfLoMpXb0C7Iga2i2vfnvbjIrgKbZRRpeMOvUJD
	hDotdR0x2eCciTRHK4d2bbP9C0skeMKOC34KoZpgdzxJfH4oWouogmxJXq1o9AbONFRPxIGB6/q8G
	dIiab4VzaqvdxJsX2o35mP9C422AuVqgLkvunoc+XVUUgv1vapcQ02NxL8MuchUAxrQ+ZVL5k7e0p
	gi47sWgUNEKFw2GX9WuRNw9IHWN/hxCK/8Off577LVucfGnzGUkDkgeIVTxiNjGfQExJQOjzyawdP
	c1eew1Sg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkK3-00BYS1-2S
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7197561576;
	Tue, 18 Jul 2023 13:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C20EC433C8;
	Tue, 18 Jul 2023 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685258;
	bh=thRSdxoUoJtX9/ROwSyclgUVl+V+wbRWVeeCqTK3scE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ze4VmS9dtaGl9wj5pry7GbBDkDkQOofV3BVNG7uj6sc4Ps/SBOd0LDdgc1VvRCCMZ
	 oQIwgu75PffM7qW/XWRGg6XVgPzUbp8ikBKKf9jjzWXzKLNqwqru1DWiP8oIikW0/F
	 uFBPeeDyjnw8QeS6n/IVDewiTukJFF0S7wkNpy2/gFz1Qe188RRucd4s0q9fC4wpyG
	 hzQB2xBvhiW0E5yhIWT2zuuT3+iP6Qmd6UYCIlYmQPMQwGaOM4MlpBHXZKeyWaFejx
	 y7QQhHNED7/yRCz8ABfTrdVyVJDOU09Jt1k8tw6Xbj5+sgCAs9/wjAUVs/um43mIxR
	 FSaAAgUorxL1Q==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Haren Myneni <haren@us.ibm.com>,
	Nick Terrell <terrelln@fb.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Richard Weinberger <richard@nod.at>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	qat-linux@intel.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [RFC PATCH 19/21] crypto: remove obsolete 'comp' compression API
Date: Tue, 18 Jul 2023 14:58:45 +0200
Message-Id: <20230718125847.3869700-20-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12153; i=ardb@kernel.org; h=from:subject; bh=thRSdxoUoJtX9/ROwSyclgUVl+V+wbRWVeeCqTK3scE=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT4v13NiwNJYni81fdN6S+jel4BxLsY+57BqX9zPOP nLf+e1oRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI7O8M/8t+diY16YddZBac L73/Uvvux/uWGSsFrxU1CfvzS3epBSfD/5DTIdenVxlWxSsI3tOL25PNrHpZcInjLONVjy8onRD ewgMA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140100_325319_D397FFD7 
X-CRM114-Status: GOOD (  22.29  )
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

The 'comp' compression API has been superseded by the acomp API, which
is a bit more cumbersome to use, but ultimately more flexible when it
comes to hardware implementations.

Now that all the users and implementations have been removed, let's
remove the core plumbing of the 'comp' API as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/crypto/architecture.rst |   2 -
 crypto/Makefile                       |   2 +-
 crypto/api.c                          |   4 -
 crypto/compress.c                     |  32 -----
 crypto/crypto_user_base.c             |  16 ---
 crypto/crypto_user_stat.c             |   4 -
 crypto/proc.c                         |   3 -
 crypto/testmgr.c                      | 144 ++------------------
 include/linux/crypto.h                |  49 +------
 9 files changed, 12 insertions(+), 244 deletions(-)

diff --git a/Documentation/crypto/architecture.rst b/Documentation/crypto/architecture.rst
index 646c3380a7edc4c6..ec7436aade15c2e6 100644
--- a/Documentation/crypto/architecture.rst
+++ b/Documentation/crypto/architecture.rst
@@ -196,8 +196,6 @@ the aforementioned cipher types:
 
 -  CRYPTO_ALG_TYPE_CIPHER Single block cipher
 
--  CRYPTO_ALG_TYPE_COMPRESS Compression
-
 -  CRYPTO_ALG_TYPE_AEAD Authenticated Encryption with Associated Data
    (MAC)
 
diff --git a/crypto/Makefile b/crypto/Makefile
index 953a7e105e58c837..5775440c62e09eac 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -4,7 +4,7 @@
 #
 
 obj-$(CONFIG_CRYPTO) += crypto.o
-crypto-y := api.o cipher.o compress.o
+crypto-y := api.o cipher.o
 
 obj-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
 obj-$(CONFIG_CRYPTO_FIPS) += fips.o
diff --git a/crypto/api.c b/crypto/api.c
index b9cc0c906efe0706..23d691a70bc3fb00 100644
--- a/crypto/api.c
+++ b/crypto/api.c
@@ -369,10 +369,6 @@ static unsigned int crypto_ctxsize(struct crypto_alg *alg, u32 type, u32 mask)
 	case CRYPTO_ALG_TYPE_CIPHER:
 		len += crypto_cipher_ctxsize(alg);
 		break;
-
-	case CRYPTO_ALG_TYPE_COMPRESS:
-		len += crypto_compress_ctxsize(alg);
-		break;
 	}
 
 	return len;
diff --git a/crypto/compress.c b/crypto/compress.c
deleted file mode 100644
index 9048fe390c463069..0000000000000000
--- a/crypto/compress.c
+++ /dev/null
@@ -1,32 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- *
- * Compression operations.
- *
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- */
-#include <linux/crypto.h>
-#include "internal.h"
-
-int crypto_comp_compress(struct crypto_comp *comp,
-			 const u8 *src, unsigned int slen,
-			 u8 *dst, unsigned int *dlen)
-{
-	struct crypto_tfm *tfm = crypto_comp_tfm(comp);
-
-	return tfm->__crt_alg->cra_compress.coa_compress(tfm, src, slen, dst,
-	                                                 dlen);
-}
-EXPORT_SYMBOL_GPL(crypto_comp_compress);
-
-int crypto_comp_decompress(struct crypto_comp *comp,
-			   const u8 *src, unsigned int slen,
-			   u8 *dst, unsigned int *dlen)
-{
-	struct crypto_tfm *tfm = crypto_comp_tfm(comp);
-
-	return tfm->__crt_alg->cra_compress.coa_decompress(tfm, src, slen, dst,
-	                                                   dlen);
-}
-EXPORT_SYMBOL_GPL(crypto_comp_decompress);
diff --git a/crypto/crypto_user_base.c b/crypto/crypto_user_base.c
index 3fa20f12989f7ef2..c27484b0042e6bd8 100644
--- a/crypto/crypto_user_base.c
+++ b/crypto/crypto_user_base.c
@@ -85,17 +85,6 @@ static int crypto_report_cipher(struct sk_buff *skb, struct crypto_alg *alg)
 		       sizeof(rcipher), &rcipher);
 }
 
-static int crypto_report_comp(struct sk_buff *skb, struct crypto_alg *alg)
-{
-	struct crypto_report_comp rcomp;
-
-	memset(&rcomp, 0, sizeof(rcomp));
-
-	strscpy(rcomp.type, "compression", sizeof(rcomp.type));
-
-	return nla_put(skb, CRYPTOCFGA_REPORT_COMPRESS, sizeof(rcomp), &rcomp);
-}
-
 static int crypto_report_one(struct crypto_alg *alg,
 			     struct crypto_user_alg *ualg, struct sk_buff *skb)
 {
@@ -136,11 +125,6 @@ static int crypto_report_one(struct crypto_alg *alg,
 		if (crypto_report_cipher(skb, alg))
 			goto nla_put_failure;
 
-		break;
-	case CRYPTO_ALG_TYPE_COMPRESS:
-		if (crypto_report_comp(skb, alg))
-			goto nla_put_failure;
-
 		break;
 	}
 
diff --git a/crypto/crypto_user_stat.c b/crypto/crypto_user_stat.c
index d4f3d39b51376973..d3133eda2f528d17 100644
--- a/crypto/crypto_user_stat.c
+++ b/crypto/crypto_user_stat.c
@@ -86,10 +86,6 @@ static int crypto_reportstat_one(struct crypto_alg *alg,
 		if (crypto_report_cipher(skb, alg))
 			goto nla_put_failure;
 		break;
-	case CRYPTO_ALG_TYPE_COMPRESS:
-		if (crypto_report_comp(skb, alg))
-			goto nla_put_failure;
-		break;
 	default:
 		pr_err("ERROR: Unhandled alg %d in %s\n",
 		       alg->cra_flags & (CRYPTO_ALG_TYPE_MASK | CRYPTO_ALG_LARVAL),
diff --git a/crypto/proc.c b/crypto/proc.c
index 56c7c78df29713e3..88cc9830a9a907a8 100644
--- a/crypto/proc.c
+++ b/crypto/proc.c
@@ -75,9 +75,6 @@ static int c_show(struct seq_file *m, void *p)
 		seq_printf(m, "max keysize  : %u\n",
 					alg->cra_cipher.cia_max_keysize);
 		break;
-	case CRYPTO_ALG_TYPE_COMPRESS:
-		seq_printf(m, "type         : compression\n");
-		break;
 	default:
 		seq_printf(m, "type         : unknown\n");
 		break;
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index e4b6d67233763193..c476d1248c10d005 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -3295,112 +3295,6 @@ static int alg_test_skcipher(const struct alg_test_desc *desc,
 	return err;
 }
 
-static int test_comp(struct crypto_comp *tfm,
-		     const struct comp_testvec *ctemplate,
-		     const struct comp_testvec *dtemplate,
-		     int ctcount, int dtcount)
-{
-	const char *algo = crypto_tfm_alg_driver_name(crypto_comp_tfm(tfm));
-	char *output, *decomp_output;
-	unsigned int i;
-	int ret;
-
-	output = kmalloc(COMP_BUF_SIZE, GFP_KERNEL);
-	if (!output)
-		return -ENOMEM;
-
-	decomp_output = kmalloc(COMP_BUF_SIZE, GFP_KERNEL);
-	if (!decomp_output) {
-		kfree(output);
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < ctcount; i++) {
-		int ilen;
-		unsigned int dlen = COMP_BUF_SIZE;
-
-		memset(output, 0, COMP_BUF_SIZE);
-		memset(decomp_output, 0, COMP_BUF_SIZE);
-
-		ilen = ctemplate[i].inlen;
-		ret = crypto_comp_compress(tfm, ctemplate[i].input,
-					   ilen, output, &dlen);
-		if (ret) {
-			printk(KERN_ERR "alg: comp: compression failed "
-			       "on test %d for %s: ret=%d\n", i + 1, algo,
-			       -ret);
-			goto out;
-		}
-
-		ilen = dlen;
-		dlen = COMP_BUF_SIZE;
-		ret = crypto_comp_decompress(tfm, output,
-					     ilen, decomp_output, &dlen);
-		if (ret) {
-			pr_err("alg: comp: compression failed: decompress: on test %d for %s failed: ret=%d\n",
-			       i + 1, algo, -ret);
-			goto out;
-		}
-
-		if (dlen != ctemplate[i].inlen) {
-			printk(KERN_ERR "alg: comp: Compression test %d "
-			       "failed for %s: output len = %d\n", i + 1, algo,
-			       dlen);
-			ret = -EINVAL;
-			goto out;
-		}
-
-		if (memcmp(decomp_output, ctemplate[i].input,
-			   ctemplate[i].inlen)) {
-			pr_err("alg: comp: compression failed: output differs: on test %d for %s\n",
-			       i + 1, algo);
-			hexdump(decomp_output, dlen);
-			ret = -EINVAL;
-			goto out;
-		}
-	}
-
-	for (i = 0; i < dtcount; i++) {
-		int ilen;
-		unsigned int dlen = COMP_BUF_SIZE;
-
-		memset(decomp_output, 0, COMP_BUF_SIZE);
-
-		ilen = dtemplate[i].inlen;
-		ret = crypto_comp_decompress(tfm, dtemplate[i].input,
-					     ilen, decomp_output, &dlen);
-		if (ret) {
-			printk(KERN_ERR "alg: comp: decompression failed "
-			       "on test %d for %s: ret=%d\n", i + 1, algo,
-			       -ret);
-			goto out;
-		}
-
-		if (dlen != dtemplate[i].outlen) {
-			printk(KERN_ERR "alg: comp: Decompression test %d "
-			       "failed for %s: output len = %d\n", i + 1, algo,
-			       dlen);
-			ret = -EINVAL;
-			goto out;
-		}
-
-		if (memcmp(decomp_output, dtemplate[i].output, dlen)) {
-			printk(KERN_ERR "alg: comp: Decompression test %d "
-			       "failed for %s\n", i + 1, algo);
-			hexdump(decomp_output, dlen);
-			ret = -EINVAL;
-			goto out;
-		}
-	}
-
-	ret = 0;
-
-out:
-	kfree(decomp_output);
-	kfree(output);
-	return ret;
-}
-
 static int test_acomp(struct crypto_acomp *tfm,
 		      const struct comp_testvec *ctemplate,
 		      const struct comp_testvec *dtemplate,
@@ -3657,38 +3551,20 @@ static int alg_test_cipher(const struct alg_test_desc *desc,
 static int alg_test_comp(const struct alg_test_desc *desc, const char *driver,
 			 u32 type, u32 mask)
 {
-	struct crypto_comp *comp;
 	struct crypto_acomp *acomp;
 	int err;
-	u32 algo_type = type & CRYPTO_ALG_TYPE_ACOMPRESS_MASK;
 
-	if (algo_type == CRYPTO_ALG_TYPE_ACOMPRESS) {
-		acomp = crypto_alloc_acomp(driver, type, mask);
-		if (IS_ERR(acomp)) {
-			pr_err("alg: acomp: Failed to load transform for %s: %ld\n",
-			       driver, PTR_ERR(acomp));
-			return PTR_ERR(acomp);
-		}
-		err = test_acomp(acomp, desc->suite.comp.comp.vecs,
-				 desc->suite.comp.decomp.vecs,
-				 desc->suite.comp.comp.count,
-				 desc->suite.comp.decomp.count);
-		crypto_free_acomp(acomp);
-	} else {
-		comp = crypto_alloc_comp(driver, type, mask);
-		if (IS_ERR(comp)) {
-			pr_err("alg: comp: Failed to load transform for %s: %ld\n",
-			       driver, PTR_ERR(comp));
-			return PTR_ERR(comp);
-		}
-
-		err = test_comp(comp, desc->suite.comp.comp.vecs,
-				desc->suite.comp.decomp.vecs,
-				desc->suite.comp.comp.count,
-				desc->suite.comp.decomp.count);
-
-		crypto_free_comp(comp);
+	acomp = crypto_alloc_acomp(driver, type, mask);
+	if (IS_ERR(acomp)) {
+		pr_err("alg: acomp: Failed to load transform for %s: %ld\n",
+		       driver, PTR_ERR(acomp));
+		return PTR_ERR(acomp);
 	}
+	err = test_acomp(acomp, desc->suite.comp.comp.vecs,
+			 desc->suite.comp.decomp.vecs,
+			 desc->suite.comp.comp.count,
+			 desc->suite.comp.decomp.count);
+	crypto_free_acomp(acomp);
 	return err;
 }
 
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index 31f6fee0c36c6448..b40debb7d32d99fd 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -22,7 +22,7 @@
  */
 #define CRYPTO_ALG_TYPE_MASK		0x0000000f
 #define CRYPTO_ALG_TYPE_CIPHER		0x00000001
-#define CRYPTO_ALG_TYPE_COMPRESS	0x00000002
+//#define CRYPTO_ALG_TYPE_COMPRESS	0x00000002
 #define CRYPTO_ALG_TYPE_AEAD		0x00000003
 #define CRYPTO_ALG_TYPE_SKCIPHER	0x00000005
 #define CRYPTO_ALG_TYPE_AKCIPHER	0x00000006
@@ -493,52 +493,5 @@ static inline unsigned int crypto_tfm_ctx_alignment(void)
 	return __alignof__(tfm->__crt_ctx);
 }
 
-static inline struct crypto_comp *__crypto_comp_cast(struct crypto_tfm *tfm)
-{
-	return (struct crypto_comp *)tfm;
-}
-
-static inline struct crypto_comp *crypto_alloc_comp(const char *alg_name,
-						    u32 type, u32 mask)
-{
-	type &= ~CRYPTO_ALG_TYPE_MASK;
-	type |= CRYPTO_ALG_TYPE_COMPRESS;
-	mask |= CRYPTO_ALG_TYPE_MASK;
-
-	return __crypto_comp_cast(crypto_alloc_base(alg_name, type, mask));
-}
-
-static inline struct crypto_tfm *crypto_comp_tfm(struct crypto_comp *tfm)
-{
-	return &tfm->base;
-}
-
-static inline void crypto_free_comp(struct crypto_comp *tfm)
-{
-	crypto_free_tfm(crypto_comp_tfm(tfm));
-}
-
-static inline int crypto_has_comp(const char *alg_name, u32 type, u32 mask)
-{
-	type &= ~CRYPTO_ALG_TYPE_MASK;
-	type |= CRYPTO_ALG_TYPE_COMPRESS;
-	mask |= CRYPTO_ALG_TYPE_MASK;
-
-	return crypto_has_alg(alg_name, type, mask);
-}
-
-static inline const char *crypto_comp_name(struct crypto_comp *tfm)
-{
-	return crypto_tfm_alg_name(crypto_comp_tfm(tfm));
-}
-
-int crypto_comp_compress(struct crypto_comp *tfm,
-			 const u8 *src, unsigned int slen,
-			 u8 *dst, unsigned int *dlen);
-
-int crypto_comp_decompress(struct crypto_comp *tfm,
-			   const u8 *src, unsigned int slen,
-			   u8 *dst, unsigned int *dlen);
-
 #endif	/* _LINUX_CRYPTO_H */
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
