Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B7CEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iWtj3K26fGR3wr/gtkipQizElZEkmtkx/SGgHnO0nU=; b=p64aGN+oExjZQE
	rolusJgjRBydsYlwfz4jlA0VkPH3JM4LviIp+pZfl4XTGFlQIiAND8wSUjF8wwR03E+t934BVPJOc
	Vf0VeYA5u6qHhUJXA2uQetRlQUM0Y21yqdNh6Wr/JHIUItvszPwlfSE61WuHVvJIhGfR1cFIA/kQv
	XPnW8ksVleVj8s3soGxy0/IMF0g8CiHFbTlvO2jJ2log9LayYkX72hJSudLPbQqePcPo/+MnmfuF8
	5vhr2zlQPT9sPToxkJSuvN1fPZTJbTJi2K6xKqX9qVNVTGNPTmFvSlvATXFxktIycxc+YlrQ37jDz
	ZULq2gK9sNDCMmer33pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11z-005vus-1z;
	Wed, 19 Jul 2023 06:51:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM11y-005vtd-0t
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZZXm4BQZOdQigOK/4e8g7t+tuxoopxluzezUpeoGAFo=; b=oh4NH78w/Ip739qTEH4qXq9JAC
	Wv+E/3d33Chj01gFL0aEZ3rTLFMVgMZcolaivThKB++aBobX1wX9rjhToc1Z5Pv7taSzX5CQnMzt+
	VsTduwJpXlb1HEjM8lvXOtfjt/VXKJ2OLSS+p7Fti87IoMVlO7zQC/cLluoBegy6amu8Ku+LRPPi5
	S071P55XZFRpBdAoZK/AGH18OV0kRFcDeuVv/97RPDMuMYKJ9rmNH1YF4lCtJBFbrX/sYgjQs60uN
	Xnt7aJB38zWXhA3zVWT8Yj8QXmX2NEGXANmmkGKfkL8XeUBptBbdKONkTbgknYyc22XI7rbiV3Uk2
	5qRfMx7Q==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkKs-00BYZ1-2n
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB57661584;
	Tue, 18 Jul 2023 13:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB034C433D9;
	Tue, 18 Jul 2023 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685249;
	bh=WuS8tfuWkadsvD2O2V7rKFd8MWT1OV3T8mJ+98LYJNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KOZE5JKHBMLH4xqPAmknZzizKFbAuar0MPatAbTbxfzMgM5F5T2bWDuqhBqimvbvz
	 lL8hhy704b+vsQ7ELuSTbnm0o+LG6XhaXxD2+jg3ZW5eKrVf8KmyHroHTD/A0WJi1T
	 IO9OZ5y5F6F8zaIlybvZh8jj/PSBfYkamLIW9WAM9UbsrwUOh2UVDvpvxgoeo3FiO2
	 PNREjtTL8co/91NVDg2fCgO9x/ldAFrNNClD995an4PNN8CKiRbviBGXGxB0yoMOdu
	 eg/X244yURv0/5iP21yB3b2VC8M1/IQLwA0dUHEC3KFSc5FY/P23Iwzf+7Zv44j0vw
	 +UtrZYwAMxGfw==
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
Subject: [RFC PATCH 17/21] crypto: cavium/zip - drop obsolete 'comp' implementation
Date: Tue, 18 Jul 2023 14:58:43 +0200
Message-Id: <20230718125847.3869700-18-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5435; i=ardb@kernel.org; h=from:subject; bh=WuS8tfuWkadsvD2O2V7rKFd8MWT1OV3T8mJ+98LYJNo=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT1PjcQb7M0e4sxP2uX86f9CqYGqijYXnfN2/hx5Zb lTb9qino5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzEz5+R4U3W3HV3XrUuW1jP e89tUQxfqvjH+U5PWp5/XLB8+ZnPE7sY/nDf+Zybn1Z3+YrA3H0LbsTY3ZHcZ/ntd+PM41/jvux jWMUJAA==
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140152_594390_06B91F54 
X-CRM114-Status: GOOD (  14.45  )
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
 drivers/crypto/cavium/zip/zip_crypto.c | 40 ----------------
 drivers/crypto/cavium/zip/zip_crypto.h | 10 ----
 drivers/crypto/cavium/zip/zip_main.c   | 50 +-------------------
 3 files changed, 1 insertion(+), 99 deletions(-)

diff --git a/drivers/crypto/cavium/zip/zip_crypto.c b/drivers/crypto/cavium/zip/zip_crypto.c
index 1046a746d36f551c..5edad3b1d1dc8398 100644
--- a/drivers/crypto/cavium/zip/zip_crypto.c
+++ b/drivers/crypto/cavium/zip/zip_crypto.c
@@ -195,46 +195,6 @@ static int zip_decompress(const u8 *src, unsigned int slen,
 	return ret;
 }
 
