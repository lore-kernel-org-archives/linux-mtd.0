Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E60C35FF7
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 12:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZnwlVaAYg7P9NoMf6IbPMPHyXz+X7EEnZtvyB7KxPI=; b=YEoK75DGdCKLlp
	kwrY47JbqzWyaJ2XB4jSazczGrrVJn9g5yZa8T6FR5wrlYkVN4/YXRKO4FacNs4SuA2/EA05rpaeq
	FWub1YwUrX4l7RQSYNUkTO05wR+Vzszn2Vg5RB+XJR6sDo6eKrNTiB2EKhznCFzF47DQir8Ddfk9D
	+WRrTqi6miOelc1HorxTxOzuQe1wwJIEU74AazECMcobj1U9jkHuzU1T2OfAIxldOxwBR86p6+Jie
	vLE347F46X7MDwJtvBIRDb5cQ+HHBK/MYIblaU8ss3LtFR0nYRb9NMmViVNmT4KsWDM4I9TXebJwX
	3mJE4IpY5vQE1AGsoAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43p-0000000E8EL-1MDo;
	Fri, 14 Mar 2025 12:22:45 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43n-0000000E8CN-0RJ8
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 12:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TnJxSbbE+YJ2uAsOZ9Ozioiuc9CHKwZc8r1aAkL68hE=; b=ckUUMG/PN5PGEpKMpd4/Qt177w
	js3qq3sPtB8rX9OeidhC8D6nzSPfiQqUjLPb9myb2O/LIByhfPHhp7gazo50XEmLEnKWY184uwly7
	CaCa3gstGBs1vv6gkJJxaUVbZhDdjRxhoL5X7r+mAZQWQL+7nLf8DPCtJHYZdsA+s5teLw6uQ/5d+
	b54wIAAzdDcmfRV6qHwaynhrNarbrTg4IJkXuk5sAVaGgf4GlfBL3PB0Fdd9Rb2rSd71rp2BkSgpo
	ppg7BWoQYxAfPV+pVB80iPuk1tGeyfN/EBDXdJhuHY+CXC9mFqeFnN0iAEF660+BAgTu9XmYtfVJA
	2prYAFyw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tt43f-006Zmo-1u;
	Fri, 14 Mar 2025 20:22:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Mar 2025 20:22:35 +0800
Date: Fri, 14 Mar 2025 20:22:35 +0800
Message-Id: <c89cc6e2c4e5158e16a2d1b8b93a3d7cadd809e6.1741954523.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1741954523.git.herbert@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v4 PATCH 05/13] crypto: scomp - Add chaining and virtual address
 support
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_052243_145346_B79F0429 
X-CRM114-Status: GOOD (  13.59  )
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

Add chaining and virtual address support to all scomp algorithms.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 crypto/scompress.c | 96 +++++++++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 31 deletions(-)

diff --git a/crypto/scompress.c b/crypto/scompress.c
index 4441c40f541f..ba9b22ba53fe 100644
--- a/crypto/scompress.c
+++ b/crypto/scompress.c
@@ -178,8 +178,9 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 	unsigned int dlen = req->dlen;
 	struct page *spage, *dpage;
 	unsigned int soff, doff;
-	void *src, *dst;
 	unsigned int n;
+	const u8 *src;
+	u8 *dst;
 	int ret;
 
 	if (!req->src || !slen)
@@ -188,37 +189,47 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 	if (!req->dst || !dlen)
 		return -EINVAL;
 
