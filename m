Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A2C606DF4F
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bqnvFDx7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AxUPetqH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5ATyUNkclSP2YjyiaLuBzF/ddluj7gGN2tovOHWFwm8=; b=bqnvFDx7G2GNFGvDzgQsQ6Oa8N
	10JH32k/9tkzvQACmcbJu/48JChx4rKq7o2yUTr/cSt5OBYHhRql/QZ5hChfo0DQp05QqETxFWO1C
	kLWhxybvO75ZN1XGvj9aXvRq7rEzYbEYI+uIsdYPWwBPJkNyTw+61Htaf1UbLh/uGj/R8owNnS+H0
	/5LTGFvgzreiGaB+Mzw5nayInfOeufY9oDmBO7MfYVrJ8rAbogAdfqCzMEw/R5/z3weQ2ckaP89wm
	noRAAIaE1NBLdGioxTsSaC9Q8E4HT6dhpogXRp1f3sH2i6s8PyS6qUSx2ZEOPKG/UzOeyFIgkOEaG
	MkxDYPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX3-00000002wFU-2sOS;
	Tue, 10 Nov 2026 07:44:41 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWv-00000002vwF-3Qvs
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:35 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-53dda625f63so1140666b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296673; x=1794901473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBjorQ9/iOTfxxDZxqvQ3932oKOZt1oFqCel4x70Msk=;
        b=AxUPetqHAEZgBjb/rPGLSAFHWbnlmLpGosgVtvKdlMf2eGAvymk6lTE4co726liztf
         uhzb8m6Z0Ifdsx+n8+XlKSMQ93xHEjZsvLmwK+0/hqYy6GPifp1G5DvJ2vvfMtX2a+Lw
         RkjnJhWXtHBsjJgXi4pMbVeFB/ydQIDqWvU/L4Pyf/7ltJSiZ5+eph06z8Rv0q4xSkCr
         w77tsmmUpiH4ejKkYP9BqWBMJHtfDj/hOoMt+bRFGGSxGSsbeG8+/VfKd9AyFmJ/d4Zo
         qHIgMIp0Vgn4fVfitsnD7CASc6kjgJWzT2bMeTHA4pnbNaTyV3NI1gSbwdMRpki1/TSI
         u5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296673; x=1794901473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBjorQ9/iOTfxxDZxqvQ3932oKOZt1oFqCel4x70Msk=;
        b=ydY8yKulCHMHNyZe9NlyatOwRe4hMy4dx9qQeQIL5NsjD8W9H8+mNWS6IMa1jLQ2BJ
         PB6bnI+b6V+vUoay1i0792vzx39tJI5uy5h2mwWxHpRKjE/Y2tAeZJXnHhMHAtnU3EBC
         wzQ1mmnKGRUGL590jGVeeYojf28SSenAKX4yB6X11VdGQXSzumKu8Sg95NTUcRcrlzxq
         Xgflbs9o19PiPDO3DmDXOf5wkJpnNQSpl8fUgW8TW7KlpZetIwVERK4cuDDxVRFYDGo2
         UB/dAHUzOga3lgH7pVWY/eM2b24rzbZzqFfLmQf2mUfUpUDclQgPLGHxVgvnNoLtCJ2r
         uuAg==
X-Gm-Message-State: APuU4Z/3lIaBHZRpMnQDl9g8Oe5CMDTRkBNIkDYaCwWv8b3l7pQvU4w2
	b82G2hRm/h6g+qD0OPtEPNs6G5kjw5DZBzGKJbpiwnthnQR6ZgZ7NIA4
X-Gm-Gg: AYBFou3ZaI/uot7nZewwgTp22tK1EPSmswfzVRVCsGhgrYEN9SuLZ3XC8bJ9pi1IDuT
	YHkKMFViwOMCXzwdhDtmml2j8g3JVd3EuTiyJHp5VHjdiwkBvbWisXnoazpCUQU+8HOFZmsJe/S
	IYVXVoveFeZQhcPW4yqmDcF7i4QX2TtxKjwdrgM96m45EEpqmzUwwAENzB3cqefDvNpZJAHrx8l
	CQsLsDEEd5UXZFBA3bDWMlvHEvccQ8wsg0q4CdTfz+vJY7Vaa+VbkoPKxB2w2yMUy39ZfEqjFFm
	gP1TloECBtw1XQwwjeXpsvJapV4/Bn1DO3A/43eAPsap+cY7mWYc4/tUwvVgBJQE0Ip8EgpuKv3
	6dxAj9sXmHinj45yeAvv9wCYOPtmihx8yZ2uqoSxKmnQGReCFbEZkIutrnqNK0OMPIPkpsGg96p
	7lU5wot10/5RPnaey5yVlRgJkniiIAWIevGEwvPytQC7b498OIqSrvKE31YKzfi1Erxp3Uk1p0J
	1NnWalJENtAiBkwX9HGq+drEXcXMg/VZKdo2Lt6CLIJsswW2zh5t/Utcq9+SHc7wOFBjrSdaGwe
	VokHsyRSRl2Km25DEPts9qARuUU7POoc9qVa32dZOqppUajrBm/zj3/ChJP2+y9bopjk23bi4Ki
	mi8oMLDOn8QoIEHF2WtpNlVHL6U4RGGweB73vjADgZE1kRHjtRG1ZHPF0elyLmR3RB8Ep7jpJyM
	T/EYTYQHblzsur+DYLvLbJ6lGTEH2d4uBKlBz6WHIKEKpXmQuSXmw=
