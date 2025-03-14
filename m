Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BD5C282EC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDBGwaE4cw2gSU3CN7g1J6bN6kk65rLmqyNWgQvxtvU=; b=Ug2Wbvh8TK6AZN
	lbOeVA8UEO7nXFu3mV/q2daicctG+HlX0qw8XK12NQFXYPG/rT9xrPaMUIyU5uzU4Fh2+TmZ1sXNP
	97s0YiEcXFWinVXegs0Jb5S4LMHPodXggwEQe13lp9MKTlNCW8XnLnFt6cd0FupbsoyliYZwk0YmT
	iQOjygoMZ04i15ohhDyltmLUANAcP0R7GDjg4aNora1/U6zzqA1EMJ4M5z+YRUiZPftfXKsCn844q
	j1bf8kufgwiGMCM0ps5CUyDzAc9QMg7UhTXDZrvWkNR0XLmeq94OyFOO9UTqx450155cCHenEEteP
	4fK3Y+CXZcDKkY7Xbbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt449-0000000E8gR-1Q2v;
	Fri, 14 Mar 2025 12:23:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt447-0000000E8cF-2B4O
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Mar 2025 12:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Date:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=avLv1kIH8yNek3R4MB5SP5S6/ORyKKw5wrgNAuoZdZU=; b=lxFO/ndNVuw8LFMEf+hiq39JXN
	K6UquOIKHevCHoLCAoFckD8RaIPN1CuAbUVdhNl2vla09mKcts5SqFEgVUq3evXh8H4ke+WuooDEV
	IiHPkH2/bNQqpK03ujbUYOE1h3JieHBcKxSOBk9z6fQFFD5YzoJm3ZGJfMDEw6zswHSdVDouV99rK
	JGMNbd3bBPC4B9CU2fxSUWVDC1bZH7+d600xow0TdgxPZL3CFduOtAmm1nzQM57okqfn/4sMJbi8p
	evz0nUdw3sGjhQcYwdo+yTqddV54Dof5uniKErvhZby5NHtxX2iALgeUgIPrKiAuAXwRFAKSXWWLf
	M07lMGiQ==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt444-00000002tRW-2TyV
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 12:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=avLv1kIH8yNek3R4MB5SP5S6/ORyKKw5wrgNAuoZdZU=; b=RzXEf6Qn+9pV5rjrmq+XBvmzn5
	9RWfQLwnbKWX/XEJmqNQqNBEAIXUX45TSU764e/PSBWHfr4Orn/WFmu7uh+SwdQ6bXs4liXR6Y7QR
	hIlBtH3hZceTxzhVQajqzs9EAAGnhGciLXoLh+4pZNIoLrvn6hVv1wn1kmBSjlkcrGYvTYg1CHo+6
	CIWR0gm2TxZn5asU5fnXrppSuABsaV7B0WOJMZDpFfrAN3SVV+viNe9jmuvelyqZjmbCGb2wcL959
	RFZ4gim2RE4eOJreaSWtvV9AUHrl3t4gFFXrIVrQWHoG9IfAOtse3X3b1y0TbN0Lfed3jT3EINlN9
	+61CRThQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tt43v-006Zou-2J;
	Fri, 14 Mar 2025 20:22:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Mar 2025 20:22:51 +0800
Date: Fri, 14 Mar 2025 20:22:51 +0800
Message-Id: <785c7858e03ad03a56ffaee0e413c72e0a307a63.1741954523.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1741954523.git.herbert@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v4 PATCH 12/13] PM: hibernate: Use crypto_acomp interface
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122300_901514_84A455CF 
X-CRM114-Status: GOOD (  13.72  )
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
---
 kernel/power/swap.c | 58 ++++++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 19 deletions(-)

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
