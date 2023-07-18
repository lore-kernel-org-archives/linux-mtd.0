Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C147DC001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAUnQSofAA9jeuXno044D26F3nq7yDxOmNn9cZ202j8=; b=3jfbkDDNiB3aMX
	9Rh1O86Hkjuuyg+/1TMRgJyVlmNm4uq8QarZi+84Edqw1vSjISpNOpO/yypB0cmiybJJxDrj0jURn
	WOnRyyFqW8wZ68L1Q87A/5YA7U7rNptjyQOWifa+rnfvrBNIFLx7bjZLNrQA0BDYYOLAxswyWj6pA
	Wg+k7JxnTatdDl3kt+PGp0BK10iGvMwNInN+7TCWcbn4fdMAvtYRP1GYhM2WDkDgkUedCr5OgdwMo
	Uh26VmoTb6ktUVQ0TYYlUM5lOULBRuzN98ZXopYah0cSuZn8QkINpTfJvTX0asQXnCgC+rocTWAra
	s7eujrwYwc3a9aWL5pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzVP-005BcX-05;
	Wed, 19 Jul 2023 05:13:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzVN-005Bbz-22
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8ZqGEynoWcUwhEc1wtg7We6dkopzN9/CqlVBm6RgwmI=; b=c9fZZwJszLvMXQAV4hqCCU6Tdq
	FuDQ5ybER+sve7Sjz1kr9K3OlVOtL7Jv2S9yDQZynpAskeV5pRMwBG2qKlhBENt2rnK9mSrxvYEw9
	N8I9QgfDNSgMshZeOhjYpVzkxJ14gsIz9MCQwZQY/cX6lVDaa0plpjcwUqVxRd+5Pu4I4zQKnVu5w
	D2KSraw6dRLlw9NiQ3VH4wk4NDDiSqhTJqSBcq2IFg9DtS5v/s7DlZ3qe9Hjf43SGVfyIa/fT+VRj
	pnGgyvOFetXNR/+iWFz0VtXmSHJgaOXzzk1dgOQ3+CZc5WnmqZ34OMHqnCH8UlsVzh5YioFr5sJoy
	1jj6vlOA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkKD-00BYUY-2i
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:01:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D84661564;
	Tue, 18 Jul 2023 13:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F638C433BA;
	Tue, 18 Jul 2023 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685205;
	bh=HLeFyJ4elCj3PCL9yLBCWDNmAFSWQ5owIJ4uPCtQ01k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OMfSi7JaG1YgRbUikTp3RAVi+Puki10pCCv8NwIZLWavXOZf6b4agoSF+ANT7jNJQ
	 HLAtXQ1aZc/Ei0giEfw/ZT3RcJvlGFkW78TpT3ssf2SlDn05nXIx19TRkfJBfkUwcs
	 87PJDlORbs1yZa9BcKBJ4Erj/ijUF6EmO/RSsbnZ//OjjBmSffcwniPjYY8PuWiZ7K
	 V+F+QviT7E6XGan7Hdy+Jerd0CBKfnhdpBJskCVBUSFyHo5ab77GAXdN12sHC/Yb2N
	 hmwNU2UduqiIB9vy/g/U/nmQAClPnYlWcEwe0VstBbYhwY8xh1kvPXWP1/mPVKmVKd
	 Fa6yaBd2neVWw==
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
Subject: [RFC PATCH 08/21] zram: Migrate to acomp compression API
Date: Tue, 18 Jul 2023 14:58:34 +0200
Message-Id: <20230718125847.3869700-9-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7420; i=ardb@kernel.org; h=from:subject; bh=HLeFyJ4elCj3PCL9yLBCWDNmAFSWQ5owIJ4uPCtQ01k=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT1lzFrfwnBaubR80rMSmhzH4mEd/+tWaebdMaWGc6 PEPYYodpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJtrgx/JU//YA5SlbsX3VyV 9UKuKPXdprvf2Wfe6PgiqvNoY0ddNcP/4pYzux/JJOdkW3nw1ew5bbfjd8r3G3/7vjqedOud7aT GAwA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140110_289018_60AF9F33 
X-CRM114-Status: GOOD (  23.08  )
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

Switch from the deprecated 'comp' to the more recent 'acomp' API.

