Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028B0606DF51
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uaFJyFKu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=swgS4YHo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vWWkJ5mRfHwt6TlOgiF0w36b/i0FOaNLdCEErzcltAA=; b=uaFJyFKuBxCZ4pjvjfIRZsXh9L
	O8EMQFdY/kbXOp3tZpi3N/YwIXsJL6w+K2KowwEf05es4sXdH42viPZ8ro7O62qIOU/zn0ZNzzyky
	Sh11kIIER4aU7/o93t3fEJYxpgD1eA2/wKOwkRaKDSJKIl6ekyfw/ijVfgnARaTwt+fVg2787hdX5
	aKJovq7I5ITMsUvto8mGYW0i/DIPB7wVAM/GlCaAnQJ0LLSRr+Y/uOb9nsOCq7MtwEw/9MIsKiEdb
	H1FUKl8JEewlFBU13ZySXloDzfISgwv3Wn7lZZSNQlkCVGjGw+H509Pp2x9at2+DY4ZiLohBaSjsp
	OejosgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX4-00000002wHX-2L4R;
	Tue, 10 Nov 2026 07:44:42 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWy-00000002w3P-17hq
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:40 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-567cb8f983bso808155b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296675; x=1794901475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYvGWnQTx9nbWejmcA7tm6oPyaxtb4Fa0G1aGGB1q2Y=;
        b=swgS4YHomw0LKIPZM0CUoA2BOk20m8W8lDDEsW8fCvMynqgSIoI04DmkYIE9L2MauK
         XiBkjHnMK9qaYSGZAcYgBDPtgvV2lRFusNeTb/WsnjopLkdZUvPcF0nv4K7FF0Fe/NlB
         Yb/HA8epWHuhpfq6ZTQHSlMo0p9J0riuBAA2Jyqr8Up09s/G+2dzjUvCi32wzvk/ibkI
         24WUJBEzRb97OJBNzRxiNGM4s0T+yidBsOnA5cYKcjRLUl8EywJ/yEUuFNe21U8Xdr8B
         kdzZaloVc+xV06zM0ltWkDjhGbuCj8vssiK+W6vYHb0gPz/ze6hfGNOfdOR7vc9nd764
         GDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296675; x=1794901475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYvGWnQTx9nbWejmcA7tm6oPyaxtb4Fa0G1aGGB1q2Y=;
        b=ngs7LRNRy06g7g/0H5i15ZckHwDU5lfENtD8ppVsSIPQyBq8VLCjoT1wjnCtL/KPaX
         OF9+8N2jpPuXVllHqjEIT/qVCH8EKhKklsmKPOQurskawPZFo0f42hrKCx0cJXl5QYiC
         PUJj4xiIqOG7wdD5/Tv0eHYI3SEks27W3JHSRPT9hNA1WRJT3WWVp81EUVVX2dHkjG80
         1lg0NULvSzM7SyiCeUKll5JTlxsx94jKpCl9JH161s5HFRj9Zd6YJZ+wOLeN5rV6pDxz
         hBp566Vk2poLgo3x51N3PzsdCqumMfxB43NoJexNZtJAqJHtA9KmocZtDUGXFPyaUCvt
         jN3w==
X-Gm-Message-State: APuU4Z9rdpMHMg9taG7vbU0u+ai4Rf8TlnrdBNxMvZpCMu+Y3zEZu/uM
	/MeXAQmv8lWyXmTikrlI+6GQ4k0f8WljCg2nSqGfaIgJ79dQy/Ac5EZU
X-Gm-Gg: AYBFou1nJKStvQ40OH5l9Qou1DAdnW43qKxORMoQ0YpC+ZNIPqLyY1haVkFfviXRfMg
	Jwqbz06hKslb5h7jA1ZKpg17ydQ0SN1HIIV3+RpUIp5Qxlk/B3U96XT9FQ8BrVbevOlKrIjUMRZ
	wm1Vbl6We4+xHM30pRRsB35OTKuITHngBr6ZnU7BxCcJWmmW6eywo+gPKYbtwY57IOU5exEQDRq
	clLM5YKHHHomsxpDKjclVr8k9dSWRt1CDx9qBtRKAjZ/QPRGQX7iVzOHv4MlWDZxVpCiOzJWgEE
	zlLLOavnxS7eATel8gQSfFM3sT7FRVYvDDSfvqOJNDgY73fYdUXAJhu0NGNbCTURPA8M8wktIZA
	GCfnVR7Lq22CUFX0OvmyYKQQ/5h4WBnfPfUnqfIIvA+Daxv5PskdJm1PRlSEh70MBVX5imkQsmi
	Gw4euPu0xEwW8NvWPilvwEdLA6EOnf9kCcMk0y7k1Us87B4A6GM/0T1po/q0uhuaF5T0lpxt4oZ
	+fgC4sccapMn0+VRKAnQx3WRZkus82W61xIg834OMO9HbL98EyClowNtx5k13whOc9inJooGtmz
	XS95j0MsR0m9LooMhSCOaGF76RLQY4c5R/7cY5MfWYhQIGeJnjLaJYyagbN9muROXrXtRYIDLgE
	JcF7c1tz/U9wNGteZnaJasVw92BKF77sAA41UK9+jzHqYZ9PQr9/9YdTGbDHbjPP54NTEiBuk7J
	E0chMobc7y7OtIl8jzAlwHFHe54aduRBsOMiMmIiYyZCDUXm1BijHj
X-Received: by 2002:a05:6808:1524:b0:4c3:4e34:c69e with SMTP id 5614622812f47-5683c9eae0bmr1259810b6e.8.1794296675364;
        Mon, 09 Nov 2026 23:44:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:16 -0700
Subject: [PATCH v2 13/58] mtd: rawnand: mxic: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-13-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Mason Yang <masonccyang@mxic.com.tw>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234436_433572_8E70390A 
X-CRM114-Status: GOOD (  15.53  )
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
unbind. Disconnect NAND operations before disabling clocks and defer
NAND metadata and controller storage cleanup until the final MTD
reference.

Release scanned NAND metadata on registration failure as well, using
retained ownership once publication has been attempted.

Fixes: 738b0ca55f4f ("mtd: rawnand: Add Macronix raw NAND controller driver")
Cc: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxic_nand.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 92de26697359..0d20e6ba76a2 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internals.h"
 
@@ -483,6 +484,11 @@ static const struct nand_controller_ops mxic_nand_controller_ops = {
 	.setup_interface = mxic_nfc_setup_interface,
 };
 
+static void mxic_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxic_nand_ctlr, controller));
+}
+
 static int mxic_nfc_probe(struct platform_device *pdev)
 {
 	struct device_node *nand_np, *np = pdev->dev.of_node;
@@ -492,10 +498,12 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	int err;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct mxic_nand_ctlr),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &nfc->controller, mxic_nfc_release);
+	if (err)
+		return err;
 
 	nfc->ps_clk = devm_clk_get(&pdev->dev, "ps");
 	if (IS_ERR(nfc->ps_clk))
@@ -523,7 +531,6 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	nand_chip->priv = nfc;
 	nfc->dev = &pdev->dev;
 	nfc->controller.ops = &mxic_nand_controller_ops;
-	nand_controller_init(&nfc->controller);
 	nand_chip->controller = &nfc->controller;
 
 	irq = platform_get_irq(pdev, 0);
@@ -541,9 +548,17 @@ static int mxic_nfc_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	err = nand_set_release(nand_chip, NULL);
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
@@ -561,9 +576,10 @@ static void mxic_nfc_remove(struct platform_device *pdev)
 
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
