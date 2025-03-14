Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55434C35FF1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJBII+GS1As2lWBbQBeJfnuKU1n4NeeniaLkjKkf++0=; b=ILU4tKbze0cnKu
	sdncXcDMcWMgZ+uw/yZBnyZDLiOFxF43ftc8yrhSomPDuLOaNbW+B+rj8BnaWEdxehtVhpW7C/L+P
	2mLqAgYhfhVash+a+93EPnc5SUbTLgZc8TZjmoaQJ7tm2JV8LTBUz8mYM+M2ZU3aEjbO7t8k/kn7P
	eb7VZ4+NUP/zln4Ydn+JM+rTV/i+2XA8YJb7crHcEFiQ2OXi39QRUNXtH9ejVZ8mfUu+tSEJdE/dH
	VzCwAf3VpA60/F8KGhmtiKqj6cyu2+laHk69Q11QIHSJDvzQPAlVXKj3yuIVFqN70H66fHCa/13LT
	WtbXp0g82kgx1d/z9hnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt440-0000000E8Qg-0qj1;
	Fri, 14 Mar 2025 12:22:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43y-0000000E8Ng-1vbc
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Mar 2025 12:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Date:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a3l+91BKzsddVZxNXDZKRTkrBuBQtx6ec/a2AoHM33E=; b=MFKzSgDBJQ+4j3F4Rl6D+R7DQ9
	o37R0a1ILseqf9qp0UiWMmMOYQtaLn7az2b9PaP4wDYt+S2wGVFoTheooIPNo/trM9hm8oqhqlUAa
	ERJukUXheUyU15g6z/FF5MFfYGOnxQ9bM6c8IM8kEcvNqE+HUIKaNI+WDF7tUSn4YZFKWucbfmSZ7
	c/4xVmPYIaoj8/sZZlhCQ08zTFitORuSrBjXwdxl/KJdTpW02ygY2VHzy4w77YkDTUsFW6NbSW8jr
	RkroP46hNZiBm4mq/c2eOJY0EPMliROjpEPdeOt1gQS1zUauDqAtaTrJF340VePsS3rbxA9ZZ9xme
	paW0AyJA==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43t-00000002tQW-2ZMn
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 12:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a3l+91BKzsddVZxNXDZKRTkrBuBQtx6ec/a2AoHM33E=; b=LxjrBmDSAXMe+8IS1JLRtghsGp
	jZKHna+O2ddic/kb2ui4Rxa0/iaH4uvKACQVEZ9/qkqsD9U8Z8TW9XA30oLfPX5Ly+QUBTYJ7Ex5Z
	HYj+PlZeQnAoPRSnvD31J1kUhyQXvXXWL+MJWU7kYCFkL8LY8VrIBUZl9v45BFdpZsN/AO9PQEuFc
	UZFBVObwQgp++RmIRPtb+fR1FSz+tF8u7bHHx0JQxzYoAXMpUcNm74ov1psVFH+pE/d+EGJSO/N9t
	BLt5q4jWmqt6aNvC9tUjvCIJ1ZpMkc6j+k3gPGOTfJAk++4NEtDiADmyBpcil47IkA3o/pG7UXxdO
	20GhADSw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tt43W-006Zlr-1D;
	Fri, 14 Mar 2025 20:22:27 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Mar 2025 20:22:26 +0800
Date: Fri, 14 Mar 2025 20:22:26 +0800
Message-Id: <1e29b349410b0d9822c8c0b8f6e01386a3c44d66.1741954320.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1741954320.git.herbert@gondor.apana.org.au>
References: <cover.1741954320.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v4 PATCH 02/13] crypto: qat - Remove dst_null support
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122250_049774_A8E28DFB 
X-CRM114-Status: GOOD (  14.33  )
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
 .../intel/qat/qat_common/qat_comp_algs.c      | 83 -------------------
 1 file changed, 83 deletions(-)

diff --git a/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c b/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c
index 2ba4aa22e092..9d5848e28ff8 100644
--- a/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c
+++ b/drivers/crypto/intel/qat/qat_common/qat_comp_algs.c
@@ -29,11 +29,6 @@ struct qat_compression_ctx {
 	int (*qat_comp_callback)(struct qat_compression_req *qat_req, void *resp);
 };
 
