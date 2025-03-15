Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873E1C28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 05:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjaxhjpoRVHir2ZNbzlWVfgIdDylMsbT7pVbNwCIjCc=; b=H55v8xx7HQfEzy
	A1xrn5sQmjGxaFKQwROprsBxqoO80pLue9vtNKJfEtlE0NeALUXAO+/UflcnL4Wd+12b1FlVKK0lx
	7eB2I4wYFVRjup/nG+NH/igxKXAKo3TYXM9IZitnnsHVpMuLvtw5YXEUis21m1KUzmP+GFfOC9O69
	p62zmCGiNskPfnxza94nC++xSOcr1SwVyE99oTysBEKCzp2GX1zixAFQaWiNnH2WWmEf+fpROxZpz
	bEzNZ1vwAwbVBQK2NT3/C2boYwNLWDmjIyMjLQ97OIrnpACOfyz4FPlnA/4TEPnqb22SbcGD7+oFO
	qdWn+ABn5DUREf3lYCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttKGo-0000000FrNA-1I0z;
	Sat, 15 Mar 2025 05:41:14 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttKGi-0000000FrMM-3W3G
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 05:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HjjilZAPTlwOchWvZyZ1q1uWUh7zlEVWWuPECm1h8LY=; b=TmjZvaJxud5OczKDCInvffv+OJ
	SDuAn+eeML7DIHMQ/x5/VWJsvbyfmFmC2lDJttLfA3sYnPkwQSTMaMtxzs5VRA/1zdWjsA7gGxvTe
	OSNAkB1rb/xocNlS+OsQm/OvmFZd7qwrZBV/sFMkZ8sPiS+vBoeJEVlYIPe80o6MHD18J6WSJIgWI
	Fx7ZODaRqT1qu8d0+N5ool4Hmr0TevIYYjKP3vQQ6mkkZbykgKrCTGJEhE25A2Ypw7nOTwigcFRSD
	twLeW1Y2JHG8+yeyWUIb/Y78t27M2cEqR2pSDCiBk84/oHBBwsDKQqk8ABZBCu6aD1LDoFgn94LLx
	sMcoXoMQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttKGU-006mFg-2z;
	Sat, 15 Mar 2025 13:40:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 13:40:54 +0800
Date: Sat, 15 Mar 2025 13:40:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>,
	netdev@vger.kernel.org
Subject: Re: [v4 PATCH 10/13] ubifs: Use crypto_acomp interface
Message-ID: <Z9US5rHr1Y7sCpns@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
 <349a78bc53d3620a29cc6105b55985db51aa0a11.1741954523.git.herbert@gondor.apana.org.au>
 <023a23b0-d9fd-6d4d-d5a2-207e47419645@huawei.com>
 <Z9T79PKW0TFO-2xl@gondor.apana.org.au>
 <f4a51d32-0b04-2c27-924d-f3a54d6b63a5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4a51d32-0b04-2c27-924d-f3a54d6b63a5@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_224108_883159_F5291E01 
X-CRM114-Status: GOOD (  13.70  )
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

On Sat, Mar 15, 2025 at 01:08:21PM +0800, Zhihao Cheng wrote:
> 
> The crypto_acomp_alg_name() gets name from compr->cc(the name is initialized
> by compr->capi_name).
> I got the following messages after verifying:
> [  154.907048] UBIFS warning (ubi0:0 pid 110): ubifs_compress_req.isra.0
> [ubifs]: cannot compress 4096 bytes, compressor deflate, error -12, leave
> data uncompressed
> 
> The 'deflate' is zlib compressor's capi_name, but we expect it be 'zlib'
> here.

Sorry I overlooked this difference.  I will fold the following
patch into the series when I repost.

Thanks,

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 9973a2853de7..8d481c8338c3 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -70,7 +70,8 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
 static int ubifs_compress_req(const struct ubifs_info *c,
 			      struct acomp_req *req,
-			      void *out_buf, int *out_len)
+			      void *out_buf, int *out_len,
+			      const char *compr_name)
 {
 	struct crypto_wait wait;
 	int in_len = req->slen;
@@ -86,9 +87,7 @@ static int ubifs_compress_req(const struct ubifs_info *c,
 
 	if (unlikely(err)) {
 		ubifs_warn(c, "cannot compress %d bytes, compressor %s, error %d, leave data uncompressed",
-			   in_len,
-			   crypto_acomp_alg_name(crypto_acomp_reqtfm(req)),
-			   err);
+			   in_len, compr_name, err);
 	} else if (in_len - *out_len < UBIFS_MIN_COMPRESS_DIFF) {
 		/*
 		 * If the data compressed only slightly, it is better
@@ -138,7 +137,7 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 		ACOMP_REQUEST_ALLOC(req, compr->cc, GFP_NOFS | __GFP_NOWARN);
 
 		acomp_request_set_src_dma(req, in_buf, in_len);
-		err = ubifs_compress_req(c, req, out_buf, out_len);
+		err = ubifs_compress_req(c, req, out_buf, out_len, compr->name);
 	}
 
 	if (err)
@@ -190,7 +189,7 @@ void ubifs_compress_folio(const struct ubifs_info *c, struct folio *in_folio,
 		ACOMP_REQUEST_ALLOC(req, compr->cc, GFP_NOFS | __GFP_NOWARN);
 
 		acomp_request_set_src_folio(req, in_folio, in_offset, in_len);
-		err = ubifs_compress_req(c, req, out_buf, out_len);
+		err = ubifs_compress_req(c, req, out_buf, out_len, compr->name);
 	}
 
 	if (err)
@@ -206,7 +205,8 @@ void ubifs_compress_folio(const struct ubifs_info *c, struct folio *in_folio,
 
 static int ubifs_decompress_req(const struct ubifs_info *c,
 				struct acomp_req *req,
-				const void *in_buf, int in_len, int *out_len)
+				const void *in_buf, int in_len, int *out_len,
+				const char *compr_name)
 {
 	struct crypto_wait wait;
 	int err;
@@ -221,9 +221,7 @@ static int ubifs_decompress_req(const struct ubifs_info *c,
 
 	if (err)
 		ubifs_err(c, "cannot decompress %d bytes, compressor %s, error %d",
-			  in_len,
-			  crypto_acomp_alg_name(crypto_acomp_reqtfm(req)),
-			  err);
+			  in_len, compr_name, err);
 
 	acomp_request_free(req);
 
@@ -270,7 +268,8 @@ int ubifs_decompress(const struct ubifs_info *c, const void *in_buf,
 		ACOMP_REQUEST_ALLOC(req, compr->cc, GFP_NOFS | __GFP_NOWARN);
 
 		acomp_request_set_dst_dma(req, out_buf, *out_len);
-		return ubifs_decompress_req(c, req, in_buf, in_len, out_len);
+		return ubifs_decompress_req(c, req, in_buf, in_len, out_len,
+					    compr->name);
 	}
 }
 
@@ -318,7 +317,8 @@ int ubifs_decompress_folio(const struct ubifs_info *c, const void *in_buf,
 
 		acomp_request_set_dst_folio(req, out_folio, out_offset,
 					    *out_len);
-		return ubifs_decompress_req(c, req, in_buf, in_len, out_len);
+		return ubifs_decompress_req(c, req, in_buf, in_len, out_len,
+					    compr->name);
 	}
 }
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
