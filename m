Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5E606C630
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=otXW4W4/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgx/iC6r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YVScfpCl1q94on/gF3p/mnu8iJLO/TmWgcfstp+p6W8=; b=otXW4W4/V4u2z3g3jJGrDbxwJm
	AXhEQf8Cy4gJNSmwsXQANFKWT7Dbw2CkieQrehhMWHcg0Bl/yo8SUqoD6G55AdI90S/N8k8keAfFD
	MRaRf86kgS0PBeH3eeDC0cLYepOt89kMI2Gz6esfTp8j46d6cyTDKBhqYTnLeYNpIRZuTKq7S18mK
	mG4xLgC2x8hx8xKvYp/nZNu6WAAAMnZ0POl4P1s1Q8SG9U75LAE/njWASInMTaqalmSbG1cTcyrc6
	PVRyRW7sm+EdC95XffbXaTZuyT13vl1Ckeg0gTiVEaMl4RIXAdb8msLQLrHhpTeEG7wtR2EV+lddV
	s4HnV8zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXE-00000002wbR-2AK0;
	Tue, 10 Nov 2026 07:44:52 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX2-00000002wBY-0YyD
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:50 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-567cb8f983bso808167b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296679; x=1794901479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=Mgx/iC6r6SHxT/0mxjOSGDS57RZ8N6Nl2F8ALS+Jo4k43Ph4nISKKkXsJGUtomcmAl
         xUL8SX+vhRZ6ZejjmdR/LQ01tI6VpINczd++7kD9GsuWzI+VQDTwppWmoVBbrBiLCuDH
         Z/3eZx0lzcYsOEXZiRZ2mnV3hA/ZBsPY6RGnFybNFy9l7/L8Bjy0INge9ktfUtakWFeo
         Hi2+a8dW0lCCM9IX7Oi94AG1gGiYdp50YHaHK2FRXlf3qBfp/CpnFmyeodYfaST6W/V/
         cVSe0lOhBVS7+O13OmDpddy//L5Pz3d3Inm9K03tX+jnAh/XV1Xx7qHBg/0Fgn2bQRC7
         TShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296679; x=1794901479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=pfF50bsjx5NzYLLW0Rlzt25pj7GL7+Hu8gmz3PbENSkFGssmUwwN5TEdqHz8WH+8AT
         nwyNK4tUusBX3CykNgk++1tslPJMxM2G6wu0XzOcDLrSvWS/roYsc/l+NRUH2PAyjzh7
         +pdW7phAH7i/yqPEj5JJpubnTiZ3jGsdN10791eMqtFXbCX+5vZFY86pOUUIlt+yNfyc
         J77YkxPEl0RubUywfaCsvDstYHx9Na8pj6LY1ervlXLMimg628X+g/zMiC9zMdI/q2Cc
         sQidSLgaNKQkvL9aSV6cQiOjLQyEIyURBamcZZNoEeH/nVHRysjoR0jLytLmDtgMpO3c
         Ky2w==
X-Gm-Message-State: APuU4Z8za1vg2Dk6FQx6FUNoUgai7C88K2U43NE9bpYJ2DxVLmmldS6+
	w10JcPbJXs+XT6PWeaaIbIFljTR1VAoMZ9QI9Muhs7q0m7h5DOVCw2jR
X-Gm-Gg: AYBFou2Z8Cnu7B4ZyUCDrB5USOz/pd3yCS+i7JYQERoprjJiI5eFF+TlLcPDN9gKthu
	BFyKgPCshcOGuYLyvL9xz25DxcfqYnSB/Zm5QlEE3aGQo7YfaAoHjjzzX3Ti3izSAnriKijmrI8
	g4ynmSQj8ALEfWcWhiZE1EeBGPqBagTHeIIjLvvNXwB+8Zj1g3/syKdZuFX6TrYj5T5fQRPwAyM
	BPniA/wh++q6S5ETx6RDyCjs2K1lpEQgK9qNWq+7czkIRzUwMwIVC/54lZ79VRQf2PBqB2aRx9o
	Q2eMrz6XL/RPv16C61+u2MVs1Pe79E9C0IdsNEYt0jbTGiQzl1Q+5FdYaF3T2eDvcBdYEE9oK8P
	rri1nvoxx6gjGBG7HzS4nAWOqZveZBv9uH4gTWoWCM//W9x7/8k/ou+Wdo/AdoacByoLnGODebN
	tYkw55clM0VoM1BN8ckiJZaNJLhoBCr5kWv+uQuk7pLCRHZmQz/gZVPXFkEWdlmfz/GWws4wUet
	w8IkXAJQUaei1lBTLqK/BailzgA/z3KjxMeG29X1eaPuo9oNPjpQ7JqQ4ZmFEiCP+H3xje6Rb+a
	7thzh95bNpbk6l2kAIT+c4ONAW6XJ/bFfaLApybe6Iu/8JQrH/y+b1mwjBzp74QwNOkTVdxTKQI
	WvP8X9283+w8WR/rSCARiflW5TvGPC8ifGXuxmCAyx6kkxTP3FVbG1Ft+rjDclX3AOa5JAcnkqQ
	QpUg8OiC4VUkBY4/27UU3wFh8KnkR+hXLkqH+UbG91DcCm9G6LI/jotAhhZUw/WQuiJ2ZQPgIL
X-Received: by 2002:a05:6808:c1f4:b0:54e:31cd:dcd2 with SMTP id 5614622812f47-5683cd3d902mr1873142b6e.44.1794296678725;
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:19 -0700
Subject: [PATCH v2 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-16-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234440_221707_A307B184 
X-CRM114-Status: GOOD (  15.89  )
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

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..bdc3d1519631 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1336,6 +1336,11 @@ static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.exec_op = mtk_nfc_exec_op,
 };
 
+static void mtk_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(container_of(nand, struct mtk_nfc_nand_chip, nand));
+}
+
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 				  struct device_node *np)
 {
@@ -1356,8 +1361,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1370,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1415,18 +1421,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(nand, mtk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1457,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1504,6 +1521,11 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
+static void mtk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mtk_nfc, controller));
+}
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1511,11 +1533,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, mtk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