This involves using scatterlists and request objects to describe the in-
and output buffers, all of which happen to be contiguous in memory, and
reside either entirely in lowmem, or inside a single highmem page. This
makes the conversion quite straight-forward, and easy to back by either
a software or a hardware implementation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/block/zram/zcomp.c    | 67 +++++++++++++++-----
 drivers/block/zram/zcomp.h    |  7 +-
 drivers/block/zram/zram_drv.c | 12 +---
 3 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 55af4efd79835666..12bdd288a153c455 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -11,6 +11,9 @@
 #include <linux/sched.h>
 #include <linux/cpu.h>
 #include <linux/crypto.h>
+#include <linux/highmem.h>
+#include <linux/scatterlist.h>
+#include <crypto/acompress.h>
 
 #include "zcomp.h"
 
@@ -35,26 +38,32 @@ static const char * const backends[] = {
 
 static void zcomp_strm_free(struct zcomp_strm *zstrm)
 {
+	if (zstrm->req)
+		acomp_request_free(zstrm->req);
 	if (!IS_ERR_OR_NULL(zstrm->tfm))
-		crypto_free_comp(zstrm->tfm);
+		crypto_free_acomp(zstrm->tfm);
 	free_pages((unsigned long)zstrm->buffer, 1);
+	zstrm->req = NULL;
 	zstrm->tfm = NULL;
 	zstrm->buffer = NULL;
 }
 
 /*
- * Initialize zcomp_strm structure with ->tfm initialized by backend, and
- * ->buffer. Return a negative value on error.
+ * Initialize zcomp_strm structure with ->tfm and ->req initialized by
+ * backend, and ->buffer. Return a negative value on error.
  */
 static int zcomp_strm_init(struct zcomp_strm *zstrm, struct zcomp *comp)
 {
-	zstrm->tfm = crypto_alloc_comp(comp->name, 0, 0);
+	zstrm->tfm = crypto_alloc_acomp(comp->name, 0, CRYPTO_ALG_ASYNC);
+	if (!IS_ERR_OR_NULL(zstrm->tfm))
+		zstrm->req = acomp_request_alloc(zstrm->tfm);
+
 	/*
 	 * allocate 2 pages. 1 for compressed data, plus 1 extra for the
 	 * case when compressed size is larger than the original one
 	 */
 	zstrm->buffer = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 1);
-	if (IS_ERR_OR_NULL(zstrm->tfm) || !zstrm->buffer) {
+	if (IS_ERR_OR_NULL(zstrm->tfm) || !zstrm->req || !zstrm->buffer) {
 		zcomp_strm_free(zstrm);
 		return -ENOMEM;
 	}
@@ -70,7 +79,7 @@ bool zcomp_available_algorithm(const char *comp)
 	 * This also means that we permit zcomp initialisation
 	 * with any compressing algorithm known to crypto api.
 	 */
-	return crypto_has_comp(comp, 0, 0) == 1;
+	return crypto_has_acomp(comp, 0, CRYPTO_ALG_ASYNC);
 }
 
 /* show available compressors */
@@ -95,7 +104,7 @@ ssize_t zcomp_available_show(const char *comp, char *buf)
 	 * Out-of-tree module known to crypto api or a missing
 	 * entry in `backends'.
 	 */
-	if (!known_algorithm && crypto_has_comp(comp, 0, 0) == 1)
+	if (!known_algorithm && crypto_has_acomp(comp, 0, CRYPTO_ALG_ASYNC))
 		sz += scnprintf(buf + sz, PAGE_SIZE - sz - 2,
 				"[%s] ", comp);
 
@@ -115,8 +124,14 @@ void zcomp_stream_put(struct zcomp *comp)
 }
 
 int zcomp_compress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int *dst_len)
+		   struct page *src, unsigned int *dst_len)
 {
+	struct scatterlist sg_src, sg_dst;
+	int ret;
+
+	sg_init_table(&sg_src, 1);
+	sg_set_page(&sg_src, src, PAGE_SIZE, 0);
+
 	/*
 	 * Our dst memory (zstrm->buffer) is always `2 * PAGE_SIZE' sized
 	 * because sometimes we can endup having a bigger compressed data
@@ -131,21 +146,39 @@ int zcomp_compress(struct zcomp_strm *zstrm,
 	 * the dst buffer, zram_drv will take care of the fact that
 	 * compressed buffer is too big.
 	 */
-	*dst_len = PAGE_SIZE * 2;
+	sg_init_one(&sg_dst, zstrm->buffer, PAGE_SIZE * 2);
 
-	return crypto_comp_compress(zstrm->tfm,
-			src, PAGE_SIZE,
-			zstrm->buffer, dst_len);
+	acomp_request_set_params(zstrm->req, &sg_src, &sg_dst, PAGE_SIZE,
+				 PAGE_SIZE * 2);
+
+	ret = crypto_acomp_compress(zstrm->req);
+	if (ret)
+		return ret;
+
+	*dst_len = zstrm->req->dlen;
+	return 0;
 }
 
 int zcomp_decompress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int src_len, void *dst)
