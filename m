Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC96077D22
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pw+oC4sI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UkcaGpZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6iSdiQ0Fv6JA/Phyq4CEhe4apNVqLWJyd13HC94x+wY=; b=Pw+oC4sIoPLZnl9sId4PLAP4+R
	KAfgC6Ss49qvccxB2Hpq05jmDPyANRoiYYt1yjmMDiPbBVxSGCnAFs+fsKZB/2DS0k08OzG2UwctN
	vWpk/QJj590zXueYDi9W963sFxHQw2O32tSaZce5bgwo5QLiB2vKRLggJpRqeCVCRHClsliBbKY4K
	GI+xBcXAVAZkAMQKUTNVUR/ndEVaIJbHqVyCiMXgEqMNVxD+8EFhjYgXoAjQDo1q4Y2Tn3DYul87d
	IzeJvTpMSe723JRfPZrjcksWvRRzy9s7nW1bkqP5RzICUlaCKk4htELJt4NTJKI3aQSaUeGgAD1Oq
	YqrQVZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYO-00000002yTZ-1ut2;
	Tue, 10 Nov 2026 07:46:04 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXT-00000002x7I-3EsD
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:14 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4c5d8c7f326so681555b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296707; x=1794901507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ITdIqmG61dvK6QGLJbwRg5cuGN+2DrNLshk7y6XhhY=;
        b=UkcaGpZUM7Jme/4rMLOs3Rey7oRdU4xo5j0XIpqcYIAeS6+mZvMKzjUJc6Q1RggnuV
         vR82Lx9KbI+z/ah3qS0QAskoKJ2BTl8bUmFyz2aoDIbfIEqQxrQu5BWzozj1liIRg78m
         Vb7argh3GvGRInyl5eVN+84Dw/JGAcrmE8eG6AXXEKrBc8YW8mDwITQK+Z0oY8W4VSZz
         uUxbKpB4XFfO4e3HMrupTJYDUX33CULINgP1JquEnGQm3nAXTnu4Y1n0CXgRnQMOoV3I
         NAzc+Ju2ftqkHBmNd8wTUhiPOa+MdGB9x5Z7ttYLkwFHFIH9cEZU7obRP2yjW5JVI8XE
         Ni8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296707; x=1794901507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ITdIqmG61dvK6QGLJbwRg5cuGN+2DrNLshk7y6XhhY=;
        b=OWyJ9oZ0X7Mgbu05J+hvwXOpgtVjoK/2tpM1NrgBnd7qT1+YpQ0zbNXqQ9OHCeCRXF
         j5MQkcuBbKcE2dDaHkeMjoaPg50tzM8+O+NSoBa4apT/iLyZdU3/Ueed9pey3mHe7DHr
         Qz/FwO/AORbCp0Z2t33aOBpXzeRUXC1JXZTmMir0taPhFR7UcFO61TkGI+YmvL0NCn8Z
         GbNtYOGR1VD0JqLsaAjz0pAGHYQGnJJIbWcY1sbdC5N4Q//ohxjU4WXjkHJNffsxMy+Y
         9+AkPOwjqEr5ffF5N+JBrjbs4KxaGPI3GVm/o7oTiSxHcqxuBh5ExJ0MQyP+XvuiDNtn
         PgUA==
X-Gm-Message-State: APuU4Z84yNbjZasHO11grza5p2SEiNnBgS08/bJKzaAyVneLHHXyxqQ2
	M9NNf1N2xJIsKOPTDgNN9p+CNt773e5fZEZxMrEcFrKg7LUJQdnLgfQY
