Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367ECEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5lglVcuS+Rj4Hcia+DswK1ZWi/IuO7gXe34Fu5PA1M=; b=OaE6buhtqXerKw
	8f1uV70mhNeoV2g5+OOaewVVaJQd729DBeNfJFXHDIS64/UEkaCbAJi/DZuCanysgkog/MYZ/2QVO
	uSfbX4nE8nMpYeMm+D7586vN+E0cKf/t3b+RND+l6IzjqAN94swBHRovsWhgbFeAh6ciss89dl8Qu
	gZttIO4JIRdfGu7A7ZF7EgS2XrzSWoak6RM+QXLAyCK6PowjZQWzAQy6RBePS86nGtcgYFo/1SJWj
	KxjSw4QxTjvFxdEEUfLRjofl9QwyQAbJkiv4QnUsALWpOX3q7f+KClnAzCift0QTm0oiAytRQAiVc
	TsOh9XKU+DqmS8St1raA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0vg-005sEq-1v;
	Wed, 19 Jul 2023 06:44:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ve-005sCA-0I
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S6XiO5bgVZyi1I0YnlW/sOIG2R1FJh5b+HQq2ITjw3k=; b=AWQWIO3iB3rrDAYeRNrjFuEmEr
	Hy6Vu9ZI72hCLQ5Gu6oLcnArap3mgT2QhOzcXykzwI6nPuQ6hZ3sx71Tu7SAIZ6CcMtQfmXJDvbqt
	Kay+BpJ2zANl8RQ/q/piVTkIcsrSPBvy+vDjSQa510ldRl3wI6qqRF5iduZHVnMB0scjtEyqq2ixY
	5yYx75GANsLWh72ShrVnEZgftnG2sA0vyjyoq75rDA4jR6u6NiZ0vyV2jGigtjapP+sYvwQDcwZGS
	wWP9UoYubl42bg1ndICTODfK9wEIKmHftGVHb03uybS3/BXp1C14liiYNWSA/HelOaqfTn7jbmXHk
	lk07UmUA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkJZ-00BYP1-2U
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA2FE61593;
	Tue, 18 Jul 2023 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5AEC433C9;
	Tue, 18 Jul 2023 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685215;
	bh=/qQ5zVEDSQWgAAFuZ3X4YFEm+OAHRe8ZGR+DuY6dhnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jx99k83lQTosnEHIoqMPL/v8Bcu8QRVWYXkMeIHwWA0/2ffcR8hW88jOogx+7sbs2
	 Oo0pYl+hIX4Pp22IFS4oa4moekRcfNQR08hTZRALfNVDK3/pqs25UAlPVlXZLlP6+q
	 EpJutwNEnIA3Kw/vQkY38tASNdoCxNS9tY223solGfyGasrwwptAjoZTGe48e0h+zI
	 TPSrbDUlsOM7TUNxUydKXy3WngrJOdvZAQOzSQ1TYX6m3kWmykBY+K8EtgbRlW6QZu
	 C2p+dkrPWItiJW8Awli+goF89CkHLWZIblno2gdx8bL3KgdPNOpqvgiG51Hlqcq692
	 niwAFwT5xfQYw==
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
Subject: [RFC PATCH 10/21] crypto: 842 - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:36 +0200
Message-Id: <20230718125847.3869700-11-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099; i=ardb@kernel.org; h=from:subject; bh=/qQ5zVEDSQWgAAFuZ3X4YFEm+OAHRe8ZGR+DuY6dhnM=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT+X11++23f3U8DQ/9SjHpLTS1Zpciya+eWBSvZ27J L2uX6K1o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkhyjDf8+UdoabXwN4JvLV Kytb6q24N/1Ktl310bavz+7GLps7dS3DPxW9sh8cy1YXXAkw+/uyssR275cJZ4TP/Ptjmnv63AW eaGYA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140030_136980_F2ED301B 
X-CRM114-Status: GOOD (  12.70  )
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
 crypto/842.c | 63 +-------------------
 1 file changed, 1 insertion(+), 62 deletions(-)

diff --git a/crypto/842.c b/crypto/842.c
index e59e54d769609ba6..5001d88cf727f74e 100644
--- a/crypto/842.c
+++ b/crypto/842.c
@@ -39,38 +39,11 @@ static void *crypto842_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int crypto842_init(struct crypto_tfm *tfm)
-{
-	struct crypto842_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->wmem = crypto842_alloc_ctx(NULL);
-	if (IS_ERR(ctx->wmem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void crypto842_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	kfree(ctx);
 }
 
-static void crypto842_exit(struct crypto_tfm *tfm)
-{
-	struct crypto842_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	crypto842_free_ctx(NULL, ctx->wmem);
-}
-
-static int crypto842_compress(struct crypto_tfm *tfm,
-			      const u8 *src, unsigned int slen,
-			      u8 *dst, unsigned int *dlen)
-{
-	struct crypto842_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return sw842_compress(src, slen, dst, dlen, ctx->wmem);
-}
-
 static int crypto842_scompress(struct crypto_scomp *tfm,
 			       const u8 *src, unsigned int slen,
 			       u8 *dst, unsigned int *dlen, void *ctx)
@@ -78,13 +51,6 @@ static int crypto842_scompress(struct crypto_scomp *tfm,
 	return sw842_compress(src, slen, dst, dlen, ctx);
 }
 
-static int crypto842_decompress(struct crypto_tfm *tfm,
-				const u8 *src, unsigned int slen,
-				u8 *dst, unsigned int *dlen)
-{
-	return sw842_decompress(src, slen, dst, dlen);
-}
-
 static int crypto842_sdecompress(struct crypto_scomp *tfm,
 				 const u8 *src, unsigned int slen,
 				 u8 *dst, unsigned int *dlen, void *ctx)
@@ -92,20 +58,6 @@ static int crypto842_sdecompress(struct crypto_scomp *tfm,
 	return sw842_decompress(src, slen, dst, dlen);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "842",
-	.cra_driver_name	= "842-generic",
-	.cra_priority		= 100,
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct crypto842_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= crypto842_init,
-	.cra_exit		= crypto842_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= crypto842_compress,
-	.coa_decompress		= crypto842_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= crypto842_alloc_ctx,
 	.free_ctx		= crypto842_free_ctx,
@@ -121,25 +73,12 @@ static struct scomp_alg scomp = {
 
 static int __init crypto842_mod_init(void)
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
 subsys_initcall(crypto842_mod_init);
 
 static void __exit crypto842_mod_exit(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 module_exit(crypto842_mod_exit);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
