Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAB3606A881
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aBOeofjZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mjaMvcTI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o9bywXPPOHyGi8Q53Am9bclRH1IzQ1l9tA6bjOscjuY=; b=aBOeofjZQZPOx+Lqa9woJH0Prs
	GKKhMLZk2eQqPKK3pshDure1ZMBARTPfIaYTdgsKoOyTdkZOO39H4ixEvVD4V+SB/mUHPCNzsZaI4
	xdjYmy7/Fs+Cn4/wMPcYnNqllS8BaPJ03X1vUdY4v8vu4cZanArqKO8F4YnfwhMQiy2QD0LCKtfD7
	yyCDqa/xw0LafKv8DPzSiaED/XzyQFa6HQ2bIgSV6oAXzkQ8YOFAYbmq4soP7ZSB8uAoytR4IJraQ
	nD5n1PDi39IM6BtV0DyES4lg1zatwj+uaEKua+aYF//zShxJ+3S2hH1xp28EPLEyWTxtOhpPyVjch
	rkKcfhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpV-0000000Dt5E-0Bmo;
	Fri, 13 Nov 2026 18:16:53 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvow-0000000Ds46-3FSl
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:30 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8253bc5a613so1454746a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593777; x=1795198577; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=mjaMvcTIKYKT/kJ52yXShMb3al/M9YGYLQ/0nX5mLsYL/ElctzZ6LGt6/vn5dra69N
         eqk6PZLRvW8zacDV1t54dKrd33CZZAOKDFiXBYSRghNXL5QZWL/uwTzjKwviCRrD4s3x
         QXW34ihsKBRhocQxyepnq+E/shi/edpzj8jPp6+w0NLReCmF6/jxTteITadIPwGQjOlX
         RqjodZm8IivqOUin/lq6qicUtA6NNVSVtKezFX86l9QWsY4NR+Qbk5s+OzoqVjGjD+lo
         hIdG5lkSafpMgOnnDdORagJ22sQcbQ6I0FSgqyV4xwziKfwH4PwQHb3tQ9SYLpW8dqSR
         6OHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593777; x=1795198577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=k2auDVE9HtofURyfmy+cYxzTRwE/k8Y2IC2tce/CMOI4iW45ZVSdwR2uHt/x6qfu23
         /D6UMexaZdhwjieO5ip8lm5B9kgdvC+i4aIY+GOaqo05GNrKrhh6DE8PdiwUSs4pQ/nA
         EMHZIhqYiR6FhcbthQMxnstvUHRqCO3dN4gUhDB4QvDt0FxtvC7uENnZ2OYm1Jye24Lv
         UqwkKacvj2WYW8untxVpGKvVDhE7/8jGkMYW0+GVsU4C//wflEouEiID9+uOqMjSpj+K
         RBOfHS9GX1J1mOpm66ysufWAwjqtoMyT6p30x4DyEEoVXxUX8m32jcfjdsuUYyqQHEub
         sNsQ==
X-Gm-Message-State: APuU4Z+xYSq/k03OMyVLaYOKPLTg/LPYqilVOXWYvHYqx+LFnr7yXbmW
	A58MdPhHIuHWRr/ggrmoHy7TwWf5U9Se//Qsr83K6v/yty1/XZgCBMH1
X-Gm-Gg: AYBFou3qS19EVnFL0GAiPbo5Blz3VvGTIHj165cQlcyEjlyZHe00oUfdr1916Qs01ha
	r0cDNhMEmrm9E806ZLFH5P0q7HXU/Xxc+HjEhUfH6iwVs3e2/TFqzSjLFSM6//ZSazUpaBLX8lE
	2tzkjNkQr8iSxT9i36vTDoI1Zp1mBASbARtegjJ7vdkQUskVZR5GP7cirFq5LJ8lohRjWyNjAiK
	UI9kNRJC2NJ2QaeWaoDYgVi0D8t1OcIKxNBg64iqYgGpqtytiOawWi/wdetSBkCMClUxGV0wcXF
	KqDAQA85D0GHoGMQ0j6CeBaEW5Xd7WH8e8IdWMJ/nQIdlOmgDLn61dpXVvIE/hMzwh57iDi0rCB
	jstZBf73TRXMDRpeY6Op5xwbojEKfEdxK//HigHADlDXUO8De0pgNK8sTTCmCMiatvs8vIL86MF
	eEsmi9yTPTR9hJ+lYHem1v4fNb9ahEQEhn2QDL1xBnB8FUJrYJoLjZaMJ5I43EY5bNAATb/anrc
	wqWn/JcHrA9ZZjqNE7lna4X9LuSoG3Xuop1sF4Rjt+YdP9qLyGHaQpwyofi0bDOSUoLPeZzgMKV
	6AT+WHsLAIGjYTaap3hu25i0oCQykh+6iXIJBj+qpmZy3s3KtL/+qAOW5JpsJeUvRJ2S+kJlnr4
	E/eh4WvDIf4hAHIee8l/t9FHSZVIqKJk9AEzAvIIknnLPvJYJpf+E1lrOIfV8xGT4yrsUduOZs6
	D1e5V95VPumCVZRMN2D7PXiE6y5VMYSKkXgal6ruA373m2p2HwN1Q=
X-Received: by 2002:a05:6830:3491:b0:829:2866:3106 with SMTP id 46e09a7af769-8628989b101mr2619090a34.21.1794593776899;
        Fri, 13 Nov 2026 10:16:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:55 -0700
Subject: [PATCH v4 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-39-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101618_956679_2894CB01 
X-CRM114-Status: GOOD (  14.09  )
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