X-Gm-Gg: AYBFou2NU0Aj9O58/cakqqwmNWHuotI1v7Q3zw6+gxuCk1cHMeYZ2UpXe14TlRgV6+x
	k6YlXfvPbu0b8SRW0eALYvwUNbIRd58p+oCi0VRGRKcrCxX5YnVQZru07y7fEVHD/nWBvvEuFLj
	6nYQAsnSKcktL9Zm+agn0V/wQcGJHhZAc+rFv9HFL/9O4oLWQwOKN2XE9TKSGoGhj74zxKm6Pxs
	4xFcSKIsdbXZsoToAPwpNdEmAYlFg2lRdyHwmdtQtzhWXKaau4bWKr8sS7fTalFC8+vqp8+yj77
	gl5OPs4i8iqsE8YMuroK9kFGjb11QlZ20XgfBJDIlhc1p+V/up0ZdNfLgDOpA+XauJDyEsq+JnA
	HmZSv+oRawLnZ28qahGpuN+arNSOJY/YKVl3Tujr/1OXDLdEhZ4JO5WJNBNS6+4/8cnzvNFL7cl
	SN7kK9VQeAQxjkYkU6az9J9r9dGMKqhI+csZPmz078xgIq0G9/LDekZnlMmBlTCGXuC6z685WTM
	Y+AebO+iVAVy602BwNm2hfchn19Nrlf7uLnjTG4nid3bG5g75TqzL3wGzaNMdf4+zqq5DvSEEwk
	Cr3t2yL1W/WBOqTTEAq3lx/ZE6GBcK9v/Hoh2h2M7TgV5LUrb1CxiI3JLwINnScp75lwWp9R9RR
	XZqsxJ4WB3LrUZwg3b3/PfC1zEV47KoIPulkPKAkIPYW6vrdkGf1GFyjEL+qfAND2tFWlUuCuMB
	j9ohTCa12nI5e6xnNMBpNASm5YFUWWB7dOto1o9D+SJvbveOZLLSGkiaEWPyj4Yj/oBsbUvTCq
X-Received: by 2002:a05:6808:168c:b0:4b2:8e1c:5920 with SMTP id 5614622812f47-5683c7b6ce2mr1421039b6e.9.1794296706536;
        Mon, 09 Nov 2026 23:45:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:44 -0700
Subject: [PATCH v2 41/58] mtd: rawnand: brcmnand: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-41-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234507_957707_D1DB9668 
X-CRM114-Status: GOOD (  17.02  )
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

Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kamal.dasu@broadcom.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 72 +++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 4a1f5e736a1c..eaf0279518ca 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3077,6 +3077,11 @@ static const struct nand_controller_ops brcmnand_controller_ops = {
 	.exec_op = brcmnand_exec_op,
 };
 
+static void brcmnand_host_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct brcmnand_host, chip));
+}
+
 static int brcmnand_init_cs(struct brcmnand_host *host,
 			    const char * const *part_probe_types)
 {
@@ -3093,8 +3098,10 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 	nand_set_controller_data(chip, host);
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "brcmnand.%d",
 				   host->cs);
-	if (!mtd->name)
-		return -ENOMEM;
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto free_host;
+	}
 
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = dev;
@@ -3123,12 +3130,23 @@ static int brcmnand_init_cs(struct brcmnand_host *host,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_host;
 
-	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
-	if (ret)
+	ret = nand_set_release(chip, brcmnand_host_release);
+	if (ret) {
 		nand_cleanup(chip);
+		goto free_host;
+	}
+	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
+
+	return ret;
 
+free_host:
+	kfree(host);
 	return ret;
 }
 
@@ -3294,6 +3312,26 @@ static int brcmnand_edu_setup(struct platform_device *pdev)
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
+static void brcmnand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct brcmnand_controller, controller));
+}
+
 int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -3307,9 +3345,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (dn && !of_match_node(brcmnand_of_match, dn))
 		return -ENODEV;
 
-	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ctrl->controller, brcmnand_release);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, ctrl);
 	ctrl->dev = dev;
@@ -3324,7 +3365,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	init_completion(&ctrl->done);
 	init_completion(&ctrl->dma_done);
 	init_completion(&ctrl->edu_done);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &brcmnand_controller_ops;
 	INIT_LIST_HEAD(&ctrl->host_list);
 
@@ -3489,7 +3529,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			host = kzalloc_obj(*host);
 			if (!host) {
 				ret = -ENOMEM;
 				goto err;
@@ -3500,7 +3540,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 			ret = of_property_read_u32(child, "reg", &host->cs);
 			if (ret) {
 				dev_err(dev, "can't get chip-select\n");
-				devm_kfree(dev, host);
+				kfree(host);
 				continue;
 			}
 
@@ -3511,7 +3551,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 				if (ret == -EPROBE_DEFER)
 					goto err;
 
-				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
 
@@ -3528,7 +3567,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	}
 
 	/* If we got there we must have been probing via platform data */
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host) {
 		ret = -ENOMEM;
 		goto err;
@@ -3554,6 +3593,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	return 0;
 
 err:
+	brcmnand_chips_cleanup(ctrl);
 	clk_disable_unprepare(ctrl->clk);
 	return ret;
 
@@ -3563,16 +3603,8 @@ EXPORT_SYMBOL_GPL(brcmnand_probe);
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
