Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40CAEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GraX7fKMvWhAqEwscER3Ou4TIv9hvyHkK7I+bw73cpI=; b=xBa+fyD5nGaKMx
	Uc6e0L9tiSngpSJGzHHGJBiJg6NPB6p07o5GdwWigKrr4OhFQRKJdStKkKWjNF+6lEAJo1VHvbm+/
	CMbTxf/L91oZ/GsHao+PDrSiIq4MVLJgh5Qha8JdkUlFpR1PkRtZzF45xk3TJLkrZXorBr6JCHQwl
	WOVdEtbLJMG9eN8EScwFDjP81qP7wx980Q90wpCSVclCRBxpNO302eB9vFP1Hxp3IsHuIG6t3HPXt
	YC2goQ7nS0aVQ1UyIq9Pb78cyCB8Zr5r2hh2eaMGLLesDAZ/745Sdh8tkvb7WfboCcXJr/s7k+NBj
	NO87irVE3nSbZhmqtevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzhO-005IKC-0S;
	Wed, 19 Jul 2023 05:26:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzhL-005IIl-2r
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V+bFapR0nVHw1HsIXYZth7gJcsidHQgOnZtInM9Olnc=; b=EX/geHYYBXkFV+ZHsIPTz5iW1Z
	5NXjWng/GM2i3EiprY/P/wHKJZXQmslW3yNIlYoLZ4EUM1rV93umodQTe0WVFlE/onVhk5WTOx+ly
	qegENnEUfGoZE4d/ePpBcHgYkdTFN0gEIKIooawce6GHUYHIVEChIRq2al2gDwLySHFkLo0b0mIRR
	xNuWTKf/Uk3VQ741TETw/ffBiW4y8DCuEUVTwjmvC+GinrJaxEuJR7O8raBTMyK8Gpps1pVj9Eqqm
	2ZNj/OvYBkXUlwOf6igw/adleTWK+RHyGE4oUrWIq0rl1UZ4yYlMmDewd2vj5CyUVsx+eNzQ9vbqp
	TEDWEGSw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkJk-00BYPz-1Z
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:00:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A98C6157D;
	Tue, 18 Jul 2023 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F118C433CB;
	Tue, 18 Jul 2023 13:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685239;
	bh=B1nBFJJhWHao7x/jd7i5fuI23+yDZ6JoStSpKA85T9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QhcyEI485FT2QOQtXBfhXcNDTACc7aPZfUqUqG3O9OToL0ZEx0lz7onOEKWJPzF9a
	 29V0dmzfrrJ3bCKgXlMuwbIUdTvTm+1Zpoe+tGs6TZti2ETR6FJ1FgdzwzaSvekHmr
	 c8yV+dQ2XrHtLMqI7Vg2esHe763q3vsZ7ZM/UIhrdy4i+AbmkEaxlGPqCzCZMOZyix
	 ShrupEhmBq/x4aJ6cfMqPlbAT/aHBEWz10wyt3zwdM+RIAFOkK7WZLz3QX6ltlCYT4
	 7BfiQ4z+MIU14wMhRhIlW7ioLMEBdLH5L7qx293zEXFht84tDeGivetAZTv7LWIhuC
	 Qj9M8ywZ/Mz2w==
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
Subject: [RFC PATCH 15/21] crypto: lzo - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:41 +0200
Message-Id: <20230718125847.3869700-16-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060; i=ardb@kernel.org; h=from:subject; bh=B1nBFJJhWHao7x/jd7i5fuI23+yDZ6JoStSpKA85T9w=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT/2Ni1NiPvWy+jZsEfB5cPNcUclCmTWb/9o7t6rL7 P3yrMm5o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExklT8jw7eu5YnnXnr2v3/k /iTKISblY5WU5XlVNdWz8+re3l2YNouRYdar/jru1XfPPjn586Ufp6+6Aeu1+6/7rfx5ZuZ8ePL YhRMA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140040_959004_7A16FA66 
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
 crypto/lzo.c | 60 +-------------------
 1 file changed, 1 insertion(+), 59 deletions(-)

diff --git a/crypto/lzo.c b/crypto/lzo.c
index ebda132dd22bf543..52558f9d41f3dcea 100644
--- a/crypto/lzo.c
+++ b/crypto/lzo.c
@@ -26,29 +26,11 @@ static void *lzo_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int lzo_init(struct crypto_tfm *tfm)
-{
-	struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->lzo_comp_mem = lzo_alloc_ctx(NULL);
-	if (IS_ERR(ctx->lzo_comp_mem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void lzo_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	kvfree(ctx);
 }
 
-static void lzo_exit(struct crypto_tfm *tfm)
-{
-	struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	lzo_free_ctx(NULL, ctx->lzo_comp_mem);
-}
-
 static int __lzo_compress(const u8 *src, unsigned int slen,
 			  u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -64,14 +46,6 @@ static int __lzo_compress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzo_compress(struct crypto_tfm *tfm, const u8 *src,
-			unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __lzo_compress(src, slen, dst, dlen, ctx->lzo_comp_mem);
-}
-
 static int lzo_scompress(struct crypto_scomp *tfm, const u8 *src,
 			 unsigned int slen, u8 *dst, unsigned int *dlen,
 			 void *ctx)
@@ -94,12 +68,6 @@ static int __lzo_decompress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int lzo_decompress(struct crypto_tfm *tfm, const u8 *src,
-			  unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	return __lzo_decompress(src, slen, dst, dlen);
-}
-
 static int lzo_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 			   unsigned int slen, u8 *dst, unsigned int *dlen,
 			   void *ctx)
@@ -107,19 +75,6 @@ static int lzo_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lzo_decompress(src, slen, dst, dlen);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "lzo",
-	.cra_driver_name	= "lzo-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct lzo_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= lzo_init,
-	.cra_exit		= lzo_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= lzo_compress,
-	.coa_decompress		= lzo_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= lzo_alloc_ctx,
 	.free_ctx		= lzo_free_ctx,
@@ -134,24 +89,11 @@ static struct scomp_alg scomp = {
 
 static int __init lzo_mod_init(void)
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
 
 static void __exit lzo_mod_fini(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
