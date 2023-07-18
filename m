Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A8FC001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXQeh6ttOKB9MHaqsv3JGPV2Lb1rg9A53Fcc8sapb14=; b=YVf2Ql7b9Xl1/a
	lQY7aP/u3ur5uk0Ct8bHwE4dBxBrynTPmfCZjc7QCy5vjov0GgDZVOfHfMGJLLF91o3alGR7WvRt5
	72ko8WJvLtFMQzO9QwUonfGcBhmXNZaMCv35J7dZyTcUkrfTLI7vill/rss3gX4OXDsFmSjqs1ucU
	/uBe9wJEaDJIqZte1dvjrt/WwUHrpv9XpGJXl/aWVeRXp/F1UmTE8Eqaab/Agkt82jy6dOEgNqGpC
	FdzWR+d/r/EQU4ZBhlNTgTHrDPCNuwN0oKuMOh3xNCxeHBA6JMHqEgS9jpY55s1ds+TYuk99ebiPD
	nBW/mFiy1W4ZA2brzkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzyJ-005OiW-2L;
	Wed, 19 Jul 2023 05:43:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzyI-005OgE-0j
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j4nSmyg7UlapeaYcJwYhCgEPl0lBycgy1YX64o5LaBY=; b=MCvsPI1FicyhkryAKUthmszq96
	mqWXNebJKWCkN5I2sDjgUKtClL2aiRczHS3eAPcOxeY7YA04rt/639WzH8xbH+GsHwSaByK7XxTtp
	I4mu/1a7B2pHaI1IpvGN3yFHPsfa8K7SYoYC07GOjahAsTkZdC2QjxbrKEzJhEbXlnUvFqrtKwcGf
	XP9cfa0enHZIvubmYdJiudJ9YbAwYviqSbfDQD5NzLu8593ExcijAl1+6l/w+XvshW1acbLc7q/hG
	LjtnDkgVDGJYRNiFFvFYBZsnGjE2O8n5tOUpYhcvxI55eAtD1U2bJvmikuYy8TT1ZboDfLYnYsQhj
	eGLGQWpw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkK5-00BYSe-1K
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCB0261591;
	Tue, 18 Jul 2023 13:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB974C433C8;
	Tue, 18 Jul 2023 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685225;
	bh=re+UehvkeQHBK1wHhGnLcp2yWUgDT1GsozNrkQ2XFcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e2jq/7vFH+5SdEhwac2XpIYEi4F+E5PgxK5t3cUMlQUQCqTe1YvjyexPjPu11dL2c
	 yA+xClzV0scHRHYaigqmMwGwO524EVduViwfjGbx5JZ/Md/8EykRqPS2KCqv+fjAg+
	 OVZipEnxTXLcwE41PRm9YCd5p3Sy4LxJSOmeX0DCqvN/sCP1Y3ysHaCTT4H9xGNyTG
	 PR81t1YkbjBc+0e4kc7x34mAlunxZCrAiJwbGXsiBYgfuNisFYP6+PTLhgYB2otZbr
	 MPfNvkjFsrvou9y5c77Q3VziexDLzAOAt6FRUzMHZ8XXO2LdWHKBOClxYEHpj6XmGa
	 3QKnSjw0+UlCw==
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
Subject: [RFC PATCH 12/21] crypto: lz4 - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:38 +0200
Message-Id: <20230718125847.3869700-13-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2947; i=ardb@kernel.org; h=from:subject; bh=re+UehvkeQHBK1wHhGnLcp2yWUgDT1GsozNrkQ2XFcw=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT7X8homhprm68cwLX+9c9Fvx644lvpYK0uyVHXczL lbqRHF3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIkI7GFk2Cf5/H/hil+rRD0Y V1qVzlx8uzDmVsz8teat3v8K3ANncjIybI19KFrZfilr2byAGx94Wn2OsHp9Uz7yMyRa5daj4F4 hbgA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140101_805714_C34730D5 
X-CRM114-Status: GOOD (  13.48  )
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
 crypto/lz4.c | 61 +-------------------
 1 file changed, 1 insertion(+), 60 deletions(-)

diff --git a/crypto/lz4.c b/crypto/lz4.c
index 0606f8862e7872ad..c46b6cbd91ce10c0 100644
--- a/crypto/lz4.c
+++ b/crypto/lz4.c
@@ -27,29 +27,11 @@ static void *lz4_alloc_ctx(struct crypto_scomp *tfm)
 	return ctx;
 }
 
-static int lz4_init(struct crypto_tfm *tfm)
-{
-	struct lz4_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	ctx->lz4_comp_mem = lz4_alloc_ctx(NULL);
-	if (IS_ERR(ctx->lz4_comp_mem))
-		return -ENOMEM;
-
-	return 0;
-}
-
 static void lz4_free_ctx(struct crypto_scomp *tfm, void *ctx)
 {
 	vfree(ctx);
 }
 
-static void lz4_exit(struct crypto_tfm *tfm)
-{
-	struct lz4_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	lz4_free_ctx(NULL, ctx->lz4_comp_mem);
-}
-
 static int __lz4_compress_crypto(const u8 *src, unsigned int slen,
 				 u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -70,14 +52,6 @@ static int lz4_scompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lz4_compress_crypto(src, slen, dst, dlen, ctx);
 }
 
-static int lz4_compress_crypto(struct crypto_tfm *tfm, const u8 *src,
-			       unsigned int slen, u8 *dst, unsigned int *dlen)
-{
-	struct lz4_ctx *ctx = crypto_tfm_ctx(tfm);
-
-	return __lz4_compress_crypto(src, slen, dst, dlen, ctx->lz4_comp_mem);
-}
-
 static int __lz4_decompress_crypto(const u8 *src, unsigned int slen,
 				   u8 *dst, unsigned int *dlen, void *ctx)
 {
@@ -97,26 +71,6 @@ static int lz4_sdecompress(struct crypto_scomp *tfm, const u8 *src,
 	return __lz4_decompress_crypto(src, slen, dst, dlen, NULL);
 }
 
-static int lz4_decompress_crypto(struct crypto_tfm *tfm, const u8 *src,
-				 unsigned int slen, u8 *dst,
-				 unsigned int *dlen)
-{
-	return __lz4_decompress_crypto(src, slen, dst, dlen, NULL);
-}
-
-static struct crypto_alg alg_lz4 = {
-	.cra_name		= "lz4",
-	.cra_driver_name	= "lz4-generic",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct lz4_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= lz4_init,
-	.cra_exit		= lz4_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= lz4_compress_crypto,
-	.coa_decompress		= lz4_decompress_crypto } }
-};
-
 static struct scomp_alg scomp = {
 	.alloc_ctx		= lz4_alloc_ctx,
 	.free_ctx		= lz4_free_ctx,
@@ -131,24 +85,11 @@ static struct scomp_alg scomp = {
 
 static int __init lz4_mod_init(void)
 {
-	int ret;
-
-	ret = crypto_register_alg(&alg_lz4);
-	if (ret)
-		return ret;
-
-	ret = crypto_register_scomp(&scomp);
-	if (ret) {
-		crypto_unregister_alg(&alg_lz4);
-		return ret;
-	}
-
-	return ret;
+	return crypto_register_scomp(&scomp);
 }
 
 static void __exit lz4_mod_fini(void)
 {
-	crypto_unregister_alg(&alg_lz4);
 	crypto_unregister_scomp(&scomp);
 }
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
