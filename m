Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4DC36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfGZGMk0yRfBgBUbiJaK8E2F/WmtWwOMkSgGaDkSZ5c=; b=1CPYDFeWlUKpah
	EnNUwMo2imI0kKXorDRnWg6jPQvPohRC3+e/Cfeky0/sjZw3TX/CUtdG17m4VuSGanOBTZ1XkyFiM
	Z1FY7jHdzX1GwtYRc49RTM/7OnMgAtwUUcY3MhxFglCfch1dunxBMNC97/0DnEUSCgkLecIppfIF0
	IMPv2MEquEo55RzAFQBoKmBca6ukp6myRqXTtATnTiFMJU6ylqbDqu9qXbRHm1laG+A25ulYNlnLH
	+hTuugQcjtlV7VNRtAsatgS1SNVHc8aFzc9tpQ4bsAY5PWd7z8ogYuhOb0eJA8JclxCoBfhM6stYU
	NHooCXfspCqI5B/EU42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJs-0000000HJlE-0KcC;
	Mon, 07 Apr 2025 10:03:08 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJo-0000000HJhU-1j8D
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 10:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=px3+EGYGgRRo3dZvAyJd19b/rdB7wjeF+foH69J0xUM=; b=kvqWVnofxY8Ql7MAJB5VGmgnlt
	ihOroNEz5pgNDZuDC4vVYKDG/ZnMrpgTyTeF3r0BS5Ujq113UTIypJ3GSmEudHavpJMLz6heJ/6OD
	aHalESuBjxnc1S3K3MJxliJjCnyON22UiXH9CYlvMXlyMhESfrH18cGzQ5sJPT72/ztAycqJJQhZT
	QpHusWIhkhmVDqoI4mYPFgP70wZjLpDV7pjbUgiLGXgaRhMx7IULQHEoeDYa+q3WZkCWW1pf7FcdW
	o8cHhnud90AWj4SGvi5jJXQdC/6BNZ50x4dgiozMgFKAg4V+tAZtN6QhKMd2Bd4emS46GGXDpwo7X
	q2lC5v3Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1jJf-00DTHb-2k;
	Mon, 07 Apr 2025 18:02:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 18:02:55 +0800
Date: Mon, 07 Apr 2025 18:02:55 +0800
Message-Id: <5a8593a858c0531a61933ebf3cfe7cdd87ef0b2c.1744019630.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1744019630.git.herbert@gondor.apana.org.au>
References: <cover.1744019630.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 3/7] crypto: acomp - Add ACOMP_FBREQ_ON_STACK
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_030304_473216_EADBF48A 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Add a helper to create an on-stack fallback request from a given
request.  Use this helper in acomp_do_nondma.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 crypto/acompress.c                  | 14 +-------------
 include/crypto/internal/acompress.h | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 7edf2e570bf8..85cef01bd638 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -253,21 +253,9 @@ static void acomp_virt_to_sg(struct acomp_req *req)
 
 static int acomp_do_nondma(struct acomp_req *req, bool comp)
 {
-	u32 keep = CRYPTO_ACOMP_REQ_SRC_VIRT |
-		   CRYPTO_ACOMP_REQ_SRC_NONDMA |
-		   CRYPTO_ACOMP_REQ_DST_VIRT |
-		   CRYPTO_ACOMP_REQ_DST_NONDMA;
-	ACOMP_REQUEST_ON_STACK(fbreq, crypto_acomp_reqtfm(req));
+	ACOMP_FBREQ_ON_STACK(fbreq, req);
 	int err;
 
-	acomp_request_set_callback(fbreq, req->base.flags, NULL, NULL);
-	fbreq->base.flags &= ~keep;
-	fbreq->base.flags |= req->base.flags & keep;
-	fbreq->src = req->src;
-	fbreq->dst = req->dst;
-	fbreq->slen = req->slen;
-	fbreq->dlen = req->dlen;
-
 	if (comp)
 		err = crypto_acomp_compress(fbreq);
 	else
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 5483ca5b46ad..8840fd2c1db5 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -23,6 +23,12 @@
         struct acomp_req *name = acomp_request_on_stack_init( \
                 __##name##_req, (tfm), 0, true)
 
+#define ACOMP_FBREQ_ON_STACK(name, req) \
+        char __##name##_req[sizeof(struct acomp_req) + \
+                            MAX_SYNC_COMP_REQSIZE] CRYPTO_MINALIGN_ATTR; \
+        struct acomp_req *name = acomp_fbreq_on_stack_init( \
+                __##name##_req, (req))
+
 /**
  * struct acomp_alg - asynchronous compression algorithm
  *
@@ -235,4 +241,24 @@ static inline u32 acomp_request_flags(struct acomp_req *req)
 	return crypto_request_flags(&req->base) & ~CRYPTO_ACOMP_REQ_PRIVATE;
 }
 
+static inline struct acomp_req *acomp_fbreq_on_stack_init(
+	char *buf, struct acomp_req *old)
+{
+	struct crypto_acomp *tfm = crypto_acomp_reqtfm(old);
+	struct acomp_req *req;
+
+	req = acomp_request_on_stack_init(buf, tfm, 0, true);
+	acomp_request_set_callback(req, acomp_request_flags(old), NULL, NULL);
+	req->base.flags &= ~CRYPTO_ACOMP_REQ_PRIVATE;
+	req->base.flags |= old->base.flags & CRYPTO_ACOMP_REQ_PRIVATE;
+	req->src = old->src;
+	req->dst = old->dst;
+	req->slen = old->slen;
+	req->dlen = old->dlen;
+	req->soff = old->soff;
+	req->doff = old->doff;
+
+	return req;
+}
+
 #endif
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
