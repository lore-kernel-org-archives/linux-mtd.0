Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B99606C0DF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DNYlEJkR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQoldPsS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ml+4YDHp2hTUuPvYFaJmkbFYWmKn/EUTqdW9I4YfFic=; b=DNYlEJkRVJM69oP0ME9gxMX7sC
	QOPBwHfVHXxMyffpJcTp4jmXQTPyqBUcnv3uGPubgyV6lllW6F5J1bKRO6uBslM0051mbxthXwXCl
	yRA2xdCUNgDN4sL2iY/uqL3vMscHwOqH1wC6uI/WCFJ/1pDpCbQJGPRHdiv4CbeplbxPLr45oV+2h
	duN3zaYe7ErYBIqO29ER0JeyGEMOPDWijjT/nldOS+qSW+7HHwpHo3pJ7tOV3RKJkCVsZ/rb6paTz
	qqKNsexQ9SPcEw/3oE3hAAzH/1fhu+v6lvJmZiE6RwDfP3u0jqdwdCgbaurFhjZxP4D7uw86iD0xe
	LgFE2lKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoR-0000000Dr8W-0TVV;
	Fri, 13 Nov 2026 18:15:47 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoC-0000000DqjK-22oq
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:38 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-716d052dc23so490690eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593731; x=1795198531; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=ZQoldPsS6TNCy9v7XZ9H4XBSe+GCg285To3xW0sGYsWbzFWn2dvX9Lu/XaZQCaylAM
         sSU2fBjZURuSsCzvZXHNPVgFoSiId4MfkVpCZl3VA9LzMGE3VHPjT8kshJQznBw2fQq8
         6ktRZqPJiMJhEtTD3pi4sE0yfCLDv2W7hJMFAirYEBf4FajGh6KFx5GJh6RUhNy6+HiG
         RA4hN4KBgpfD8cj+mkhhQ71ktxNBJap/VIuKMdVdmVvh2OSqT7iacXn1vubkmKnGjK4C
         J2IRwODD0jWml1dLdmvaWLhkWMtQ6anIGFglG5v5kYS8hE+3g7R/24q+kgcKK8ES26wX
         RmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593731; x=1795198531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpvaBkXowcKJNbTZUWOnZy485cqImxbSHRthpUHU0/M=;
        b=vOGChmuqZkkfDKix4FlvY4MTzPRPc8vXNEuIs/x/7GERtmE0CNQ3nftBtG2DmzEl27
         froLiM9dlSJvlh9wafiYESqTce1TZuqdWw8pdoizxVJrM7vaYFpE5hFcfPY1k4QfMANB
         3UmHwXAMLTWPGZRr1B1W1xco6S0AiQwPfOqozV4cULjgsGn6hZKVvZZSluSL7z4XQjHU
         rgc5kQDh7mZ5e4Moa4A8v9HY9zqBe1e3xSRC6eztUtm1L/aAHnt3CRhUBmLckMEufYHk
         LSZnTJydO0b6/wRrXGWny15Y2cnu/2YogahsSbdZ5nyd2npCmcKTNN93k3JQ+Qbffgzz
         01SA==
X-Gm-Message-State: APuU4Z9QJTZEc2GkB/prnBZJK08AIT48DTzqtqoW38Kr7R75IsQaiGhB
	UM5UqqEHhtFkcepXU10vI2MyJogZT+6G9XxOaW8sR0aLGhXUyCFJ2eE+
X-Gm-Gg: AYBFou1yPPIXBPhDkUb523vfV9ZMyhIPCjmyxdIMET8NMCDSHhwWMeqJ/K2dC6q7LLz
	wjrlWaoHBhY9UMQ1iElT/fi16kMprF1PWbhGLDJM3Ddb+IC8ujiYCGD2PDm7fFzxvC4cMGJOJOH
	lXjzmRM5qVikauC2PhYIiab7XlFHa3s3njvrBP/zOUlAI34VpJv8J2XphmMtXXhZR/PwNKBgQ4E
	9MySZGdoTEW2CpDN0/41stQiB/R1A+RJesWsbHPEIveNk5rcrA9qpF2FTW6bkx+hN4sdwUEHRgn
	GK+yR4RhCyFanETlAdxjd/XZoEK32BEMPF0dZF15GsyCEdg79+oXWM7b7vf0PjkL0rV+qMNTcF5
	zXjkY58qMjrOVVwFxQNLHBSe3y/yVnLwwC/XQgHHaKd8SzMKZkmi3v2rI7WkVB3xfs0Lcgvb/vl
	G7f0qh/GlEGKh14HtKWwMJyTLG4I/9wFSmwRpk0JgRNiGf4IyZOb9Z0hdE/BKwW2m0FPHyPeGPU
	81gcqsg7X9osr6seWd521QtqVBTmzg7gp0gaaXmHdlXMp4D6H2a72r6ToUMMtH2Cug5E71PLTXL
	T2QYRxttODr5Krc8kPtLJeVFS56mHrBp+pIrVBP5e27JQpQLa15aTmak5WUjzBASz9KeXgrIyPR
	ARsE2PyWdK01Ajn6HDe9MyMLl/uDH0ITZM6zRGdsJUJsd0ba2JvmhLQeZzm04bBYy54/MzaF6hl
	NuAZPyPrO4ooGabGlMI7wojfL3U+RueUo53nN7LJSYiml1pTSBTRJX/JnmckQd/G+pW7kA8B5I
X-Received: by 2002:a05:6820:1505:b0:6b9:8413:89b8 with SMTP id 006d021491bc7-71acc96e8a0mr413056eaf.57.1794593731545;
        Fri, 13 Nov 2026 10:15:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:29 -0700
Subject: [PATCH v4 13/58] mtd: rawnand: mxic: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-13-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101532_589550_4AEB2502 
X-CRM114-Status: GOOD (  14.70  )
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
