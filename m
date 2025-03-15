Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D52C35FFB
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OpKLHKFNoZwk7OgIGj7dRJ8hmJ1WxdzMrID4/mhldk=; b=ga2Hs09XldePvh
	eUQ/A0010sz/3RrTEPbR0gEyHEtCNA0Xrl3iTGkdxrzk5Vo0e6dLPYRABTbECJFTh4jqz/5nKcRSD
	DHfOMrRDnmDpoNb+7VER6TbEkBeFj5j88G4LkcCaZAGWjcb2FKeCyk9YkTvM25iN1NgeUDGop/JL/
	8BIBSZdMLqEX1Lq8avksLShkFpnwWGL0rTn01l5VW2bTIUnaFListmZ91zBFXAOMtuyqmkEfpydEh
	oaZJQCT6WItLaW8xGr/1uIaokOYX9oAR8SIb7/q/U2eE3V6QRGsIyNHD3e60Av+ME3EYF10XJDcID
	h3uvXZGN0nk5RO2a8V6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOnu-0000000GDDy-0yom;
	Sat, 15 Mar 2025 10:31:42 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOmm-0000000GCy8-2kw3
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 10:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c5J7R93VbWY8eXPMwB3c29c2QRrhSxoIY0/VZKY8uW4=; b=BDStfajNUIJzKku/yhP8eaEwvf
	SKwIgAi/eq2ieZy7mMl+WSvSF5K+0TgwXRiId32ixaWn8KXQN7qkmr4+vdnOIJ60OCc3uh9InZIYX
	n4cvVas+KIkIuFAGTA/0Vpl4/rTzgWPFEgCv6GXKc0Wj6GKPrLFf9QEJB/LetMwJDks/xNvAlJ5rL
	zuruFmvoZXmk8vBB71mHnMeGkYKDYwuwe4kIdmX3jwUcPZAaB3K49PrfLindg6vwIHvV8Z7CbLxGG
	PH8IV5OmeTUeFU05TL4nLFHrb6xo1QpBQLMurlMWu84TFf5dzSpWi4YnjtecfMckf7lwCy9+wieW7
	lwd2LTsQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttOme-006p9o-2R;
	Sat, 15 Mar 2025 18:30:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 18:30:24 +0800
Date: Sat, 15 Mar 2025 18:30:24 +0800
Message-Id: <d892c20a1f0f4ebf8cc2f44216f63e7223499bad.1742034499.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1742034499.git.herbert@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v5 PATCH 03/14] crypto: iaa - Remove dst_null support
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_033033_017377_BD62E605 
X-CRM114-Status: GOOD (  14.05  )
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

Remove the unused dst_null support.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/crypto/intel/iaa/iaa_crypto_main.c | 136 +--------------------
 1 file changed, 6 insertions(+), 130 deletions(-)

diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/intel/iaa/iaa_crypto_main.c
index 990ea46955bb..50cb100bf1c8 100644
--- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
+++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c
@@ -1136,8 +1136,7 @@ static int iaa_compress(struct crypto_tfm *tfm,	struct acomp_req *req,
 			struct idxd_wq *wq,
 			dma_addr_t src_addr, unsigned int slen,
 			dma_addr_t dst_addr, unsigned int *dlen,
-			u32 *compression_crc,
-			bool disable_async)
+			u32 *compression_crc)
 {
 	struct iaa_device_compression_mode *active_compression_mode;
 	struct iaa_compression_ctx *ctx = crypto_tfm_ctx(tfm);
@@ -1180,7 +1179,7 @@ static int iaa_compress(struct crypto_tfm *tfm,	struct acomp_req *req,
 	desc->src2_size = sizeof(struct aecs_comp_table_record);
 	desc->completion_addr = idxd_desc->compl_dma;
 
-	if (ctx->use_irq && !disable_async) {
+	if (ctx->use_irq) {
 		desc->flags |= IDXD_OP_FLAG_RCI;
 
 		idxd_desc->crypto.req = req;
@@ -1193,7 +1192,7 @@ static int iaa_compress(struct crypto_tfm *tfm,	struct acomp_req *req,
 			" src_addr %llx, dst_addr %llx\n", __func__,
 			active_compression_mode->name,
 			src_addr, dst_addr);
-	} else if (ctx->async_mode && !disable_async)
+	} else if (ctx->async_mode)
 		req->base.data = idxd_desc;
 
 	dev_dbg(dev, "%s: compression mode %s,"
@@ -1214,7 +1213,7 @@ static int iaa_compress(struct crypto_tfm *tfm,	struct acomp_req *req,
 	update_total_comp_calls();
 	update_wq_comp_calls(wq);
 
-	if (ctx->async_mode && !disable_async) {
+	if (ctx->async_mode) {
 		ret = -EINPROGRESS;
 		dev_dbg(dev, "%s: returning -EINPROGRESS\n", __func__);
 		goto out;
@@ -1234,7 +1233,7 @@ static int iaa_compress(struct crypto_tfm *tfm,	struct acomp_req *req,
 
 	*compression_crc = idxd_desc->iax_completion->crc;
 
-	if (!ctx->async_mode || disable_async)
+	if (!ctx->async_mode)
 		idxd_free_desc(wq, idxd_desc);
 out:
 	return ret;
@@ -1500,13 +1499,11 @@ static int iaa_comp_acompress(struct acomp_req *req)
 	struct iaa_compression_ctx *compression_ctx;
 	struct crypto_tfm *tfm = req->base.tfm;
 	dma_addr_t src_addr, dst_addr;
-	bool disable_async = false;
 	int nr_sgs, cpu, ret = 0;
 	struct iaa_wq *iaa_wq;
 	u32 compression_crc;
 	struct idxd_wq *wq;
 	struct device *dev;
-	int order = -1;
 
 	compression_ctx = crypto_tfm_ctx(tfm);
 
@@ -1536,21 +1533,6 @@ static int iaa_comp_acompress(struct acomp_req *req)
 
 	iaa_wq = idxd_wq_get_private(wq);
 
-	if (!req->dst) {
-		gfp_t flags = req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL : GFP_ATOMIC;
-
-		/* incompressible data will always be < 2 * slen */
-		req->dlen = 2 * req->slen;
-		order = order_base_2(round_up(req->dlen, PAGE_SIZE) / PAGE_SIZE);
-		req->dst = sgl_alloc_order(req->dlen, order, false, flags, NULL);
-		if (!req->dst) {
-			ret = -ENOMEM;
-			order = -1;
-			goto out;
-		}
-		disable_async = true;
-	}
-
 	dev = &wq->idxd->pdev->dev;
 
 	nr_sgs = dma_map_sg(dev, req->src, sg_nents(req->src), DMA_TO_DEVICE);
@@ -1580,7 +1562,7 @@ static int iaa_comp_acompress(struct acomp_req *req)
 		req->dst, req->dlen, sg_dma_len(req->dst));
 
 	ret = iaa_compress(tfm, req, wq, src_addr, req->slen, dst_addr,
-			   &req->dlen, &compression_crc, disable_async);
+			   &req->dlen, &compression_crc);
 	if (ret == -EINPROGRESS)
 		return ret;
 
@@ -1611,100 +1593,6 @@ static int iaa_comp_acompress(struct acomp_req *req)
 out:
 	iaa_wq_put(wq);
 
-	if (order >= 0)
-		sgl_free_order(req->dst, order);
-
-	return ret;
-}
-
-static int iaa_comp_adecompress_alloc_dest(struct acomp_req *req)
-{
-	gfp_t flags = req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP ?
-		GFP_KERNEL : GFP_ATOMIC;
-	struct crypto_tfm *tfm = req->base.tfm;
-	dma_addr_t src_addr, dst_addr;
-	int nr_sgs, cpu, ret = 0;
-	struct iaa_wq *iaa_wq;
-	struct device *dev;
-	struct idxd_wq *wq;
-	int order = -1;
-
-	cpu = get_cpu();
-	wq = wq_table_next_wq(cpu);
-	put_cpu();
-	if (!wq) {
-		pr_debug("no wq configured for cpu=%d\n", cpu);
-		return -ENODEV;
-	}
-
-	ret = iaa_wq_get(wq);
-	if (ret) {
-		pr_debug("no wq available for cpu=%d\n", cpu);
-		return -ENODEV;
-	}
-
-	iaa_wq = idxd_wq_get_private(wq);
-
-	dev = &wq->idxd->pdev->dev;
-
-	nr_sgs = dma_map_sg(dev, req->src, sg_nents(req->src), DMA_TO_DEVICE);
-	if (nr_sgs <= 0 || nr_sgs > 1) {
-		dev_dbg(dev, "couldn't map src sg for iaa device %d,"
-			" wq %d: ret=%d\n", iaa_wq->iaa_device->idxd->id,
-			iaa_wq->wq->id, ret);
-		ret = -EIO;
-		goto out;
-	}
-	src_addr = sg_dma_address(req->src);
-	dev_dbg(dev, "dma_map_sg, src_addr %llx, nr_sgs %d, req->src %p,"
-		" req->slen %d, sg_dma_len(sg) %d\n", src_addr, nr_sgs,
-		req->src, req->slen, sg_dma_len(req->src));
-
-	req->dlen = 4 * req->slen; /* start with ~avg comp rato */
-alloc_dest:
-	order = order_base_2(round_up(req->dlen, PAGE_SIZE) / PAGE_SIZE);
-	req->dst = sgl_alloc_order(req->dlen, order, false, flags, NULL);
-	if (!req->dst) {
-		ret = -ENOMEM;
-		order = -1;
-		goto out;
-	}
-
-	nr_sgs = dma_map_sg(dev, req->dst, sg_nents(req->dst), DMA_FROM_DEVICE);
-	if (nr_sgs <= 0 || nr_sgs > 1) {
-		dev_dbg(dev, "couldn't map dst sg for iaa device %d,"
-			" wq %d: ret=%d\n", iaa_wq->iaa_device->idxd->id,
-			iaa_wq->wq->id, ret);
-		ret = -EIO;
-		goto err_map_dst;
-	}
-
-	dst_addr = sg_dma_address(req->dst);
-	dev_dbg(dev, "dma_map_sg, dst_addr %llx, nr_sgs %d, req->dst %p,"
-		" req->dlen %d, sg_dma_len(sg) %d\n", dst_addr, nr_sgs,
-		req->dst, req->dlen, sg_dma_len(req->dst));
-	ret = iaa_decompress(tfm, req, wq, src_addr, req->slen,
-			     dst_addr, &req->dlen, true);
-	if (ret == -EOVERFLOW) {
-		dma_unmap_sg(dev, req->dst, sg_nents(req->dst), DMA_FROM_DEVICE);
-		req->dlen *= 2;
-		if (req->dlen > CRYPTO_ACOMP_DST_MAX)
-			goto err_map_dst;
-		goto alloc_dest;
-	}
-
-	if (ret != 0)
-		dev_dbg(dev, "asynchronous decompress failed ret=%d\n", ret);
-
-	dma_unmap_sg(dev, req->dst, sg_nents(req->dst), DMA_FROM_DEVICE);
-err_map_dst:
-	dma_unmap_sg(dev, req->src, sg_nents(req->src), DMA_TO_DEVICE);
-out:
-	iaa_wq_put(wq);
-
-	if (order >= 0)
-		sgl_free_order(req->dst, order);
-
 	return ret;
 }
 
@@ -1727,9 +1615,6 @@ static int iaa_comp_adecompress(struct acomp_req *req)
 		return -EINVAL;
 	}
 
-	if (!req->dst)
-		return iaa_comp_adecompress_alloc_dest(req);
-
 	cpu = get_cpu();
 	wq = wq_table_next_wq(cpu);
 	put_cpu();
@@ -1810,19 +1695,10 @@ static int iaa_comp_init_fixed(struct crypto_acomp *acomp_tfm)
 	return 0;
 }
 
-static void dst_free(struct scatterlist *sgl)
-{
-	/*
-	 * Called for req->dst = NULL cases but we free elsewhere
-	 * using sgl_free_order().
-	 */
-}
-
 static struct acomp_alg iaa_acomp_fixed_deflate = {
 	.init			= iaa_comp_init_fixed,
 	.compress		= iaa_comp_acompress,
 	.decompress		= iaa_comp_adecompress,
-	.dst_free               = dst_free,
 	.base			= {
 		.cra_name		= "deflate",
 		.cra_driver_name	= "deflate-iaa",
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
