Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D215D6074E60
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xdqT9bDO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iMXG1Zhk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o9bywXPPOHyGi8Q53Am9bclRH1IzQ1l9tA6bjOscjuY=; b=xdqT9bDOFKW+nF+RcOPYiFIRvw
	HwZY/rVAnnIxtCdNf46YkgsIT81W4CZ7TT7uoIzFJIBGIR3zPNEf7yPPdEnQXSUDGqdr27ugD31IV
	pqN+emb8daxjCKG7xbG91H9yNF7txuvIBfNOsQifisyQ5evgE6sHRvIXPbI2rvNOK+QPxo6OS27vT
	XvMETPdEvv474fNKdaWety9dgIZs70lNKBPrvbqthxfa0FhFteE5wBiplIymu9zj4t2Hz/J2KgvVU
	f0Iy9WA8jQOx6/Tu6MD2twpbm9hoWfiTBZ0N+gSwXsRQARdSkFc7nCqffh83NPluZ3DaqDHU/7FDq
	qta/C7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdZ-00000008NfA-3U7R;
	Thu, 12 Nov 2026 01:30:02 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcn-00000008MFY-24VC
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:19 +0000
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-82109f51565so1636162a34.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446952; x=1795051752; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=iMXG1ZhkHP7EnPCaqeOV/q4ns8hF2uTT7tWxhBOIIru2hBIMFOITQh64T97+YjCMVt
         w8Dfu7QqUwn4uryaOTLqE5sU39NL5yyyVCFbfeZq58UFDXXxzANoH1IQxi5PcB8elBfU
         c0l2g/LIZ/SuTO5HPZLlLOl1UvbC6hWRLrgUw4pV68KV+d5lAxqVtglKf4+w3dCopv6W
         idFSQtZEPc67mzdWCe+RMdMbw1O/hUi+HDskBxPBQKXLRxAxiOY1S5kyLkchC4GZPtIu
         eKA41MFr4FfGbHJoaRwmLrgTpg6Nw/LSYL3oFPvxLHydShunM5nc7cCG2lIhChGUWPLM
         4ZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446952; x=1795051752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=pahIUHXkLbCYiYbDR7K36cUjO60pRRSlQBOeCd/W40mN6vKVQ6C6i2ru6GSX1Kld84
         xf7Jc29CuzsOBa3Lfu4ueJIwY0MGPG+ZPA/D8Ykf//+6mjbRiYcb1b/b7XdSFm6CYRCx
         5xhEUap8ArwczyYYU4ybd01Ryp/QFb+u9E5XnTPtlGcYaRbx8oSEUTv700ycbeGmrB6I
         13i3sD5Wdp5Aya9/UnoTVTX3/U+QnLHAe55q9y6sMTIcGoGtfSyoL6JNqJj6PRBuVvV4
         JX657hLFXzwc0ne1bZKDM8ZHlmptYpeYvtbGqCGNL05b8LHMc9AZE9byzNyyOGeDg2HS
         ZRJQ==
X-Gm-Message-State: APuU4Z9mNCFast4k/OwK1dRqedv2hwCq5F3fxBhv13YyHCEK+AlC3fIc
	nHJADcn/ururEg4Jevu5Vd3A6/TkYEqJtxoL1LpuI9hOgjefCaUUZD/C
X-Gm-Gg: AYBFou0M+Lm3yykJ10bLgPnX00g8R4fO4C2Ct9+qGX344Af1hMebeH79mNyZl+sjoNi
	4ejFu7Z87U/RGe2NzhARaimrOARmK+MFO+YVO5yV+8ZtBoi3MHgZRVC0+dhDY4p1Tge1VMk/MA5
	26Gb5ufmVG4BJWOR6zb8fjgBDxmjNrwtbdzfcoKtzW26okMfMJhkWX+41GrqtLtRmnjTyR6Mnww
	hFALxOuk5Aj5d/3iHAsPOghdXCSzl/7wHMS03vAPG/MJgF+bOlDRcxwoXj5GesNURrhAJ+2auX3
	9+Ge4h2nd3+FtxmoZ4zSSx6XJSLLP+Wy/l1GO6Vglhbl7Pvbktjydht5BmBPXvAR3f29aiF4ttG
	QeiibDttaXrZD6ZBFcf8lO6Ju/z2mrxAOewDrc9ztdMLQaBPfhNM9TBpxy/PKz8XuKz+EyYwFtV
	aMa9bn27oORikY1uSstWN43u5q7YfLrFS+3AeQVjGr49YadiimBy8C4f/LpBKl9+bwdC6A012YR
	H9nMVK8SjhR1mfVWLVKZlA+yVbCX3reon0nBx8YsrZITzGJRr99keodSk5pL8mxzgOzeNP4Fon5
	kmWGT7qOoZs/qZ5tr3qFGl8Nv7kl7hACPWeHtkDLWF4yDE9E13/J1ikIlvuJ0W3Z5nGaFYy4YYW
	hlmYr6Oksi+0VWGg5E1V7zDuY1k2/sGYCQHmcyAFHyEcZuTiYHxiyHRbxe8VWlb9ypr/YffkE3T
	YvtPsOHjDKOhgk59EbQyUdEgWXolztiidZULe4ozfows5jI3r0FMr0xyW+P7lewmpmCpY5QAUA0
	A==
X-Received: by 2002:a05:6808:1304:b0:53a:6769:c35f with SMTP id 5614622812f47-56b967c9b4fmr4139860b6e.33.1794446951849;
        Wed, 11 Nov 2026 17:29:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:18 -0700
Subject: [PATCH v3 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-39-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172913_592323_6D47D9FB 
X-CRM114-Status: GOOD (  14.91  )
X-Spam-Score: -1.8 (-)
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

Install lifetime ownership after scanning each chip and before any MTD
device is published. On a partial probe failure, unregister only the
published chips, then disconnect and release every initialized chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c2ccb999ad8d..3451687a2bf4 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1903,7 +1903,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2022,15 +2021,17 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
 		dev_err(dev, "can't get chip-select\n");
-		return -ENXIO;
+		ret = -ENXIO;
+		goto free_host;
 	}
 
 	nand_set_flash_node(chip, dn);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "qcom_nand.%d", host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
-	mtd->owner = THIS_MODULE;
 	mtd->parent_dev = dev;
 
 	/*
@@ -2053,7 +2054,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2061,10 +2062,15 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_lifetime(chip, to_qcom_nand_host(chip));
+	if (ret)
+		goto err;
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2076,15 +2082,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	int ret = -ENODEV;
 
 	for_each_available_child_of_node_scoped(dn, child) {
-		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+		host = kzalloc_obj(*host);
 		if (!host)
 			return -ENOMEM;
 
 		ret = qcom_nand_host_init(nandc, host, child);
-		if (ret) {
-			devm_kfree(dev, host);
+		if (ret)
 			return ret;
-		}
 
 		list_add_tail(&host->node, &nandc->host_list);
 	}
@@ -2106,12 +2110,16 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		struct nand_chip *chip = &host->chip;
+		struct mtd_info *mtd = nand_to_mtd(chip);
+
 		if (host->registered) {
-			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			ret = mtd_device_unregister(mtd);
 			WARN_ON(ret);
 		}
-		nand_cleanup(&host->chip);
+		nand_disconnect(chip);
 		list_del(&host->node);
+		mtd_put_master(mtd);
 	}
 }
 
@@ -2149,9 +2157,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, nandc);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
