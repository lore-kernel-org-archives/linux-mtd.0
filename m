Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E625606DF36
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E7ApKMcG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Y6zE3U4d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBwN7iJR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6alxSsO37W1+QJoMvRQoT/qj4pGYi7+jYRXroMsjwTQ=; b=E7ApKMcGCmx5cSPUeR20XFEyUx
	uO/r6zs1m5W0oPG/byNEbMEKV7L+rvX0uimlW3/LhAorDfjLPHSO6zKh7zTNADMa6max35oS6wcDS
	dP777UVWtMggYxjo5COqZjaQH/jFgPCgZWH6Y5tbWP/MHnsRdzFsPeqQ/+oSqCZFMHSomGRgxWWbA
	79MfkzNdpVUY4ERayaWsDgPprHv8Medjr+Thd2YZ1dmcDkrFMJwl+/i6BzaiTtHPTcAXfVXtheWNf
	hZCFKqMx8Sv9K9423A3dTnzOulbCz7UrzkO+D1tclRuSzSq/waLh/MToZWqje0196Jdb1lDoG/qzM
	hifbEi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXU-00000002xB7-2nYg;
	Tue, 10 Nov 2026 07:45:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXJ-00000002wgL-0TbR
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=; b=Y6zE3U4d7T4ogZTehLZSy8CbAT
	XFANt7+UjJisw905caMcz+vGL7Tsna9O5DNJ7zMGqdzrzGy7P8kCQa2pjEAZbrzgYfvw4Gyw7b8Cv
	VsP1aLZmu9pUG2AQ01L0cja/8dlVQfbVa0WeJjNh/6GcJT/aKbyoM1K9Uk+UFR3daftINL+v2wqZ5
	t/vcHBLpKeveTWwFJl/iMdraTxm5X/zqsFWDWCP9xHUgnykLEdHDdC7vtxdRoaMcUtWWemIMJySV1
	oUMxUiJ/H7y6LSKMKGLTMGFaBQoi9GIq4599IwFTeW6HSCCgRJTZLDElo1k5+MyQQGfYT+weoRXY5
	/6kUrAFQ==;
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX4-00000007dzB-029N
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:50 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-84a248254f4so929892a34.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296680; x=1794901480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=;
        b=cBwN7iJRWdHNoYTytwGjePCD3rx7AkxTBuZGeQHAJxcVnEdwPK9GvTZDrt8eOQcV7u
         JoxViNqKXeBumfvAq/h0IWLTrvP6Nvv+hRv8/MTbo4q5DMsnw+SElXiT0UrTRrYKgK6Y
         fhePosh7RTE4e72OAu2p74UQ7pVXeAQzlLjJyH2lOOVr3AIyrNe2RE8c62gJzRlksiNZ
         HNNXVy3j8meKJfYWYhBXeoiRQT+PUVMR2IAvCnhJeIMbyC9P/WO9Bl2ZNm1/p5LglIP8
         IJZVfHNPZlHeg3CvV7bOZ4x6H/asgEyh2yRbLMCMlcssA4chqPYmgQXYGiRvsz2A0XM/
         nfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296680; x=1794901480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnAS6WOgFuGwDjvtZJG6FbzuORG3Gs7qMjpBKDa9+4A=;
        b=K3Sgv3T/3MaPxebzXnVy+EdZUOMHvsOQbhdWZynPReXQIMD4aI3KNyebROlg7YyEII
         29mN86UX0DeUuVbcuzB3fwaLjA9+vxKmIgixFpkyrZzwzkN/of8Svu4Mog228NqB17FL
         mIPo6Fng+pA1aNafBZXwjHSjhIXdzoX6d3wJYwkSDgc5lz5i4Pbsfwfjd5arx9vODrmg
         8nYco5cMhJn20yaOSdKXjvhbC/XtwAR3/lSkozWZ9TkWP2cOzNe+5EPxUriPbKKEKwDI
         vxNe2L7mk0LAIuPwxM6+CBW/84ylu0Rz12N9WTqifVwxarkTEd3o2qZWV76QylxsRyIt
         g13g==
X-Gm-Message-State: APuU4Z9e1AGplDpQ0rZWLMOexk/NVf1NLUI4a6DMZukyYmdzSnLwI6KM
	rScwbFx8zQeZUXq3Ij8dUUEKsgy8S8PGOXKoo2zxSIl3K9einiNVp9Ze
