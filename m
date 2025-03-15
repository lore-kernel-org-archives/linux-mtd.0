Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF4C35FF7
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/S20KTBFJIBIcQdTZPdw3SZKD6C2PBdLtRJxWIAqds=; b=rNkSpG1BfUm60H
	K5LhqdMaSlXlLfHfUU0UMSD9E/u8ziMT5T9Ut7eG6FNe52PiX5f1G5Hugln1x6wb+xyhtE7YY/QnV
	YGqB4aKrkuAfF6uUOZ0rGwdvlNVMza7+SVxhB+v+6/ZuWiup/HG6IAEM1aLw8JyQQxpBf2taTE7bk
	Xl2XjdYqmwuHtepFr3YYOGWGafWIVbfvm8UhCC3+VHHIcTlHYue6SON9grrWdUREjizTZJx3o7P6m
	DS667dLWy4ttctmbgvYnNWH9jIs2FRi2rLHrnaUO1V1apYmVM7HsifEs7gQmT3CTauDGWIB1+EtyW
	RzMqM9w9PXcQQONsLjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOo0-0000000GDJR-39ph;
	Sat, 15 Mar 2025 10:31:48 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOn9-0000000GD4A-0mex
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 10:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hBTo5GBDN+0PxC8Vd/uhm5QjbYhkQA1Havr2Id6DpTo=; b=kigllFsyJ4vVo2JcGvNlgNIUhq
	ZwpxhB5BQpHtubMKdglEwbOeNhtGK6aL5iccdvyjCSKpYUPGwUfTMTQfiw6rOlqvepBzHfZBlxy2U
	YujNpmdQgvozAcv0gNepmgE3df78E1AyCdfmBRKHn/vFWOzgz5P0utojpMDw5EdAaD1BVyMQnqPJM
	irBpVcpDBam0JCwDjGBak28NCO/l0Z8oveyijpt6cO4PqCXUApuso9FHTKrPkG2QU2CqrnVwdSHKi
	rslKaxSpxE/ycgQG0W4gh0WwngShnMJYXh+ghxUIKH/Gwuh8f4VJ9KFYFAzAaRf+QPD15131lHU3k
	LJLQDmEg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttOn1-006pCy-2X;
	Sat, 15 Mar 2025 18:30:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 18:30:47 +0800
Date: Sat, 15 Mar 2025 18:30:47 +0800
Message-Id: <434ca0f270b1e76f2abb222ddb0d68d7f1e0831a.1742034499.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1742034499.git.herbert@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v5 PATCH 13/14] ubifs: Use crypto_acomp interface
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_033055_528294_9F7AA1BD 
X-CRM114-Status: GOOD (  22.10  )
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

Remove the compression mutexes and the overallocation for memory
(the offender LZO has been fixed).

Cap the output buffer length for compression to eliminate the
post-compression check for UBIFS_MIN_COMPRESS_DIFF.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 fs/ubifs/compress.c | 106 ++++++++++++++++++++++++++------------------
 fs/ubifs/journal.c  |   2 +-
 fs/ubifs/ubifs.h    |  15 +------
 3 files changed, 67 insertions(+), 56 deletions(-)

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 0b48cbab8a3d..a241ba01c9a8 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -15,7 +15,7 @@
  * decompression.
  */
 
-#include <linux/crypto.h>
+#include <crypto/acompress.h>
 #include "ubifs.h"
 
 /* Fake description object for the "none" compressor */
@@ -26,11 +26,8 @@ static struct ubifs_compressor none_compr = {
 };
 
 #ifdef CONFIG_UBIFS_FS_LZO
-static DEFINE_MUTEX(lzo_mutex);
-
 static struct ubifs_compressor lzo_compr = {
 	.compr_type = UBIFS_COMPR_LZO,
-	.comp_mutex = &lzo_mutex,
 	.name = "lzo",
 	.capi_name = "lzo",
 };
