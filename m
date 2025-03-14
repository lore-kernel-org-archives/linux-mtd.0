Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AEBC35FF9
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDR6bwxlWMIieAomZ1/rS5lbicGf8X9prisT+dzZoCM=; b=enWZRauuI4h3DZ
	mnC0M77VrPzOWTjbSDP9zjxG7/F9rDudq92AypANbi2Ldx7HjCXSZwP9BFNqM5fn+tYWayRCVdDEF
	2fnn+JmYZ1Gwiw+mnqay+bsqCfIb1/6b0lUlIgBf89cW7txQrk9TGwNqMeEKz3DP8nH5NeY80p9EL
	qktjNwA5gdX5rkYPy3nxu/1/jNFT9U8TUARJKNnkHpc6UeZQJRGlsjz6+DQHecSG4rZR6TPcTjsgX
	e0bRlK2qGhVcldyc3mutOPxUdjRtcj9oSq+SV41qwF+OkHoCLYCCiKnUxDgVCanB0iVrL39eql2se
	RkXgbB4dFpYcBxg4S40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43s-0000000E8Gk-0VEK;
	Fri, 14 Mar 2025 12:22:48 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43p-0000000E8Dv-2kFS
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 12:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/lhr+zGaM7DIiI+E9GgEBvGtPQKlXrXK4hNUAFbkgRw=; b=VuQtL1wtN14IjlQVQgiT/Qyv7K
	59V0FMWNt44dHOGaZYcxctVwPOve9DKE3VpcZS1kKqWG/h1XT+M/LcOeosIIC51GqQRGt+BWgT5G2
	MW8EvXd3SMfOzG/ntnQnc/TvVrOaaYwsf1KkT46/fP3OsPvi/aUT5WEGR6fis7/YWtiACrOev0CyW
	c1n4QntnFBwdL8HjFfG/NGTx/dyEEmlF84/ljJWJsxiywrMjZ2XVZ090TopwYuHOTjXl2gVTqfd/X
	MborNDj/NvvvXyX5qcE+mf/x2p9mjxp4IoDjTHK9ry3bscZI6qsC93bovySfuNCfZQUzvd5Hi/MlK
	P78eJlvg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tt43h-006Zn3-2u;
	Fri, 14 Mar 2025 20:22:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Mar 2025 20:22:37 +0800
Date: Fri, 14 Mar 2025 20:22:37 +0800
Message-Id: <730498abde26909d413616ca9f166abd1a254b83.1741954523.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1741954523.git.herbert@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v4 PATCH 06/13] crypto: acomp - Add ACOMP_REQUEST_ALLOC and
 acomp_request_alloc_extra
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_052245_979630_5630FE62 
X-CRM114-Status: GOOD (  21.06  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add ACOMP_REQUEST_ALLOC which is a wrapper around acomp_request_alloc
that falls back to a synchronous stack reqeust if the allocation
fails.

Also add ACOMP_REQUEST_ON_STACK which stores the request on the stack
only.

The request should be freed with acomp_request_free.

Finally add acomp_request_alloc_extra which gives the user extra
memory to use in conjunction with the request.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 crypto/acompress.c                  | 38 ++++++++++++--
 include/crypto/acompress.h          | 80 +++++++++++++++++++++++++++--
 include/crypto/internal/acompress.h |  6 +++
 include/linux/crypto.h              |  1 +
 4 files changed, 117 insertions(+), 8 deletions(-)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 194a4b36f97f..9da033ded193 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -60,28 +60,56 @@ static void crypto_acomp_exit_tfm(struct crypto_tfm *tfm)
 	struct crypto_acomp *acomp = __crypto_acomp_tfm(tfm);
 	struct acomp_alg *alg = crypto_acomp_alg(acomp);
 
-	alg->exit(acomp);
+	if (alg->exit)
+		alg->exit(acomp);
+
+	if (acomp_is_async(acomp))
+		crypto_free_acomp(acomp->fb);
 }
 
 static int crypto_acomp_init_tfm(struct crypto_tfm *tfm)
 {
 	struct crypto_acomp *acomp = __crypto_acomp_tfm(tfm);
 	struct acomp_alg *alg = crypto_acomp_alg(acomp);
+	struct crypto_acomp *fb = NULL;
+	int err;
+
+	acomp->fb = acomp;
 
 	if (tfm->__crt_alg->cra_type != &crypto_acomp_type)
 		return crypto_init_scomp_ops_async(tfm);
 
+	if (acomp_is_async(acomp)) {
+		fb = crypto_alloc_acomp(crypto_acomp_alg_name(acomp), 0,
+					CRYPTO_ALG_ASYNC);
+		if (IS_ERR(fb))
+			return PTR_ERR(fb);
+
+		err = -EINVAL;
+		if (crypto_acomp_reqsize(fb) > MAX_SYNC_COMP_REQSIZE)
+			goto out_free_fb;
+
+		acomp->fb = fb;
+	}
+
 	acomp->compress = alg->compress;
 	acomp->decompress = alg->decompress;
 	acomp->reqsize = alg->reqsize;
 
-	if (alg->exit)
-		acomp->base.exit = crypto_acomp_exit_tfm;
+	acomp->base.exit = crypto_acomp_exit_tfm;
 
-	if (alg->init)
-		return alg->init(acomp);
+	if (!alg->init)
+		return 0;
+
+	err = alg->init(acomp);
+	if (err)
+		goto out_free_fb;
 
 	return 0;
+
+out_free_fb:
+	crypto_free_acomp(fb);
+	return err;
 }
 
 static unsigned int crypto_acomp_extsize(struct crypto_alg *alg)
diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 53c9e632862b..03cb381c2c54 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -10,9 +10,11 @@
 #define _CRYPTO_ACOMP_H
 
 #include <linux/atomic.h>
+#include <linux/args.h>
 #include <linux/compiler_types.h>
 #include <linux/container_of.h>
 #include <linux/crypto.h>
+#include <linux/err.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/spinlock_types.h>
@@ -32,6 +34,14 @@
 
 #define CRYPTO_ACOMP_DST_MAX		131072
 
+#define	MAX_SYNC_COMP_REQSIZE		0
+
+#define ACOMP_REQUEST_ALLOC(name, tfm, gfp) \
+        char __##name##_req[sizeof(struct acomp_req) + \
+                            MAX_SYNC_COMP_REQSIZE] CRYPTO_MINALIGN_ATTR; \
+        struct acomp_req *name = acomp_request_on_stack_init( \
+                __##name##_req, (tfm), (gfp), false)
+
 struct acomp_req;
 
 struct acomp_req_chain {
@@ -83,12 +93,14 @@ struct acomp_req {
  * @compress:		Function performs a compress operation
  * @decompress:		Function performs a de-compress operation
  * @reqsize:		Context size for (de)compression requests
+ * @fb:			Synchronous fallback tfm
  * @base:		Common crypto API algorithm data structure
  */
 struct crypto_acomp {
 	int (*compress)(struct acomp_req *req);
 	int (*decompress)(struct acomp_req *req);
 	unsigned int reqsize;
+	struct crypto_acomp *fb;
 	struct crypto_tfm base;
 };
 
@@ -210,24 +222,68 @@ static inline int crypto_has_acomp(const char *alg_name, u32 type, u32 mask)
 	return crypto_has_alg(alg_name, type, mask);
 }
 
+static inline const char *crypto_acomp_alg_name(struct crypto_acomp *tfm)
+{
+	return crypto_tfm_alg_name(crypto_acomp_tfm(tfm));
+}
+
+static inline const char *crypto_acomp_driver_name(struct crypto_acomp *tfm)
+{
+	return crypto_tfm_alg_driver_name(crypto_acomp_tfm(tfm));
+}
+
 /**
  * acomp_request_alloc() -- allocates asynchronous (de)compression request
  *
  * @tfm:	ACOMPRESS tfm handle allocated with crypto_alloc_acomp()
+ * @gfp:	gfp to pass to kzalloc (defaults to GFP_KERNEL)
  *
  * Return:	allocated handle in case of success or NULL in case of an error
  */
-static inline struct acomp_req *acomp_request_alloc_noprof(struct crypto_acomp *tfm)
+static inline struct acomp_req *acomp_request_alloc_extra_noprof(
+	struct crypto_acomp *tfm, size_t extra, gfp_t gfp)
 {
 	struct acomp_req *req;
+	size_t len;
 
-	req = kzalloc_noprof(sizeof(*req) + crypto_acomp_reqsize(tfm), GFP_KERNEL);
+	len = ALIGN(sizeof(*req) + crypto_acomp_reqsize(tfm), CRYPTO_MINALIGN);
+	if (check_add_overflow(len, extra, &len))
+		return NULL;
+
+	req = kzalloc_noprof(len, gfp);
 	if (likely(req))
 		acomp_request_set_tfm(req, tfm);
 	return req;
 }
+#define acomp_request_alloc_noprof(tfm, ...) \
+	CONCATENATE(acomp_request_alloc_noprof_, COUNT_ARGS(__VA_ARGS__))( \
+		tfm, ##__VA_ARGS__)
+#define acomp_request_alloc_noprof_0(tfm) \
+	acomp_request_alloc_noprof_1(tfm, GFP_KERNEL)
+#define acomp_request_alloc_noprof_1(tfm, gfp) \
+	acomp_request_alloc_extra_noprof(tfm, 0, gfp)
 #define acomp_request_alloc(...)	alloc_hooks(acomp_request_alloc_noprof(__VA_ARGS__))
 
+/**
+ * acomp_request_alloc_extra() -- allocate acomp request with extra memory
+ *
+ * @tfm:	ACOMPRESS tfm handle allocated with crypto_alloc_acomp()
+ * @extra:	amount of extra memory
+ * @gfp:	gfp to pass to kzalloc
+ *
+ * Return:	allocated handle in case of success or NULL in case of an error
+ */
+#define acomp_request_alloc_extra(...)	alloc_hooks(acomp_request_alloc_extra_noprof(__VA_ARGS__))
+
+static inline void *acomp_request_extra(struct acomp_req *req)
+{
+	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
+	size_t len;
+
+	len = ALIGN(sizeof(*req) + crypto_acomp_reqsize(tfm), CRYPTO_MINALIGN);
+	return (void *)((char *)req + len);
+}
+
 /**
  * acomp_request_free() -- zeroize and free asynchronous (de)compression
  *			   request as well as the output buffer if allocated
@@ -237,6 +293,8 @@ static inline struct acomp_req *acomp_request_alloc_noprof(struct crypto_acomp *
  */
 static inline void acomp_request_free(struct acomp_req *req)
 {
+	if (!req || (req->base.flags & CRYPTO_TFM_REQ_ON_STACK))
+		return;
 	kfree_sensitive(req);
 }
 
@@ -257,7 +315,8 @@ static inline void acomp_request_set_callback(struct acomp_req *req,
 					      void *data)
 {
 	u32 keep = CRYPTO_ACOMP_REQ_SRC_VIRT | CRYPTO_ACOMP_REQ_SRC_NONDMA |
-		   CRYPTO_ACOMP_REQ_DST_VIRT | CRYPTO_ACOMP_REQ_DST_NONDMA;
+		   CRYPTO_ACOMP_REQ_DST_VIRT | CRYPTO_ACOMP_REQ_DST_NONDMA |
+		   CRYPTO_TFM_REQ_ON_STACK;
 
 	req->base.complete = cmpl;
 	req->base.data = data;
@@ -446,4 +505,19 @@ int crypto_acomp_compress(struct acomp_req *req);
  */
 int crypto_acomp_decompress(struct acomp_req *req);
 
+static inline struct acomp_req *acomp_request_on_stack_init(
+	char *buf, struct crypto_acomp *tfm, gfp_t gfp, bool stackonly)
+{
+	struct acomp_req *req;
+
+	if (!stackonly && (req = acomp_request_alloc(tfm, gfp)))
+		return req;
+
+	req = (void *)buf;
+	acomp_request_set_tfm(req, tfm->fb);
+	req->base.flags = CRYPTO_TFM_REQ_ON_STACK;
+
+	return req;
+}
+
 #endif
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 575dbcbc0df4..c1ed55a0e3bf 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -12,6 +12,12 @@
 #include <crypto/acompress.h>
 #include <crypto/algapi.h>
 
+#define ACOMP_REQUEST_ON_STACK(name, tfm) \
+        char __##name##_req[sizeof(struct acomp_req) + \
+                            MAX_SYNC_COMP_REQSIZE] CRYPTO_MINALIGN_ATTR; \
+        struct acomp_req *name = acomp_request_on_stack_init( \
+                __##name##_req, (tfm), 0, true)
+
 /**
  * struct acomp_alg - asynchronous compression algorithm
  *
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index 61ac11226638..ea3b95bdbde3 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -138,6 +138,7 @@
 #define CRYPTO_TFM_REQ_FORBID_WEAK_KEYS	0x00000100
 #define CRYPTO_TFM_REQ_MAY_SLEEP	0x00000200
 #define CRYPTO_TFM_REQ_MAY_BACKLOG	0x00000400
+#define CRYPTO_TFM_REQ_ON_STACK		0x00000800
 
 /*
  * Miscellaneous stuff.
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