X-Gm-Gg: AYBFou3vP3TUvuEhboEZbe1LIwuk3PhHNnL4/M0DnowQMDRLwqNTT5nXbMXV0UDt0Tl
	YGlwfd7E1kI2nbDDxFiDBRJdcsKpwX920tfuRpy660L6ZIW2uOOMw7QFv5UBU8EyIj4ElqkogFo
	HraaE+SwT+/Z+CkAAt9ylyE0NmMx2V1qtzW3weYWif37H0Ol7jufvEXV96UNJ2cOctY4aKw25V/
	g96Ooyq+pHVFfPKI1sEeQYu/lficTGVDHOFjAPTZ8uPnET0yehmnb0Wc7YIeFE/nnazd+SuELl+
	ZpE+QXH/Zzo9K7L0tV0rRLz+g7iJDQTEflxqT1rm8xndIsi4nNz4ULPXl2w+xuGvRsto6E6UBmk
	3tp6fGTemTNrv37IQf1U49bYx2daOqUW9wyZtk/4e+CJtpR/AKRexhbF13pPfsu0iLEOqBitK4T
	+U8WsudhJo70yCsFbohT9dHFJNt/u0hMohGSaJGtcmBUAzCYdnq7qI3gYWt6n0eFeVkFK89YBmP
	ferE0HbaOGyC0nQlp4T00JHnJl8zZ31aZvhnN3OW2dp72RKJKgK/JYUvQ4c3S0sfc9WvImB6/li
	sTiedcVI3U75uALBQUlu1FDR0IrQXTc65wEy3VrfEagbvji6ZAn/f9jL/5FkTq68+wWiB8OIRTU
	CoWIVURMfuOZ9JJBcZacvwaI5/+AF6UB18YspvL/3KJd61YqOyUSdSYa/W70SVOvxZaf/Sz2+rm
	ifbcz2PRCgGdRqo3QBqUz5L8mIr3QRnXAAlh5xImG9/blR63ylt8g=
X-Received: by 2002:a05:6808:3505:b0:531:7f68:842e with SMTP id 5614622812f47-5683c73b48dmr1413961b6e.8.1794296679771;
        Mon, 09 Nov 2026 23:44:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:20 -0700
Subject: [PATCH v2 17/58] mtd: rawnand: rockchip: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-17-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074448_703316_F9DCE9D1 
X-CRM114-Status: GOOD (  17.74  )
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

Keep chip metadata and controller storage alive for retained MTD
handles. Disconnect each chip after unregistering it and before
releasing transfer buffers or clocks. This also lets unregister
notifiers finish using those buffers before hardware teardown. Free chip
metadata on the final MTD put.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 49 +++++++++++++++++++------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index 9444ba02696d..aa31457390cd 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -1115,6 +1115,11 @@ static const struct nand_controller_ops rk_nfc_controller_ops = {
 	.setup_interface = rk_nfc_setup_interface,
 };
 
+static void rk_nfc_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct rk_nfc_nand_chip, chip));
+}
+
 static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 				 struct device_node *np)
 {
@@ -1134,8 +1139,7 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	rknand = devm_kzalloc(dev, struct_size(rknand, sels, nsels),
-			      GFP_KERNEL);
+	rknand = kzalloc(struct_size(rknand, sels, nsels), GFP_KERNEL);
 	if (!rknand)
 		return -ENOMEM;
 
@@ -1144,17 +1148,19 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= NFC_MAX_NSELS) {
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
 
 		rknand->sels[i] = tmp;
@@ -1179,14 +1185,15 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 
 	if (!mtd->name) {
 		dev_err(nfc->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_chip;
 	}
 
 	mtd_set_ooblayout(mtd, &rk_nfc_ooblayout_ops);
 	rk_nfc_hw_init(nfc);
 	ret = nand_scan(chip, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	if (chip->options & NAND_IS_BOOT_MEDIUM) {
 		ret = of_property_read_u32(np, "rockchip,boot-blks", &tmp);
@@ -1197,16 +1204,26 @@ static int rk_nfc_nand_chip_init(struct device *dev, struct rk_nfc *nfc,
 		rknand->boot_ecc = ret ? chip->ecc.strength : tmp;
 	}
 
+	ret = nand_set_release(chip, rk_nfc_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "MTD parse partition error\n");
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&rknand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(rknand);
+	return ret;
 }
 
 static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
@@ -1219,8 +1236,9 @@ static void rk_nfc_chips_cleanup(struct rk_nfc *nfc)
 		chip = &rknand->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&rknand->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1375,17 +1393,24 @@ static const struct of_device_id rk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rk_nfc_id_table);
 
+static void rk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct rk_nfc, controller));
+}
+
 static int rk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, rk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &rk_nfc_controller_ops;
 
@@ -1449,9 +1474,9 @@ static void rk_nfc_remove(struct platform_device *pdev)
 {
 	struct rk_nfc *nfc = platform_get_drvdata(pdev);
 
+	rk_nfc_chips_cleanup(nfc);
 	kfree(nfc->page_buf);
 	kfree(nfc->oob_buf);
-	rk_nfc_chips_cleanup(nfc);
 	rk_nfc_disable_clks(nfc);
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
