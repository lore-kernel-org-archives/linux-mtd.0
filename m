Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B0DC001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EiQ1ks6DED0lX5lzEGg/yQ4Fu2usopQyM2QKSAhjIc4=; b=tGIFD64jITuKah
	mg0ZuOzk2u8lqRICelIgfkZSnWrzZllK84X+2ciiDbnkyU9CfL59WVPvwVAsUrXANkJ50wGBe6nUM
	gOPcHVDPZ8PKh48Pq6XHJwyCk93wqc8m6eS+0mGeV2PiVGzR8wY7HNfOsygI/jhpIAkaAljZsGJ1A
	j8ZIFjF1mYmfb/UebqN4DyD2nDT9dRuxhQIgoDT5C395a+Yn9rz3fJEfgsX7PPQv2DLkEGWuX8QwF
	Yxnfw8obArK8b/LUq0gW7U8IKOBKAPSuFoFWRw21HDAUVRbL21o2tEGnsduTg70L8LvORc8v0NDPQ
	sKFwHNGvrcBJXIyfQ9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0nm-005oBf-2y;
	Wed, 19 Jul 2023 06:36:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0nl-005oAq-0i
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ipMvWUNO4WnC3bpCkEa2MV+7JMyScHZo49wId5JBTRM=; b=f2MmPI2y7LvxY7O9+PVMfnRTEU
	LFEoPHhgGHZLvc1N6ymIe6/hbOMk/nQOiFEFYEDvORNV7vJvzltQXrKVtKgTGBpkNj7lcXJa4BRJF
	4E9lOPrBEaXQtkw1TTfEIDn5VBQnONfLmi2t0KdNohVlocqYYp9ospv5JvqjK6nYtoy2vtJsMWAMp
	ISAirVpnh44NRrluGce6De1a32F7+kUx0huMQb1KRSPSM6OykASu4MeHaZvq5crGvttBC1X+4kuvB
	c5C3WNVT/qw114ERaRsR4K9J5BpE4vq3KoJwiQI5AdxvbDPUJo2t3LBuSaNFBHC1RfCi6MrFpUyKV
	UkIjKDKQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkJY-00BYP2-2u
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B0736157D;
	Tue, 18 Jul 2023 13:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C00C433AD;
	Tue, 18 Jul 2023 13:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685210;
	bh=Ln0aastSpcedVqwTHUVbrX3O0loZpzS07kCv9ju4Uqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tfjve+K440HP9qYEXRju588QpE0GGJWWWRb52ntY3B5OwUyZ9uV2Tx00V6jbXSkRU
	 6y8YbxPM4fNCwCH5Wd1xlZowJNK+Jd3pekJEnQwW3QUWmI+gNCQqObPGTKlVKDri/N
	 BkwgUJwRsj5VzRMR/ZM+NvTgrJ7t8J04SjORvxjkq1u56Ty/AqN6+amGzDTV+j6rqW
	 GrMrXM6KMaVsSUJldL8cRPTxDz5RNB+7xWVTwh5YaxFOR6rNU8YqjXgWLZNwl64ZcA
	 w29uqRX2g3DqnKMUeBvv9TeZw+/OdZaEKoxYVPT4Ff0na33ZNItEL05ZKKZByEVIBo
	 PI33ft5i/rk9Q==
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
Subject: [RFC PATCH 09/21] crypto: nx - Migrate to scomp API
Date: Tue, 18 Jul 2023 14:58:35 +0200
Message-Id: <20230718125847.3869700-10-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9281; i=ardb@kernel.org; h=from:subject; bh=Ln0aastSpcedVqwTHUVbrX3O0loZpzS07kCv9ju4Uqo=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT3n6zm0Tjy549vRinltqWc7aNfElLO1X5Osmu/q/f 3M/6Kx3RykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjI+bMM/5Nlu5nX3j530qXt 1V2/+Sxrk/5fMzueIHAp0/t3wlx+XkuGf2aeC7cfrdoruHSb88utx/78fW/7u4trV4n3iwbOxI9 XmXgB
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140029_347773_BD994A8F 
X-CRM114-Status: GOOD (  19.28  )
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

The only remaining user of 842 compression has been migrated to the
acomp compression API, and so the NX hardware driver has to follow suit,
given that no users of the obsolete 'comp' API remain, and it is going
to be removed.

So migrate the NX driver code to scomp. These will be wrapped and
exposed as acomp implementation via the crypto subsystem's
acomp-to-scomp adaptation layer.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/crypto/nx/nx-842.c            | 34 ++++++++++++--------
 drivers/crypto/nx/nx-842.h            | 14 ++++----
 drivers/crypto/nx/nx-common-powernv.c | 30 ++++++++---------
 drivers/crypto/nx/nx-common-pseries.c | 32 +++++++++---------
 4 files changed, 57 insertions(+), 53 deletions(-)

diff --git a/drivers/crypto/nx/nx-842.c b/drivers/crypto/nx/nx-842.c
index 2ab90ec10e61ebe8..331b9cdf85e27044 100644
--- a/drivers/crypto/nx/nx-842.c
+++ b/drivers/crypto/nx/nx-842.c
@@ -101,9 +101,14 @@ static int update_param(struct nx842_crypto_param *p,
 	return 0;
 }
 
