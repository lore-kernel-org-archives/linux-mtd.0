Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969C606A335
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fYcjNWpB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FxROmFhP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MtrISyGx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2AkW6rACMoQTsCVmeQ7ghJSVMiqBlr19DR60woiDW5o=; b=fYcjNWpBxTsZei1oLEB64pnJ/f
	5CKoE2SX4HXgSl43OZpeEUNGMjQWOAsRG+7V5VT2CEWx37YLFVFi50exa9MLrbdYzuyd6fE/r8gOT
	bPGhgGaGv95vBJMuf9l3vqKFPfqHvYL2tHmWMWS2JJr0bBCAN+hL8qX+XuYk0yn4pfyuXOFkGE/Hx
	OwJrxPLCQ2whKZJ/mhBhsQyTioc6cr3gjOfWqb8ICyVGdGimSXZwabNHIpjNL8AFZNB2U31e2j3AY
	E3HPwNlzr0sXpJin7uP750w+vmI4yPVlyDDJ//zsljDVYdEF1uaP56rVy7xBaSokDgc8V4Er+upY8
	JtoRK/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqFG-00000001H5F-3Doc;
	Mon, 16 Nov 2026 06:31:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEj-00000001G4C-0jzg
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=; b=FxROmFhPqS2uMl86FWhhrsZJFx
	v1RzUGgFw6l1sHy2M/Y3KA0Wbb6i5tPHFB2AmR373ltRJyg+Rfrx0z+swh6h1ovldR4K1q8QOOHXl
	NARWr5CwGEu3KXzWT3+Sc8Njyrx0EhSctsafcB6yrbQCZdFHX6h5HJZd6bDnsLlJ4awCf5LHZ4Xd6
	qI5OHRTSgttO/ttZgk6U1FaAziYTsGP14Rt4UWTw/DamN3GuIJFeIzFWeRudd/pJn3iWlmSe0+ldN
	N9Qao/CkWbCi6yKrGIs6vqcKRssPAWFDSSP0viTsLQHucnBW6Zpj1eG2MrWw6IpdFbCoK+wfQct61
	gLe2fcvg==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEe-0000000DPHc-3sQA
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:38 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-71ad047710aso1094846eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810635; x=1795415435; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=MtrISyGxqbihuZZbu2urYnGNhGvMTCh2JmdqScp0UoW1YHiNSnTg1JufJ+h0cGCd5T
         Lb0IO7PbcFF2juwC4E9isGHeX1tBorp59fJ5q1WUCW9ZSJejctW54tUsnA4GEPA7z1uM
         /uqWYYi/t8KM/cnxVAAWBmTd/MgYFRO67iRnoaNO/6mdp9GmsMaqY/vvItrDthdEjNug
         oquajkrkS/dR0b2oKUzudJ86ZXg5lrQR6RWwjPiHwwToNa/b4oro1sgfojUCFkyizM1a
         NnjMa8NEMFrRGKwGd4eZLHpuOMSiwdwjxEb/WbRFpNXwBLZ97GeNTM1g1t+YgHD73bO1
         WkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810635; x=1795415435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=gDrff5bGfDubFig5zsxphGn0TaFvduOXx1qdLlJ01MtgpYS3D4yN2Mja7ec2vkxiRV
         1PbO0+6PdK36fyVHpJpIe5pSZpgZsZytNFmK/gr1NBXQIC2CKSDr0noOZXmj1X1gpndi
         KH0/0TPB3OKM9YYapVG/MRIll+iUifQ7iKXU6JIr07CiodZisSP1solB1UUDYp6onxFp
         0lEo6iZPB8Pqq+PhGKDRbsBeO5odI4DP7+s7P+/C4/JpKcIMUe3BOC2sTjHKQNU1ln2v
         LNiu96mk+xLS3iPMMkE+zVac91ugNDjP5VZTzmsV16wON5/7bBu2OSb1YUOPgUERxgIw
         3Rxw==
X-Gm-Message-State: APuU4Z9I+rSauBJJ+UlZfl4dlAWM9vR3T9WbKeulvChTkUTU7WdBpS6m
	Ddj6KOGTB+MCRKS9eHjvNjA+31fAkW5EWsE8ZFyiv8uqGyghHqJOexJ1
X-Gm-Gg: AYBFou1W7sH7AloZfo1lKgL5rSJnO9YEUOPE6o86rCaPonblG+COPpMfYL9YAPTMHjK
	uEy891DP0V2LxcuAZpYKMkL+y5mz1z34I06pGeLMZBOnxfBy9okg1g8lzr3OPgprtaqAYbP5AC9
	XIOhZL0ltzZkPNUTLaBGXUnnRjnfZRFQhyJ2Pp2m9XKU5h413/JX8MKm2xtdL03ir5U5szijpy4
	QasBylya0fqgpT1ElFiv1SX9nzTCpBOc6jr09ZLVO/jju4oEPVmt/MIdUyH9wu0Jm5oQfpS0t+X
	NRsjhiayAxVDc160qzzvGQA26tqtERATF5Sax9+4pbsYgYQXT/oaxDMyu7g3iw2/l/BDIlLvgOV
	cDKucom3Z91esWWqVFyUCkPLytL4WsIOl+5rpeZYsXdImWhbl1fHoS8R5QjN9COhkQX+aFqD6K3
	KFP5h6cCW4TTC3Hm93vcfnGMb/K3yHivuF3DxRF4IcP7JvSmgb1nd/XM5a763qdVBs3awx9enrz
	NtvrjcW3n+bi1zWzHwLKdkotJiT/UWyQONq4kz19QBo+RrlG2R/uz5SXMg4KuwdxXXKbQkFXhOT
	Uua3C2uXX+hfcj2d09WhqwrJHtjxqcFg2XMAZTvE7XTfaeg/y2rUlxvk6QNHFEpHq7G62kb7+dv
	G5i9u6wLIaa8bHMOox/8kzxN3CeNooUkuQGTtlbDyrG13JEgZ0wHV4OLIHBGoNrfVHQfZI6bObg
	JG+zTYAwY8cVggG2uFw+HMJKA/SYZEPDTz+J/ndkiMD+2NgHcWI7/G
X-Received: by 2002:a05:6820:6fc8:b0:702:dd8d:316e with SMTP id 006d021491bc7-71ab4fa6f0bmr4749517eaf.25.1794810634684;
        Sun, 15 Nov 2026 22:30:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:55 -0700
Subject: [PATCH v5 40/58] mtd: rawnand: cafe: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-40-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063037_331921_E94808F5 
X-CRM114-Status: GOOD (  13.99  )
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
