Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928F7C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:55:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A602133D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RMy0nWrX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ptz2OYA5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55A602133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9OTQO+8RUW+cEjPQOwDEer/lJZteEQFEVgpv2Avwbt4=; b=RMy0nWrX5S/dJSeVWGO10XY5kA
	vN5tjosJTZjBMb0hBy7M7IUK50f065E3xdNKmit95dd+uga5YaDffihV6L6WHKd/YZmM6gI4+N2ig
	Es6w4FzkvewV3SQF3OCBe4JjyLWCMTLSBUgeBNUN3RD85eDPfmmq0mYVi4kQ8f2VIC4D03t/BowBn
	1c/9Qx2u5KsGWXRmO50DGHEI/FO8x6rtmNpilHjX8Q/Xj8W+TiAybw+TxokKFZytXOqEUcGskbVVE
	evjmdnLiHGtyLW3iOGJUz2oec6Q2duBJBCK0wzyCHVfAPTfW067jaobxdcBF4O4JayYfncEJEDT4O
	EBVK6yZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6G9Y-0002Id-Vy; Tue, 19 Mar 2019 14:55:44 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6G88-0007jC-FQ
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 14:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1553007254; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Kz40BVlMRqN8ut2nL28uff4m8WDbaozEPbolXrXQGag=;
 b=ptz2OYA5Xs0MjzKzH6fJ3jGgMvOiVlMqmJY3/HhsmzQcc3HHj3y236+U3VF++yn/N6x+4o
 Zs7HsYJW4zJgLjf4u2mPm0AcS7HkEk/z1yJN5ec2HKvYzF3xZxUE9c+mKbdoNgYVlKbzaC
 SrCQfIAfuWArkjgx+W3ooEZ1TLrRLOM=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v6 07/13] mtd: rawnand: ingenic: Rename jz4780_bch_init to
 jz4780_bch_reset
Date: Tue, 19 Mar 2019 15:53:57 +0100
Message-Id: <20190319145403.31627-8-paul@crapouillou.net>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_075417_172160_C01A780A 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The jz4780_bch_init name was confusing, as it suggested that its content
should be executed once at init time, whereas what the function really
does is reset the hardware for a new ECC operation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v5: New patch
    
    v6: No change

 drivers/mtd/nand/raw/ingenic/jz4780_bch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index fdf483a49f7b..7635753bd7ea 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -69,8 +69,8 @@ struct jz4780_bch {
 	struct mutex lock;
 };
 
-static void jz4780_bch_init(struct jz4780_bch *bch,
-			    struct jz4780_bch_params *params, bool encode)
+static void jz4780_bch_reset(struct jz4780_bch *bch,
+			     struct jz4780_bch_params *params, bool encode)
 {
 	u32 reg;
 
@@ -183,7 +183,8 @@ int jz4780_bch_calculate(struct jz4780_bch *bch, struct jz4780_bch_params *param
 	int ret = 0;
 
 	mutex_lock(&bch->lock);
-	jz4780_bch_init(bch, params, true);
+
+	jz4780_bch_reset(bch, params, true);
 	jz4780_bch_write_data(bch, buf, params->size);
 
 	if (jz4780_bch_wait_complete(bch, BCH_BHINT_ENCF, NULL)) {
@@ -220,7 +221,7 @@ int jz4780_bch_correct(struct jz4780_bch *bch, struct jz4780_bch_params *params,
 
 	mutex_lock(&bch->lock);
 
-	jz4780_bch_init(bch, params, false);
+	jz4780_bch_reset(bch, params, false);
 	jz4780_bch_write_data(bch, buf, params->size);
 	jz4780_bch_write_data(bch, ecc_code, params->bytes);
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