-int nx842_crypto_init(struct crypto_tfm *tfm, struct nx842_driver *driver)
+void *nx842_crypto_alloc_ctx(struct crypto_scomp *tfm,
+			     struct nx842_driver *driver)
 {
-	struct nx842_crypto_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct nx842_crypto_ctx *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
 
 	spin_lock_init(&ctx->lock);
 	ctx->driver = driver;
@@ -114,22 +119,23 @@ int nx842_crypto_init(struct crypto_tfm *tfm, struct nx842_driver *driver)
 		kfree(ctx->wmem);
 		free_page((unsigned long)ctx->sbounce);
 		free_page((unsigned long)ctx->dbounce);
-		return -ENOMEM;
+		kfree(ctx);
+		return ERR_PTR(-ENOMEM);
 	}
 
-	return 0;
+	return ctx;
 }
-EXPORT_SYMBOL_GPL(nx842_crypto_init);
+EXPORT_SYMBOL_GPL(nx842_crypto_alloc_ctx);
 
-void nx842_crypto_exit(struct crypto_tfm *tfm)
+void nx842_crypto_free_ctx(struct crypto_scomp *tfm, void *p)
 {
-	struct nx842_crypto_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct nx842_crypto_ctx *ctx = p;
 
 	kfree(ctx->wmem);
 	free_page((unsigned long)ctx->sbounce);
 	free_page((unsigned long)ctx->dbounce);
 }
