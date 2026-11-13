Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45006606A889
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvRW7BUS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UJLDFmw1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Imaqx5Ld
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2AkW6rACMoQTsCVmeQ7ghJSVMiqBlr19DR60woiDW5o=; b=nvRW7BUS+0XorBYpvDuczkZeaF
	h2kwZRwWldJJY5i/wOUth/UmhXN2Y/AmQgo3M7Z/YC54m1H06MfPcMgyQTOf9bxLAmSD4qfeVRrkD
	Ore6cfpzg4nsrAtvtKLNLEXhV51DHGSIaC6ZZOYeJ2cD/DlTWZ7ccS5BXvmnCxYXJdaaOmQaw3p16
	4Hd2yfXvC/FY7D0aG6MBF2vlall+adHt9RWCWwaHB0dpLIL4y+niLsHvaJBU31/qXLMFCwfGYahld
	LnC2waouFBLqGt8eL6pibhGJ2PMIchexILF6n5TqRtypuk/hpOBtOCscWPHbV441fHaN2X4kjg7GY
	SFsucziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvpR-0000000Dswk-2Lp0;
	Fri, 13 Nov 2026 18:16:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvp0-0000000DsDD-3SeB
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=; b=UJLDFmw1gtMWWl3uuJP4ZVxcut
	G50SkOmqgEFzkF+5WH7dnzyZsZKI9slM+ep7bJFzQ019R6+lvJcw3H6n3QO1dMTKfF9eKq3HIZZNa
	6/bcm+8Zwet4fIma6E0MLVaaMR9LEvLSNy4IHi5Qf0+0Dbar5n1SXA9UftgJzQtDZPvqbkioAahvi
	OIVfh4IDK4gzhsCcRLeM0L14cVX8sF2LjSeXeVlXcYzPM3sAzf3knEQb5D6hlx3jPEgPZnaBgh9Un
	WzYpHMK2YL87TB6smiXZIVqsW7FCAoLgCtFiOGlEp6FHvRFwjI2koYdaPT3oP9wmXlMDMzTkuFqR4
	4QKyNQZg==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvox-0000000Bdq8-42U4
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:16:21 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-70bf1671c21so1706343eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593778; x=1795198578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=Imaqx5LdYWoGIyDjhZM5PoVCx1szzpGVeHIOziISfvSfHSYbtxNqeL/qrMnuEB4xbx
         3sGV6V7XxNvwiP+MVCiPMcyAFssN5qgLUkSG1tq3tu/8S2etpChAQvbLgRH0tNOcLf9p
         UhcSdbpV6wzFnhN+7pHlUDewgLI+H48zuv9BOHf3uAy7a09FCQMo2TzQucbwRMx7VjSJ
         IaDlachRh0n6ha8WaMgGq5VCgZBS2mpB8QwOa1tjqVUQQcRwhqPR9wZ4Rijv9OfrwAwR
         RA6zkPpb9YYNgjWLYgsSKncq3EhZEwFXst40Ncx7Emc2TV9jir46wlHD82mM6xISP83G
         GXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593778; x=1795198578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=Nbvp9ptojHvLPo9UzKA5E/D8oOjyXs3OqwyeU2o6lu9bWO8VjHhcGkw92ShpXdaCk5
         CcTVflyHqy2sAdr3CqfxVFWGMz+LmyMhd+bHmBfFrm9WPe8wGcQwDGta3pDO6FLX6+c1
         tL/WRc24yKtE0BfGQ5/nBzG7P0bildl8u1BB9KTKLMAittvnDd+vKH8KuSnprCNVQ5Ef
         xbW3P5G2ncTwhcKbWnU6CO9KkoiF9h8AZnlmlcC5yESYbqdcWzR2BIHQ5MzLfuwdRxd/
         AyWTzbVeeCRIU1I78w+lVhgiycn7FMuQaCrs+gtZsiwF3XQE3l+yeMBvfl8OuoopWEcf
         7Mgg==
X-Gm-Message-State: APuU4Z9zQjva0ylTlYStzFGmuqv8MNj4YD+YrUi9G2UHmIQYmeCvyuPz
	LZ7b7MjrBLGoE6eDLpzIUMwAmxhmx99Bptib+EWmSv7CCOVLgZNXzhMg
X-Gm-Gg: AYBFou1mfHTFXSBo4O/Mj6VX/bqccMu7Sar0kyuO8zK4oFoYWOQNCuf3o3XBUAXAWV/
	GNyBrSRYNna8DbWBV0hcmgzqeISR+EjZHY1ic0cZ8FagFv9uvVz4G5Qi7M+2mzPTFLpnTwlLAb8
	LaiCsM80ME955aNXCo05jo/nExmuRU+4jnnOr/1dco0Z+QNpNAkOguWClfrUvfBpOvAYYAzVqSI
	zcPKSTcjwHB6v0qlmWZwBztnEMN/4cECymB/HUYalLJueasOXFTZJkPk3D/RPXEfGNckI4pu/eD
	qVBEZVwKBErAlImIIxl08MAAEKMiIRVLWmO/1R9X1Kv6WvXJDt63d1mfekJp0FAx0ucX0DUhmcK
	46k4cNv3gBgw+TH6uCpYZ4daHUQvBt6mDfEu7kfT/V5Q8stVVEe6eW29Y8BlIpGxhfhQojtfJNd
	1R/3Pdk9P2CTGu8TcczPG4U2pXwcBjhgQVlDhUj8Yw+DegWJgsJaMlr2V/LOWClJBs1W5FEr5ZT
	v71j4qDIHXp3HrUwV7y2LPmHFM60zgEh/L2Ca/AiCrQaS55i5WjSWGq4KnJEsyZpnfnKq34iC2/
	yHcZIzBzsfGV6GwgfpZOuNgdrNAKdE1acgGKcjD4eskYJf1or3riQ6R8GAxbOQWPlqjd0+toQfx
	lHILYbM8G0B7fobHxOZrIEarBbc9weNXXEWo38/x3dUv3005kf9AJit/aY4R4irjyNNVoz3a4RL
	uCsWv52zGMSPvgHhb0ExRHLnXDhZb0tNuo1HrtU77JXHjUw8WKLZY/
X-Received: by 2002:a05:6820:f007:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-71ab4cd8533mr2096480eaf.13.1794593778031;
        Fri, 13 Nov 2026 10:16:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:56 -0700
Subject: [PATCH v4 40/58] mtd: rawnand: cafe: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-40-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181620_092545_6ED5D7EA 
X-CRM114-Status: GOOD (  13.74  )
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

Free DMA memory in the synchronous NAND detach callback while the PCI
resources are available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index e936c9807bf8..be29e78d6408 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -683,6 +683,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->parent_dev = &pdev->dev;
@@ -693,7 +697,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +789,15 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +811,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +824,16 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int ret;
 
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_disconnect(chip);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-	ret = mtd_device_unregister(mtd);
-	WARN_ON(ret);
-	nand_cleanup(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 	pci_disable_device(pdev);
+	mtd_put_master(mtd);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
