Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386F606DF51
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N/TymXML;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BgqM75pC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=om3KGECN1Rvo8Ih040T3XtT7A3iye6vrxku49ZrlNTU=; b=N/TymXMLd4kxCCngJhG0XGEPjk
	SiYGclrEdcGqEbFHolt2RlJpnr3X0FTjikqYM1TgaDhFcixtUQPO22+KXkcQ+D0+YWP2Tm2kLQ9MG
	3pl1KXkZhSGxYFqKi/au8YFanraGdb5ABmiJD74SgyUOCx7uNi9FYYBeRMlEKAS3xjZtBrg9L2TMG
	JCD38kasdPFYCr32K8y7K1O06zvSeVzIV9k+1fpON6AuMonvyafbGAQRZ690pd68t/3jMTFFzfqZF
	PPxPPwSMQzL8B5K0VicIca6S6qwqL8BeUVKminmGDWoQjhV7Qflh5r5S5nbqSprAGjq1ovLWSCBwe
	byz6BWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX4-00000002wGM-03yE;
	Tue, 10 Nov 2026 07:44:42 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWw-00000002vyb-2K5F
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:36 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-4a77761ff8aso1047196fac.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296674; x=1794901474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdQo3wXxFHmeo7xPvpCJxlweZL30baHWhmpYu6iwYLU=;
        b=BgqM75pCCYbHS8YxXdICDjnEUrOLPjaHza08UdyrVq9RFXAmu6Sj1O/gag4pv3MDgR
         t3QMmUNbbT+U91OtjFmeb7IFXckUJwePXCsauGMJhQBPhk+rjyEALtYpqi5ZOi2jSRDQ
         esjb4OYlQC5nOgzjr/u8IiVBq8815F4rhMlcrdRfMfjM6orUG1mo6DuTDKzUOjXr+u9l
         Y7OIQasdeb9Tkkpu+zTcbxaSnhO2nLvkM3bsv14OjwcCey9QqoBk0L0I8tYFBHduu0Fy
         SXlTB1itihKGHDPH7qGxve+mk6oyBmE3B6p0lhsFD8CIlYNNtY61//4/JFlimxiLwE+U
         XOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296674; x=1794901474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdQo3wXxFHmeo7xPvpCJxlweZL30baHWhmpYu6iwYLU=;
        b=RrdHAAvje155uAv3UcLMntn5uIF1Bkv85sboeLI0OkeJU7Ny/nyTAzUf6I46TxEoQ7
         Pt54RsQ05k9wyQ4Aa57EGYEkSIyUoW2UTbWjyV7ExckXGwASPsEY/kOhj760nVN6hay9
         1Ckk9IbDf5durLURqHaQNf66WBNzEvRJm9AusH4e8hWfpcVWOiXo+n2s5GJ79PmJkgW6
         /U435JIqRPfXBEZLWPFcGp/XU8kELBqmxmTgkC8fXD5mOzl9KnIF2wCuOcblJ5lPruIw
         a4UXQW/eoujH5bkjoXSrVtYOZKxTsn9BWja9aFujh4fHP/FxbkViRRSQjda4oFXjM6Gn
         N0pg==
X-Gm-Message-State: APuU4Z/XbTosRRq7kuOx3zvo7evhGoR9gNJ5qyroYcdfhRKozNEcs6i+
	+aoa9t2Of9W7+dMaz0kAiJDGoABurPrpzPjecQjt4LXc9c6DHYSEgKOC3v0QIXJK
X-Gm-Gg: AYBFou1aytOL5oOfUusAmbP8KXyOp+w3ZXkKWUqCj8vPiWicF3W58BkK5MB70OrNB+L
	PT3PYC2MqrCpuMLE9IrxUFSxk9FSxWPcTFFQwVVqt/TX+KDTdsM3kV0clbL4oNttI4adbES2Uma
	Yl2DwdK7IxjKIBcRDRcBBU+TK+KViidHbwEspO3xMefuZ8l/k5lftFVPar9rswA3iK3dUTtGgti
	jTbzL7ZUWS1AEqRCjCYhhql/zb5kDyo2bO4Xoq5YlFK3M1aPvAdZSU7p49bTUaoguJ0b7ffI4a4
	eurt9yAD8KfgXCj+QAZqJciBGQqWaac6UASpZXWFxlMUNd7+v+IyCPZ4AS2CTlQqLZkwKkeVXEg
	W6WPSXvzvLWHgqCGhzyY/VNGUlwwya26CvXIssJD1BxZBO3wSOzF+qI0baEV07qxc7ZWoWaroKq
	2Iank17w35iW+DjAEdt3YVEjj55y9CZs101VXr4MYURhj0veW8GQVPe/1xWkz/SvQhGjebuWAQm
	rYtTi0xfWil/MMc8920fX42Rj80LN+P0bcZAn3GJHw6fbh++89QnsVuLuv66lyLk+MLEBYDTHcr
	9fWr9jNdJHdskVeGm5XGoXddOFrMiSaw8b+5hi36UU4EUn3+SdEFCrwu21yPfax5A2YqtuhX9BN
	gkS0hDV6knI0Mu6Z/08Pwmz0d2BfR4Uk//tr72Oq/65H7rIIaGt7eXHQN2VLAyszC3pwclvz0iW
	LVWn+1TlOCe5HWw1K8D3YrOJeieV3OF4q5+ioxnabg0hi9f8jH+yA=