-	soff = req->src->offset;
-	spage = nth_page(sg_page(req->src), soff / PAGE_SIZE);
-	soff = offset_in_page(soff);
-
-	n = slen / PAGE_SIZE;
-	n += (offset_in_page(slen) + soff - 1) / PAGE_SIZE;
-	if (slen <= req->src->length && (!PageHighMem(nth_page(spage, n)) ||
-					 size_add(soff, slen) <= PAGE_SIZE))
-		src = kmap_local_page(spage) + soff;
-	else
-		src = scratch->src;
-
-	doff = req->dst->offset;
-	dpage = nth_page(sg_page(req->dst), doff / PAGE_SIZE);
-	doff = offset_in_page(doff);
-
-	n = dlen / PAGE_SIZE;
-	n += (offset_in_page(dlen) + doff - 1) / PAGE_SIZE;
-	if (dlen <= req->dst->length && (!PageHighMem(nth_page(dpage, n)) ||
-					 size_add(doff, dlen) <= PAGE_SIZE))
-		dst = kmap_local_page(dpage) + doff;
+	if (acomp_request_src_isvirt(req))
+		src = req->svirt;
 	else {
-		if (dlen > SCOMP_SCRATCH_SIZE)
-			dlen = SCOMP_SCRATCH_SIZE;
-		dst = scratch->dst;
+		soff = req->src->offset;
+		spage = nth_page(sg_page(req->src), soff / PAGE_SIZE);
+		soff = offset_in_page(soff);
+
+		n = slen / PAGE_SIZE;
+		n += (offset_in_page(slen) + soff - 1) / PAGE_SIZE;
+		if (slen <= req->src->length &&
+		    (!PageHighMem(nth_page(spage, n)) ||
+		     size_add(soff, slen) <= PAGE_SIZE))
+			src = kmap_local_page(spage) + soff;
+		else
+			src = scratch->src;
+	}
+
+	if (acomp_request_dst_isvirt(req))
+		dst = req->dvirt;
+	else {
+		doff = req->dst->offset;
+		dpage = nth_page(sg_page(req->dst), doff / PAGE_SIZE);
+		doff = offset_in_page(doff);
+
+		n = dlen / PAGE_SIZE;
+		n += (offset_in_page(dlen) + doff - 1) / PAGE_SIZE;
+		if (dlen <= req->dst->length &&
+		    (!PageHighMem(nth_page(dpage, n)) ||
+		     size_add(doff, dlen) <= PAGE_SIZE))
+			dst = kmap_local_page(dpage) + doff;
+		else {
+			if (dlen > SCOMP_SCRATCH_SIZE)
+				dlen = SCOMP_SCRATCH_SIZE;
+			dst = scratch->dst;
+		}
 	}
 
 	spin_lock_bh(&scratch->lock);
 
 	if (src == scratch->src)
-		memcpy_from_sglist(src, req->src, 0, slen);
+		memcpy_from_sglist(scratch->src, req->src, 0, slen);
 
 	stream = raw_cpu_ptr(crypto_scomp_alg(scomp)->stream);
 	spin_lock(&stream->lock);
@@ -237,7 +248,7 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 
 	req->dlen = dlen;
 
-	if (dst != scratch->dst) {
+	if (!acomp_request_dst_isvirt(req) && dst != scratch->dst) {
 		kunmap_local(dst);
 		dlen += doff;
 		for (;;) {
@@ -248,20 +259,34 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 			dpage = nth_page(dpage, 1);
 		}
 	}
-	if (src != scratch->src)
+	if (!acomp_request_src_isvirt(req) && src != scratch->src)
 		kunmap_local(src);
 
 	return ret;
 }
 
+static int scomp_acomp_chain(struct acomp_req *req, int dir)
+{
+	struct acomp_req *r2;
+	int err;
+
+	err = scomp_acomp_comp_decomp(req, dir);
+	req->base.err = err;
+
+	list_for_each_entry(r2, &req->base.list, base.list)
+		r2->base.err = scomp_acomp_comp_decomp(r2, dir);
+
+	return err;
+}
+
 static int scomp_acomp_compress(struct acomp_req *req)
 {
-	return scomp_acomp_comp_decomp(req, 1);
+	return scomp_acomp_chain(req, 1);
 }
 
 static int scomp_acomp_decompress(struct acomp_req *req)
 {
-	return scomp_acomp_comp_decomp(req, 0);
+	return scomp_acomp_chain(req, 0);
 }
 
 static void crypto_exit_scomp_ops_async(struct crypto_tfm *tfm)
@@ -322,12 +347,21 @@ static const struct crypto_type crypto_scomp_type = {
 	.tfmsize = offsetof(struct crypto_scomp, base),
 };
 
-int crypto_register_scomp(struct scomp_alg *alg)
+static void scomp_prepare_alg(struct scomp_alg *alg)
 {
 	struct crypto_alg *base = &alg->calg.base;
 
 	comp_prepare_alg(&alg->calg);
 
+	base->cra_flags |= CRYPTO_ALG_REQ_CHAIN;
+}
+
+int crypto_register_scomp(struct scomp_alg *alg)
+{
+	struct crypto_alg *base = &alg->calg.base;
+
+	scomp_prepare_alg(alg);
+
 	base->cra_type = &crypto_scomp_type;
 	base->cra_flags |= CRYPTO_ALG_TYPE_SCOMPRESS;
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
