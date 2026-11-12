Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E49606E102
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wdSI+f9s;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nJpYGnVb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ml+4YDHp2hTUuPvYFaJmkbFYWmKn/EUTqdW9I4YfFic=; b=wdSI+f9sO2uD3ykcM5RsWZQeQu
	M+qdAheBb9pSyihYFAdcd2iQN58jCionbwUt31M3OOFZJbCqg932G0IXo7CYqOJkuMD8A1geDUWrJ
	yEUoUaI8fqyScK0dIpZQv7FcfW9XAbKZ7s80Ic+sjrSpwxAnyFCs+SDhK6KyJ7jiILSPnV/l3Pe4Q
	vRGTimmry/QBrlmq0+cQrfJ3f59weLWKnkcQgAEP8bJfJUlmtj9KWNv7Y7cunzOFNMmax3tSvPJsa
	Sjcyj88oNDRKY6CqEpLPdBrHK5o1rKt308OdijFvr2LO5/d7LNEGREMj7o67Oc89VuB25sRJFadSV
	gak1QGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcS-00000008LbP-0XsC;
	Thu, 12 Nov 2026 01:28:52 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcJ-00000008LJk-23tc
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:44 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-4f488ba6e90so1406965b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446923; x=1795051723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=nJpYGnVb49JfjiCMldU2BjdA/PKh42PBpLr/u3bZHOsYUvSnPlrdes3FzfTkxt4duQ
         LfFKK3nDNNg6Lx+ZE1L6IAL43zXOddnN7LOfV9DiQHoJCbAqd74AzA3/B8sdMRK6Z2im
         ZCe9j9ROcm59L7efp5g4TeAxeaA02NCDDwb28TRBQclwX6CFbhuWXPosZ9vKxniMBwkb
         xHGYuc5Uj8b/fZWeduAbtKY9i1Hs1z42nHQdMeSdNS7KLg+AOeB4JgMpygHANHhL6k4L
         xuPXMhdAGqa4YOqpXD0TDchOSSB3E7E+wXWcNgLKSnO/bOUxcV0vRPhP6uqhn7Tf6IyD
         Y1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446923; x=1795051723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=wIYPVY/976x0M3sLMDhprXWVybI4cB0nNdC1sQasrDBYvN8wmccas+DJ0XV0teceIr
         7Kx0XM1foKlTFdbzO4x5mRcc6xjQAZ5EboUzl3H7Yvmgl6y6OCklNE3FCrOzmbG9eW72
         prfMxclt7gRUHXuLeoS7RMTeSTsCMEGCpmBF41tQrWrRZ8jRuearpVa11OJGyDfyJxWK
         Z5slIFXqQqyuAPofpTGECEzDJF6sK8MKTHlMHlq2kOU+l+WmhOb6nwgi5y+RMnWBf50g
         eonyMPBndcLUOMfEFNXzeQ0ffqbw5wjcgccTUVbNW/6l+MebYLFWsRCVS6772kIJ/v3h
         Cx/g==
X-Gm-Message-State: APuU4Z+qZD+9cyVhQ1xzDh1ijDHcTo+qZQ11wPd9EYcLglbBzvTjDkZP
	iI417J+DxpZoOvj9C2k9SuaXpgv0VhLFkNKIq98X20C6DW2ev/smzNBx
X-Gm-Gg: AYBFou32zuOGjl06EvzOny+0a+2PzY2q0JTlEbainqeS+OHkyaDxVYm4Ebu9fv/JjPB
	i5EcgCh8jDCwdudW9aq7/8ciQGPPpafyFR8OS37uX9iX2dOqDz5W5o74fHnLDlPb4Wa3yhtrpvq
	iEpyc5J7qsfx542SFMje0/KzDcKZz4c7JjrU65VTpKCNdyEWsuRtnNFk0JmKerDGU4FyfXMuNDX
	MdeeOx76VrDAZM4hEafqbYTQgRjOE06EGDJ2tl+JKtNqVyHUgLNpimL0NvdRZH3n15WCMMdIxBd
	VSSGNs7f4HWMOpaNBvHxmTlEh+nMJPS+vvwPdP9oNu1Vb/1II7glTrc46O2hOXWx/aahPVtNyXO
	L0ExQoE3IO5w20CRRv4zOSJuLf0RTAwGD+pLrCzJUy5EoUy1woSmL+I8Kb+6cbS0V518FV4eDPW
	zeguv76ed/E+mzOxRLBF/UKZr578pdljQffWWog73AXJXMlgIyZFHEjdAgicHzajC/rnrGinA3p
	RjXaP1PkmMgWZH1RyY6LCZ9meQcIJRjDxgp8tIoKC7LTY3ZtdV5mOUF6rOOTZDoIdPKbnHovfq6
	SpImF7u4D9XNFG9mOuzj/9uKtOxQ9AG3H7QWHCtnASfyHeyK9boaVgE6S6k8zxSfAwoFd5Ee5AG
	jJCk1t6omNUSQZ+MxOpL6l7z4HgG/vJqDEZ1w05Ot9NLSnwsl5sxx1Pf7Cmwpgxcz6BDbZVSAGo
	CqPs5zt8UOq5gy89seooifejh+q/LBVLANVE7UHqd3Me3kMQ74aleh
X-Received: by 2002:a05:6808:30a5:b0:4b9:a88b:888b with SMTP id 5614622812f47-56b96ad0a30mr4058270b6e.33.1794446922686;
        Wed, 11 Nov 2026 17:28:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:52 -0700
Subject: [PATCH v3 13/58] mtd: rawnand: mxic: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-13-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172843_596980_05B6ED53 
X-CRM114-Status: GOOD (  15.30  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A retained MTD handle must not access controller storage freed by
unbind. Disconnect and clean up NAND operations before disabling clocks.
Retain the copied layout and controller storage until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Cc: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index ce9fe27fb4ac..9b666a2c0a8d 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -492,10 +493,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, nfc);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +526,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +543,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_lifetime(nand_chip, NULL);
+	if (err) {
+		nand_cleanup(nand_chip);
+		goto fail;
+	}
 	err = mtd_device_register(mtd, NULL, 0);
-	if (err)
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
 		goto fail;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 	return 0;
@@ -561,9 +571,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	mxic_nfc_clk_disable(nfc);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id mxic_nfc_of_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
