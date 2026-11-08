Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B2606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xNF4Wsjt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgIUDfbe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GsRhJaedIh4tKkPpHczqGwOMVmGQhlPd2AWSZsGVPsY=; b=xNF4WsjtEm+B/e3xn1qSs/CfYX
	dpG2xEDq/e+z9MNShFVO9BbU0EAOkEg3HujZGj66wOTpVIpsOlFb+vaQegeihyC72pGMGtUjXDz0l
	9XCtMBKtt8SnDHBmlu13vQUBM4Lv2rzD5t5q9TP//BmBWJBGA/6CxQ+MXrR3j3heD2fK5oZgndlA9
	M173E5L5+nQWNGp8B84mOqWLwbzsZSVtY3LiENvd1KlvaFDBXgH09EqW3nwsNLjL4o6SUzHebuLfP
	9fcF+JlHSNeFrogUe8G9ZeuE9k7HzdLKGPwENJO1QTA5bxInHChRnSVbWGfCKaVx58jc+uxFHU3QC
	fqEYKsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA6z-0000000Gg2b-0aXh;
	Sun, 08 Nov 2026 21:07:37 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA6w-0000000Gg0e-3sta
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:07:36 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-84e513877a3so218444a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172054; x=1794776854; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=;
        b=dgIUDfbeBlHdoBauZG0phyRd8iCa+Hv9AfROxyz9nTtxn4j4W9jd9RczTKc1YIleQc
         t+BJnrh9IZ6DPqfdgh77U6jRAVahZi7mF1CjVLm/xce8g+lFTKy75ab9NdXjpkxSLMiq
         edc2QxLixApagZoQo1CVR/ir/S67QTSLyhcu4LQ6VvOn51gHIe62ql5F79QYST5PLNWy
         YkvnzyDb6EzVrd03Vv3UZUSdNw/HNHrOQVaDTWg/YXxHxy3TP9QL0zby2I9MNwxRQxXj
         VN8Nk/8eB05bXJ4mIgp/NLmrjwfiW5PiKoyhonZ3SF5rfaqsUPg9cVmZIGsJ9GQ57H+B
         A0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172054; x=1794776854;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EEsTvDHWsy6BHKFJlVpg36WKPFu4YHw4KdAe6UCxLUM=;
        b=HcioE2sxIOWeHb7hxKrDltmb0D8MZ7LjiC+DSRrklkwFTue8zeNi4TXU8H18uT5cBJ
         fTideaR/FNPU962R+fJLDy3JMQqaiPieqbaiqgLKZUA+iuNJVg/K1I9XxgVXH8q8WpD8
         ujDfrHPZZoym9Ki6L0pNKoT7lvqKTiyv/fonaJpJwXyCtrtgmb7DGeDCJHSTAXcAk/0n
         0u777TGhJAojmw9Bj6a0LB4nOZeb0FGXjRzZJ5Gyv+EVQzpHyaYkSfv6Luno5/aUT4mq
         CYHo9HJsGglE8Q2cxLGxMUqIDwRp8rrmSz/vKafpkuZ4e/oB1k5fwwXRX9t89CWS0m5c
         b+MA==
X-Gm-Message-State: APuU4Z/PUC5PMKDKr9jsWhh6i8BfBpJiD35U6ormQzGenzabfW1yah+d
	w4Ysat3q9UJIq5vQ32xZvpxoz2AkD2gzINP4ZNv1LvDGATVOHrc16Uyj
