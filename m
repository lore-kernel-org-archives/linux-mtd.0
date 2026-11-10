Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B916077D12
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4JbPwA0q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSglZIVz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C6IRQfRIdNlop1maIeDpvLOwNHyc12Etqu1fO3rBPf8=; b=4JbPwA0qgFyV7LJfkERq+wi7Qc
	FUrmr58NODCENcr/J/cnDMDMF/nQlXh31CYmIn2UqqQv2h942DrWrAzrz6OjQd6NNlYitDM9ayi8a
	/UYCagHxgBZxcroJi1Rscm+P6NKYfTVdDhsz+9bpQ5ImnqGmljCsEqQrh4Y5CFsvJ53t0Ub9l2pZm
	SUrT07fBL09+A9NTUaj2Yrtmkny8bl0IOKd4vcx9qaM/qwUCirVWAr2QRyDGY5ihyE4Pg+jXPFEGv
	KqBKWD2WtFTcV0/c0gVyPFc1Lp0sPRQdrnoxcICC1np0dofQF+leiTc+KN3z/xkbnicvy/4bbimxh
	ZzfnFLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYH-00000002yHV-0ZGg;
	Tue, 10 Nov 2026 07:45:57 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXS-00000002x4t-2utu
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:12 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4f699fe49b3so1177643b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296705; x=1794901505; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
        b=DSglZIVzJtC5O2StG9PRGVqWlFSmp7eN/YyA2vVpjTVo/dM4MrL2EKJlOdHKJKtbts
         Ha/E1lyLsZ8uWZSu8pQ0xxgxPWsrI8No2Vopr/pj+AA9z6Kg7psS6UVuEsGlkxKAJsBr
         d7P/8t0RKmvRbT6cb6axxhOlIeOPHiYVU33GV1YD4qEbQ+FIf3usx6zuU7Ht3oPTkvb/
         zQvU3wRqxMyjPSckiPZYZy7ImQuw9wYDnhhsw65tbu1lfc6TriKPVqNyWDTvt2b1YUgY
         oFlbPAF7jjHrjbOtErQMrUQx8jBlmzh1dvl4B97QVOLJVsE4ACKruMvK005JgyYWFaNR
         nBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296705; x=1794901505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7c6OOYT+qEeDVQYiysesbJy0c+qB96uscD707pwGC0=;
        b=SIuM/KbYGd8Wr+TVIl+W39/mSngy/YncLCZdY/RQoERsd5kvfFcDv4muAJZJyB1plX
         nAzOOwUpn/Ma5iFH1PvbDSys+dVpVzrE76kaGNjRVR3Ac2vRc/CAR94IAivMkZVKmtP/
         IXBQo1xKRUT+LurawONWxAOvDhrIda/PvuxxwSOTIAe7ssEbM2xHvsBcuQIICHcMWzU2
         W/vwHvn7Vkbiw4LPYQs9d1pDfVQTjKRxsXEZo5thQrwiLU2WbfWNowsobjzvJi5EkzU9
         gYeRLXOJhj0PkvbhcdDfU6qcJQc5WbaJc/RGAt6Po2vRh6aZsQXkmSJxROFmg+q/2EHT
         yLOA==
X-Gm-Message-State: APuU4Z/xsrTPXo/01kkBFHIAQbDWiHmiiv328ef+Is41J1mXp2ZyGv6n
	mpT4qkMjNauMCuupa/k60yhJuKayqUtBAPgsr2o8KVqG5lI891vP6vb8LnyEflCQ
X-Gm-Gg: AYBFou2v+juofNB0Z0JQGWGcWQMl/ZLKajkgSBPS/BfyyYR9i8Pk16vIYAjsZaMeYV1
	KwgJoQSPs6cO7fAWjDm/5iDF1cjDcfm8Uo9Miqi7SQtsb/A+gWvgWxOqHE9NywxOvP9beAv9Yzw
	7GEKujsxzLH1jF7ycpm0rxuBBmFtVDnFoJ1jrYbaDyV2FwL5fVpu/R8kstPUbjXLuGbER39SFg4
	acaG0+etl6qdn2AWjvjtt0oUjINfNlcCyOey8FlqyDfixy2Yt+aD31ix6PbHnbhj6OTnGxB0rnS
	alRbVpnnlJB4/RVKZx+YTjow0VVHP3KGBkMUdZ3alkEri+ulFQV+iv5T/Z8VJlMKsBMhwcXY2Kj
	xY1nRo39kFd5dIG+GsXnjT3XciTNa9DzAmRBp/RclHP64nugWIP5kv9UYqClczUgi79E2/JbL8u
	ul+RVYBIJt9PmnXHZMVmuMsGnhUTI0G49cuP39DjDOD10iqOjQKby1FZPezh/D6GB0NergTgMVp
	qdCq2+ZIimSXPldrO/e+iwdTtGUk5lVe3Y3X05MlQRhJN4xHe0AYlpFIVs/9zTMtkuO5m6aS6VV
	naJBuDqAl47Syyr6CNTFr4YeuffzXYjQMRRri6AKHAmhfhc/lLV+K+/IP/vUjAlo8IsqKO8HlJy
	xcRiRlWZ7WXk+/CIIKJI86t6ZkIcW6o8gknAV2RoGkscTMcPXF6+U+AQHkbJizW01PVcJte2Nw4
	o5UIpHu0VmZbg1ahbIrhhs4YLu7jwzajdIGrwTWAWK2zazjQuJ4q4=
X-Received: by 2002:a05:6808:2220:b0:4d6:90f4:48b4 with SMTP id 5614622812f47-5683cd802b7mr1432333b6e.54.1794296705267;
        Mon, 09 Nov 2026 23:45:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:43 -0700
Subject: [PATCH v2 40/58] mtd: rawnand: cafe: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-40-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234506_806588_9D1BA464 
X-CRM114-Status: GOOD (  14.18  )
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

Free DMA memory at teardown and clear its pointer before deferred
detach.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index f3117b031cd2..bcf7482410e7 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -651,7 +651,10 @@ static void cafe_nand_detach_chip(struct nand_chip *chip)
 {
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+	if (cafe->dmabuf) {
+		dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
+		cafe->dmabuf = NULL;
+	}
 }
 
 static const struct nand_controller_ops cafe_nand_controller_ops = {
@@ -659,6 +662,11 @@ static const struct nand_controller_ops cafe_nand_controller_ops = {
 	.detach_chip = cafe_nand_detach_chip,
 };
 
+static void cafe_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct cafe_priv, nand.legacy.dummy_controller));
+}
+
 static int cafe_nand_probe(struct pci_dev *pdev,
 				     const struct pci_device_id *ent)
 {
@@ -683,6 +691,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe_nand_release);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->dev.parent = &pdev->dev;
@@ -693,7 +705,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +797,16 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		cafe_nand_detach_chip(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +820,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +833,17 @@ static void cafe_nand_remove(struct pci_dev *pdev)
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
+	cafe_nand_detach_chip(chip);
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
