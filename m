Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73F5C0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 04:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eomUJDjM8CxOFlpuT9xnDeLiUMYsKfQ0SNeGxKzoM9Y=; b=QaSa0yZvZDZUSi
	jnIQKnN/c08IKxJD5Y9suW8XGh4CFFIgquOgL7vG4Pyqd1SrrcD44RT2AayKnbh9QVzOQoyi65zTj
	AZZ1USknWdmki7PjqhzkOp7aR1D3oMQmFBlrdMo6cn8nweWtrFfSprCEH+CpGWGTREhq7zDJCsvDq
	3Sg1a9b1RR1HKEah4Ph5baZljuPgLvJ1z9F3s2Fwgez88cpK00PUWxue3uB8MRO6dXfeo059LheKb
	4OleavcrEHLHXWclDcL2QaQYfIom63NBuNCz+r9LFMlzQX/UmYb1F+aykJ2eUu3wYVvIWVykua3eN
	z4U7OaROl9/4SaDxpNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzFm-0055sT-2o;
	Wed, 19 Jul 2023 04:57:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzFj-0055rh-1f
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 04:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CpAknPUOM8krIT8EAZZSUjCs5TwzRUtQwWGu4Y79rT8=; b=W0H5pCHsAobrpF9HeAC5TOPMZb
	WB+/CGy50rs605cEcKoQaGB0UdTJoSTVYF0awgZBDIVBiDdPPmOtTIW8h/wBXpSmiYoQ743Gp2n/v
	j+LyTUYR9qL2gS4BasdHHeZtENVVPFIBMTzlRanXySlISgESje06zpdMaUTvlWTZmY1BcG6gVvpqw
	h34CD6N+ZFFMTiGJhZHzvYhOqkgPNgkcFcua2NKL3lCoMhm3iQaFVF97JXmJfPlrdckhaXH34PNkY
	x+K8KEP59xTBbTnwE/A6tWKewpaD2WFH4mnNqAQXkZETjmJ3TgFglEBNAKTa1zYcklIBBCTG4w1Ww
	gS23Javw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkK6-00BYTG-1Z
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A57BA61573;
	Tue, 18 Jul 2023 13:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A75C433CA;
	Tue, 18 Jul 2023 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685230;
	bh=ybqp9scuELh2vQqve89JuTt0+nVIyUf6Gt9BVqu5B2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N7rM2DGifJvUBSsRs2TqmJFZjS7Ja3MsCYwYk4vDlyS8D/ipVSN1emtrvn1c39ITj
	 t0kxALgOjR+NN2wT7NsRGLVwfw2FUMIgz5urIfIVlKjU+OwppKTlVvOoKbui8GaR6U
	 YouQxeZ6C93QO3pou/o2fWQ5tzrVZBu0uQJXmvPFpO7YK/5f02xUmf6QDN0KrwXdth
	 Od8H44CB7Le+By/Dc2tEPuwcEAGr8N8CDOfjY8Hc5SowM4TDRKoVKJ9ZvFWsgbOwEK
	 CuvFMkl+2cU3srDp0ESxTSTljbUXUzaUZPYubFlYHnJSvt4W8HryGXhGMY2ibyTuW2
	 i4dksQaVdwmKQ==
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
Subject: [RFC PATCH 13/21] crypto: lz4hc - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:39 +0200
Message-Id: <20230718125847.3869700-14-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3050; i=ardb@kernel.org; h=from:subject; bh=ybqp9scuELh2vQqve89JuTt0+nVIyUf6Gt9BVqu5B2E=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbTw2fjrb6ghOa2x4xrH0+6/bVlX1sHR/c9z6a3fPH5 Ptym60tHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiPO8YGd41l/z1cHdIkV12 7fHt2lqOarNuqUyHkrwtX0tZX9T9Dmdk6Pu3Oi2UR+En23SXe3PaZm3RTlny7s1Mxq4EnYtFs84 +5wMA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140102_973283_5E5203D2 
X-CRM114-Status: GOOD (  13.29  )
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
 crypto/lz4hc.c | 63 +-------------------
 1 file changed, 1 insertion(+), 62 deletions(-)

diff --git a/crypto/lz4hc.c b/crypto/lz4hc.c
index d7cc94aa2fcf42fa..5d6b13319f5e7683 100644
--- a/crypto/lz4hc.c
+++ b/crypto/lz4hc.c
@@ -26,29 +26,11 @@ static void *lz4hc_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int lz4hc_init(struct crypto_tfm *tfm)
-{
-	struct lz4hc_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->lz4hc_comp_mem = lz4hc_alloc_ctx(NULL);
-	if (IS_ERR(ctx->lz4hc_comp_mem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void lz4hc_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	vfree(ctx);
 }
 
-static void lz4hc_exit(struct crypto_tfm *tfm)
-{
-	struct lz4hc_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	lz4hc_free_ctx(NULL, ctx->lz4hc_comp_mem);
-}
-
 static int __lz4hc_compress_crypto(const u8 *src, unsigned int slen,
 				   u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -69,16 +51,6 @@ static int lz4hc_scompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lz4hc_compress_crypto(src, slen, dst, dlen, ctx);
 }
 
-static int lz4hc_compress_crypto(struct crypto_tfm *tfm, const u8 *src,
-				 unsigned int slen, u8 *dst,
-				 unsigned int *dlen)
-{
-	struct lz4hc_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __lz4hc_compress_crypto(src, slen, dst, dlen,
-					ctx->lz4hc_comp_mem);
-}
-
 static int __lz4hc_decompress_crypto(const u8 *src, unsigned int slen,
 				     u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -98,26 +70,6 @@ static int lz4hc_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lz4hc_decompress_crypto(src, slen, dst, dlen, NULL);
 }
 
-static int lz4hc_decompress_crypto(struct crypto_tfm *tfm, const u8 *src,
-				   unsigned int slen, u8 *dst,
-				   unsigned int *dlen)
-{
-	return __lz4hc_decompress_crypto(src, slen, dst, dlen, NULL);
-}
-
-static struct crypto_alg alg_lz4hc = {
-	.cra_name		= "lz4hc",
-	.cra_driver_name	= "lz4hc-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct lz4hc_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= lz4hc_init,
-	.cra_exit		= lz4hc_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= lz4hc_compress_crypto,
-	.coa_decompress		= lz4hc_decompress_crypto } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= lz4hc_alloc_ctx,
 	.free_ctx		= lz4hc_free_ctx,
@@ -132,24 +84,11 @@ static struct scomp_alg scomp = {
 
 static int __init lz4hc_mod_init(void)
 {
-	int ret;
-
-	ret = crypto_register_alg(&alg_lz4hc);
-	if (ret)
-		return ret;
-
-	ret = crypto_register_scomp(&scomp);
-	if (ret) {
-		crypto_unregister_alg(&alg_lz4hc);
-		return ret;
-	}
-
-	return ret;
+	return crypto_register_scomp(&scomp);
 }
 
 static void __exit lz4hc_mod_fini(void)
 {
-	crypto_unregister_alg(&alg_lz4hc);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