X-Gm-Gg: AYBFou2ejH0iyLOZ6rFMBRs+py8uAKuy7zT60KugNmLpdf6Hn9b6BUnKwuibs9a8u64
	M5OHhcmfLxqSpkMXqnxBr+xeM0bQ6RtwjkmdhL7DvVsaZmoNoPESFapUjubWMbKVXF6+3E0fbWc
	liJZ6AARF9KPU/4JoB72UtQlNHnSxu850rQHUra7cWutzCUcH1gB60RUyS+L6LP/Bk+pkkRcaPY
	DXSYfdOWdAhL+EvPcCm0ovCzwVDGPdRslnWK/nkxYNuJxsq9dROHpQ6Xpx36UmB9EwhU0ICdR34
	Qw/6l6P70jTdSOCQyG9Eli8b3bOVq5QBtKfuBInoOGNVtI+RNlUeeGRKh1N1lcfsAOrufPm4lSV
	R2+yYk/w+mg9FGNU6mxfBN1OK18iswQIwVu2TIKaGVvOWADap31tFTbaLgfB5ocifUi+gkHC3Bs
	lVrR5uhvrTS/Eem8NPT7F3BlqDec6SXqbcTHwYf19JsPuR2Z0aTaAGWRVJ52Ckk14mhbX/sKpf0
	A3PuYuCMY73dBY9+lmQF1TIrWdmsmGL/5ZoR60DJPEw2tPNI7Fg8OO+cl+C/SI+7JmXX78YQ/yM
	/P68CfAjx41JKh8UgwHJE0K3mR32Apy77GuI6lH/kHL8cHyDvfDlI38R25IbHQ1tPGpjDx0Hhec
	lnIiypu+3fg1dg9rjkb3HiR/8Wvp7odAVWhx5qN/DUiNycCTxH/FzixasLzkFoXCSR5S5g9eUVz
	RQuSXh7//mz4mnmqHt0LvUoFle0l0rzO+Ydw0AOJO4j4re2M1GUHSW
X-Received: by 2002:a05:6830:82f4:b0:85c:e511:ee04 with SMTP id 46e09a7af769-85f34abf688mr2547935a34.16.1794172053785;
        Sun, 08 Nov 2026 13:07:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb2b331sm2147379a34.10.2026.11.08.13.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:07:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:07:31 -0700
Subject: [PATCH] mtd: rawnand: atmel: release the NFC IRQ before controller
 cleanup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-atmel-nand-irq-teardown-v1-v1-1-341643c83ee3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3Q6CMAyG4VshPbZhm4mot2I82E+RGim6TSQh3
 LubHr5fmqcrJIpMCc7NCpFmTjxJCb1rwA9WboQcSoNR5qC16jC93cgZbR7pgWIlIMcXZrIxTB/
 BWWN/UmavOq+PwUFxnpF6Xn4/Ltd/F+ROPle4XjibCF204oc6jTm0VW6Flgzb9gWEzj8YpQAAA
 A==
X-Change-ID: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130734_970600_EC76FAD2 
X-CRM114-Status: GOOD (  11.14  )
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

The NFC interrupt is shared and devm-managed. Controller removal disables
the clock used by the legacy binding before devres releases the handler.
An interrupt from another device on the shared line can therefore make
atmel_nfc_interrupt() read the NFC status with its clock disabled.

Release and drain the handler before freeing the controller resources.
Track successful IRQ registration because probe also uses this cleanup
path when requesting the IRQ itself fails.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0bdbcbb50d94..9a724de67624 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -263,6 +263,7 @@ struct atmel_hsmc_nand_controller {
 	struct completion complete;
 	u32 cfg;
 	int irq;
+	bool irq_requested;
 
 	/* Only used when instantiating from legacy DT bindings. */
 	struct clk *clk;
@@ -2334,6 +2335,9 @@ atmel_hsmc_nand_controller_remove(struct atmel_nand_controller *nc)
 	regmap_write(hsmc_nc->base.smc, ATMEL_HSMC_NFC_CTRL,
 		     ATMEL_HSMC_NFC_CTRL_DIS);
 
+	if (hsmc_nc->irq_requested)
+		devm_free_irq(nc->dev, hsmc_nc->irq, hsmc_nc);
+
 	if (hsmc_nc->sram.pool)
 		gen_pool_free(hsmc_nc->sram.pool,
 			      (unsigned long)hsmc_nc->sram.virt,
@@ -2383,6 +2387,8 @@ static int atmel_hsmc_nand_controller_probe(struct platform_device *pdev,
 		goto err;
 	}
 
+	nc->irq_requested = true;
+
 	/* Initial NFC configuration. */
 	regmap_write(nc->base.smc, ATMEL_HSMC_NFC_CFG,
 		     ATMEL_HSMC_NFC_CFG_DTO_MAX);

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-atmel-nand-irq-teardown-v1-f902307c18db

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