@@ -42,13 +39,8 @@ static struct ubifs_compressor lzo_compr = {
 #endif
 
 #ifdef CONFIG_UBIFS_FS_ZLIB
-static DEFINE_MUTEX(deflate_mutex);
-static DEFINE_MUTEX(inflate_mutex);
-
 static struct ubifs_compressor zlib_compr = {
 	.compr_type = UBIFS_COMPR_ZLIB,
-	.comp_mutex = &deflate_mutex,
-	.decomp_mutex = &inflate_mutex,
 	.name = "zlib",
 	.capi_name = "deflate",
 };
@@ -60,13 +52,8 @@ static struct ubifs_compressor zlib_compr = {
 #endif
 
 #ifdef CONFIG_UBIFS_FS_ZSTD
-static DEFINE_MUTEX(zstd_enc_mutex);
-static DEFINE_MUTEX(zstd_dec_mutex);
-
 static struct ubifs_compressor zstd_compr = {
 	.compr_type = UBIFS_COMPR_ZSTD,
-	.comp_mutex = &zstd_enc_mutex,
-	.decomp_mutex = &zstd_dec_mutex,
 	.name = "zstd",
 	.capi_name = "zstd",
 };
@@ -80,6 +67,30 @@ static struct ubifs_compressor zstd_compr = {
 /* All UBIFS compressors */
 struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
+static int ubifs_compress_req(const struct ubifs_info *c,
+			      struct acomp_req *req,
+			      void *out_buf, int *out_len,
+			      const char *compr_name)
+{
+	struct crypto_wait wait;
+	int in_len = req->slen;
+	int dlen = *out_len;
+	int err;
+
+	dlen = min(dlen, in_len - UBIFS_MIN_COMPRESS_DIFF);
+
+	crypto_init_wait(&wait);
+	acomp_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
+				   crypto_req_done, &wait);
+	acomp_request_set_dst_dma(req, out_buf, dlen);
+	err = crypto_acomp_compress(req);
+	err = crypto_wait_req(err, &wait);
+	*out_len = req->dlen;
+	acomp_request_free(req);
+
+	return err;
+}
+
 /**
  * ubifs_compress - compress data.
  * @c: UBIFS file-system description object
@@ -112,23 +123,14 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 	if (in_len < UBIFS_MIN_COMPR_LEN)
 		goto no_compr;
 
-	if (compr->comp_mutex)
-		mutex_lock(compr->comp_mutex);
-	err = crypto_comp_compress(compr->cc, in_buf, in_len, out_buf,
-				   (unsigned int *)out_len);
-	if (compr->comp_mutex)
-		mutex_unlock(compr->comp_mutex);
-	if (unlikely(err)) {
-		ubifs_warn(c, "cannot compress %d bytes, compressor %s, error %d, leave data uncompressed",
-			   in_len, compr->name, err);
-		goto no_compr;
+	{
+		ACOMP_REQUEST_ALLOC(req, compr->cc, GFP_NOFS | __GFP_NOWARN);
+
+		acomp_request_set_src_nondma(req, in_buf, in_len);
+		err = ubifs_compress_req(c, req, out_buf, out_len, compr->name);
 	}
 
-	/*
-	 * If the data compressed only slightly, it is better to leave it
-	 * uncompressed to improve read speed.
-	 */
-	if (in_len - *out_len < UBIFS_MIN_COMPRESS_DIFF)
+	if (err)
 		goto no_compr;
 
 	return;
@@ -139,6 +141,31 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 	*compr_type = UBIFS_COMPR_NONE;
 }
 
+static int ubifs_decompress_req(const struct ubifs_info *c,
+				struct acomp_req *req,
+				const void *in_buf, int in_len, int *out_len,
+				const char *compr_name)
+{
+	struct crypto_wait wait;
+	int err;
+
+	crypto_init_wait(&wait);
+	acomp_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
+				   crypto_req_done, &wait);
+	acomp_request_set_src_dma(req, in_buf, in_len);
+	err = crypto_acomp_decompress(req);
+	err = crypto_wait_req(err, &wait);
+	*out_len = req->dlen;
+
+	if (err)
+		ubifs_err(c, "cannot decompress %d bytes, compressor %s, error %d",
+			  in_len, compr_name, err);
+
+	acomp_request_free(req);
+
+	return err;
+}
+
 /**
  * ubifs_decompress - decompress data.
  * @c: UBIFS file-system description object
@@ -155,7 +182,6 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
 		     int in_len, void *out_buf, int *out_len, int compr_type)
 {
-	int err;
 	struct ubifs_compressor *compr;
 
 	if (unlikely(compr_type < 0 || compr_type >= UBIFS_COMPR_TYPES_CNT)) {
@@ -176,17 +202,13 @@ int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
 		return 0;
 	}
 
-	if (compr->decomp_mutex)
-		mutex_lock(compr->decomp_mutex);
-	err = crypto_comp_decompress(compr->cc, in_buf, in_len, out_buf,
-				     (unsigned int *)out_len);
-	if (compr->decomp_mutex)
-		mutex_unlock(compr->decomp_mutex);
-	if (err)
-		ubifs_err(c, "cannot decompress %d bytes, compressor %s, error %d",
-			  in_len, compr->name, err);
+	{
+		ACOMP_REQUEST_ALLOC(req, compr->cc, GFP_NOFS | __GFP_NOWARN);
 
-	return err;
+		acomp_request_set_dst_nondma(req, out_buf, *out_len);
+		return ubifs_decompress_req(c, req, in_buf, in_len, out_len,
+					    compr->name);
+	}
 }
 
 /**
@@ -199,7 +221,7 @@ int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
 static int __init compr_init(struct ubifs_compressor *compr)
 {
 	if (compr->capi_name) {
-		compr->cc = crypto_alloc_comp(compr->capi_name, 0, 0);
+		compr->cc = crypto_alloc_acomp(compr->capi_name, 0, 0);
 		if (IS_ERR(compr->cc)) {
 			pr_err("UBIFS error (pid %d): cannot initialize compressor %s, error %ld",
 			       current->pid, compr->name, PTR_ERR(compr->cc));
@@ -218,7 +240,7 @@ static int __init compr_init(struct ubifs_compressor *compr)
 static void compr_exit(struct ubifs_compressor *compr)
 {
 	if (compr->capi_name)
-		crypto_free_comp(compr->cc);
+		crypto_free_acomp(compr->cc);
 }
 
 /**
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 36ba79fbd2ff..7629ca9ecfe8 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1625,7 +1625,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	int err, dlen, compr_type, out_len, data_size;
 
 	out_len = le32_to_cpu(dn->size);
-	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
+	buf = kmalloc(out_len, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3375bbe0508c..7d0aaf5d2e23 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -124,13 +124,6 @@
 #define OLD_ZNODE_AGE 20
 #define YOUNG_ZNODE_AGE 5
 
-/*
- * Some compressors, like LZO, may end up with more data then the input buffer.
- * So UBIFS always allocates larger output buffer, to be sure the compressor
- * will not corrupt memory in case of worst case compression.
- */
-#define WORST_COMPR_FACTOR 2
-
 #ifdef CONFIG_FS_ENCRYPTION
 #define UBIFS_CIPHER_BLOCK_SIZE FSCRYPT_CONTENTS_ALIGNMENT
 #else
@@ -141,7 +134,7 @@
  * How much memory is needed for a buffer where we compress a data node.
  */
 #define COMPRESSED_DATA_NODE_BUF_SZ \
-	(UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR)
+	(UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE)
 
 /* Maximum expected tree height for use by bottom_up_buf */
 #define BOTTOM_UP_HEIGHT 64
@@ -835,16 +828,12 @@ struct ubifs_node_range {
  * struct ubifs_compressor - UBIFS compressor description structure.
  * @compr_type: compressor type (%UBIFS_COMPR_LZO, etc)
  * @cc: cryptoapi compressor handle
- * @comp_mutex: mutex used during compression
- * @decomp_mutex: mutex used during decompression
  * @name: compressor name
  * @capi_name: cryptoapi compressor name
  */
 struct ubifs_compressor {
 	int compr_type;
-	struct crypto_comp *cc;
-	struct mutex *comp_mutex;
-	struct mutex *decomp_mutex;
+	struct crypto_acomp *cc;
 	const char *name;
 	const char *capi_name;
 };
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