X-Received: by 2002:a05:6808:c40a:b0:4fb:a7f3:4211 with SMTP id 5614622812f47-5683cdc8145mr1336190b6e.58.1794296672603;
        Mon, 09 Nov 2026 23:44:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:14 -0700
Subject: [PATCH v2 11/58] mtd: rawnand: denali: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-11-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Jason Roberts <jason.e.roberts@intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234433_915595_636D97C2 
X-CRM114-Status: GOOD (  19.36  )
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

Both Denali frontends allocate chip and controller objects with
device-managed storage that disappears on unbind even when MTD
references remain. Give each chip a retained lifetime and a reference to
the controller, and keep the initial controller reference until IRQ and
mapped hardware resources have been released.

Unregister and disconnect each chip before disabling the controller.
Remove its list entry before dropping ownership, and use the same
release path for partially published probe failures. Denali chip
initialization now consumes its chip allocation on both success and
failure.

Fixes: ce082596ae43 ("mtd/nand: Add Intel Moorestown/Denali NAND support")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Jason Roberts <jason.e.roberts@intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/denali.c     | 31 +++++++++++++++++++++++--------
 drivers/mtd/nand/raw/denali_dt.c  | 21 ++++++++++++++++-----
 drivers/mtd/nand/raw/denali_pci.c | 15 ++++++++++++---
 3 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index fa2439cb4daa..4525cec3cae8 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1176,6 +1176,12 @@ static const struct nand_controller_ops denali_controller_ops = {
 	.setup_interface = denali_setup_interface,
 };
 
+static void denali_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct denali_chip, chip));
+}
+
+/* Takes ownership of dchip, including on failure. */
 int denali_chip_init(struct denali_controller *denali,
 		     struct denali_chip *dchip)
 {
@@ -1192,7 +1198,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 		if (bank >= denali->nbanks) {
 			dev_err(denali->dev, "unsupported bank %d\n", bank);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		for (j = 0; j < i; j++) {
@@ -1200,7 +1207,8 @@ int denali_chip_init(struct denali_controller *denali,
 				dev_err(denali->dev,
 					"bank %d is assigned twice in the same chip\n",
 					bank);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto free_chip;
 			}
 		}
 
@@ -1210,7 +1218,8 @@ int denali_chip_init(struct denali_controller *denali,
 					dev_err(denali->dev,
 						"bank %d is already used\n",
 						bank);
-					return -EINVAL;
+					ret = -EINVAL;
+					goto free_chip;
 				}
 			}
 		}
@@ -1250,12 +1259,17 @@ int denali_chip_init(struct denali_controller *denali,
 
 	ret = nand_scan(chip, dchip->nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, denali_chip_release);
+	if (ret)
+		goto cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&dchip->node, &denali->chips);
@@ -1264,7 +1278,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(dchip);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(denali_chip_init);
@@ -1274,7 +1289,6 @@ int denali_init(struct denali_controller *denali)
 	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
-	nand_controller_init(&denali->controller);
 	denali->controller.ops = &denali_controller_ops;
 	init_completion(&denali->complete);
 	spin_lock_init(&denali->irq_lock);
@@ -1368,8 +1382,9 @@ void denali_remove(struct denali_controller *denali)
 		chip = &dchip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&dchip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 
 	denali_disable_irq(denali);
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8c822eae72e7..e75754bd6d61 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -81,7 +82,6 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 static int denali_dt_chip_init(struct denali_controller *denali,
 			       struct device_node *chip_np)
 {
-	struct denali_chip *dchip;
 	u32 bank;
 	int nsels, i, ret;
 
@@ -89,8 +89,8 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 	if (nsels < 0)
 		return nsels;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	struct denali_chip *dchip __free(kfree) =
+		kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip)
 		return -ENOMEM;
 
@@ -106,7 +106,15 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 		nand_set_flash_node(&dchip->chip, chip_np);
 	}
 
-	return denali_chip_init(denali, dchip);
+	return denali_chip_init(denali, no_free_ptr(dchip));
+}
+
+static void denali_dt_release(struct nand_controller *controller)
+{
+	struct denali_controller *denali;
+
+	denali = container_of(controller, struct denali_controller, controller);
+	kfree(container_of(denali, struct denali_dt, controller));
 }
 
 static int denali_dt_probe(struct platform_device *pdev)
@@ -117,10 +125,13 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_controller *denali;
 	int ret;
 
-	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->controller;
+	ret = devm_nand_controller_init(dev, &denali->controller, denali_dt_release);
+	if (ret)
+		return ret;
 
 	data = of_device_get_match_data(dev);
 	if (WARN_ON(!data))
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index f53df1b32dda..c39abe71941f 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -27,6 +28,11 @@ MODULE_DEVICE_TABLE(pci, denali_pci_ids);
 
 NAND_ECC_CAPS_SINGLE(denali_pci_ecc_caps, denali_calc_ecc_bytes, 512, 8, 15);
 
+static void denali_pci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct denali_controller, controller));
+}
+
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	resource_size_t csr_base, mem_base;
@@ -35,9 +41,13 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct denali_chip *dchip;
 	int nsels, ret, i;
 
-	denali = devm_kzalloc(&dev->dev, sizeof(*denali), GFP_KERNEL);
+	denali = kzalloc_obj(*denali);
 	if (!denali)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &denali->controller,
+					denali_pci_release);
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(dev);
 	if (ret) {
@@ -92,8 +102,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	nsels = denali->nbanks;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	dchip = kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip) {
 		ret = -ENOMEM;
 		goto out_remove_denali;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