X-Received: by 2002:a05:6808:c1ad:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5683cccbab8mr1414448b6e.36.1794296673663;
        Mon, 09 Nov 2026 23:44:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:15 -0700
Subject: [PATCH v2 12/58] mtd: rawnand: arasan: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-12-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234434_729139_F0A0EB94 
X-CRM114-Status: GOOD (  17.38  )
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

Keep chip metadata, BCH state and controller storage until the last MTD
reference is released. Unregister and disconnect the chips before
releasing chip-select GPIOs, so notifier I/O and active NAND operations
finish while the hardware is usable.

Free unpublished chip allocations directly and use retained cleanup
after MTD registration has been attempted.

Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 57 ++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 865754737f5f..57b5d6119b70 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1269,6 +1269,11 @@ static const struct nand_controller_ops anfc_ops = {
 	.detach_chip = anfc_detach_chip,
 };
 
+static void anfc_chip_release(struct nand_chip *chip)
+{
+	kfree(to_anand(chip));
+}
+
 static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 {
 	struct anand *anand;
@@ -1276,7 +1281,7 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	struct mtd_info *mtd;
 	int rb, ret, i;
 
-	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
+	anand = kzalloc_obj(*anand);
 	if (!anand)
 		return -ENOMEM;
 
@@ -1284,31 +1289,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	anand->ncs_idx = of_property_count_elems_of_size(np, "reg", sizeof(u32));
 	if (anand->ncs_idx <= 0 || anand->ncs_idx > nfc->ncs) {
 		dev_err(nfc->dev, "Invalid reg property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->cs_idx = devm_kcalloc(nfc->dev, anand->ncs_idx,
 				     sizeof(*anand->cs_idx), GFP_KERNEL);
-	if (!anand->cs_idx)
-		return -ENOMEM;
+	if (!anand->cs_idx) {
+		ret = -ENOMEM;
+		goto free_chip;
+	}
 
 	for (i = 0; i < anand->ncs_idx; i++) {
 		ret = of_property_read_u32_index(np, "reg", i,
 						 &anand->cs_idx[i]);
 		if (ret) {
 			dev_err(nfc->dev, "invalid CS property: %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 	}
 
 	/* Ready-busy init */
 	ret = of_property_read_u32(np, "nand-rb", &rb);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (rb >= ANFC_MAX_CS) {
 		dev_err(nfc->dev, "Wrong RB %d\n", rb);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	anand->rb = rb;
@@ -1323,24 +1332,35 @@ static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
 	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	ret = nand_scan(chip, anand->ncs_idx);
 	if (ret) {
 		dev_err(nfc->dev, "Scan operation failed\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, anfc_chip_release);
 	if (ret) {
 		nand_cleanup(chip);
+		goto free_chip;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&anand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(anand);
+	return ret;
 }
 
 static void anfc_chips_cleanup(struct arasan_nfc *nfc)
@@ -1353,8 +1373,9 @@ static void anfc_chips_cleanup(struct arasan_nfc *nfc)
 		chip = &anand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&anand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1431,17 +1452,24 @@ static int anfc_parse_cs(struct arasan_nfc *nfc)
 	return 0;
 }
 
+static void anfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct arasan_nfc, controller));
+}
+
 static int anfc_probe(struct platform_device *pdev)
 {
 	struct arasan_nfc *nfc;
 	int ret;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &nfc->controller, anfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = &pdev->dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &anfc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
@@ -1481,13 +1509,12 @@ static void anfc_remove(struct platform_device *pdev)
 	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
+	anfc_chips_cleanup(nfc);
 	for (i = 0; i < nfc->ncs; i++) {
 		if (nfc->cs_array[i]) {
 			gpiod_put(nfc->cs_array[i]);
 		}
 	}
-
-	anfc_chips_cleanup(nfc);
 }
 
 static const struct of_device_id anfc_ids[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
