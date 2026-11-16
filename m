Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F60960A2633
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oV4rudwW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Jr+6eqUE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwiBFA3g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hLxLa+rNkucW0vUMOsT7yVNDp7Cv0G6uY3pNqW7HoUg=; b=oV4rudwWc6D/fQ8Y5oBXQZ8TsK
	ZOK5SqCLXnjdFzUsBB+yBaVIu7Un24OJ/J+MJQXvoJYNWt0BbT9A54Oauv0keg1d06SLIuViJiWMH
	Sk+EkDETDl2B6wjv6/NXPgt8sPm/DG0ufEuME8H28t24iTHx8OxZWuMGC3niMywif4Y/Lgaaf0X1a
	t3hTnrQEVBThs0tyCh1lAQgNurKdUjXfjpYUqrl3+Xuh1cheQT9DoR2loBEehn/3qY65bQNT2XJk9
	AUUL2CYQUHB8R2Ui+vd9YwqGCi8FL8473w+K2ca3xbii3GV7S2sKCOmZs7QVum42hApihbQi9dQxl
	Ted7x1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEG-00000001FI4-3OL2;
	Mon, 16 Nov 2026 06:30:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEA-00000001F7d-1Eco
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=; b=Jr+6eqUEU6hlyjucgUo1nYcj5Z
	1iWu2ZU/K8lnXs45spmHJax3bSb/Ypu3vUk1wJzC16XHSlgtc+u1xwOmbS1OhZ1XMjLxkxvK7lj7u
	Y9rvO7lOwwA3TclPF4M4S8zkVEMwL9s++7tHkYICqUBznfsgsliaW5s5Fk/uilh938cBYVPZ/wvzd
	L7PGpT+UooaKFH+heX/gMzDK5+lYYNoDpsHc3rXrPDZMmjq74D65O0ThjFqbhLsqsvVbGScUnJhxU
	wzgXrz00YpbkYH9SjSOcB5CFRjG/KbvRsZO73Y++jNhYBZU2K2sZny2us0+MUP+DnnyXTwgTvRBm+
	vPmbu4vw==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqE4-0000000DP79-34Jy
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:04 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-71ab5e64742so2622266eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810598; x=1795415398; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=DwiBFA3gcTlYv/opS/XcEpELvkzmqRkgc/jcMToHaKifOxk2St37OYYupqRZEtY/pv
         ab+ZIn3XTkhRdFg/8r6hF+vAa/fs0Ikqfe7i1DvoIyCQiX9aLTjZCVZl6HgHgjINBQcd
         xwdkwzJwyd4pZUJ9hbz4diBWThwAYIsp/05hj3RaGdnsFF6fI9c93+OUq7bJGYVu1SAT
         gNV4rVHwDRc7+UJ8Tu68cZKDVr2BGtWbQNPaMuM1kDDH91DbRA/J7dPciWtvWgozWq53
         C7akf0nireXhOCW+E0XiaJYM1jcRmmJyTH4nKgItApnWUM1HLCmIRjasbGL6KZQfuqf2
         WMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810598; x=1795415398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=Q/SQuLq0QjDCKslKk7PU0Mu4BmI2GBI5nMg/bsPykpgjHcKR6ucqt+Ia92I1DxWZMy
         hLpMb69vw3EaoKzZ9xPZYzp0D7/e03/pPHW/UnxcKq+SPYJuayzkGEZxqemjzbe3Lr5k
         ooObb2Ku+5RT27mk+aeIsjQavN22CjASK2AR5VvpkZPty5oPm3M1hIkxHu0z2DVhk+yZ
         HLCl/6+5Z2SFkwDWNqFsQen9d/pKwMxDZubR0e/grE0A2YjLGwWq2A+oMF7P0nOjQFH2
         i4FNTSKm6v3+GQyF1ZZpMVL9eC3v32knXdtGkEfSPulYuqDvzVHNEMjaRPZJ8FYJKCcC
         Kqww==
X-Gm-Message-State: APuU4Z+/ocoNR+NF2KFE5seAOTtIH7/TFATfCviC2rChVx0Tpiqbuhfx
	ThY2jtN1/HJetuFHsHpH0oFfmZzG+UYH902iErhOYP9W42W0HA19Ra16
