Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B192EC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:54:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75FB12175B
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 14:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N+9Nnz6c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="LH2QGlxl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75FB12175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Io6a20PMAkbINSbWxpXd4iyfB5wETQ3qawCJYqTrUOc=; b=N+9Nnz6cH4r+/q9GHWNeB14112
	NttEKOKoOZZ0f81xv7nmkxgkNYtxEPRxyiWT797KO7/LfiUIreI5/1z9QWCDOFSz9HD7Xc71y7xDh
	z8BUdwmATMQhbeJLcvUGDs8i4J9GHyc28qUpIHN5BlKD5XjXyaHOlnzG6V9nC9jUYK56hJO3disgm
	fvy1H/M+Hk/AVVcgYsTlu9FLihd8xu4bD3+TxMWcyD3o+dREIZq6Z7LtomHKtJxk4rSDunAwk/q2f
	fj89XKjuQ+1AY+cv/AIHkZnTWDiEz4G+mbaLTIzaILRSDdrL17kFdZQa8AVfn7ZyOBaf1NX8Pmwj7
	z4CSMqyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6G8R-0008Bt-4F; Tue, 19 Mar 2019 14:54:35 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6G84-0007gC-P8
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 14:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1553007249; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=AFMmtOPkINv1KPuFSEKxXaoY2Y1Bl80fng8JRV1Eq9c=;
 b=LH2QGlxlWCxLqS//wxfcpQXlA8RTJFSZemXobTApH8wpmL4epG6dyi4SOxmTvsClOcBDwe
 y2WSu7sRAbF2YtHB3UbAqWHTs5AUx8zzp2LT37IWqrHrlbnNMKdgkJSrtccn3G/H5SFNSN
 UIY37rnb0SoRsYUhNAdj7pdHh9Akr8w=
From: Paul Cercueil <paul@crapouillou.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH v6 01/13] dt-bindings: mtd: ingenic: Add compatible strings
 for JZ4740 and JZ4725B
Date: Tue, 19 Mar 2019 15:53:51 +0100
Message-Id: <20190319145403.31627-2-paul@crapouillou.net>
In-Reply-To: <20190319145403.31627-1-paul@crapouillou.net>
References: <20190319145403.31627-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_075413_007237_69E93B1F 
X-CRM114-Status: UNSURE (   9.60  )
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

Add compatible strings to probe the jz4780-nand and jz4780-bch drivers
from devicetree on the JZ4725B and JZ4740 SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    v2: - Change 'ingenic,jz4725b-nand' compatible string to
          'ingenic,jz4740-nand' to reflect driver change
        - Add 'ingenic,jz4740-bch' compatible string
        - Document 'ingenic,oob-layout' property
    
    v3: - Removed 'ingenic,oob-layout' property
        - Update compatible strings to what the driver supports
    
    v4: No change
    
    v5: No change
    
    v6: No change

 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
index 29ea5853ca91..a5b940f18bf6 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -6,7 +6,10 @@ memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
 be children of the NEMC node.
 
 Required NAND controller device properties:
-- compatible: Should be set to "ingenic,jz4780-nand".
+- compatible: Should be one of:
+  * ingenic,jz4740-nand
+  * ingenic,jz4725b-nand
+  * ingenic,jz4780-nand
 - reg: For each bank with a NAND chip attached, should specify a bank number,
   an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
 
@@ -72,7 +75,10 @@ NAND devices. The following is a description of the device properties for a
 BCH controller.
 
 Required BCH properties:
-- compatible: Should be set to "ingenic,jz4780-bch".
+- compatible: Should be one of:
+  * ingenic,jz4740-ecc
+  * ingenic,jz4725b-bch
+  * ingenic,jz4780-bch
 - reg: Should specify the BCH controller registers location and length.
 - clocks: Clock for the BCH controller.
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
