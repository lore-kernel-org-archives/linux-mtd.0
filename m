Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A30CAC5B9
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 08:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPJsUbm0HbLJg3vwJqiFJlXT4xnLOK6g+N1dis5U+Tg=; b=XEg/Q3yN7Au/cI
	3oEp3BQSBzp2711G0FzJFIOth36y2ZrlsXG95Yswf4ziMyMZBGmdvsPpGKa7nI9RSiL6hF07Awc1f
	YlcOMicVKB4k37gCfyAZI/pULT5YU7losRMOhKXKtuPePzTmUUe1audJdrrfaV07vmIcxDScXuL3H
	U1xPk/GslNDKNp4+sEmqwLlF6+IYRUVMUqaozusV0s5RWjhdHkTLZxmUIhOx5s80cJirWQ9WMmpm5
	dgSlu/urjiMK28D3+ColcsAU9dBDd/MW2LSpm5cMoFrxggsBOcA7IztWMTtkvCcZ6nV3Ov/1/D+6w
	rssNpJl1dBc/Rt6SqHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VQR-00000004b9Z-0EF9;
	Tue, 30 Sep 2025 08:09:31 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VQN-00000004b63-3eZg
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 08:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:cc:to:subject:message-id:date:from:reply-to;
	bh=SNl+JjIRM7qiedHpV2E5vW8Z43H70pcL9HXRcwW98v8=; b=OUoPEgaY2Om8Dxww/thydnKrAA
	UPck2JTT4NJ/82oH9tlSHFmZ6IKJbS8qyAIbgzWdk7Oel1UoTvj/N5uJmRsP9MZAzrwQRTarHgugZ
	AOHtaGmT1ArzuycdwrH1Lb+0/bvLOnCmnPvAyZFwUHrc1doFgskyKFwDXdGEDvm9jGA2roNRgA6a9
	D8YTkVVNKbhplJQjDaKxxdILtf7MiMhqA2NHDUrMrrBAMnmpfPWsWzThFYjtfAZ54BJCI4u3wvBPd
	WFkPBq9S012jMzeZVro7+GE4HsCXO4/62UHJm93vAetQG+/Jgv/dvNjV1Uoc2qxqba0lhIGRwFXij
	nOv63TSw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1v3VPW-009OTT-26;
	Tue, 30 Sep 2025 16:08:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 30 Sep 2025 16:08:34 +0800
Date: Tue, 30 Sep 2025 16:08:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Han Xu <han.xu@nxp.com>
Cc: "suman.kumar.chakraborty@intel.com" <suman.kumar.chakraborty@intel.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"terrelln@fb.com" <terrelln@fb.com>,
	"dsterba@suse.com" <dsterba@suse.com>,
	Richard Weinberger <richard@nod.at>,
	"chengzhihao1@huawei.com" <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: [PATCH] crypto: zstd - Fix compression bug caused by truncation
Message-ID: <aNuQAr79Hdky3WII@gondor.apana.org.au>
References: <GV1PR04MB9071B5AC95DBD48B67FACF44971BA@GV1PR04MB9071.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <GV1PR04MB9071B5AC95DBD48B67FACF44971BA@GV1PR04MB9071.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_010927_906733_01692518 
X-CRM114-Status: GOOD (  12.41  )
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

On Mon, Sep 29, 2025 at 11:51:36PM +0000, Han Xu wrote:
> Hi Suman,
> 
> The patch f5ad93ffb5411 "crypto: zstd - convert to acomp"
> leads to the following kernel dump during UBIFS write back.

Thanks for the detailed report and instructions!

Please let me know if you still get the crash with this patch:

---8<---
Use size_t for the return value of zstd_compress_cctx as otherwise
negative errors will be truncated to a positive value.

Reported-by: Han Xu <han.xu@nxp.com>
Fixes: f5ad93ffb541 ("crypto: zstd - convert to acomp")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/zstd.c b/crypto/zstd.c
index c2a19cb0879d..ac318d333b68 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -83,7 +83,7 @@ static void zstd_exit(struct crypto_acomp *acomp_tfm)
 static int zstd_compress_one(struct acomp_req *req, struct zstd_ctx *ctx,
 			     const void *src, void *dst, unsigned int *dlen)
 {
-	unsigned int out_len;
+	size_t out_len;
 
 	ctx->cctx = zstd_init_cctx(ctx->wksp, ctx->wksp_size);
 	if (!ctx->cctx)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
