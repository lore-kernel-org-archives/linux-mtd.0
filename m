Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11A8EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQTXSbhu2w9KJwkv9IeVJaZPEkvDizrXvO9RRmGGisA=; b=GX/NhM5wDfLIkz
	CRmAA1YPso7HAJvH6Zik44fssV8NPeShGttAGXEzlwuXep/uhcB6H6qb9/YGtkm/ObWK/Rpt67iAT
	1zkXKaRP0jzQ4Omba8JXLIWcbYxtvEUor4Fl3XAFcbbJWocIePfdCFK8HNM10+M6LnnPpu9BddRtU
	Uu0ozNaGwX1DOXcBBnvUoyRuQmsOZx1thXSFresFjBRbfzJ63f9ji4YCfViXuGkUfHsbd3+lCqnus
	R+5FtUFVmzYAekp9VqsTavOQ8Z5B47nkG4p1bzojZh9QF7YEUr+2pf82Rqo9fpVbc8TW1qGd7uaL8
	iAwQrjh8hbRO8a30ybjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0qv-005py5-1C;
	Wed, 19 Jul 2023 06:40:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0qt-005pwE-0l
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VrOg4AeIMt/G4A3FDe8u4FLDtQ24xrnoQeLLdNrF+AE=; b=aNgMALe85wKlXUrReZMsKjNgqq
	7VwK5mvUm7LyYX8jlpZuNj+dj6Kxfst9EQre0zWgmBlREwzTNd2f2iKDkw9w19WQC+xKMnAyK4AIC
	QKpn1RVXXYRXs1IqZJ0wyeYCAwly0VMl+TK94+4BStAI9uE7uIqPF33PkTu3VgCJxEkuEe6BtjLjY
	cxntcmwzQT7E/otVb419J2lvB4KkFHvVmAQbH4UcZWGPm9LjWE4SsvqlTmMr8s1kTT9Yg+HbLsK8W
	8lVgtNRAJIGCw7o9Wk/gjYW76x2JQnMed4AAUyJP4zVWD2IXi49l5toLowP+E2CXpl6LRAQpK/LD7
	jBIDfHCA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkKP-00BYVX-0i
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 073026154D;
	Tue, 18 Jul 2023 13:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19995C433C8;
	Tue, 18 Jul 2023 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685244;
	bh=peXwgO2lyNmi+9SzG2/BdcMLN+f3eLd+y3jKWWgC8aQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TdkMaJKDTq+zIO7n8GZ1p6h2kCkWyoQVZH6lj/cGZHSgU+hRHEGX2iJAp83rnSOSw
	 7z9yGPVhvdymwCEL/bh89Q8SPgY4CGLXiUiwegZaO9RFiOtmVHD620zWrulzIqz5Fb
	 oq/U8LcSSgYAhLAOktz0OpCjr70/kOCmzLQ6DxPxetv6QlNyKsHj+iXub0jCsLR1Sm
	 IJDQqMIEunRPZAZFwtvCBglfCVX835YwoD6m9c1UhYZ7Kvl4djZ1iyX/sb4o3m+kkP
	 je/3k07aXFsZyASrqrqqy4HUICL9jUliyuYYU7ZL7rFU5X0e1s0NlXXKEc8+v7E88r
	 3gw+gyBOgIZzA==
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
Subject: [RFC PATCH 16/21] crypto: zstd - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:42 +0200
Message-Id: <20230718125847.3869700-17-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3114; i=ardb@kernel.org; h=from:subject; bh=peXwgO2lyNmi+9SzG2/BdcMLN+f3eLd+y3jKWWgC8aQ=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT8NRrezVU4/VCR9T1G2en+U6PT268mNR7qltf/yWr W6dw1vRUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZysIDhD+duhXelu1kOWUzm bLrUfPHM98LuO2wvAxnCS2eFBF6LbGFkmFyxW636Xq/aoeVKTyexvWCOycrYJXNa+3NcRWVSweN 3LAA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140122_489682_83889379 
X-CRM114-Status: GOOD (  13.49  )
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
 crypto/zstd.c | 56 +-------------------
 1 file changed, 1 insertion(+), 55 deletions(-)

diff --git a/crypto/zstd.c b/crypto/zstd.c
index 154a969c83a82277..c6e6f135c5812c9c 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -121,13 +121,6 @@ static void *zstd_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int zstd_init(struct crypto_tfm *tfm)
-{
-	struct zstd_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __zstd_init(ctx);
-}
-
 static void __zstd_exit(void *ctx)
 {
 	zstd_comp_exit(ctx);
@@ -140,13 +133,6 @@ static void zstd_free_ctx(struct crypto_scomp *tfm, void *ctx)
 	kfree_sensitive(ctx);
 }
 
-static void zstd_exit(struct crypto_tfm *tfm)
-{
-	struct zstd_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	__zstd_exit(ctx);
-}
-
 static int __zstd_compress(const u8 *src, unsigned int slen,
 			   u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -161,14 +147,6 @@ static int __zstd_compress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int zstd_compress(struct crypto_tfm *tfm, const u8 *src,
-			 unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct zstd_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __zstd_compress(src, slen, dst, dlen, ctx);
-}
-
 static int zstd_scompress(struct crypto_scomp *tfm, const u8 *src,
 			  unsigned int slen, u8 *dst, unsigned int *dlen,
 			  void *ctx)
@@ -189,14 +167,6 @@ static int __zstd_decompress(const u8 *src, unsigned int slen,
 	return 0;
 }
 
-static int zstd_decompress(struct crypto_tfm *tfm, const u8 *src,
-			   unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct zstd_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __zstd_decompress(src, slen, dst, dlen, ctx);
-}
-
 static int zstd_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 			    unsigned int slen, u8 *dst, unsigned int *dlen,
 			    void *ctx)
@@ -204,19 +174,6 @@ static int zstd_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __zstd_decompress(src, slen, dst, dlen, ctx);
 }
 
-static struct crypto_alg alg = {
-	.cra_name		= "zstd",
-	.cra_driver_name	= "zstd-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct zstd_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= zstd_init,
-	.cra_exit		= zstd_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= zstd_compress,
-	.coa_decompress		= zstd_decompress } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= zstd_alloc_ctx,
 	.free_ctx		= zstd_free_ctx,
@@ -231,22 +188,11 @@ static struct scomp_alg scomp = {
 
 static int __init zstd_mod_init(void)
 {
-	int ret;
-
-	ret = crypto_register_alg(&alg);
-	if (ret)
-		return ret;
-
-	ret = crypto_register_scomp(&scomp);
-	if (ret)
-		crypto_unregister_alg(&alg);
-
-	return ret;
+	return crypto_register_scomp(&scomp);
 }
 
 static void __exit zstd_mod_fini(void)
 {
-	crypto_unregister_alg(&alg);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
