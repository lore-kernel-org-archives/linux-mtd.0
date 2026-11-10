Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829F6077D00
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZoViyHd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSJP9ffn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ykCCczhupqKHfVIEWLSpblR+JvaMwgJmqktEtH3+j7M=; b=dZoViyHdHsOJge5WmrFSRHto8q
	hsWzk6kixzd2xT4yTakqZHXHC4jDVyVtTDm9BfGLZN9icWfEacA0QWKhnrYuKykoOxE/crpgkM8Uh
	lMW8FjBSHOJavZusUxbDPEBPUak+JS6cvoHld58J5SSITKNHVmdxYMUji2ToQ2zlhSIQwLLjl02kz
	XKjfrjMZDnd2UAnYYR70stpQBjZpirMD9/r+/wFp6bkWFeFkMc0UK0FE/BIEUP32KWuQ8D1LDsjcV
	WCcD1vtOBtg9TXvJyJtiRex2rmRBofy6GCuNUJlXYh3UbGA4bOkYCatn8qKbbBMXbpq583qlhU2uc
	MR2lUN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYE-00000002yDD-3uTO;
	Tue, 10 Nov 2026 07:45:54 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXN-00000002wrz-2YeV
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:08 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a76f63b243so1257457fac.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296699; x=1794901499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
        b=WSJP9ffnHKhMwNmLpb8sOC86mGuOe+Eo8Wk4LVtI/mTJ7f5uABNRqGH56pb2i6hHdG
         PeImJo6sgPEPWkzDfIpsp0upqvsTAa7U1iu2/ovqDP/QEDMHTDk1xxfWsCl74P7qEDOK
         y0G9jzCKTdP7WV5XFXiXknACImMNRAaE2sZTRrTnSAs2XAAsm2FlcsvQ//ofjZNs7ST5
         W2Ws+wi5B95Ex2+wR6qTwMHM3RYc1gI/I+DF97h07jK3kNvuX3i5VC1G4ivcQZYaFoOp
         13Id4HgRE87lh0dAVKYarzge/HrxOwGL7YRLfGBzzdCASuOH6IVyV7/ZIaQzSnsYtcvj
         veyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296699; x=1794901499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yGaeVaifk9LejzpVmSA+OCqgtCKl6gm08dCAtuGNp9Y=;
        b=GTyH5lLdEwvXtaNjYxlP6vfYEriq67Zb+O06uAxkQXLffrBRpx/FjyL9CBzdKZ2NzL
         8ELQW1bZ1tFulA6XkgfgtCkUbouJdqigPnezsFrlT0h3q38+SWaoa/JTyfMN1l4VksjJ
         2QU2BGGm9a0AHsb0cbm653jG/5WMvtTKzjyADu+w71vLmrhJLQltN7PYxWeh8JlyvXIT
         mE2lOfsJhlO+oq/v1xyOJj4rDWnNMUYU5sOIiTT6kfG4ZrWVdTVmMAcJyfA4c6ZmHETK
         4BwI91Z/I0f6H3mkmjvQ3ATwHO8umpdG4yuOUUKezuLUzkonDil9/P0xm+xErmt06M0X
         pAFA==
X-Gm-Message-State: APuU4Z90cs0pfHKvlPGg+1LsnTNtEA0Ov9hq5iWIJDVCZ3uDRC+WRsGQ
	YaYqU2XEVsgTv7RrHnuuT6M33sFk2rYeX+PRmPDBvbaGng2K8vPonG9G
