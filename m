Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12C4C282EC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Mar 2025 12:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1dMNL+WqHf101IZ7NFqO+4jWwfZ7wEGmc9VAWQbFI8=; b=rd+2kNz5fYoqPr
	J3uIFunhtm40Xryjy7yV8KseuOjibxzrIO+xXbeWcXruYat+D+igJtfj+OlcUg6dG01kQZpkNwquN
	atBzhkLZhokw5uxDAUcta73TSEo82myKA3at7bPlxesHc2E1NyerbHjeTdiJamdemqfoSWLd9OXBn
	YyJlJ7oGTvYQLECWurHU2Ytvs1i1RD7QBKhIa+XP4m7J0tyDBvf5jvbgTNyEfF6b2EkRZYYEt91SD
	8bXyMADkLb5YNcJOScOSXffWJc4hqtBcXO8ZF+WVFCul+qhSFoPva18eqyNG7hrFM+2I4QVYl325P
	/8hafQMkE4cRQDTj5eug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43z-0000000E8Ph-25jk;
	Fri, 14 Mar 2025 12:22:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43y-0000000E8Nh-1vbe
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Mar 2025 12:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Date:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KzUqiKmDfyVjOhBcGp1Btr2sYsGEx9by+Pr5sL1lV+M=; b=XQDVGKFYhMNdWlbe9+iYqo7mYW
	WzGMExwoykTnmfYDCYSPe14yXdEBR6/jeBs/FC1XPLoygMtsIKdyYRXm5Ste7MubH4rQjYtoEZIsB
	//8BtSDeudZ7BPC3B3ySXQvkNJEz1aizMGS+ZbKaLmulqOkqQFt9DPThnadvM9hX9Y3eAbrHRY+IC
	JudqW3CSJdR7GM/L7z2p+AHC+OeWNQL7WDeo2wSrqzATCAID/uH4CLZWB56JXReTeFiP4IjwQ3W0b
	WxpoKMRZhAWKNwhW5DQzJU9R3CtBKHbnsQCzgDTDh9WUqXtJMYpVgeqXSfnNtyD91enEwtAxlwKkM
	Bv5eKQUw==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt43t-00000002tQX-2hYu
	for linux-mtd@lists.infradead.org;
	Fri, 14 Mar 2025 12:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KzUqiKmDfyVjOhBcGp1Btr2sYsGEx9by+Pr5sL1lV+M=; b=gPK3uH1ikN6akg09KidJxxGFn5
	xAOypABetxoD/9lmYtVB5pml1tAFdm25RGxHNZIJdAm2JHNMY9+IMeN7GIotcledlgjVS+iQ5/g0J
	GBXoOoEzt3+1qsz/v8FtrgpA0dHlNG+Qnfk7nswCjQzQ5GFMNom3AIl/YETJCGyqNdcnLcOTGBZVQ
	nI2tJsAWMgcu2SvcZI+Lq7cbgeKYMC08f6egjvRvbOgF4nxlozEq6eFutBFp+GNdmET0wx7IrRZM6
	hqn9J9M9XnMRVzCHk+wwYgxtGWkJNh7c2lO6yV9GaiK0z5aIKTwcbnLjB5BRD/YFQZlvBMu/z1KCK
	BcXPaO1w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tt43d-006ZmX-0u;
	Fri, 14 Mar 2025 20:22:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Mar 2025 20:22:33 +0800
Date: Fri, 14 Mar 2025 20:22:33 +0800
Message-Id: <17787b6b8f00b2ad067e31b8eb1fe8b339da6856.1741954523.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1741954523.git.herbert@gondor.apana.org.au>
References: <cover.1741954523.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v4 PATCH 04/13] crypto: acomp - Remove dst_free
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122250_046254_9FE7925F 
X-CRM114-Status: UNSURE (   8.58  )
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

Remove the unused dst_free hook.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/internal/acompress.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 957a5ed7c7f1..575dbcbc0df4 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -17,7 +17,6 @@
  *
  * @compress:	Function performs a compress operation
  * @decompress:	Function performs a de-compress operation
- * @dst_free:	Frees destination buffer if allocated inside the algorithm
  * @init:	Initialize the cryptographic transformation object.
  *		This function is used to initialize the cryptographic
  *		transformation object. This function is called only once at
@@ -38,7 +37,6 @@
 struct acomp_alg {
 	int (*compress)(struct acomp_req *req);
 	int (*decompress)(struct acomp_req *req);
-	void (*dst_free)(struct scatterlist *dst);
 	int (*init)(struct crypto_acomp *tfm);
 	void (*exit)(struct crypto_acomp *tfm);
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
