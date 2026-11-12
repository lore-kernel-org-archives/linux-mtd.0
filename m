Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855E60A6F6B
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2i+ZneFY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nk2KSeAp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hLxLa+rNkucW0vUMOsT7yVNDp7Cv0G6uY3pNqW7HoUg=; b=2i+ZneFYUIXODn24WAlyFMmOR5
	wtSR+4mllRZQCS4daXq96oWkTzObLMXTeTpnWe8DdcXWyAkdv4UKC8yH7WRhu7+8AXILY7iEbtjMY
	SXhup8rzBE1kF3op08WrCC2JXgBXWKWkATJvliv9ezYPbV+pwKZ6lnfmQ6CKBpvQm+SeptqLuyDDl
	ujKFfvow6Z4AqXgKzEJDcE0QC+dAAE2C5O/po5JG8cTQkC+vKXO1+EmsLbBwL7s17Ev8gImwnKk94
	MmTA546si6GHrU3+5CY/4Ts5tz4dYrEODV5dLJHSww8Fd9THQcUI9MntK/Hhfti1BreJ3zzHL2qbw
	zy36woKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcQ-00000008LXw-2big;
	Thu, 12 Nov 2026 01:28:50 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcH-00000008LGs-3zNF
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:43 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-567cb8f983bso1843291b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446920; x=1795051720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=Nk2KSeApa8gJyGVz9ITUsi1SXz9EJO9f5TPU6dGf+xLJ3OwwMpo1BGMGS6A4T1y5cR
         80gWszdMBfO2SvwQTodcHjcLcoOuXgcJwEBNdku/s0IfwrZizxe1vlm8JiZdzVaa2emu
         OOgqCRJyWGrcRL4PPP++mUcWzx0lD38QHMFcCdd3xIBj1lXmZCzKS17gv0v4o1SNJUve
         pAR67ZwFO0dkEtrQPkcA1Q+dcr0lgZihoyc2e/1Ywra9mYrAg6jwvZ18wW5mDFTnj27S
         JeBcV7sRTZksFxWPmklxiFroswXXjXmWp0hykgFSeB1Ihi73HcePpCcimUfBVowk9CRl
         TUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446920; x=1795051720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=Q8r4b5TZjnFqNP+Tu0XIxYCOImewJuwDW44j5uLGRwjm0zABoPEcQXET+gBriTrr2j
         FoN027h9qv1Sh9qwEPb41Omdvy8Y7h9G+uhQq518cmbu1iQOZqG5sbivnpMkQdDh+GsU
         38bQMCyC20o1xXN6bzlPHuf9EjufCIEXcka4PQNuIK4I2gFiNQLc6gyBzkCJbBzF2n9R
         1GPBU4ezljdbC9hb4ftpNZOOKMTf4DCoT0vha2t46xaZzCHWcjM9qOftq34+Hg7WSfo7
         /NI9ClI+dDuuiasdMKowj1rs75tOo0EjzH2Yo/vwXOhV/f9NQlddIiYKNSrBvXYqA/95
         6V9w==
X-Gm-Message-State: APuU4Z+ap7YdqWSC1O4BIpdUQdK+90XJjmH4wcHeudz//vL/a7H+eiLr
	fWPzCnmtF2HtoYvyuRZMpM8g1diO31b/v2SDdSFGd9XVkBoGdoZnYt80
X-Gm-Gg: AYBFou0yL0T+clUZoHGoX1umNiBW/kAznGNPGPJb6Ca13KjmthBp9+3PeHZeLuKPveK
	+pHrKLbEMUGBZgh5D1EdVhwLJWLio+4/PQ08umgpkK9B/qwL2tkrNnED1D+m8Pgheo2vRhzGs9Z
	n3Bxv2EUxLbaqjEWWPFB/TnQJ3eFLEBdETYD9xeqvqC0FScY2nRn7DxELtwNCp8aQfnwSV30ObL
	+W/mH9phh52DQGGBK+RsRGlYIJls5MVVr9p33Sm5s7DUW57dXYc19juPAkGeC+lUhTRYjXlF/6E
	bjE1xv8bebs4wyxroUGhDtzD+vv2vNOchhy0tlD+2kHq0k9cfEPEbiqp7COXMiSblfysHmSe2Ct
	USozj86tQh5HjHBAUX6GTrCAu3IcjpBWHZ1ID5NizNz9j7/GTXUqtcxb8YL5DMM+JP6aZaZqmbt
	qLJtg7AhQhFXir8UepmSRIEqdZmqjSJu8shJlf7CNB1EMoBs9119L12llOTtmIw14jiD6mfwB88
	pdoga0KsuOov3JDeImOwlOj824Qx99PikvXnRtveYMtUdw3vz7Y6jaOB5010G/OhdWtKvE3Q7OK
	T84tyxFkwoDh042Vp2iSBzZ4J4Vmk2t9byJE1K5/voN/+aYe2J06RG/JKk23SiUiiC5fLiDzYBo
	XjgosWsWz/fvXAuG4jigiPTbut5dluvslAYJ5+30Adxpj6nqETquSZC1itbEpTA1gUFTz2kv2aR
	sRS3/PeKfw32fC3isX4XW150drEcqBniHW1HuBCXaQjlTA5F01apZj
X-Received: by 2002:a05:6808:1691:b0:4e8:e664:f268 with SMTP id 5614622812f47-56b96ac9cfcmr3918949b6e.25.1794446920494;
        Wed, 11 Nov 2026 17:28:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:50 -0700
Subject: [PATCH v3 11/58] mtd: rawnand: denali: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-11-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Jason Roberts <jason.e.roberts@intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172842_167468_413F5BB0 
X-CRM114-Status: GOOD (  18.89  )
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