-/* Legacy Compress framework start */
-int zip_alloc_comp_ctx_deflate(struct crypto_tfm *tfm)
-{
-	struct zip_kernel_ctx *zip_ctx = crypto_tfm_ctx(tfm);
-
-	return zip_ctx_init(zip_ctx, 0);
-}
-
-int zip_alloc_comp_ctx_lzs(struct crypto_tfm *tfm)
-{
-	struct zip_kernel_ctx *zip_ctx = crypto_tfm_ctx(tfm);
-
-	return zip_ctx_init(zip_ctx, 1);
-}
-
-void zip_free_comp_ctx(struct crypto_tfm *tfm)
-{
-	struct zip_kernel_ctx *zip_ctx = crypto_tfm_ctx(tfm);
-
-	zip_ctx_exit(zip_ctx);
-}
-
-int  zip_comp_compress(struct crypto_tfm *tfm,
-		       const u8 *src, unsigned int slen,
-		       u8 *dst, unsigned int *dlen)
-{
-	struct zip_kernel_ctx *zip_ctx = crypto_tfm_ctx(tfm);
-
-	return zip_compress(src, slen, dst, dlen, zip_ctx);
-}
-
-int  zip_comp_decompress(struct crypto_tfm *tfm,
-			 const u8 *src, unsigned int slen,
-			 u8 *dst, unsigned int *dlen)
-{
-	struct zip_kernel_ctx *zip_ctx = crypto_tfm_ctx(tfm);
-
-	return zip_decompress(src, slen, dst, dlen, zip_ctx);
-} /* Legacy compress framework end */
-
 /* SCOMP framework start */
 void *zip_alloc_scomp_ctx_deflate(struct crypto_scomp *tfm)
 {
diff --git a/drivers/crypto/cavium/zip/zip_crypto.h b/drivers/crypto/cavium/zip/zip_crypto.h
index b59ddfcacd34447e..a1ae3825fb65c3b6 100644
--- a/drivers/crypto/cavium/zip/zip_crypto.h
+++ b/drivers/crypto/cavium/zip/zip_crypto.h
@@ -57,16 +57,6 @@ struct zip_kernel_ctx {
 	struct zip_operation zip_decomp;
 };
 
-int  zip_alloc_comp_ctx_deflate(struct crypto_tfm *tfm);
-int  zip_alloc_comp_ctx_lzs(struct crypto_tfm *tfm);
-void zip_free_comp_ctx(struct crypto_tfm *tfm);
-int  zip_comp_compress(struct crypto_tfm *tfm,
-		       const u8 *src, unsigned int slen,
-		       u8 *dst, unsigned int *dlen);
-int  zip_comp_decompress(struct crypto_tfm *tfm,
-			 const u8 *src, unsigned int slen,
-			 u8 *dst, unsigned int *dlen);
-
 void *zip_alloc_scomp_ctx_deflate(struct crypto_scomp *tfm);
 void *zip_alloc_scomp_ctx_lzs(struct crypto_scomp *tfm);
 void  zip_free_scomp_ctx(struct crypto_scomp *tfm, void *zip_ctx);
diff --git a/drivers/crypto/cavium/zip/zip_main.c b/drivers/crypto/cavium/zip/zip_main.c
index dc5b7bf7e1fd9867..abd58de4343ddd8e 100644
--- a/drivers/crypto/cavium/zip/zip_main.c
+++ b/drivers/crypto/cavium/zip/zip_main.c
@@ -371,36 +371,6 @@ static struct pci_driver zip_driver = {
 
 /* Kernel Crypto Subsystem Interface */
 
-static struct crypto_alg zip_comp_deflate = {
-	.cra_name		= "deflate",
-	.cra_driver_name	= "deflate-cavium",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct zip_kernel_ctx),
-	.cra_priority           = 300,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= zip_alloc_comp_ctx_deflate,
-	.cra_exit		= zip_free_comp_ctx,
-	.cra_u			= { .compress = {
-		.coa_compress	= zip_comp_compress,
-		.coa_decompress	= zip_comp_decompress
-		 } }
-};
-
-static struct crypto_alg zip_comp_lzs = {
-	.cra_name		= "lzs",
-	.cra_driver_name	= "lzs-cavium",
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct zip_kernel_ctx),
-	.cra_priority           = 300,
-	.cra_module		= THIS_MODULE,
-	.cra_init		= zip_alloc_comp_ctx_lzs,
-	.cra_exit		= zip_free_comp_ctx,
-	.cra_u			= { .compress = {
-		.coa_compress	= zip_comp_compress,
-		.coa_decompress	= zip_comp_decompress
-		 } }
-};
-
 static struct scomp_alg zip_scomp_deflate = {
 	.alloc_ctx		= zip_alloc_scomp_ctx_deflate,
 	.free_ctx		= zip_free_scomp_ctx,
@@ -431,22 +401,10 @@ static int zip_register_compression_device(void)
 {
 	int ret;
 
-	ret = crypto_register_alg(&zip_comp_deflate);
-	if (ret < 0) {
-		zip_err("Deflate algorithm registration failed\n");
-		return ret;
-	}
-
-	ret = crypto_register_alg(&zip_comp_lzs);
-	if (ret < 0) {
-		zip_err("LZS algorithm registration failed\n");
-		goto err_unregister_alg_deflate;
-	}
-
 	ret = crypto_register_scomp(&zip_scomp_deflate);
 	if (ret < 0) {
 		zip_err("Deflate scomp algorithm registration failed\n");
-		goto err_unregister_alg_lzs;
+		return ret;
 	}
 
 	ret = crypto_register_scomp(&zip_scomp_lzs);
@@ -459,18 +417,12 @@ static int zip_register_compression_device(void)
 
 err_unregister_scomp_deflate:
 	crypto_unregister_scomp(&zip_scomp_deflate);
-err_unregister_alg_lzs:
-	crypto_unregister_alg(&zip_comp_lzs);
-err_unregister_alg_deflate:
-	crypto_unregister_alg(&zip_comp_deflate);
 
 	return ret;
 }
 
 static void zip_unregister_compression_device(void)
 {
-	crypto_unregister_alg(&zip_comp_deflate);
-	crypto_unregister_alg(&zip_comp_lzs);
 	crypto_unregister_scomp(&zip_scomp_deflate);
 	crypto_unregister_scomp(&zip_scomp_lzs);
 }
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
