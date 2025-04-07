Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA579C36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XziXfsjLDAa/+ehQ7mBqFpGpRsWEDU3dWeQARsyN5YI=; b=BjB/uObL4ehs7x
	BMk2dPsR7nFnrKEavqkJtDPAai0Kes8rpd4ymWScRYoZVOjfUJhKvbZ+PNzrkHxTw1sMDDi8S0DJ8
	Bl6vEEYuCna1eaOx7tplTGgzjTI5tiU8P8AIKZtqcL3ad94FIr3EwS+Y38j5r/6HzCvrKxnxS5NKM
	VBekhjVj8M53hKCfBUvg3iNHTDl7HSvCUD0X8flwqzG5Vy2EwvrZikja9AIVFn7Dl4MZIvHV0NIWD
	5fJ0OMT7SXRh6y/PmjDa2YGBYiXJ4eIIEJb1hEwK6lfoynk2MowGaCAzdpy/rVUsnM1QUF8LwjGce
	OTIxg57aX9VjjM6lPt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJm-0000000HJhO-3SHV;
	Mon, 07 Apr 2025 10:03:02 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJk-0000000HJfj-3nxm
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 10:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jjjfcrbdglAfHDZsLm4AQmzRyyIMxV2gmoAWlVJoeto=; b=TFeDLg4QjSVrIFOkdXVoUEer0Y
	TXRW7Cr1gG7Nv6IoTDZ/tw6NVzLi9iaCSzlPHQLqpZwT0evl82oFQMNlwqA1Asog6ogO8cImErn4w
	dcICk6cWZzwvEOxeejdLNuFMr9WsKFhBRV9h2ozVoJo26HVIux3mZ1nrFkLFrF0+sGkQKdnP1t1Eu
	KmFffjiRbEBIJYCZazuZRR5r6GdOB9I8XK3AMeNddqOi4F4hHGHHIlUyLQ17QybprZf9SOv43d/N/
	P3qupUEO5JByLTn86HeOwfBnJgF5+Biw3TBu6UTfvih01pvAkQLmuCUgImLmdPOd8lAvmRATIjJDS
	JSKoqlvQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1jJb-00DTHE-0i;
	Mon, 07 Apr 2025 18:02:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 18:02:51 +0800
Date: Mon, 07 Apr 2025 18:02:51 +0800
Message-Id: <020d0876b0e76511fe0317069d32dac87416ac06.1744019630.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1744019630.git.herbert@gondor.apana.org.au>
References: <cover.1744019630.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 1/7] crypto: api - Add helpers to manage request flags
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_030300_941838_56B2F6D1 
X-CRM114-Status: UNSURE (   7.76  )
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

Add helpers so that the ON_STACK request flag management is not
duplicated all over the place.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/algapi.h |  5 +++++
 include/linux/crypto.h  | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index ede622ecefa8..6999e10ea09e 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -272,4 +272,9 @@ static inline bool crypto_tfm_req_chain(struct crypto_tfm *tfm)
 	return tfm->__crt_alg->cra_flags & CRYPTO_ALG_REQ_CHAIN;
 }
 
+static inline u32 crypto_request_flags(struct crypto_async_request *req)
+{
+	return req->flags & ~CRYPTO_TFM_REQ_ON_STACK;
+}
+
 #endif	/* _CRYPTO_ALGAPI_H */
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index dd817f56ff0c..a387f1547ea0 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -476,5 +476,29 @@ static inline bool crypto_tfm_is_async(struct crypto_tfm *tfm)
 	return tfm->__crt_alg->cra_flags & CRYPTO_ALG_ASYNC;
 }
 
+static inline bool crypto_req_on_stack(struct crypto_async_request *req)
+{
+	return req->flags & CRYPTO_TFM_REQ_ON_STACK;
+}
+
+static inline void crypto_request_set_callback(
+	struct crypto_async_request *req, u32 flags,
+	crypto_completion_t compl, void *data)
+{
+	u32 keep = CRYPTO_TFM_REQ_ON_STACK;
+
+	req->complete = compl;
+	req->data = data;
+	req->flags &= keep;
+	req->flags |= flags & ~keep;
+}
+
+static inline void crypto_request_set_tfm(struct crypto_async_request *req,
+					  struct crypto_tfm *tfm)
+{
+	req->tfm = tfm;
+	req->flags &= ~CRYPTO_TFM_REQ_ON_STACK;
+}
+
 #endif	/* _LINUX_CRYPTO_H */
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
