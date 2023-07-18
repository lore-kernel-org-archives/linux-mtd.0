Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5514C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovGfcZubt6z59y+sNV3RDIY+jfO5cAGMBMINOO2guwg=; b=KNROO4oQXczqgF
	FN441fgEAjnyYlqbF/mScdX+H44dCaQ0l1O19gBsBOXbMUZMDA9Sb2XN5sk4alylgfn19aPNGxvUJ
	kzJ/UPWLr22bsxX6m9tI5QUv2UQixUp30tEggSS6eVhFA4TF78Erjao7OW6rLBDMFSrUioOaJK5bN
	2R5YTd9gBh8ZFDzsG/LYBR8vtCm2oFrq1HeiD0GK8n6KRl8X17sRdllb2wNUnGg8JY9+UtnJjYkX8
	bjAIq6N/50eJ1br4AmnoPUb3QhuJR1/CqjAINXxr4hvL2QNteAeljU9UthjlnnEoNtGO/g8rHy3g7
	nTqvJB/8lvNvcedh2drA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM02E-005Q3c-2x;
	Wed, 19 Jul 2023 05:47:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM029-005PzL-0X
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cwFGfeVoZskNWU8YcWmTG596ul0FU7z+qOxYKCib21Q=; b=BNDtCBBpZYKM5QFvBJYbEDrkSX
	Yzs3kokCbMrdU333sJrPKxeT3w5oEBRErsvUWEncEj8zqCjArCC152HT18soYc0XgbmlbMxyiJF+7
	ADxuJXvVWHHyyvVwzzHFBnSyHcrIq9itb8lw92asYi8Bm2FN0yQMu9XRzZLeOeK9G6Xs4MmpgEZDd
	Y73K0qLqKCBBTBgfH1mP0hXnAGlGHrni3J7HTITGV4dybP8BUzdTLHcRAkIZOyZBtUEztolRwJqm8
	HeOG+DjsfxwJKDPEU7ai83vp1MUflQ0Lwtjk6+5ex8z4qfXOZXWMIzYY11jbR/YPPwYCy6Tq1Pk05
	6Ipj/LZg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkKR-00BYW8-2p
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BC1861582;
	Tue, 18 Jul 2023 13:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178C6C433CA;
	Tue, 18 Jul 2023 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685220;
	bh=M7WgPUSIPoeRnhagLleZw11JZUjXzh7EjhC9ItdylhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiqeV+BnZp3cLfA0MbxVPtz12ltzOoRSGxIORn0Gi//Rft3vveQhu0SjmWQWBCr6y
	 CimWcYY2BnWLFZOpS1dkdgCF5KhOgCmOumRRbE3tgC1vamXZSIUoCzOjWeBAuvHkoT
	 bmlK9VgojWthOUgQshf1e6xPJkY34b9KQAf7cy1o1KkiB1KulcsBBCsvs+QENZM6tU
	 WJdFfgfWftd+tcznULjDoG+tps1F3jrdnP95FxyqkRnzApk8jXjonDy+83onKlSagl
	 gyS7vLkWPZ7ChOnN1uQz9FZv57FvLZY/5pbGnW1DEoxc/JNtoaCd0DVyc0khrwyZ3h
	 Nq8L4k3r0uh1w==
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
Subject: [RFC PATCH 11/21] crypto: deflate - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:37 +0200
Message-Id: <20230718125847.3869700-12-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3314; i=ardb@kernel.org; h=from:subject; bh=M7WgPUSIPoeRnhagLleZw11JZUjXzh7EjhC9ItdylhI=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT9Vz0SiZCzNmlVRdnKSfvtS574N93b97iX832bmU3 QlKyPrVUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACYivYGRoYGZ/d62qVNZEw5b bVxzpfjx1dxEiRczJu3OYWisXWV4xZKRof3PC46/975fuv+B+8HuefcX7pyd+fLPBHOJ5XPWmt0 6Ks8GAA==
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140124_397833_64617B92 
X-CRM114-Status: GOOD (  13.05  )
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

No users of the obsolete 'comp' crypto compression API remain, so let's
drop the software deflate version of it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 crypto/deflate.c | 58 +-------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/crypto/deflate.c b/crypto/deflate.c
index f4f127078fe2a5aa..0955040ca9e64146 100644
--- a/crypto/deflate.c
+++ b/crypto/deflate.c
@@ -130,13 +130,6 @@ static void *deflate_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int deflate_init(struct crypto_tfm *tfm)
-{
-	struct deflate_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __deflate_init(ctx);
-}
-
 static void __deflate_exit(void *ctx)
 {
 	deflate_comp_exit(ctx);
@@ -149,13 +142,6 @@ static void deflate_free_ctx(struct crypto_scomp *tfm, void *ctx)
 	kfree_sensitive(ctx);
 }
 
-static void deflate_exit(struct crypto_tfm *tfm)
-{
-	struct deflate_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	__deflate_exit(ctx);
-}
-
 static int __deflate_compress(const u8 *src, unsigned int slen,
 			      u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -185,14 +171,6 @@ static int __deflate_compress(const u8 *src, unsigned int slen,
 	return ret;
 }
 
-static int deflate_compress(struct crypto_tfm *tfm, const u8 *src,
-			    unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct deflate_ctx *dctx = crypto_tfm_ctx(tfm);
-
-	return __deflate_compress(src, slen, dst, dlen, dctx);
-}
-
 static int deflate_scompress(struct crypto_scomp *tfm, const u8 *src,
 			     unsigned int slen, u8 *dst, unsigned int *dlen,
 			     void *ctx)
@@ -241,14 +219,6 @@ static int __deflate_decompress(const u8 *src, unsigned int slen,
 	return ret;
 }
 
-static int deflate_decompress(struct crypto_tfm *tfm, const u8 *src,
-			      unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct deflate_ctx *dctx = crypto_tfm_ctx(tfm);
-
-	return __deflate_decompress(src, slen, dst, dlen, dctx);
-}
-
 static int deflate_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 			       unsigned int slen, u8 *dst, unsigned int *dlen,
 			       void *ctx)
@@ -256,19 +226,6 @@ static int deflate_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __deflate_decompress(src, slen, dst, dlen, ctx);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "deflate",
-	.cra_driver_name	= "deflate-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct deflate_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= deflate_init,
-	.cra_exit		= deflate_exit,
-	.cra_u			= { .compress = {
-	.coa_compress 		= deflate_compress,
-	.coa_decompress  	= deflate_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= deflate_alloc_ctx,
 	.free_ctx		= deflate_free_ctx,
@@ -283,24 +240,11 @@ static struct scomp_alg scomp = {
 
 static int __init deflate_mod_init(void)
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
 
 static void __exit deflate_mod_fini(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
