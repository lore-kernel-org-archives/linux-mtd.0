Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF06C28B28
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Mar 2025 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1dMNL+WqHf101IZ7NFqO+4jWwfZ7wEGmc9VAWQbFI8=; b=szQ4K7HxYBJjnt
	fJrNShBPMq9O/Fbwf/FTQxuxzb3NZkaYuZqLUZA+WwYZ8djA7Z5t0ljmYk4SyAhlKVlCH09ywQ9nL
	xlsUE6kh5tV4hCFbQX4paSyrLm8zychrAEKW+wcy2Mttuz3KdNStG4hiIVhplelw1FCHRzYA5TKYp
	9dVM+PhCycn/Y3m+yvyefFKpegh73wYIdGKEru32knKoDY1XKasggwEtcCO+ZeVllCORLTtATog9B
	5j5vR0Y16JhOx89YdRKsnoyYCIwcwYhF+xB9l3RskXZUbLAc2m005XgYnLaEX8asbte7jHYIKOrYs
	z40aCqx58xQauDqGCR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOnv-0000000GDF1-1xdH;
	Sat, 15 Mar 2025 10:31:43 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttOms-0000000GD1I-20Cq
	for linux-mtd@lists.infradead.org;
	Sat, 15 Mar 2025 10:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KzUqiKmDfyVjOhBcGp1Btr2sYsGEx9by+Pr5sL1lV+M=; b=VXobMZ3Y8vATPC3L9UcX5S4rPg
	ZVam8+21N+E1rPwi2RSbsRdy5f5O/NF82tH02+tYuudbvUtnWr8ZrFuUE1XfHYbWwFkr7uyLiJvut
	ZDjpF4ZT4g1QOJZNKDPpqhzU6zntdUYnJ6vgYQRDunjPZePch15H1UrawNQycJoCFcRqZEYmcUYh0
	IurN51Y82e4eRN57k8j0fcEvqV3Kpk7KhH93jo5KBAYYkb3jV+G+M8iVJ9j/FmRKdvl8SvfmesY+F
	S13/JnvPAXS60aCGf48ZT4yih8cWXuq48sq5pzoavPUIeeFwp3clg8YouALoCppA4FefO3myBQvHP
	tOVbKL5Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1ttOmj-006pAI-1U;
	Sat, 15 Mar 2025 18:30:30 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 15 Mar 2025 18:30:29 +0800
Date: Sat, 15 Mar 2025 18:30:29 +0800
Message-Id: <aabd036f637f60a9fa455b254eebe031da3a0ee0.1742034499.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1742034499.git.herbert@gondor.apana.org.au>
References: <cover.1742034499.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v5 PATCH 05/14] crypto: acomp - Remove dst_free
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_033038_534337_929A803F 
X-CRM114-Status: UNSURE (   8.65  )
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
