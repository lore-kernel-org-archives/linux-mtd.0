Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67224606A883
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eljE9tpK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUa3aJWs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3837wqjhTTSk+NA/3JhO62LBCqrEiVpklRBEyZVkR5w=; b=eljE9tpKsRXtQRDetSJoxcQTKG
	7ANQNGjfCIfC3q+t2FQzG9fLXq5QQfRPnHOV7UTGrWueBrLlmvPNTSnWjZfLZBY11kpLsAiRo4ms1
	Jdndwqkqb7C/BrjbCnysJIuQ8lArytLzr1YqauF5b8YWy3x4AhhYEi2afweBg9ALEQ1vphEb5MYXh
	1Vo3ETl/ECNyxu5XGqgNzl/OFRahkvO6l8m4cypewyQiI9MKQLV1K95xLwgqiMA+kgfqCSiH4641i
	Ytbllg7Bpm0OgGR9Poqr9pvhndVx9YavhLO1Qdq3tkSe/krjf3pdoLInIX8Mxt0GHUVgztitERZBO
	AxUmO/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFE-00000001H1I-3wKf;
	Mon, 16 Nov 2026 06:31:12 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEe-00000001FxU-3QiO
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:39 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-71ad047710aso1094859eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810636; x=1795415436; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=DUa3aJWsAOXhtI//Jtajr2vLK9GrrHyiIg3DiezNq+cKWaOO8hJ7iLU6j7KjAvHBcK
         TCueTIIVHTPX8He+LSyNrB0HA4HO0p9t4BOIFbeqrJgm7w1NkSHdN1qcaK2RgzCl60R2
         4JYga3bFQrUhscmZ/erLNQ3UFjHA/mFodW7r8c03kZjP3Ti/jq+DUi62/viE3FeEZeRr
         imsEOHmgxnDeO2PapP1Zm8JVmQpC5NjuD+aGuclBPjynNHBA1/H7Av0SJyXtkhH20mSe
         mR+oHCeU0nHr/b9yw7iY9hsOJV4kKG6qGt0K0aae+K2QegimpyWRFZYDJstyrfgUmleb
         lgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810636; x=1795415436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OFEjQApaoiTgPpS/OsG2Bydz2dTAP/bVvX613SxTag=;
        b=bqeo+3HX+PRuVJbHTGgV1znY1RhrUlkoAiYephAZNxcNioR4T87w2ggXhbH/ZKQ85H
         X8R636UhsKaOTGEOC7dA6Op58t0p3+lAO6ijv582477+wmNguQ3NuRSVz9ZiiIGTmoOk
         rAyLhSsQNvkrOlrQPWJeQ0LHD8oUj+7N4SU9zsyU6Q3kCpSQXUdBmDpLLAah3I4OCFwn
         anApCPhiUAoAknMsFMnGtKqoGlVO5Ih9dzP+6OMp6ed+gyhaRRtNvIC+JvUqL/1/CZUW
         BGJ8aUvmx2FGNQP/ufFCB0jSNgAmtGOr94vkuYP7+JoClE6bYwkjO3SRdZvTaUwYEzqD
         TicQ==
X-Gm-Message-State: APuU4Z8uuE0N54Hgt4GrZpWkNqYN5edoslvU99zso/lwPNLiDKsQM4ql
	2JwbN9yS/Jc+EX9ouH7+Kc8o9eK+dFs19p5z1kknVZkO8hWBeXE6E1j5
