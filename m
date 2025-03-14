Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECD5C282EC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 12:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4P0Kzo1X+zho3F8zBYqEDmwniV8yKi7HHnDb5uOmbU0=; b=mtCaDnXvcFrxHX
	DSKKohKCAXQu+kVSSiZzF5AEsZCZ+LRpfbwozPKbfEyEBGsUP31bufIvj88g1nWLeJ8yfZs24NV2l
	Cq64f+Ec6lvDQ2RBPLuejjYXXYox83PiUaz5j/ZsBsGMtddikjaA06mMSTibfUtbISt4IPPXYmspL
	6z/7kBp3IXaW30K/hRZitoEtFjHaSoJZ6kLF1+qrlUim7W6VgrHtND5QtbtwN4rlHvF73I/lvwLbh
	OWnm/vKX7B1Bh79Y0GBbddnpZ9Ac2IAYYVa3Ric5BG3PgmKiQng/GNHULSdkhqK2SZtjXRkOo3UCt
	/RdzhxBTXrwfwM/V3NGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43t-0000000E8IV-2gTT;
	Fri, 14 Mar 2025 12:22:49 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43r-0000000E8FG-2lin
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 12:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zIb0wSG71Ygj2H3jMgCe2Okz2AI9eV57QCfyyCpN7fc=; b=UIesLuOkOKkXi6wOEUTzd8PLUa
	xc77yNRZ84G492gM0yD5b2fCNAUd92yIdOAEjzDcY9qJfxGqIaI/GQMoh+NAEwN68XTFkTDyFe/9V
	Ec49HFWezk6LFLaJAyGFYive0u7KYruVUi0Z/OlOzJV1gyJVAKuzDthWxNoiaesG6dp7er+IQrGwH
	FZ2QKx8L+hxO47Bv9cVhwXGp3+S9KV+a1FIQxkqD2IB3kT0cPAG0yKqeJLov66/sADzg8Pj0Wgopu
	uCxFTE+YtZc4+tXRG93Yh/Sv8Vy54O8CorJ01niKH4j/VbhhfcaBtQC9qm1ti8l9QBlNZOS1nqyA8
	Gfg+9dXA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tt43k-006ZnL-0c;
	Fri, 14 Mar 2025 20:22:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Mar 2025 20:22:40 +0800
Date: Fri, 14 Mar 2025 20:22:40 +0800
Message-Id: <96c3973e2ef9cd6762071a6dc5d6b34c660f9fa7.1741954523.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1741954523.git.herbert@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v4 PATCH 07/13] crypto: iaa - Use acomp stack fallback
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_052247_699280_05A1EF95 
X-CRM114-Status: GOOD (  11.27  )
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

Use ACOMP_REQUEST_ON_STACK instead of allocating legacy fallback
compression transform.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/crypto/intel/iaa/iaa_crypto_main.c | 28 +++++-----------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/intel/iaa/iaa_crypto_main.c
index 50cb100bf1c8..09d9589f2d68 100644
--- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
+++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c
@@ -33,8 +33,6 @@ static unsigned int nr_cpus_per_node;
 /* Number of physical cpus sharing each iaa instance */
 static unsigned int cpus_per_iaa;
 
-static struct crypto_comp *deflate_generic_tfm;
-
 /* Per-cpu lookup table for balanced wqs */
 static struct wq_table_entry __percpu *wq_table;
 
@@ -1001,17 +999,14 @@ static inline int check_completion(struct device *dev,
 
 static int deflate_generic_decompress(struct acomp_req *req)
 {
-	void *src, *dst;
+	ACOMP_REQUEST_ON_STACK(fbreq, crypto_acomp_reqtfm(req));
 	int ret;
 
-	src = kmap_local_page(sg_page(req->src)) + req->src->offset;
-	dst = kmap_local_page(sg_page(req->dst)) + req->dst->offset;
-
-	ret = crypto_comp_decompress(deflate_generic_tfm,
-				     src, req->slen, dst, &req->dlen);
-
-	kunmap_local(src);
-	kunmap_local(dst);
+	acomp_request_set_callback(fbreq, 0, NULL, NULL);
+	acomp_request_set_params(fbreq, req->src, req->dst, req->slen,
+				 req->dlen);
+	ret = crypto_acomp_decompress(fbreq);
+	req->dlen = fbreq->dlen;
 
 	update_total_sw_decomp_calls();
 
@@ -1898,15 +1893,6 @@ static int __init iaa_crypto_init_module(void)
 	}
 	nr_cpus_per_node = nr_cpus / nr_nodes;
 
-	if (crypto_has_comp("deflate-generic", 0, 0))
-		deflate_generic_tfm = crypto_alloc_comp("deflate-generic", 0, 0);
-
-	if (IS_ERR_OR_NULL(deflate_generic_tfm)) {
-		pr_err("IAA could not alloc %s tfm: errcode = %ld\n",
-		       "deflate-generic", PTR_ERR(deflate_generic_tfm));
-		return -ENOMEM;
-	}
-
 	ret = iaa_aecs_init_fixed();
 	if (ret < 0) {
 		pr_debug("IAA fixed compression mode init failed\n");
@@ -1948,7 +1934,6 @@ static int __init iaa_crypto_init_module(void)
 err_driver_reg:
 	iaa_aecs_cleanup_fixed();
 err_aecs_init:
-	crypto_free_comp(deflate_generic_tfm);
 
 	goto out;
 }
@@ -1965,7 +1950,6 @@ static void __exit iaa_crypto_cleanup_module(void)
 			   &driver_attr_verify_compress);
 	idxd_driver_unregister(&iaa_crypto_driver);
 	iaa_aecs_cleanup_fixed();
-	crypto_free_comp(deflate_generic_tfm);
 
 	pr_debug("cleaned up\n");
 }
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
