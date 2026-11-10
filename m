Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0657606A945
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ACr9NLv/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KD/PNLv1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drGWXfVP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SVV4s71ySruJvsejq2XhtVU8AapY4SUj47xnlRnMJaE=; b=ACr9NLv/WPmWIKg8ZaOwOiHTro
	vM6Er8WXsZBYIVnnPlL2YmRyZeaCp7AC/Hyqn2J64CRN+16ZaZza1uQ76OR7XtctlQvCcXxSKWTj9
	EjLc5Uwj8UIZQXEmJXZYY847C8RkSUGFTLICwB2YavbQgPra+P9pblMISA88/7v/oMiIWvHiRNU14
	wuG6zl9rYZctjOo8RjSCLYB+BdTQIGLLwGo4vYVdqh8gf8CV1NjCesZ+yYIA5UUDa28hqQgjGH6/Q
	VekPZtTaUMdkS2fjQ4sxGjDhM+l4B05FtzjkysSdLsFzJAyXMZE2iXu+StPOUCndcBVzGgcRPWVqk
	96suTQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYo-00000002z4i-3oVp;
	Tue, 10 Nov 2026 07:46:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXm-00000002xgx-3BGp
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=; b=KD/PNLv15tO8y5nfpNE8bhxOnk
	boRuteW778nPpQP7S7uWafuPby7wQHn76YkX+1lBOMX8vGaxO9IRDJRU4ye8zPln/Nmw7ZDVOt/TF
	0ec1aMD8qxAw9l68zGvTpIIt16tH3ablLR3BYaFvSs3BfpTNHLz5ZWuJT0UzfGy60CCeF13nqPX+6
	fyhQJo3WUpmJg/kHeVfZaeuZ1vW4e+E+3bhKncWrBm5LqMxCtR2c5Ypya+LRtK/iRY03N8cJlRtLY
	f5QiYndEWPCkQUDGuQvYFvoJUvqAPlfMFz+tBTd40XpJfXRJ/oPMXi+BPyCFiNxjesu3ehHZWP2Mg
	jjBT9T2A==;
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXV-00000007e6l-1g8c
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:12 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1393049b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296704; x=1794901504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
        b=drGWXfVPBM+sg1i6ZfrSZGcc9dUFx2UWQRj5l9ykercAiVnM0BFSWV+HGT9DuPsUmP
         lWDFT/QPzJJRa1SlWPAKvxI042SnMApcU0iJ/Wb66+t/uKG6IV0M6WhcnvF9BP3bQnJu
         zvy0tv9PiD9ABYl/U+zgwN/ttyADXCBsTvuVYWU9HTxVfDO99E8rjJnla32iOkePlKWI
         43yoQO6rceCfC+06+bnCFawGwQwZLwDmNoHfs0XCFxMd9f+KgNwGMgFoU6thf99TgM1c
         6h6SeRDapzQeoxVdGoZ3RMg/VCHHxbeKV7bvTZG862bzbkk1t/mgDm7cNH9as2+QP0kF
         ylAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296704; x=1794901504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjDWnM22Q/K7vI6+OfH7WDfHobDgdF+mnz7wU6JjdMs=;
        b=NYP/gw+kz1vfkC96okVLEzbiCaWUKSd9v9LHjPY+9VrQX+N4n7Z02nrK+vPQccowim
         dBQXBfRT7Z/7ZsRcOkK27IQyuQo7YNzbFigLPnSs+t77tsIms30H3He7dubv+io/Fg45
         7tZMgv9vd5VmJBGIynCD7ifQS4PO5cmQ6sV+Z3XWIUvcR2gU8YJzIdRjIZvvGoMWiCSt
         B61VXPS6jdPEL7LViC01HTQKi9rZfQOBA4mG/6tcWRHQkFGGtsYtrF9qObohnexeP8ak
         6oX+eQwYT//1f68iJCQyBQOjKsAZ5kdrD9OTNWpinHPxwfq2nA3Cq4IUde7NQtnF2G/N
         8AIQ==
