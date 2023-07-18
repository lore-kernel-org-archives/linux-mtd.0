Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BABCC001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OWvcvQHdT36MtD1JKC//gTjL31KN3yq9abxocaVCGw=; b=LuGoqwUrEet/xD
	W8UzNeLR4xi7LjBnPH7dWd2fMcjJjinBkzTuVGb8aNiXapei20QR3vZ8IV9JBcIWLvEn9psrNrXuL
	0w19k1WDgRcbDXTczH2xHjmyu1UM7jFVjuJHU+Wknj/u/ejiFtQlScaoitxqnFyRmQMrIg2tAakf6
	g2uCpkgBhtGqa9sW1FM1+ogeSQHweMc+yolOCiaCsD+0+2n8ugtKDU2ttRgxuDyLg4zA0YIYzGSTt
	UinPPQoLoC9wxkRhk55dQSf7r2JSkf8HsLoCARw3uTI9saVccMcPY7ewIkPPYLNPRccrOugROzKCt
	YtKkPsv5WHpzAcOXGuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Lq-005Yle-2V;
	Wed, 19 Jul 2023 06:07:54 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Lp-005YkS-1d
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/AnSMy15h9q7QyIcZ2Mv9cs4eDjzNQTu7D9ABQn4Tz4=; b=o9hptYMfHstfItJZdbQNkEgqGZ
	Mt1J08vAvDt5lsl4LCjzORVXqw3pW5SnBLNoAwq3qjMTpLweEkWYP5CTY6eguQI2UKwmCOP6OPcIz
	K2wwymAtNZkdUnZUYMro55jv74GFnSCcpoYL1DhEyOPuovDb5HlNpBoGcA53g01oJedKGmD3D2o9y
	4jI4fdk86Tvmr4IVwwcxb16nhjgKUDvfuFXtiyzbB5uDwiUyCY0BpOtrCmXoqvdC7uNtYwRiV6Mhq
	hhFGXTfle73aGQLz15Vx6BwHE4sA2OsNeQ9AXPoU2jRuehZnkk4+KV3eck+t30RuUG8/Swn8mOgQy
	Lam/emIA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkKC-00BYUT-29
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 738A16157E;
	Tue, 18 Jul 2023 13:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DE9C433D9;
	Tue, 18 Jul 2023 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685234;
	bh=LMbtrrL41VdEZgul85mdHBoLsIRux4jBa3a/x61Ycxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nT+7oEuP4bPgj+UiAqrCeUG8s2JirqYarClLaYQ/v7t474QklYXyL0XeFjZeHBVdh
	 gv6D22UjPMjlm71YbZ/F30zxtNnROq9jkGmaU6AnNvB2MtBuIPcvxAraaZNd0iDh0B
	 IMs+GSjziPHc22fbdXvDp3XCm0G+Lnmz9NSwGiWDdh+mPtQmwyjVrzILqas8OPkNnT
	 gWzoDk9n4OHoV1ckft0Jl7jge4Y/jOjIALGlr5nfTnwDwLWGcpc0OM7unB6x/JmeDq
	 qMI9+93zX3UyQsoHYBpXuJ6Jahesute96sx0/ZWb5cr42+NaO3NjuNrMS4ULnd2uuh
	 T9dfxF8HRZITw==
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
Subject: [RFC PATCH 14/21] crypto: lzo-rle - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:40 +0200
Message-Id: <20230718125847.3869700-15-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3187; i=ardb@kernel.org; h=from:subject; bh=LMbtrrL41VdEZgul85mdHBoLsIRux4jBa3a/x61Ycxo=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT92iOmFL6eW+FVzXLW0ihXLXO0i9eJVdGxorWFrc+ eDR0dsdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJnXzP8U5K5NrOp8HTz3nm9 vE+Wqa1J2lLH4G911il0qi/fkmslLYwMe1lrDvNXerk8WPLgpeMdRTOuz4Gm+2dp7xJ/J76NUaC FGQA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140109_269262_BFBC84AE 
X-CRM114-Status: GOOD (  13.10  )
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
 crypto/lzo-rle.c | 60 +-------------------
 1 file changed, 1 insertion(+), 59 deletions(-)

diff --git a/crypto/lzo-rle.c b/crypto/lzo-rle.c
index 0631d975bfac1129..658d6aa46fe21e19 100644
--- a/crypto/lzo-rle.c
+++ b/crypto/lzo-rle.c
@@ -26,29 +26,11 @@ static void *lzorle_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int lzorle_init(struct crypto_tfm *tfm)
-{
-	struct lzorle_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->lzorle_comp_mem = lzorle_alloc_ctx(NULL);
-	if (IS_ERR(ctx->lzorle_comp_mem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void lzorle_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	kvfree(ctx);
 }
 
-static void lzorle_exit(struct crypto_tfm *tfm)
-{
-	struct lzorle_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	lzorle_free_ctx(NULL, ctx->lzorle_comp_mem);
-}
-
 static int __lzorle_compress(const u8 *src, unsigned int slen,
 			  u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -64,14 +46,6 @@ static int __lzorle_compress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzorle_compress(struct crypto_tfm *tfm, const u8 *src,
-			unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct lzorle_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __lzorle_compress(src, slen, dst, dlen, ctx->lzorle_comp_mem);
-}
-
 static int lzorle_scompress(struct crypto_scomp *tfm, const u8 *src,
 			 unsigned int slen, u8 *dst, unsigned int *dlen,
 			 void *ctx)
@@ -94,12 +68,6 @@ static int __lzorle_decompress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzorle_decompress(struct crypto_tfm *tfm, const u8 *src,
-			  unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	return __lzorle_decompress(src, slen, dst, dlen);
-}
-
 static int lzorle_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 			   unsigned int slen, u8 *dst, unsigned int *dlen,
 			   void *ctx)
@@ -107,19 +75,6 @@ static int lzorle_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lzorle_decompress(src, slen, dst, dlen);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "lzo-rle",
-	.cra_driver_name	= "lzo-rle-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct lzorle_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= lzorle_init,
-	.cra_exit		= lzorle_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= lzorle_compress,
-	.coa_decompress		= lzorle_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= lzorle_alloc_ctx,
 	.free_ctx		= lzorle_free_ctx,
@@ -134,24 +89,11 @@ static struct scomp_alg scomp = {
 
 static int __init lzorle_mod_init(void)
 {
-	int ret;
-
-	ret = crypto_register_alg(&alg);
-	if (ret)
-		return ret;
-
-	ret = crypto_register_scomp(&scomp);
-	if (ret) {
-		crypto_unregister_alg(&alg);
-		return ret;
-	}
-
-	return ret;
+	return crypto_register_scomp(&scomp);
 }
 
 static void __exit lzorle_mod_fini(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
