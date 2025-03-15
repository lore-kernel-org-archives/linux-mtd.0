Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAB3C35FF3
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sw1prKKupThoup7wiHybd3WGCMGfDp688kbLfPT01So=; b=0Q4cgm5pL9fZWL
	7jyp9dcwoU//mUosWeGNuvH13K6AqYf274EI8PfpQutkb2eLAqQToxSf/NxjyR8cVpRVdMLnUNMO0
	G92ZoGbZ4Ah3mqJW0h+Hhy7YociDflYy6ciVk9zqVugiZOSYeY7/14ZkbVzX8pnDYmgUtf6Pp4i7W
	PgJgHNF8jeW9WoiNox2+evQdn0VKxC9xsgT4kPA1oNX5JIuiPozHNbky/xw1mPaxcq0sDbSbx3Wvd
	l7MHZuZViHyO0y3B9h47xs6Y8HaAJhYsHiV+995Yf1KdBtt5S2wcIVcY10Cgl9rGvDZhVgvaMLhQw
	ZQ44dqBkBQRX5dyxl+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOo0-0000000GDIp-0siT;
	Sat, 15 Mar 2025 10:31:48 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOn6-0000000GD3Z-3tyG
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 10:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xKQt4Hlnj5e/HvykRuz+6r4zNwDvKhLAIlJI8TesC9s=; b=mard5RaiB53sgxHWGigmRyNu/z
	QVMxyNh0mBvl3eiSqd6xkjcGFuz9jYzWpqi1lE33QGmwKcUqNlDR6GZyjuz9SOoSlYWnHEnN19SDH
	4Hhm0HWXclbrIUk5L5kRTLmmXyu+4o7RKpUxOGQRLomxTvv0vehoJhET+vlFKWzgQfz9NzazMTx3k
	jfvW+i+fpJvWpcNP/nfYpXed93EBj2JVclEtW1HqR1zJSLyou3hqqS/eMrYxh4sknCTJsHEacaoQ1
	qm+Q48exqJFv3qThVhs4IgQAgHvk9t75jYofrhP4mDAZ9y9u7o3+SvlUy+Md6422xkzGBVtXq2PCl
	wqMAzkiA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttOmz-006pCh-1f;
	Sat, 15 Mar 2025 18:30:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 18:30:45 +0800
Date: Sat, 15 Mar 2025 18:30:45 +0800
Message-Id: <339411183892ccee27409f00e975ae09f88e01af.1742034499.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1742034499.git.herbert@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v5 PATCH 12/14] PM: hibernate: Use crypto_acomp interface
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_033053_256000_1CE2C0A8 
X-CRM114-Status: GOOD (  14.67  )
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

Replace the legacy crypto compression interface with the new acomp
interface.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
 kernel/power/hibernate.c |  5 ++--
 kernel/power/swap.c      | 58 +++++++++++++++++++++++++++-------------
 2 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 10a01af63a80..12051ff00839 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -11,6 +11,7 @@
 
 #define pr_fmt(fmt) "PM: hibernation: " fmt
 
+#include <crypto/acompress.h>
 #include <linux/blkdev.h>
 #include <linux/export.h>
 #include <linux/suspend.h>