X-Gm-Gg: AYBFou2Wv4kJaoTm/aSnajAlAF3z9HsaUE86g11SVG4AlB38imRpYcNkY2eZR/C6Hqh
	iVuJuTEa9/m9djLe1dk3XOzRdtxdnm9bBIXF0bKF6R9vc7ubjrOxDffY6xD2Us5JeMTQ1aHRPjD
	Qq3l8YQgCpkH3YZAD2ibqyLv+RYZwqws6+zlbtVZE6/yLhfIcDPOybt2J270dI3kll9hGSKmejr
	b35ctgQkUR/7OO/+8JsLgz+YXsAmgkgDmFKSjSedMo6uta/UJQ6Q1kM7WaMgG6Hu6Y6mFF5Hus3
	yRWwXW53hNZyYdyDYYE8IDHj3qgS8pktADhhGBKq9vPxbu/d6MxHXyVjKD+qWxxEULF9Fgt9ZLK
	aBVeJrOst+YiBaX0+mHEB6D0VpG/w+LtjTpicthpxu6A2klCVVhqzJMalok8+Mzq6XPipiu7pV/
	r9+mgV80wPeQN7p2KpoBLsLoeJ+adXjXsHTgzgKDTi6U831xfYSZa1ClENcRmP6oHwOQcbeIMR1
	rnRlIWhUqxZEl3OeLWw06RuFRfX2EO5Y6hi8TnJNFuj+/Wv+Jh24aBJIm5+FKP9YDGzI/Elztv/
	DAX2TONwDjBNjbWhszA57yOhDX2986YxshfhVsGtmKIl3Ven+pkzLO/7MgIWbQ3gjDpe+c4D9Fs
	vDooeggKwPh3eRnRrFTjl/rHUzelMPLlM+9NBw0xhV3/Xw/08jy5oEdMQHky0BY5EhRFXvYQmAI
	ueV3MV3yJ3zQJTLUdkOwcP+YxqRUq5FVob8L/woZooEPzlkUTU/lo=
X-Received: by 2002:a05:6820:a292:10b0:70a:6888:2274 with SMTP id 006d021491bc7-71ab5073337mr4232314eaf.45.1794810636011;
        Sun, 15 Nov 2026 22:30:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:56 -0700
Subject: [PATCH v5 41/58] mtd: rawnand: brcmnand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-41-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223036_906769_66EC5AF9 
X-CRM114-Status: GOOD (  16.28  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Unwind previously registered chip-selects on probe failure.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 63 +++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0378014da6d2..8b2ffe5d44af 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3093,10 +3093,11 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = dev;
 
 	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
@@ -3123,13 +3124,24 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
-	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
+	ret = nand_set_lifetime(chip, container_of(chip, struct brcmnand_host, chip));
+	if (ret) {
 		nand_cleanup(chip);
+		goto free_host;
+	}
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
+
+free_host:
+	kfree(host);
+	return ret;
 }
 
 static void brcmnand_save_restore_cs_config(struct brcmnand_host *host,
@@ -3294,6 +3306,21 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
 	return 0;
 }
 
+static void brcmnand_chips_cleanup(struct brcmnand_controller *ctrl)
+{
+	struct brcmnand_host *host, *tmp;
+
+	list_for_each_entry_safe(host, tmp, &ctrl->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
+		WARN_ON(mtd_device_unregister(mtd));
+		nand_disconnect(chip);
+		list_del(&host->node);
+		mtd_put_master(mtd);
+	}
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -3307,9 +3334,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
-	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ctrl->controller, ctrl);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
@@ -3324,7 +3354,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
@@ -3489,7 +3518,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			host = kzalloc_obj(*host);
 			if (!host) {
 				ret = -ENOMEM;
 				goto err;
@@ -3500,7 +3529,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			ret = of_property_read_u32(child, "reg", &host->cs);
 			if (ret) {
 				dev_err(dev, "can't get chip-select\n");
-				devm_kfree(dev, host);
+				kfree(host);
 				continue;
 			}
 
@@ -3511,7 +3540,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 				if (ret == -EPROBE_DEFER)
 					goto err;
 
-				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
 
@@ -3528,7 +3556,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* If we got there we must have been probing via platform data */
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host) {
 		ret = -ENOMEM;
 		goto err;
@@ -3554,6 +3582,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	return 0;
 
 err:
+	brcmnand_chips_cleanup(ctrl);
 	clk_disable_unprepare(ctrl->clk);
 	return ret;
 
@@ -3563,16 +3592,8 @@ EXPORT_SYMBOL_GPL(brcmnand_probe);
 void brcmnand_remove(struct platform_device *pdev)
 {
 	struct brcmnand_controller *ctrl = dev_get_drvdata(&pdev->dev);
-	struct brcmnand_host *host;
-	struct nand_chip *chip;
-	int ret;
 
-	list_for_each_entry(host, &ctrl->host_list, node) {
-		chip = &host->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-	}
+	brcmnand_chips_cleanup(ctrl);
 
 	clk_disable_unprepare(ctrl->clk);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
