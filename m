Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CE606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S18rjtS1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnQ8ur1V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o9bywXPPOHyGi8Q53Am9bclRH1IzQ1l9tA6bjOscjuY=; b=S18rjtS1IEoxuLOe5SFIpMvVjD
	85jW8V4O+N57TvfERJTdsom9Xk6bTDjXBsH/1UKl+rMeblTNh2wHNP73xUVeOkom7xOv/t/PVt/Ib
	IEGAcAbQCQT0P2SvBAkaWvzrVGn+XeIl7jqbSLsLrKOaz0VvcqOpK5JiZkYRzFOEb3N3Aglk7sasT
	3OMeHqcRPlIdDdYwfTTC1u8lrC2BJoNClKSg7fIulgu/cC5IL4NsbOwXCXBvXtE2p/BtVYJtt84yB
	W0xtY6IIgqq5MmNVTiPm5CwFFBIrwc5Qp3SOzn9Oy+VU6UOQmEmu8+M9UVJ5BHaSQGZRA5xX8Q02G
	kWL9tIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFC-00000001Gui-1hxe;
	Mon, 16 Nov 2026 06:31:10 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEc-00000001FqV-3s9h
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:38 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-71ad5f20016so837316eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810633; x=1795415433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=gnQ8ur1VBbVywvoLRp9EM3kEuT88BHxEN3uE/qFs02vR5qm5uZNBCmrihGw9Kol0Dl
         /jijjVxsY+1ezktiQIoPD1LTRp8yRcnFoKQXBOyJkQzltZ2HGQ3c/CFEhFep7ycFXazk
         Z6qYYNKhisy6fNUQSNS6Sd2+PfupbCENz9rwhb1vNMsmlgDi1LFJOosEPjT50YTB1hEC
         /oPIuAfjWcedKLTKLes8tOig5K00qW/jyCtHWwhI3bq8jbp2e5vai2LAjnkAxWA40QVC
         M/KwRUrG4kTPO9b3UhG1zwmTQv0coqZ4QZwZ6sqFFHt30dqbUSyBDMsdXlIPa4ffTFeD
         43DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810633; x=1795415433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPYf6hAVCpQUew2+XnRE+2ErB2I0G1vs/wGjfQG7r+A=;
        b=wE+cZBUJvsbXHSszgA5fLuv2e0ErPaCrAFEek2hj1XxCkwCGFO7JZ7Et51A+HHZD5t
         fW270emgBBfr+WGn15Czi0reuhR8LicsvRE9YlZUvzYDvHaXRMb6gcZZMKPWN6JFv/J9
         aHZdfwVkz2tv6ZpZfjMN1eManFS1o/cJ9+WmuZ9FkhhXT2qHd03kMajF7e3O+FAGxW1h
         CwNufEYF4ITvbyPIi5sMwgh+fhx1sOJhcTeM6T8pDbxWq2/GidDkf599f7yHywpXb0S+
         rOYxti7TvjZZyPhckJgmJUofXusDMSgbO0UWTGt8GT2mQuV7Lh5Mi+OLS5Bot76jXDaB
         oBNA==
X-Gm-Message-State: APuU4Z8AEtC9Xq3drjKKVguxOLZ5OqzKGO6ytTXyPNYQw7HYEq82Q0Jd
	QA82/Hy+CmaLw+RX/6qlsvobmkwBsC83nsfgQ/0uF34T8bI/lDepolwaQIjFvb6B
X-Gm-Gg: AYBFou2LEKQKjKwYToGiLCcfBo9VE78D013opdlUZvXnUo2XU3WhMzYCrU16et/qjck
	2is9SMKimZ+F/ueS7NkzWsc/kuyd6kY3AGDfJaLabnTdGxpS2xemotdWtk26Ir795cuHD9Vn3Kt
	CT88o0/tvL6TI7bETbmmd6D4VnGqbdNdWaI+6+sUt8AEpMtqFB6xpRxii1F9qqCkRS7dOVQecJh
	dheYStAoqF4Jnr4CSf4svHZNMAmbcLzA6ilJis2K5kJCYX0pwN8zJA2hmgXwvXJfeDwyzi3HMg1
	8iCUbogx4Ya2BLJ9UFJSqyKh3aQTlhTfbpQfU/VUgXgf3w44dxVtBguyJoHokdwggANDeEenRBf
	55R7OXFuVd74zZFGzeSJb9+wW2XqXxz4XjhY9koQjtuE1SsWVi8Ve6nvEVC05ITVH8jLrcvC04E
	cqeKyR0ruLbiHMJys8rwia3j8WPVNOBZaObSlSKC50Y6V5laWh4JfRT1dshUz6GTOggYqX7LZQ4
	5hfp24vC3ubUpvOOacs+ZimaDOwK+pAgSJ0R9rSqCQvWDiTP3qtpZsuLxP+2BirFUeriASmpXmK
	+gq6uk5h8Lx55thrZ4Nqi/OK/xO8Hx8p4yXMfaHzXMBxJhglLE6hrb9erOCkglGrmp+1N7uSTtI
	JcUEQfXLGVUZ5vM35rumundNiKjYE4WeruK3T0nxeFWnBQSHwUce27nyorSTsZf2sn9eLW1F75K
	C9XOh2fXFPfiPq+RWMFg0D3FBTcGBKEunJB87VcGfictDdRIo9af4w+FWMcnC7QtL+lK0UeqGO
X-Received: by 2002:a05:6820:1396:b0:71a:e21b:8213 with SMTP id 006d021491bc7-71ae688ed43mr2480312eaf.13.1794810633535;
        Sun, 15 Nov 2026 22:30:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:54 -0700
Subject: [PATCH v5 39/58] mtd: rawnand: qcom: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-39-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_223035_077016_5C8892E0 
X-CRM114-Status: GOOD (  14.14  )
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
