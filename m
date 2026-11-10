Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82DE606DF43
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A2nKipID;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptUfG6aO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vsKXLA3oadyjaCSYrZkzqDiSdiUm85t9p+me4P+YGbs=; b=A2nKipID3EoKMs9MVGohO4h5MC
	pb8yp+xz6qSu4b/+ienR7qkATotfb9rpYLXfmOrlOVzKqLmwQUDej8B+vkf8QuyQhCRAVtKPE1wel
	alg6DiyzaHA/gZunb9455/k4PXNKN5s9NPztlXrqCasItpZPh3tQuN4xUUkzFIn8PpbvONdJOtDIE
	gNMJ9ljN4omANajP3BbtQC/ysqM1/lI+PW+zxBTImShbh8Phu5z6sq7gJawMEgPJfJl256A2omVVh
	sib1rI0IlWoNq94XxTALzbxf+nfWxuSmcSnHItJGr6HZphcMmWLsV34ZNVWspU4NZ9ntEYPCFaopn
	K5B28uXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX3-00000002wFF-1ccQ;
	Tue, 10 Nov 2026 07:44:41 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWu-00000002vuK-3Trd
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:34 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-823b938464fso1199758a34.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296672; x=1794901472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=;
        b=ptUfG6aO3GDgLw6EwLy6JbL671V1ZG0AFp9OjXqhXCaKTRLsan45yfx4fO0C/TtQm1
         GBSt1Y4guMk+/dBgAVnEbfYr7DZlKnM0+IU7i/UXXNzi4nyiuHKj1R8tkGfW1kEcx/o1
         IvopA3RWdri+snZsrs5uyO/CzXhwe1vjHegeOq+OOZtj8NppSbMbhXJao803kclevfZ0
         hhHiptltfkaPWcwLCV3LyYrMKjc8Cl56uQ/J5zYRoG7DC2VMpGMX7VgF+qdoJALgBOnp
         2ODn52c/rs2IyjLw8EzGdLpwaI0JBpKRTXgyAN7mkG8EwfXm8t1pFpWQPKZ0995UJcS6
         L/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296672; x=1794901472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaUjU6rZJ1LzqNl1x0+DJrNeQht0mR0DpJgGLhNES4Y=;
        b=xu1xAXPV6kIamO6zpMaJqS/UgWD1EKMAsMqU/hVzod68xF34a3JFhZpsm0OyKwwIGq
         EC71AtgmVH+8th7tUJwTbX4d8lpw1gTvO+Dg2rClKW3LPMe8wEjY39js3Qtodr5XrAJD
         bBNNqQfcf4N7GxKMi9Y6reqtWAt7VyOvAfgSbaZsykCyFuaFfYj9UZA4/fmHbVxLg46e
         eL5JuZod5nK6pH6IwOfb++byLKo7HKotT0gas9Fw4026eQ8vVgjxmh8QuBGJJ3HZLM3Q
         v7Qhs7McMEJjOmyjTiUlbNk0dpn3+KyzX8w1nR+fOV87bQwbp7ILtYvXlCvOIka2qIY/
         GMYA==
X-Gm-Message-State: APuU4Z9JmnsFJbulpab69LFPMKRfZSilUqBQkTa3L6Cta9ZTLOlem0RN
	/DRqlv3bPcshZZWWact8uO/VbsbDHUOC0FMbnVTCjo0YHWa1/U7+b9K+
X-Gm-Gg: AYBFou2aDoHn47QWIvzKg9tYGaj3FJNY8E0ViTLjs/6BdYTECWSC2omHaJy5E6co5l+
	IU4x0Egqe5pKadK0ohKDMSGwHumtQS0sHeawjKfGxflcFLtUWWlaghrXPgUxGks98Ee/fwRlufX
	pt1PKOEtHiMp4Kkhq+5lVxFCOLIhwA9vVhn2y1j8Q8FqVt42uCxQUNXKfmvNZ3EcG21RyED1JrN
	/9goSpMZAGMr2l7+4KOZAOLHZYYUYHSxZF4AsUS3Fj/GPln2SGbVlOnCWEohGEQaLMcZx3BZwAP
	QKvPRJoLR1S6knWSciGtjN9NvfNXoEJTJdmG6wXi4cYpeJzVWEjcj1Uj/Fffl0+OUgzwJdxVG7T
	bzMwq8wiFHpC0fGYzdKsnrVZGMt7Ro09eQv4LoiqCKAHamExQJrCgwgIgRxDtPJNKjvNAJdZDAG
	Fbedg9QbvkPkcWaEb8+dJBUWVBOzUfU+nEAjEGbJs6tgZMGeN6SuF/X70h7S7/qz9OmLBEDZkb3
	z8jhx/I4lT18nTK0x1+246PsJygQx2XRTK2fBR/7fqqiSZXiQxZw4BvmUewirGTtg70oJYSQIIf
	ywiCMMKSreRvyc/YJhOOkBGbi11fqdIDvfJbTFpv2IZllGBYB4pMuwd1Z2ztQAKo1/M3oxnwPvi
	04Bi8BAKpgX/qE3H2+kLBQYzujWI1KBPYpx1zOkAz2mcG2fGTc5KYmlIwfg27DogKIgb+HmXhAk
	hicrUOGPRND/mlPASOmHN7m1rSq65PXuNjqh6OkOSovjEd8nU6Xak=
X-Received: by 2002:a05:6808:192a:b0:568:3866:d1c8 with SMTP id 5614622812f47-5683cd1afa7mr1399971b6e.42.1794296671626;
        Mon, 09 Nov 2026 23:44:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:13 -0700
Subject: [PATCH v2 10/58] mtd: rawnand: stm32_fmc2: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-10-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234433_496946_7594BDC9 
X-CRM114-Status: GOOD (  15.95  )
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
defer NAND metadata cleanup and controller storage release until the
final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christophe Kerello <christophe.kerello@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
