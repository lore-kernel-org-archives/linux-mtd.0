Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB50C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:55:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A262133D
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kVQa8Pzj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Ewvq3QZi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A262133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HlcqZwbxF95YpaDbcSHngnRt8la+klVG8brnBh389YA=; b=kVQa8PzjZXduXSxnkcHbkEJQ0n
	lBOchEw04kPyqi/Bh7vzUHNB8xa7MfPYDQ9csTqFoGlkUfJYVMs5XiC6vCaWRpyyRp9dbURvKEmyL
	zkGXGI6d0XI4Oy6RYHvZ3xJhvjNRfVjZ0rMKuiWRtx5xBcZ++tna5GSyogY2cQpFFnMGz5iBHvdeM
	JuPdP08nFpARgaX7sDyOsvVKtg24mmkR0V37hHW2NXD44hW4W8r1R/YJ5sdvLJI4UHVTxEOOR9Bzv
	a+kFDWQg9eYhQxp4q1o1OoucEkrIijAAgPT2/DH5eeq181Q9wSt0c0DCNvLotOGswFQNwXqxQZD73
	l2yUgoTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6G8o-0000G7-8z; Tue, 19 Mar 2019 14:54:58 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6G85-0007gb-0b
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 14:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1553007251; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=lU6SgPmsQUfybwnNCOu+ZEyV7qCRJ4XazkGuBRWcMHU=;
 b=Ewvq3QZi7epjpXaI6dGBPaqlbOqIZnMujPDInYPj3QIM5T6ILN1TNLTMLrVFHtGg4IVLP+
 jw401LFE8Z5GucTl23233P5zdYar+aTyfgAAg5UDuyh+IriK/dF82boEgh4XvHqc8GLBrQ
 3Ij1carY1bYKWEq22KTNhIsk2q3IR5o=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v6 03/13] dt-bindings: mtd: ingenic: Use standard ecc-engine
 property
Date: Tue, 19 Mar 2019 15:53:53 +0100
Message-Id: <20190319145403.31627-4-paul@crapouillou.net>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_075413_257675_CBC499DB 
X-CRM114-Status: UNSURE (   8.84  )
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

The 'ingenic,bch-controller' property is now deprecated and the
'ecc-engine' property should be used instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v5: New patch
    
    v6: No change

 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index 5a45cc54f46d..c02259353327 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -14,7 +14,7 @@ Required NAND controller device properties:
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
 Optional NAND controller device properties:
-- ingenic,bch-controller: To make use of the hardware ECC controller, this
+- ecc-engine: To make use of the hardware ECC controller, this
   property must contain a phandle for the ECC controller node. The required
   properties for this node are described below. If this is not specified,
   software ECC will be used instead.
@@ -48,7 +48,7 @@ nemc: nemc@13410000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		ingenic,bch-controller = <&bch>;
+		ecc-engine = <&bch>;
 
 		nand@1 {
 			reg = <1>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
