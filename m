Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290EAC3601E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqDFuVQyash9kb0Evm8Gz/8YOutn0nQlEm8MVaBl5Mo=; b=42R46DbfL4EKP8
	554BGHVlk/IzToul3yPKSysiw2ZkX2FrAfLopA0NBK1njxQ/wNgjHHSElcVUziqsu37EVfzPrrm5R
	+svb3wVCOQqN7TBj3MkTW2pnM6NKFITg3mXAa4sTwIVipBYehyjxUMtFUiWK5DLARutWhBRYZDS/3
	fMME93m00KkXMPVuRKj0jx7y9mCnfaNkpyaFjQOKLMD/8D2g4guyrwxjYs8JVwVpTwU8eFSNFXYRb
	5ynMB95RCot8UptET4Num5b35st3rWok79VyGSgrr/2qlEBq20RmUInmIxQAV4Uy9gp8kjKDwwIpx
	JbfP+OyX/vNxN3XILzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJz-0000000HJuv-3yfQ;
	Mon, 07 Apr 2025 10:03:15 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJw-0000000HJot-3a0j
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 10:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RmqAi0FnR081KEUwLh7HrYLW0oIEOru0MTzQ3KJf5O4=; b=me+FtLn9b06FFkn0J0njGSX85L
	S0kMUIZN+uf32JaiIjFKYgRkZ0rVM+kd8ii5M3JgEatzwhBPsvkcb9RHPcUq/I/bKngyCj3fFSCTj
	5HeVYcMC57cUziT0V1Hszd1qM8VkAN9+UzlTFbvN6N77a9H2LUBHMjvkMh+Nu86K3RTmAw7KPPfH2
	Dc7dz35YA6LV+1nnmiInr0fn1JSSKhBI6/ZF3HTJz6jdhpeg4fDrSWLlcgUtm7riB6kSU8lx/sjZq
	UW9mRjvKZfce1mGJD4lwzCA+iBmhuHL+OlXweuv7fur4irIA5SwFn6mDmfjlZOW9y8eUaBaNEn2GS
	QaMWAimg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1jJp-00DTIS-06;
	Mon, 07 Apr 2025 18:03:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 18:03:05 +0800
Date: Mon, 07 Apr 2025 18:03:05 +0800
Message-Id: <92b18f60721e79d1f51da2a80abe3827b0115781.1744019630.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1744019630.git.herbert@gondor.apana.org.au>
References: <cover.1744019630.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 7/7] crypto: acomp - Remove ACOMP_REQUEST_ALLOC
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_030312_906891_E1441A88 
X-CRM114-Status: UNSURE (   6.92  )
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

Remove ACOMP_REQUEST_ALLOC in favour of ACOMP_REQUEST_ON_STACK
with ACOMP_REQUEST_CLONE.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/acompress.h | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 93cee67c27c0..96ec0090a855 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -48,12 +48,6 @@
 
 #define	MAX_SYNC_COMP_REQSIZE		0
 
-#define ACOMP_REQUEST_ALLOC(name, tfm, gfp) \
-        char __##name##_req[sizeof(struct acomp_req) + \
-                            MAX_SYNC_COMP_REQSIZE] CRYPTO_MINALIGN_ATTR; \
-        struct acomp_req *name = acomp_request_alloc_init( \
-                __##name##_req, (tfm), (gfp))
-
 #define ACOMP_REQUEST_ON_STACK(name, tfm) \
         char __##name##_req[sizeof(struct acomp_req) + \
                             MAX_SYNC_COMP_REQSIZE] CRYPTO_MINALIGN_ATTR; \
@@ -580,21 +574,6 @@ int crypto_acomp_compress(struct acomp_req *req);
  */
 int crypto_acomp_decompress(struct acomp_req *req);
 
-static inline struct acomp_req *acomp_request_alloc_init(
-	char *buf, struct crypto_acomp *tfm, gfp_t gfp)
-{
-	struct acomp_req *req;
-
-	if ((req = acomp_request_alloc(tfm, gfp)))
-		return req;
-
-	req = (void *)buf;
-	acomp_request_set_tfm(req, tfm->fb);
-	req->base.flags = CRYPTO_TFM_REQ_ON_STACK;
-
-	return req;
-}
-
 static inline struct acomp_req *acomp_request_on_stack_init(
 	char *buf, struct crypto_acomp *tfm)
 {
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