-struct qat_dst {
-	bool is_null;
-	int resubmitted;
-};
-
 struct qat_compression_req {
 	u8 req[QAT_COMP_REQ_SIZE];
 	struct qat_compression_ctx *qat_compression_ctx;
@@ -42,8 +37,6 @@ struct qat_compression_req {
 	enum direction dir;
 	int actual_dlen;
 	struct qat_alg_req alg_req;
-	struct work_struct resubmit;
-	struct qat_dst dst;
 };
 
 static int qat_alg_send_dc_message(struct qat_compression_req *qat_req,
@@ -60,46 +53,6 @@ static int qat_alg_send_dc_message(struct qat_compression_req *qat_req,
 	return qat_alg_send_message(alg_req);
 }
 
-static void qat_comp_resubmit(struct work_struct *work)
-{
-	struct qat_compression_req *qat_req =
-		container_of(work, struct qat_compression_req, resubmit);
-	struct qat_compression_ctx *ctx = qat_req->qat_compression_ctx;
-	struct adf_accel_dev *accel_dev = ctx->inst->accel_dev;
-	struct qat_request_buffs *qat_bufs = &qat_req->buf;
-	struct qat_compression_instance *inst = ctx->inst;
-	struct acomp_req *areq = qat_req->acompress_req;
-	struct crypto_acomp *tfm = crypto_acomp_reqtfm(areq);
-	unsigned int dlen = CRYPTO_ACOMP_DST_MAX;
-	u8 *req = qat_req->req;
-	dma_addr_t dfbuf;
-	int ret;
-
-	areq->dlen = dlen;
-
-	dev_dbg(&GET_DEV(accel_dev), "[%s][%s] retry NULL dst request - dlen = %d\n",
-		crypto_tfm_alg_driver_name(crypto_acomp_tfm(tfm)),
-		qat_req->dir == COMPRESSION ? "comp" : "decomp", dlen);
-
-	ret = qat_bl_realloc_map_new_dst(accel_dev, &areq->dst, dlen, qat_bufs,
-					 qat_algs_alloc_flags(&areq->base));
-	if (ret)
-		goto err;
-
-	qat_req->dst.resubmitted = true;
-
-	dfbuf = qat_req->buf.bloutp;
-	qat_comp_override_dst(req, dfbuf, dlen);
-
-	ret = qat_alg_send_dc_message(qat_req, inst, &areq->base);
-	if (ret != -ENOSPC)
-		return;
-
-err:
-	qat_bl_free_bufl(accel_dev, qat_bufs);
-	acomp_request_complete(areq, ret);
-}
-
 static void qat_comp_generic_callback(struct qat_compression_req *qat_req,
 				      void *resp)
 {
@@ -131,21 +84,6 @@ static void qat_comp_generic_callback(struct qat_compression_req *qat_req,
 
 	areq->dlen = 0;
 
-	if (qat_req->dir == DECOMPRESSION && qat_req->dst.is_null) {
-		if (cmp_err == ERR_CODE_OVERFLOW_ERROR) {
-			if (qat_req->dst.resubmitted) {
-				dev_dbg(&GET_DEV(accel_dev),
-					"Output does not fit destination buffer\n");
-				res = -EOVERFLOW;
-				goto end;
-			}
-
-			INIT_WORK(&qat_req->resubmit, qat_comp_resubmit);
-			adf_misc_wq_queue_work(&qat_req->resubmit);
-			return;
-		}
-	}
-
 	if (unlikely(status != ICP_QAT_FW_COMN_STATUS_FLAG_OK))
 		goto end;
 
@@ -248,26 +186,6 @@ static int qat_comp_alg_compress_decompress(struct acomp_req *areq, enum directi
 	if (areq->dst && !dlen)
 		return -EINVAL;
 
-	qat_req->dst.is_null = false;
-
-	/* Handle acomp requests that require the allocation of a destination
-	 * buffer. The size of the destination buffer is double the source
-	 * buffer (rounded up to the size of a page) to fit the decompressed
-	 * output or an expansion on the data for compression.
-	 */
-	if (!areq->dst) {
-		qat_req->dst.is_null = true;
-
-		dlen = round_up(2 * slen, PAGE_SIZE);
-		areq->dst = sgl_alloc(dlen, f, NULL);
-		if (!areq->dst)
-			return -ENOMEM;
-
-		dlen -= dhdr + dftr;
-		areq->dlen = dlen;
-		qat_req->dst.resubmitted = false;
-	}
-
 	if (dir == COMPRESSION) {
 		params.extra_dst_buff = inst->dc_data->ovf_buff_p;
 		ovf_buff_sz = inst->dc_data->ovf_buff_sz;
@@ -329,7 +247,6 @@ static struct acomp_alg qat_acomp[] = { {
 	.exit = qat_comp_alg_exit_tfm,
 	.compress = qat_comp_alg_compress,
 	.decompress = qat_comp_alg_decompress,
-	.dst_free = sgl_free,
 	.reqsize = sizeof(struct qat_compression_req),
 }};
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
