Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC87C369A2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 10:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VlQErHfxi4+MjtAnWRm02QhgQ4ThAh0U6mAXN2eUwg=; b=PHquHuYB+2lJzL
	P+0GQaB8iXe2uG7xI2XPvJg6rZPPVJGorB+qAmKq/2AqnocDQH/3DgZWWb9yIZOHtvvO5xvLXoYM0
	pVuoLeo5aTEMOaxwjF2JsDnOpebdF1hpmZGBksJV53rTLUPgg/H5qRbs1/RXLsZg5+4D0I9b+CnK1
	r6z0TWSTdfmZJ9KxvFbOSwSUkCtN8ijN/UP6ClzkX9nRfyfREstgeKOQ4a0/1/tfYh/31FK0JB46m
	N0lt7t1BHsmZci79uNiIsWucGAknIKea15Eyo3Qw3TWEyB2r10Km+2BWuyyCp8l7n8dxNEjQ+pEL8
	B4Sv+G38JxhyVM7EuCjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJp-0000000HJiz-1zND;
	Mon, 07 Apr 2025 10:03:05 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJm-0000000HJgJ-1uWH
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 10:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H3qmPC540vj+KWPyVGIUKyAF9WbqmMBeBWMS8tfPYEI=; b=svmmqo+Njr2/cZEiDYUULEHeUb
	t1dvVZSddqSCpBBk6I845HcQ7YWOF6j2svIBdufFqI7BFN+AwAVRYs2zfob27B/weuL0m5BU1v2ho
	P3g40+iI6U75gI/J6gjXNPwNpgaFrAcYxHNMZNJ0zBRLYNDROIoq5iSCHoyOZG9eY3gojLRlALV5Z
	gIt/pDz/IUoP5oMutNjtAQoJ4da7rLrndUEnAR2R5monAc6W5CyhzG67ngZW+WGKJXKskycmvh4ND
	ci4FZ1gYURTqugme6MAmnv2IADBJIF6SGBeeOhuQtySpBmQl5vLczOxqspypq+xOCHTxqR3hGs4XJ
	HncoWLqQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1jJd-00DTHP-1k;
	Mon, 07 Apr 2025 18:02:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 18:02:53 +0800
Date: Mon, 07 Apr 2025 18:02:53 +0800
Message-Id: <f229244c4d84d9de43c5dc187bdd3233d68cb263.1744019630.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1744019630.git.herbert@gondor.apana.org.au>
References: <cover.1744019630.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 2/7] crypto: acomp - Use request flag helpers and add
 acomp_request_flags
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_030302_491541_461A0131 
X-CRM114-Status: GOOD (  12.32  )
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

Use the newly added request flag helpers to manage the request
flags.

Also add acomp_request_flags which lets bottom-level users to
access the request flags without the bits private to the acomp
API.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/acompress.h          | 27 ++++++++++++++++-----------
 include/crypto/internal/acompress.h |  6 ++++++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 080e134df35c..f383a4008854 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -38,6 +38,12 @@
 /* Set this bit if destination is a folio. */
 #define CRYPTO_ACOMP_REQ_DST_FOLIO	0x00000040
 
+/* Private flags that should not be touched by the user. */
+#define CRYPTO_ACOMP_REQ_PRIVATE \
+	(CRYPTO_ACOMP_REQ_SRC_VIRT | CRYPTO_ACOMP_REQ_SRC_NONDMA | \
+	 CRYPTO_ACOMP_REQ_DST_VIRT | CRYPTO_ACOMP_REQ_DST_NONDMA | \
+	 CRYPTO_ACOMP_REQ_SRC_FOLIO | CRYPTO_ACOMP_REQ_DST_FOLIO)
+
 #define CRYPTO_ACOMP_DST_MAX		131072
 
 #define	MAX_SYNC_COMP_REQSIZE		0
@@ -201,7 +207,7 @@ static inline unsigned int crypto_acomp_reqsize(struct crypto_acomp *tfm)
 static inline void acomp_request_set_tfm(struct acomp_req *req,
 					 struct crypto_acomp *tfm)
 {
-	req->base.tfm = crypto_acomp_tfm(tfm);
+	crypto_request_set_tfm(&req->base, crypto_acomp_tfm(tfm));
 }
 
 static inline bool acomp_is_async(struct crypto_acomp *tfm)
@@ -298,6 +304,11 @@ static inline void *acomp_request_extra(struct acomp_req *req)
 	return (void *)((char *)req + len);
 }
 
+static inline bool acomp_req_on_stack(struct acomp_req *req)
+{
+	return crypto_req_on_stack(&req->base);
+}
+
 /**
  * acomp_request_free() -- zeroize and free asynchronous (de)compression
  *			   request as well as the output buffer if allocated
@@ -307,7 +318,7 @@ static inline void *acomp_request_extra(struct acomp_req *req)
  */
 static inline void acomp_request_free(struct acomp_req *req)
 {
-	if (!req || (req->base.flags & CRYPTO_TFM_REQ_ON_STACK))
+	if (!req || acomp_req_on_stack(req))
 		return;
 	kfree_sensitive(req);
 }
@@ -328,15 +339,9 @@ static inline void acomp_request_set_callback(struct acomp_req *req,
 					      crypto_completion_t cmpl,
 					      void *data)
 {
-	u32 keep = CRYPTO_ACOMP_REQ_SRC_VIRT | CRYPTO_ACOMP_REQ_SRC_NONDMA |
-		   CRYPTO_ACOMP_REQ_DST_VIRT | CRYPTO_ACOMP_REQ_DST_NONDMA |
-		   CRYPTO_ACOMP_REQ_SRC_FOLIO | CRYPTO_ACOMP_REQ_DST_FOLIO |
-		   CRYPTO_TFM_REQ_ON_STACK;
-
-	req->base.complete = cmpl;
-	req->base.data = data;
-	req->base.flags &= keep;
-	req->base.flags |= flgs & ~keep;
+	flgs &= ~CRYPTO_ACOMP_REQ_PRIVATE;
+	flgs |= req->base.flags & CRYPTO_ACOMP_REQ_PRIVATE;
+	crypto_request_set_callback(&req->base, flgs, cmpl, data);
 }
 
 /**
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 960cdd1f3a57..5483ca5b46ad 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -229,4 +229,10 @@ static inline bool acomp_walk_more_src(const struct acomp_walk *walk, int cur)
 {
 	return walk->slen != cur;
 }
+
+static inline u32 acomp_request_flags(struct acomp_req *req)
+{
+	return crypto_request_flags(&req->base) & ~CRYPTO_ACOMP_REQ_PRIVATE;
+}
+
 #endif
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