-EXPORT_SYMBOL_GPL(nx842_crypto_exit);
+EXPORT_SYMBOL_GPL(nx842_crypto_free_ctx);
 
 static void check_constraints(struct nx842_constraints *c)
 {
@@ -246,11 +252,11 @@ static int compress(struct nx842_crypto_ctx *ctx,
 	return update_param(p, slen, dskip + dlen);
 }
 
-int nx842_crypto_compress(struct crypto_tfm *tfm,
+int nx842_crypto_compress(struct crypto_scomp *tfm,
 			  const u8 *src, unsigned int slen,
-			  u8 *dst, unsigned int *dlen)
+			  u8 *dst, unsigned int *dlen, void *pctx)
 {
-	struct nx842_crypto_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct nx842_crypto_ctx *ctx = pctx;
 	struct nx842_crypto_header *hdr = &ctx->header;
 	struct nx842_crypto_param p;
 	struct nx842_constraints c = *ctx->driver->constraints;
@@ -429,11 +435,11 @@ static int decompress(struct nx842_crypto_ctx *ctx,
 	return update_param(p, slen + padding, dlen);
 }
 
-int nx842_crypto_decompress(struct crypto_tfm *tfm,
+int nx842_crypto_decompress(struct crypto_scomp *tfm,
 			    const u8 *src, unsigned int slen,
-			    u8 *dst, unsigned int *dlen)
+			    u8 *dst, unsigned int *dlen, void *pctx)
 {
-	struct nx842_crypto_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct nx842_crypto_ctx *ctx = pctx;
 	struct nx842_crypto_header *hdr;
 	struct nx842_crypto_param p;
 	struct nx842_constraints c = *ctx->driver->constraints;
diff --git a/drivers/crypto/nx/nx-842.h b/drivers/crypto/nx/nx-842.h
index 7590bfb24d79bf42..de9dc8df62ed9dcb 100644
--- a/drivers/crypto/nx/nx-842.h
+++ b/drivers/crypto/nx/nx-842.h
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/ratelimit.h>
+#include <crypto/internal/scompress.h>
 
 /* Restrictions on Data Descriptor List (DDL) and Entry (DDE) buffers
  *
@@ -177,13 +178,14 @@ struct nx842_crypto_ctx {
 	struct nx842_driver *driver;
 };
 
-int nx842_crypto_init(struct crypto_tfm *tfm, struct nx842_driver *driver);
-void nx842_crypto_exit(struct crypto_tfm *tfm);
-int nx842_crypto_compress(struct crypto_tfm *tfm,
+void *nx842_crypto_alloc_ctx(struct crypto_scomp *tfm,
+			     struct nx842_driver *driver);
+void nx842_crypto_free_ctx(struct crypto_scomp *tfm, void *ctx);
+int nx842_crypto_compress(struct crypto_scomp *tfm,
 			  const u8 *src, unsigned int slen,
-			  u8 *dst, unsigned int *dlen);
-int nx842_crypto_decompress(struct crypto_tfm *tfm,
+			  u8 *dst, unsigned int *dlen, void *ctx);
+int nx842_crypto_decompress(struct crypto_scomp *tfm,
 			    const u8 *src, unsigned int slen,
-			    u8 *dst, unsigned int *dlen);
+			    u8 *dst, unsigned int *dlen, void *ctx);
 
 #endif /* __NX_842_H__ */
diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 8c859872c1839eca..80023686f3e21b72 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -1031,23 +1031,21 @@ static struct nx842_driver nx842_powernv_driver = {
 	.decompress =	nx842_powernv_decompress,
 };
 
-static int nx842_powernv_crypto_init(struct crypto_tfm *tfm)
+static void *nx842_powernv_crypto_alloc_ctx(struct crypto_scomp *tfm)
 {
-	return nx842_crypto_init(tfm, &nx842_powernv_driver);
+	return nx842_crypto_alloc_ctx(tfm, &nx842_powernv_driver);
 }
 
-static struct crypto_alg nx842_powernv_alg = {
-	.cra_name		= "842",
-	.cra_driver_name	= "842-nx",
-	.cra_priority		= 300,
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct nx842_crypto_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= nx842_powernv_crypto_init,
-	.cra_exit		= nx842_crypto_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= nx842_crypto_compress,
-	.coa_decompress		= nx842_crypto_decompress } }
+static struct scomp_alg nx842_powernv_alg = {
+	.base.cra_name		= "842",
+	.base.cra_driver_name	= "842-nx",
+	.base.cra_priority	= 300,
+	.base.cra_module	= THIS_MODULE,
+
+	.alloc_ctx		= nx842_powernv_crypto_alloc_ctx,
+	.free_ctx		= nx842_crypto_free_ctx,
+	.compress		= nx842_crypto_compress,
+	.decompress		= nx842_crypto_decompress,
 };
 
 static __init int nx_compress_powernv_init(void)
@@ -1107,7 +1105,7 @@ static __init int nx_compress_powernv_init(void)
 		nx842_powernv_exec = nx842_exec_vas;
 	}
 
-	ret = crypto_register_alg(&nx842_powernv_alg);
+	ret = crypto_register_scomp(&nx842_powernv_alg);
 	if (ret) {
 		nx_delete_coprocs();
 		return ret;
@@ -1128,7 +1126,7 @@ static void __exit nx_compress_powernv_exit(void)
 	if (!nx842_ct)
 		vas_unregister_api_powernv();
 
-	crypto_unregister_alg(&nx842_powernv_alg);
+	crypto_unregister_scomp(&nx842_powernv_alg);
 
 	nx_delete_coprocs();
 }
diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 35f2d0d8507ed774..6232901adc495ed3 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -1008,23 +1008,21 @@ static struct nx842_driver nx842_pseries_driver = {
 	.decompress =	nx842_pseries_decompress,
 };
 
-static int nx842_pseries_crypto_init(struct crypto_tfm *tfm)
+static void *nx842_pseries_crypto_alloc_ctx(struct crypto_scomp *tfm)
 {
-	return nx842_crypto_init(tfm, &nx842_pseries_driver);
+	return nx842_crypto_alloc_ctx(tfm, &nx842_pseries_driver);
 }
 
-static struct crypto_alg nx842_pseries_alg = {
-	.cra_name		= "842",
-	.cra_driver_name	= "842-nx",
-	.cra_priority		= 300,
-	.cra_flags		= CRYPTO_ALG_TYPE_COMPRESS,
-	.cra_ctxsize		= sizeof(struct nx842_crypto_ctx),
-	.cra_module		= THIS_MODULE,
-	.cra_init		= nx842_pseries_crypto_init,
-	.cra_exit		= nx842_crypto_exit,
-	.cra_u			= { .compress = {
-	.coa_compress		= nx842_crypto_compress,
-	.coa_decompress		= nx842_crypto_decompress } }
+static struct scomp_alg nx842_pseries_alg = {
+	.base.cra_name		= "842",
+	.base.cra_driver_name	= "842-nx",
+	.base.cra_priority	= 300,
+	.base.cra_module	= THIS_MODULE,
+
+	.alloc_ctx		= nx842_pseries_crypto_alloc_ctx,
+	.free_ctx		= nx842_crypto_free_ctx,
+	.compress		= nx842_crypto_compress,
+	.decompress		= nx842_crypto_decompress,
 };
 
 static int nx842_probe(struct vio_dev *viodev,
@@ -1072,7 +1070,7 @@ static int nx842_probe(struct vio_dev *viodev,
 	if (ret)
 		goto error;
 
-	ret = crypto_register_alg(&nx842_pseries_alg);
+	ret = crypto_register_scomp(&nx842_pseries_alg);
 	if (ret) {
 		dev_err(&viodev->dev, "could not register comp alg: %d\n", ret);
 		goto error;
@@ -1120,7 +1118,7 @@ static void nx842_remove(struct vio_dev *viodev)
 	if (caps_feat)
 		sysfs_remove_group(&viodev->dev.kobj, &nxcop_caps_attr_group);
 
-	crypto_unregister_alg(&nx842_pseries_alg);
+	crypto_unregister_scomp(&nx842_pseries_alg);
 
 	spin_lock_irqsave(&devdata_mutex, flags);
 	old_devdata = rcu_dereference_check(devdata,
@@ -1255,7 +1253,7 @@ static void __exit nx842_pseries_exit(void)
 
 	vas_unregister_api_pseries();
 
-	crypto_unregister_alg(&nx842_pseries_alg);
+	crypto_unregister_scomp(&nx842_pseries_alg);
 
 	spin_lock_irqsave(&devdata_mutex, flags);
 	old_devdata = rcu_dereference_check(devdata,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