X-Gm-Message-State: APuU4Z+0cFsSCyJpzHzJ+5OlAeFncp3LChVL+5itQudwkMVyHw/icVjx
	ikPjzpGM/MoqlJNbmx++93XADG2iyyknaxpG6l54DaVBJnKAdOYNVyry
X-Gm-Gg: AYBFou3Er8Gw8K+x+sg9jtUk12RW7f92GFH1gAt6VjMTP4seg30DG7aTfnnBNAZ3/k5
	tyBPHZC9ScgX4HSCeUCQ4plx9r4zQEHl0HXcCwu9MbAptUuJE9Tx3Q0+JXd8/bVRvtDXVS5imZN
	DaI7v/ebk+OnN6a8+q7ESDJARZXbmc9KXCkYlKg650Mdg1n6J5vnhLAIfsvea63g+AZwywvEKtM
	GOoFM5f7vHUesIRXCjgRQMtZPSKInvBL3zViJQrhyGX7DFhl5WIa1Tb6dI2eQ7CuUleuldWqkQq
	VENdAFtcWeNacouELvIpqWtRafXWSj5YQuRFvK00NAGUK3uzIOinLJiD0cXS4wtMGeRxonPDkqY
	StILuGn9LLxN5WFi2sOlaIo5mScPLSPmoEfashLndUCSaEBlc8f5Pto0J7yoU3Lmf7NaYkVZlOX
	u8hBsMbhdkYvscdmEl4uArUwT9n12xdE+MuvqUxqXZL3T7u9qbBRKJ5qRu/LDaYiDJf1jDCUdlq
	2g7g7Uu6Xg/eytW7yI9jtcMxop9PTxVxnra19v0aPypbG83Q54cebRPCbIv8lP17LuBBFD6yn1r
	WBtiH7bydShglCYzSNOiyFTPFnkFbB0aFMRaTaSM4h2jppGDVE0XKSF9f8Kt8vJOq1uS1AiZD12
	VNNTk2+hk1XVV6CLZNp4Jhl8xi+qN5zN+4N8YfGVVjezbvhMs/NmzVgv0G857qqytk1ijKFO/ov
	E4IwPbbsNRMK4BaWJT1hHrcb/HgZE3aw7wyIFoa+9fMTYV2gB2QQ8=
X-Received: by 2002:a05:6808:4fcd:b0:4b8:46e3:e221 with SMTP id 5614622812f47-5687288b6ccmr1019708b6e.13.1794296704117;
        Mon, 09 Nov 2026 23:45:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:42 -0700
Subject: [PATCH v2 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-39-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074510_632402_9FE90E64 
X-CRM114-Status: GOOD (  16.19  )
X-Spam-Score: 0.1 (/)
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

Cc: linux-arm-msm@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 46 +++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 978fa84f051d..2e8fc574f718 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1903,7 +1903,6 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 {
 	u32 nand_ctrl;
 
-	nand_controller_init(&nandc->controller);
 	nandc->controller.ops = &qcom_nandc_ops;
 
 	/* kill onenand */
@@ -2010,6 +2009,11 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
+static void qcom_nand_host_release(struct nand_chip *chip)
+{
+	kfree(to_qcom_nand_host(chip));
+}
+
 static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			       struct qcom_nand_host *host,
 			       struct device_node *dn)
@@ -2022,13 +2026,16 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
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
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -2053,7 +2060,7 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
 	if (nandc->props->use_codeword_fixup) {
 		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
@@ -2061,10 +2068,15 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
+	ret = nand_set_release(chip, qcom_nand_host_release);
+	if (ret)
+		goto err;
 	return 0;
 
 err:
 	nand_cleanup(chip);
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -2076,15 +2088,13 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
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
@@ -2106,12 +2116,16 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
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
 
@@ -2141,6 +2155,11 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 	return 0;
 }
 
+static void qcom_nandc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct qcom_nand_controller, controller));
+}
+
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
@@ -2149,9 +2168,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	struct resource *res;
 	int ret;
 
-	nandc = devm_kzalloc(&pdev->dev, sizeof(*nandc), GFP_KERNEL);
+	nandc = kzalloc_obj(*nandc);
 	if (!nandc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nandc->controller, qcom_nandc_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, nandc);
 	nandc->dev = dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
