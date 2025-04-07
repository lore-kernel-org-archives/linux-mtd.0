Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C15C3601E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clEHz6qZtOg8h9f9cf0X1kO5epcDDy3s/B5tht5D2k4=; b=U+xk7lPMSfeWAw
	o+Bq7g+qpSqC12C0P3JsU3tSP8dkEDjSUUhFSunVsuIv4GXgnfsHEYoWXwGzsAxb6JIgkuOWyjfB6
	aSURSvcrBmQtg8LDEMbpjbw1rppfbJ7hXanvrtwAJGoYizYVs116PsjPpb/xh78kkW5xw5KH0PBRu
	Yxyc8nS3gWd8s2MBJ8GV2KWtlmbhyt0JABZb2UwM4NUTU39LEle8A2Ud6PHBlGOWLiEevLzIDAUbO
	MWidQpMltNJWVV4yEwX0lmBHSENv3kg361CRWDQa22RSslyQD8Z9wtXPHcNEKwIB+a7ZDVhVsFwwT
	iBLZMlncqRvxuHoovj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJt-0000000HJmO-1AQ8;
	Mon, 07 Apr 2025 10:03:09 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jJq-0000000HJik-1G37
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 10:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N/kV/3akXRd58FogHn86jKF/OX5hcoPGbXayJwTkJqI=; b=XG6jzAZ1FnKDPjeKXr+71wxvcV
	uPaOB/awuKivEwilwSo8Ln/vKITvuq+xMfCUo5AL+VrnvCUyKi+hWtaV6Hk+A4hJpl+bGGuAn/N1i
	W1ssWpT2d6+EuRrN+JcKFbPFgXYttlS5eGwps8R0kRIlKj1BsxrMMGLkdg2Q3YE4fGY4BES8Vo2PA
	qqoH/Oyn536KRwoCk8Fe5k6VKFjon4KE5YTyNquGI0MkJk4x+Pi8M4Bmmw/P3tIKWyEFQ7Ose+Ydg
	PzZrI0UYCZp1rJv5K6dKQBv/G3jFcEw1bk/N6COFY5LnjWMd9kzwz2AAGoajskoPROo7SJxkIXiag
	zFqOKCew==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u1jJi-00DTHo-0M;
	Mon, 07 Apr 2025 18:02:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 07 Apr 2025 18:02:58 +0800
Date: Mon, 07 Apr 2025 18:02:58 +0800
Message-Id: <5e73c54a230c711c581238979936dc72543c7f02.1744019630.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1744019630.git.herbert@gondor.apana.org.au>
References: <cover.1744019630.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH 4/7] crypto: iaa - Switch to ACOMP_FBREQ_ON_STACK
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_030306_348386_F46F7B4D 
X-CRM114-Status: UNSURE (   8.21  )
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

Rather than copying the request by hand, use the ACOMP_FBREQ_ON_STACK
helper to do it.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/crypto/intel/iaa/iaa_crypto_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/intel/iaa/iaa_crypto_main.c
index aa63df16f20b..b4f15e738cee 100644
--- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
+++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c
@@ -999,12 +999,9 @@ static inline int check_completion(struct device *dev,
 
 static int deflate_generic_decompress(struct acomp_req *req)
 {
-	ACOMP_REQUEST_ON_STACK(fbreq, crypto_acomp_reqtfm(req));
+	ACOMP_FBREQ_ON_STACK(fbreq, req);
 	int ret;
 
-	acomp_request_set_callback(fbreq, 0, NULL, NULL);
-	acomp_request_set_params(fbreq, req->src, req->dst, req->slen,
-				 req->dlen);
 	ret = crypto_acomp_decompress(fbreq);
 	req->dlen = fbreq->dlen;
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
