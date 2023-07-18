Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA2AC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZK+7CuZb/7uh8eN3rltgHrcwYTYwkBXvoDCktUaxt4=; b=CADFDHjJOGQuRi
	GR1xph2V7Sd7cwWDSqQBtJPxAyPbCSUo8pX3xOhVRD/DeGEqZ2NV2mWOI/sTkpgLW3HZ4+f0zm1mh
	txrTLDIRn/NnhxGjOm60UP10GZLiAvjM2pZDcwA/ZGisMFhGC+t9yKeIsTWz98j6rs3yuNQoeNRDb
	Z1/ZoZJgtJWUz+D/VakHtz4tPKVIVo5/g3E6cIVSczbx1kSmu4NtHIWkiBK98VsxTZkAeyN3sGSau
	GMkc0lZxMl8dDlbLc0N1/W6nR+Yljpi0bdaNrkUh6UqsGw+KWyWSuPN1bDLcdl34ouB9/SKK9863K
	8cjXbMF2Lr5fkQxKnkVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzYB-005CTi-0Z;
	Wed, 19 Jul 2023 05:16:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzY9-005CSq-1C
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:16:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uU7LsleR+bunjpyXfpIDw/S/I5ukDh86zvktec1fSKQ=; b=Bg3XTfbW9iei5mZDggYLyuNLIk
	3ZZcyxpOy7ttenKsHDjlGOkAkglT6w89GVteLAe/M0e3xAzmNDS+DWZkM9/YsJuWRMbG+51tU0hO3
	B4iaVq1oytRWsrkwsJsHv60vwh/4DW3tVbhawOidgH0con69JSux45uxo4RAf8GCO1ulDP+QxqEC9
	P7vCYPZ3QULGlbIVafevSMGd7wP5Pzu90Gn/Auv7XUgkqqrWMJ1n98Ilnt62NphDa21bkyStx9Sos
	xtywbaagTfb2RB0KBGdj1zvNzMJlbDgEgGOQft2LXP0byS4y/Kgv9jVr7zzbtFRvmrir2gAi+M6Na
	TPLHH7aA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkK0-00BYS1-33
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:00:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C35461587;
	Tue, 18 Jul 2023 13:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA35DC433C7;
	Tue, 18 Jul 2023 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685254;
	bh=XPV4TqBofI5Mv/9FxSzW2w9wDpjRH3FBmnl+elNmQmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ISjla2n56YlijkAfztYf+g/V55gbC1NwHuZxMobak7dzq1xFYwC2FOjLzG7BhGk39
	 WElaQlZCvERhLtfdZN6U1NTa89maaiB/EROatQGBz3Tf+2R0fxGm7Mz2CwC19whuMX
	 ujukHX5uc0QUGdmNauZEsgc+XRWigo+HTrRhHh/XQV3Lg2DIjDtQD7ngcClNZQzThu
	 Ko41ly0UE0C9pfmRdwaPFsb6Gf5mwmNkCbbova/2+c4P5r9ZHJoRynlewW/aQwNEdd
	 +wNcHpk9se26dAHR8lWvDp9i/MsFjfKPDw90Z4ePMA82jrNu75a/IUzbYcr5SjzBcx
	 Au5HmuXBKW+SQ==
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
Subject: [RFC PATCH 18/21] crypto: compress_null - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:44 +0200
Message-Id: <20230718125847.3869700-19-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053; i=ardb@kernel.org; h=from:subject; bh=XPV4TqBofI5Mv/9FxSzW2w9wDpjRH3FBmnl+elNmQmI=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT/O57bKCxz/9vLss0pfr+Jm/e61X1XTMfSsSULYue u/2p0xfOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBE+MwY/odZ3Irasizr+IVT X0s6Prw8+Ytn0b/OLRkMdSdmL343SdCNkWHWzl16hVIP5jypnaLLdu2tadOnOdt63cPaO1PuCd/ ZfJQNAA==
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140057_539156_16673675 
X-CRM114-Status: GOOD (  15.45  )
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

The 'comp' API is obsolete and will be removed, so remove this comp
implementation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/crypto_null.c | 31 ++++----------------
 crypto/testmgr.c     |  3 --
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/crypto/crypto_null.c b/crypto/crypto_null.c
index 5b84b0f7cc178fcd..75e73b1d6df01cc6 100644
--- a/crypto/crypto_null.c
+++ b/crypto/crypto_null.c
@@ -24,16 +24,6 @@ static DEFINE_MUTEX(crypto_default_null_skcipher_lock);
 static struct crypto_sync_skcipher *crypto_default_null_skcipher;
 static int crypto_default_null_skcipher_refcnt;
 
-static int null_compress(struct crypto_tfm *tfm, const u8 *src,
-			 unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	if (slen > *dlen)
-		return -EINVAL;
-	memcpy(dst, src, slen);
-	*dlen = slen;
-	return 0;
-}
-
 static int null_init(struct shash_desc *desc)
 {
 	return 0;
@@ -121,7 +111,7 @@ static struct skcipher_alg skcipher_null = {
 	.decrypt		=	null_skcipher_crypt,
 };
 
-static struct crypto_alg null_algs[] = { {
+static struct crypto_alg cipher_null = {
 	.cra_name		=	"cipher_null",
 	.cra_driver_name	=	"cipher_null-generic",
 	.cra_flags		=	CRYPTO_ALG_TYPE_CIPHER,
@@ -134,19 +124,8 @@ static struct crypto_alg null_algs[] = { {
 	.cia_setkey		= 	null_setkey,
 	.cia_encrypt		=	null_crypt,
 	.cia_decrypt		=	null_crypt } }
-}, {
-	.cra_name		=	"compress_null",
-	.cra_driver_name	=	"compress_null-generic",
-	.cra_flags		=	CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_blocksize		=	NULL_BLOCK_SIZE,
-	.cra_ctxsize		=	0,
-	.cra_module		=	THIS_MODULE,
-	.cra_u			=	{ .compress = {
-	.coa_compress		=	null_compress,
-	.coa_decompress		=	null_compress } }
-} };
+};
 
-MODULE_ALIAS_CRYPTO("compress_null");
 MODULE_ALIAS_CRYPTO("digest_null");
 MODULE_ALIAS_CRYPTO("cipher_null");
 
@@ -189,7 +168,7 @@ static int __init crypto_null_mod_init(void)
 {
 	int ret = 0;
 
-	ret = crypto_register_algs(null_algs, ARRAY_SIZE(null_algs));
+	ret = crypto_register_alg(&cipher_null);
 	if (ret < 0)
 		goto out;
 
@@ -206,14 +185,14 @@ static int __init crypto_null_mod_init(void)
 out_unregister_shash:
 	crypto_unregister_shash(&digest_null);
 out_unregister_algs:
-	crypto_unregister_algs(null_algs, ARRAY_SIZE(null_algs));
+	crypto_unregister_alg(&cipher_null);
 out:
 	return ret;
 }
 
 static void __exit crypto_null_mod_fini(void)
 {
-	crypto_unregister_algs(null_algs, ARRAY_SIZE(null_algs));
+	crypto_unregister_alg(&cipher_null);
 	crypto_unregister_shash(&digest_null);
 	crypto_unregister_skcipher(&skcipher_null);
 }
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 4971351f55dbabb9..e4b6d67233763193 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4633,9 +4633,6 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sm4_cmac128_tv_template)
 		}
-	}, {
-		.alg = "compress_null",
-		.test = alg_test_null,
 	}, {
 		.alg = "crc32",
 		.test = alg_test_hash,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
