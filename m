Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B64C35FF1
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjVzIim+9rOeY38h3abeMBxeybGAS9geNcz+I7mY9Nw=; b=HFG7B8AZzlrUOT
	clko80JcvT7pOsho5JTE0hhgkiTKkrH3/vMqysxywXRQLCXrKlPcVwCY1v/Ow2pwC16MxRyCLGKul
	UKq5VgpQgQYd6BKoqUaq7IjSTvzOPjnop/b2bY8HNnQ2vnDbz3O7fmxiI6AbTgtn+8J5sfCaZfqFs
	gLXPGL2Fbyw9S9YxiREFcdH+JhBruqVEjnkw5IDiZrKpzVtRA19nEUcMPCAal0zGENxvA4XO2Q3ue
	S/BiCeKkpZazii5Mo/Ma7OimOUnJsOQswXADxM/YRtkZrgQ2rEV+gTO1mhBtDPF5OKfe+26oi0+iS
	45gZVXjASFg1kuYLBIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOny-0000000GDH1-1EoU;
	Sat, 15 Mar 2025 10:31:46 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOn0-0000000GD2h-0KN8
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 10:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l+ZShRAgEc0yiVA0reyVkATRhc0SDpPkUxK/Z/PM0O0=; b=MGO6vtHahHBxkmrH8DwyZEKAI9
	pKzyjPmuAHwe6QiTiP0mW61T5ZzyT7rCjMPS97gc0QA3Mp0cf8+44r45YdqvZtrOmFCyjy5tO1z2j
	Rf0gEGIy1zJ2DtjIgWQCsYtRLALhHkLSa8f6AE5kYSRDDSdtfkzX3TT+R9tyTN6v6OfbN+okX0ynF
	Mlfl28w2wL7PI/N3s//x8YI6h5ugngO06ZO50jVeJ/Lt1HS12CsreiJtwAZLMOluusxui3aVWzGzV
	pfAz4NWIQsT2OsGjCE48ohTVlCaZlvZ70Ra9V4+nrVs95QSaD4x5aPJHuaVK3fy6BC7LI+kalBmD4
	vxnKuDyA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttOms-006pBk-27;
	Sat, 15 Mar 2025 18:30:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 18:30:38 +0800
Date: Sat, 15 Mar 2025 18:30:38 +0800
Message-Id: <690f24976ed3938d3a8cb29d38e264ce3121caad.1742034499.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1742034499.git.herbert@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v5 PATCH 09/14] crypto: acomp - Add async nondma fallback
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_033046_109989_67B1EF43 
X-CRM114-Status: GOOD (  12.29  )
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

Add support for passing non-DMA virtual addresses to async drivers
by passing them along to the fallback software algorithm.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 crypto/acompress.c | 69 +++++++++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/crypto/acompress.c b/crypto/acompress.c
index 9da033ded193..d54abc27330f 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -152,20 +152,6 @@ struct crypto_acomp *crypto_alloc_acomp_node(const char *alg_name, u32 type,
 }
 EXPORT_SYMBOL_GPL(crypto_alloc_acomp_node);
 
-static bool acomp_request_has_nondma(struct acomp_req *req)
-{
-	struct acomp_req *r2;
-
-	if (acomp_request_isnondma(req))
-		return true;
-
-	list_for_each_entry(r2, &req->base.list, base.list)
-		if (acomp_request_isnondma(r2))
-			return true;
-
-	return false;
-}
-
 static void acomp_save_req(struct acomp_req *req, crypto_completion_t cplt)
 {
 	struct crypto_acomp *tfm = crypto_acomp_reqtfm(req);
@@ -234,6 +220,45 @@ static void acomp_virt_to_sg(struct acomp_req *req)
 	}
 }
 
+static int acomp_do_nondma(struct acomp_req_chain *state,
+			   struct acomp_req *req)
+{
+	u32 keep = CRYPTO_ACOMP_REQ_SRC_VIRT |
+		   CRYPTO_ACOMP_REQ_SRC_NONDMA |
+		   CRYPTO_ACOMP_REQ_DST_VIRT |
+		   CRYPTO_ACOMP_REQ_DST_NONDMA;
+	ACOMP_REQUEST_ON_STACK(fbreq, crypto_acomp_reqtfm(req));
+	int err;
+
+	acomp_request_set_callback(fbreq, req->base.flags, NULL, NULL);
+	fbreq->base.flags &= ~keep;
+	fbreq->base.flags |= req->base.flags & keep;
+	fbreq->src = req->src;
+	fbreq->dst = req->dst;
+	fbreq->slen = req->slen;
+	fbreq->dlen = req->dlen;
+
+	if (state->op == crypto_acomp_reqtfm(req)->compress)
+		err = crypto_acomp_compress(fbreq);
+	else
+		err = crypto_acomp_decompress(fbreq);
+
+	req->dlen = fbreq->dlen;
+	return err;
+}
+
+static int acomp_do_one_req(struct acomp_req_chain *state,
+			    struct acomp_req *req)
+{
+	state->cur = req;
+
+	if (acomp_request_isnondma(req))
+		return acomp_do_nondma(state, req);
+
+	acomp_virt_to_sg(req);
+	return state->op(req);
+}
+
 static int acomp_reqchain_finish(struct acomp_req_chain *state,
 				 int err, u32 mask)
 {
@@ -252,10 +277,8 @@ static int acomp_reqchain_finish(struct acomp_req_chain *state,
 		req->base.flags &= mask;
 		req->base.complete = acomp_reqchain_done;
 		req->base.data = state;
-		state->cur = req;
 
-		acomp_virt_to_sg(req);
-		err = state->op(req);
+		err = acomp_do_one_req(state, req);
 
 		if (err == -EINPROGRESS) {
 			if (!list_empty(&state->head))
@@ -308,27 +331,17 @@ static int acomp_do_req_chain(struct acomp_req *req,
 	    (!acomp_request_chained(req) && !acomp_request_isvirt(req)))
 		return op(req);
 
-	/*
-	 * There are no in-kernel users that do this.  If and ever
-	 * such users come into being then we could add a fall-back
-	 * path.
-	 */
-	if (acomp_request_has_nondma(req))
-		return -EINVAL;
-
 	if (acomp_is_async(tfm)) {
 		acomp_save_req(req, acomp_reqchain_done);
 		state = req->base.data;
 	}
 
 	state->op = op;
-	state->cur = req;
 	state->src = NULL;
 	INIT_LIST_HEAD(&state->head);
 	list_splice_init(&req->base.list, &state->head);
 
-	acomp_virt_to_sg(req);
-	err = op(req);
+	err = acomp_do_one_req(state, req);
 	if (err == -EBUSY || err == -EINPROGRESS)
 		return -EBUSY;
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