X-Gm-Gg: AYBFou3/zFUg9bhMPCnK4PaGOXZLdVxSkfyCwSmwDUfRCS7uYmRgQhVVy8vHCsLAuyL
	yW2rAVtj8xY5AQTPy33tjy+PPJ9EhKxhd3k1UTf5nesE/OXDBWTf/JIMbkcJwRRIpIbEWSSEKHR
	7Z0G1RuRe8UCIzXaVqguRZSNCCyu2sdDsDxUz5DlrMAI1ooX3qON94xXBKX6xjWAqouMz0t3kd2
	GMy27dudtHda8EMTxwlZ8c2REgFnpW5o1KJPSENJ88Sr7KFHaR1XP83F72T+n0ImQiLr56gJgHZ
	nEjx6usNpptAg6fbpnaBi6q+PhqppXu831nh++iZ/73T1lbtB29oiTw+GdFVmefmeF+AlyLRl3k
	RhDeH6wuRQxuh4Xa7gHUCjqHz4QHvlKBQHggHBJN2OK2BpUVDbwCtyxelYt903KH11uL0YQnXec
	C7PiUkhjSEly/VdzZj74Hxi/CfyHlgy62MVcQVK44f4vLmVlZN5DcmYQXnuWrdZa7rGh/J4ljX/
	SsqpvUgIBbSQ52WawRbm9uxieJ1cWyKvqfS3LtqjnKFORX5VUOtfNcY6R3ikks2WTrps9+wgKBi
	08HmX0ur7aEk3YHdwSeTwPIcfx9XtUkEMPA986dfoXUon9Y89IPzvUkuPaSBObTKBa2mMPY4XYL
	Hd0w368KHSyMmrIkyHO2EyHz7Unz9QCOkKSQDH+XJXFM3fZKxG/MG9qnGd3vkN7fLXu7iMbXt96
	3jAuDRcG99KdYVrDCa+JGByuvjnD6gvgg0+6l2NcqMcyl7VuvBGtyXjeTuPoVdQkkBC34hp/Q2+
	A==
X-Received: by 2002:a05:6808:23c7:b0:564:3072:3830 with SMTP id 5614622812f47-56881290b71mr784466b6e.8.1794296698788;
        Mon, 09 Nov 2026 23:44:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:38 -0700
Subject: [PATCH v2 35/58] mtd: rawnand: marvell: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-35-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234501_836576_7E6C84D9 
X-CRM114-Status: GOOD (  18.03  )
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

Retain the layout metadata used by OOB queries and unlink before put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/marvell_nand.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b992c..f3967024411c 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -2600,6 +2600,11 @@ static const struct nand_controller_ops marvell_nand_controller_ops = {
 	.setup_interface = marvell_nfc_setup_interface,
 };
 
+static void marvell_nand_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct marvell_nand_chip, chip));
+}
+
 static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				  struct device_node *np)
 {
@@ -2630,9 +2635,7 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	}
 
 	/* Alloc the nand chip structure */
-	marvell_nand = devm_kzalloc(dev,
-				    struct_size(marvell_nand, sels, nsels),
-				    GFP_KERNEL);
+	marvell_nand = kzalloc(struct_size(marvell_nand, sels, nsels), GFP_KERNEL);
 	if (!marvell_nand) {
 		dev_err(dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -2654,19 +2657,21 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			if (ret) {
 				dev_err(dev, "could not retrieve reg property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (cs >= nfc->caps->max_cs_nb) {
 			dev_err(dev, "invalid reg value: %u (max CS = %d)\n",
 				cs, nfc->caps->max_cs_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/*
@@ -2688,7 +2693,8 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 			marvell_nand->sels[i].ndcb0_csel = NDCB0_CSEL;
 			break;
 		default:
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		/* Retrieve RB id */
@@ -2702,14 +2708,15 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 				dev_err(dev,
 					"could not retrieve RB property: %d\n",
 					ret);
-				return ret;
+				goto free_chip;
 			}
 		}
 
 		if (rb >= nfc->caps->max_rb_nb) {
 			dev_err(dev, "invalid reg value: %u (max RB = %d)\n",
 				rb, nfc->caps->max_rb_nb);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		marvell_nand->sels[i].rb = rb;
@@ -2737,9 +2744,14 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 	ret = nand_scan(chip, marvell_nand->nsels);
 	if (ret) {
 		dev_err(dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
+	ret = nand_set_release(chip, marvell_nand_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 	if (pdata)
 		/* Legacy bindings support only one chip */
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
@@ -2747,13 +2759,18 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
 		ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&marvell_nand->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(marvell_nand);
+	return ret;
 }
 
 static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
@@ -2766,8 +2783,9 @@ static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
 		chip = &entry->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -2932,6 +2950,11 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
 	return 0;
 }
 
+static void marvell_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct marvell_nfc, controller));
+}
+
 static int marvell_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2939,13 +2962,14 @@ static int marvell_nfc_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	nfc = devm_kzalloc(&pdev->dev, sizeof(struct marvell_nfc),
-			   GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->controller, marvell_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->controller);
 	nfc->controller.ops = &marvell_nand_controller_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