X-Gm-Gg: AYBFou1qt2wwJN785EyPKCUjnAuaPrCfI+2ufFtbP3/ypqQ1CUN8fTlQSHuYvgS9UWl
	cCMIjJyaqhe186I8+K54qucLgGk1TRYGrQgei0gBq0FMFBfkPRu2GxxF1R5jcorCYT4XoPFkZnO
	N3Otu8lzz3PyhnnSBFYPNf0wgMbIH18pbpARmAhAaV9C4HeKPEED33d4fbcK7s2xcy1rvDYTvCM
	/1r0FA2h5K1MA7eSIbYHbn0n6CaKVsNU2iA7fey5KqXYhKCHdQ6bR3QA6rWsFAcw2IzzUxLEpuQ
	E6Jfou2BWAjn2oy48nb9/+GKnol2/uc8LufECg2qgHHjNt+x2THZgn+J4pZ6yLC3tlmtJUMi6qL
	bjRVRi+llnRGuxcF8UJvS8BHzSV5oMiQ+PL4me4nYbO0i7Fiv3K38X0aYPXKlKTvLlmCgPxYxrB
	xqyAq2Uozo94JYVq7D5YrQd4izB/lpSb7AUAUBVE8bVNHK9meCK3wM+cSrZoIMuuQw0E5bgzt9E
	vqxVtlw2GMZdMnm9bR1MnT9AcsJ87aLgBegybIIWgHSXOA7AdoMdVURqYfX7INWmGmx2jd4Vw3G
	Xms10F7D/q9KYd9WN2JxeA70jfG5P/OQxO2CiAmb0bpqA21r2EQk+msaq5bATgOaTqR6LVlYEC6
	V+7cgx6K1VRK040JNLCGqTLNKMYg2CCSWek1UUcKNyOxDJFVPdHnH6Sf5dmsXFkn7h1MqZl2W7P
	2l4bDMbje0PUJcLaw9SlfkpQS+kLWYIFrC2faBeIdMGjj9ad/+iQ0=
X-Received: by 2002:a05:6820:570b:10b0:71a:fa49:2f33 with SMTP id 006d021491bc7-71afa49313dmr331313eaf.41.1794810598414;
        Sun, 15 Nov 2026 22:29:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:26 -0700
Subject: [PATCH v5 11/58] mtd: rawnand: denali: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-11-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Jason Roberts <jason.e.roberts@intel.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063001_055704_E43C2B79 
X-CRM114-Status: GOOD (  19.42  )
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

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: ce082596ae43 ("mtd/nand: Add Intel Moorestown/Denali NAND support")
Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Jason Roberts <jason.e.roberts@intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/denali.c     | 26 ++++++++++++++++++--------
 drivers/mtd/nand/raw/denali_dt.c  | 13 ++++++++-----
 drivers/mtd/nand/raw/denali_pci.c |  9 ++++++---
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 9c07e4e25a27..098b00724bee 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1176,6 +1176,7 @@ static const struct nand_controller_ops denali_controller_ops = {
 	.setup_interface = denali_setup_interface,
 };
 
+/* Takes ownership of dchip, including on failure. */
 int denali_chip_init(struct denali_controller *denali,
 		     struct denali_chip *dchip)
 {
@@ -1192,7 +1193,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 		if (bank >= denali->nbanks) {
 			dev_err(denali->dev, "unsupported bank %d\n", bank);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		for (j = 0; j < i; j++) {
@@ -1200,7 +1202,8 @@ int denali_chip_init(struct denali_controller *denali,
 				dev_err(denali->dev,
 					"bank %d is assigned twice in the same chip\n",
 					bank);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto free_chip;
 			}
 		}
 
@@ -1210,7 +1213,8 @@ int denali_chip_init(struct denali_controller *denali,
 					dev_err(denali->dev,
 						"bank %d is already used\n",
 						bank);
-					return -EINVAL;
+					ret = -EINVAL;
+					goto free_chip;
 				}
 			}
 		}
@@ -1250,12 +1254,17 @@ int denali_chip_init(struct denali_controller *denali,
 
 	ret = nand_scan(chip, dchip->nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(chip, dchip);
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
@@ -1264,7 +1273,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(dchip);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(denali_chip_init);
@@ -1274,7 +1284,6 @@ int denali_init(struct denali_controller *denali)
 	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
-	nand_controller_init(&denali->controller);
 	denali->controller.ops = &denali_controller_ops;
 	init_completion(&denali->complete);
 	spin_lock_init(&denali->irq_lock);
@@ -1368,8 +1377,9 @@ void denali_remove(struct denali_controller *denali)
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
index 8c822eae72e7..9abe607fc7e7 100644
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
 
@@ -106,7 +106,7 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 		nand_set_flash_node(&dchip->chip, chip_np);
 	}
 
-	return denali_chip_init(denali, dchip);
+	return denali_chip_init(denali, no_free_ptr(dchip));
 }
 
 static int denali_dt_probe(struct platform_device *pdev)
@@ -117,10 +117,13 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_controller *denali;
 	int ret;
 
-	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->controller;
+	ret = devm_nand_controller_init(dev, &denali->controller, dt);
+	if (ret)
+		return ret;
 
 	data = of_device_get_match_data(dev);
 	if (WARN_ON(!data))
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index f53df1b32dda..37ef153ad8d8 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -35,9 +36,12 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct denali_chip *dchip;
 	int nsels, ret, i;
 
-	denali = devm_kzalloc(&dev->dev, sizeof(*denali), GFP_KERNEL);
+	denali = kzalloc_obj(*denali);
 	if (!denali)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &denali->controller, denali);
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(dev);
 	if (ret) {
@@ -92,8 +96,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
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