@@ -757,7 +758,7 @@ int hibernate(void)
 	 */
 	if (!nocompress) {
 		strscpy(hib_comp_algo, hibernate_compressor, sizeof(hib_comp_algo));
-		if (crypto_has_comp(hib_comp_algo, 0, 0) != 1) {
+		if (!crypto_has_acomp(hib_comp_algo, 0, CRYPTO_ALG_ASYNC)) {
 			pr_err("%s compression is not available\n", hib_comp_algo);
 			return -EOPNOTSUPP;
 		}
@@ -1008,7 +1009,7 @@ static int software_resume(void)
 			strscpy(hib_comp_algo, COMPRESSION_ALGO_LZ4, sizeof(hib_comp_algo));
 		else
 			strscpy(hib_comp_algo, COMPRESSION_ALGO_LZO, sizeof(hib_comp_algo));
-		if (crypto_has_comp(hib_comp_algo, 0, 0) != 1) {
+		if (!crypto_has_acomp(hib_comp_algo, 0, CRYPTO_ALG_ASYNC)) {
 			pr_err("%s compression is not available\n", hib_comp_algo);
 			error = -EOPNOTSUPP;
 			goto Unlock;
diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index 82b884b67152..80ff5f933a62 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -12,6 +12,7 @@
 
 #define pr_fmt(fmt) "PM: " fmt
 
+#include <crypto/acompress.h>
 #include <linux/module.h>
 #include <linux/file.h>
 #include <linux/delay.h>
@@ -635,7 +636,8 @@ static int crc32_threadfn(void *data)
  */
 struct cmp_data {
 	struct task_struct *thr;                  /* thread */
-	struct crypto_comp *cc;                   /* crypto compressor stream */
+	struct crypto_acomp *cc;		  /* crypto compressor */
+	struct acomp_req *cr;			  /* crypto request */
 	atomic_t ready;                           /* ready to start flag */
 	atomic_t stop;                            /* ready to stop flag */
 	int ret;                                  /* return code */
@@ -656,7 +658,6 @@ static atomic_t compressed_size = ATOMIC_INIT(0);
 static int compress_threadfn(void *data)
 {
 	struct cmp_data *d = data;
-	unsigned int cmp_len = 0;
 
 	while (1) {
 		wait_event(d->go, atomic_read_acquire(&d->ready) ||
@@ -670,11 +671,13 @@ static int compress_threadfn(void *data)
 		}
 		atomic_set(&d->ready, 0);
 
-		cmp_len = CMP_SIZE - CMP_HEADER;
-		d->ret = crypto_comp_compress(d->cc, d->unc, d->unc_len,
-					      d->cmp + CMP_HEADER,
-					      &cmp_len);
-		d->cmp_len = cmp_len;
+		acomp_request_set_callback(d->cr, CRYPTO_TFM_REQ_MAY_SLEEP,
+					   NULL, NULL);
+		acomp_request_set_src_nondma(d->cr, d->unc, d->unc_len);
+		acomp_request_set_dst_nondma(d->cr, d->cmp + CMP_HEADER,
+					     CMP_SIZE - CMP_HEADER);
+		d->ret = crypto_acomp_compress(d->cr);
+		d->cmp_len = d->cr->dlen;
 
 		atomic_set(&compressed_size, atomic_read(&compressed_size) + d->cmp_len);
 		atomic_set_release(&d->stop, 1);
@@ -745,13 +748,20 @@ static int save_compressed_image(struct swap_map_handle *handle,
 		init_waitqueue_head(&data[thr].go);
 		init_waitqueue_head(&data[thr].done);
 
-		data[thr].cc = crypto_alloc_comp(hib_comp_algo, 0, 0);
+		data[thr].cc = crypto_alloc_acomp(hib_comp_algo, 0, CRYPTO_ALG_ASYNC);
 		if (IS_ERR_OR_NULL(data[thr].cc)) {
 			pr_err("Could not allocate comp stream %ld\n", PTR_ERR(data[thr].cc));
 			ret = -EFAULT;
 			goto out_clean;
 		}
 
+		data[thr].cr = acomp_request_alloc(data[thr].cc);
+		if (!data[thr].cr) {
+			pr_err("Could not allocate comp request\n");
+			ret = -ENOMEM;
+			goto out_clean;
+		}
+
 		data[thr].thr = kthread_run(compress_threadfn,
 		                            &data[thr],
 		                            "image_compress/%u", thr);
@@ -899,8 +909,8 @@ static int save_compressed_image(struct swap_map_handle *handle,
 		for (thr = 0; thr < nr_threads; thr++) {
 			if (data[thr].thr)
 				kthread_stop(data[thr].thr);
-			if (data[thr].cc)
-				crypto_free_comp(data[thr].cc);
+			acomp_request_free(data[thr].cr);
+			crypto_free_acomp(data[thr].cc);
 		}
 		vfree(data);
 	}
@@ -1142,7 +1152,8 @@ static int load_image(struct swap_map_handle *handle,
  */
 struct dec_data {
 	struct task_struct *thr;                  /* thread */
-	struct crypto_comp *cc;                   /* crypto compressor stream */
+	struct crypto_acomp *cc;		  /* crypto compressor */
+	struct acomp_req *cr;			  /* crypto request */
 	atomic_t ready;                           /* ready to start flag */
 	atomic_t stop;                            /* ready to stop flag */
 	int ret;                                  /* return code */
@@ -1160,7 +1171,6 @@ struct dec_data {
 static int decompress_threadfn(void *data)
 {
 	struct dec_data *d = data;
-	unsigned int unc_len = 0;
 
 	while (1) {
 		wait_event(d->go, atomic_read_acquire(&d->ready) ||
@@ -1174,10 +1184,13 @@ static int decompress_threadfn(void *data)
 		}
 		atomic_set(&d->ready, 0);
 
-		unc_len = UNC_SIZE;
-		d->ret = crypto_comp_decompress(d->cc, d->cmp + CMP_HEADER, d->cmp_len,
-						d->unc, &unc_len);
-		d->unc_len = unc_len;
+		acomp_request_set_callback(d->cr, CRYPTO_TFM_REQ_MAY_SLEEP,
+					   NULL, NULL);
+		acomp_request_set_src_nondma(d->cr, d->cmp + CMP_HEADER,
+					     d->cmp_len);
+		acomp_request_set_dst_nondma(d->cr, d->unc, UNC_SIZE);
+		d->ret = crypto_acomp_decompress(d->cr);
+		d->unc_len = d->cr->dlen;
 
 		if (clean_pages_on_decompress)
 			flush_icache_range((unsigned long)d->unc,
@@ -1254,13 +1267,20 @@ static int load_compressed_image(struct swap_map_handle *handle,
 		init_waitqueue_head(&data[thr].go);
 		init_waitqueue_head(&data[thr].done);
 
-		data[thr].cc = crypto_alloc_comp(hib_comp_algo, 0, 0);
+		data[thr].cc = crypto_alloc_acomp(hib_comp_algo, 0, CRYPTO_ALG_ASYNC);
 		if (IS_ERR_OR_NULL(data[thr].cc)) {
 			pr_err("Could not allocate comp stream %ld\n", PTR_ERR(data[thr].cc));
 			ret = -EFAULT;
 			goto out_clean;
 		}
 
+		data[thr].cr = acomp_request_alloc(data[thr].cc);
+		if (!data[thr].cr) {
+			pr_err("Could not allocate comp request\n");
+			ret = -ENOMEM;
+			goto out_clean;
+		}
+
 		data[thr].thr = kthread_run(decompress_threadfn,
 		                            &data[thr],
 		                            "image_decompress/%u", thr);
@@ -1507,8 +1527,8 @@ static int load_compressed_image(struct swap_map_handle *handle,
 		for (thr = 0; thr < nr_threads; thr++) {
 			if (data[thr].thr)
 				kthread_stop(data[thr].thr);
-			if (data[thr].cc)
-				crypto_free_comp(data[thr].cc);
+			acomp_request_free(data[thr].cr);
+			crypto_free_acomp(data[thr].cc);
 		}
 		vfree(data);
 	}
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