+		     const void *src, unsigned int src_len, struct page *dst)
 {
-	unsigned int dst_len = PAGE_SIZE;
+	struct scatterlist sg_src, sg_dst;
 
-	return crypto_comp_decompress(zstrm->tfm,
-			src, src_len,
-			dst, &dst_len);
+	if (is_kmap_addr(src)) {
+		sg_init_table(&sg_src, 1);
+		sg_set_page(&sg_src, kmap_to_page((void *)src), src_len,
+			    offset_in_page(src));
+	} else {
+		sg_init_one(&sg_src, src, src_len);
+	}
+
+	sg_init_table(&sg_dst, 1);
+	sg_set_page(&sg_dst, dst, PAGE_SIZE, 0);
+
+	acomp_request_set_params(zstrm->req, &sg_src, &sg_dst, src_len,
+				 PAGE_SIZE);
+
+	return crypto_acomp_decompress(zstrm->req);
 }
 
 int zcomp_cpu_up_prepare(unsigned int cpu, struct hlist_node *node)
diff --git a/drivers/block/zram/zcomp.h b/drivers/block/zram/zcomp.h
index cdefdef93da8c00d..32b9c4ae2d6dd9bf 100644
--- a/drivers/block/zram/zcomp.h
+++ b/drivers/block/zram/zcomp.h
@@ -12,7 +12,8 @@ struct zcomp_strm {
 	local_lock_t lock;
 	/* compression/decompression buffer */
 	void *buffer;
-	struct crypto_comp *tfm;
+	struct crypto_acomp *tfm;
+	struct acomp_req *req;
 };
 
 /* dynamic per-device compression frontend */
@@ -34,10 +35,10 @@ struct zcomp_strm *zcomp_stream_get(struct zcomp *comp);
 void zcomp_stream_put(struct zcomp *comp);
 
 int zcomp_compress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int *dst_len);
+		   struct page *src, unsigned int *dst_len);
 
 int zcomp_decompress(struct zcomp_strm *zstrm,
-		const void *src, unsigned int src_len, void *dst);
+		     const void *src, unsigned int src_len, struct page *dst);
 
 bool zcomp_set_max_streams(struct zcomp *comp, int num_strm);
 #endif /* _ZCOMP_H_ */
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 5676e6dd5b1672a8..ac24f5d955e3c16d 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1345,9 +1345,7 @@ static int zram_read_from_zspool(struct zram *zram, struct page *page,
 		kunmap_atomic(dst);
 		ret = 0;
 	} else {
-		dst = kmap_atomic(page);
-		ret = zcomp_decompress(zstrm, src, size, dst);
-		kunmap_atomic(dst);
+		ret = zcomp_decompress(zstrm, src, size, page);
 		zcomp_stream_put(zram->comps[prio]);
 	}
 	zs_unmap_object(zram->mem_pool, handle);
@@ -1432,9 +1430,7 @@ static int zram_write_page(struct zram *zram, struct page *page, u32 index)
 
 compress_again:
 	zstrm = zcomp_stream_get(zram->comps[ZRAM_PRIMARY_COMP]);
-	src = kmap_atomic(page);
-	ret = zcomp_compress(zstrm, src, &comp_len);
-	kunmap_atomic(src);
+	ret = zcomp_compress(zstrm, page, &comp_len);
 
 	if (unlikely(ret)) {
 		zcomp_stream_put(zram->comps[ZRAM_PRIMARY_COMP]);
@@ -1618,9 +1614,7 @@ static int zram_recompress(struct zram *zram, u32 index, struct page *page,
 
 		num_recomps++;
 		zstrm = zcomp_stream_get(zram->comps[prio]);
-		src = kmap_atomic(page);
-		ret = zcomp_compress(zstrm, src, &comp_len_new);
-		kunmap_atomic(src);
+		ret = zcomp_compress(zstrm, page, &comp_len_new);
 
 		if (ret) {
 			zcomp_stream_put(zram->comps[prio]);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
