Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56560A2603
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EobTf18H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2Cmy8YD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hLxLa+rNkucW0vUMOsT7yVNDp7Cv0G6uY3pNqW7HoUg=; b=EobTf18HDGpcjm+7FwnEw7pLob
	PKuCO2JbPIPOKMAYsGniCx0D7p+8YkdUOE/kmAckcnwXq17Ep7FWNrqTWuDcmddZbrz3l5bYPVNKr
	yHTGBfhBD0FG0QoZts7eLgLRkh0BvZ7wAhNA0TNM3ANsYDfjYCoendUpoG1ni8jGJ0kz84pMK9iA0
	PVCTGRwz4kmHojMw2kPwM+YKPWiZ7GLLfpHWbKeNfjB3XyeQVL9JRcW8BYMG2wzaDZ/Z8VEoYl0GQ
	5oBEzecS/Mq+pGEXzQ0sj7X9tP67/a8RzKW41TUBxisQz/mkH4O8gyeUZiNTQNvFzOHm5zHZvGNLX
	Ec3vBjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoM-0000000Dr15-3E0j;
	Fri, 13 Nov 2026 18:15:42 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo9-0000000Dqg1-1O8f
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:32 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-7190d9bdb2cso1587916eaf.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593728; x=1795198528; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=g2Cmy8YDVsNkhVRuRsLpZy4T9Hxymc15o0kXh6piBPDrHXERhbdYETP2W5sd/jJxaO
         12W7SYV6aLnWPzsh/XASxmTDIMGTiVZjNVEg7FwqAAebo0gI3fFJsT6QVAyP80Z3p3A6
         eoQqhcWNSdRPNKhNIITfY18CS3WPTK+jAyd5eWiiA17XypHjff7/8ivK2uzImkp+XfDs
         SuV33HTKNY5dC1gaSadUkMilCqiGBVNK5Qdoi8hcA28VjZIz1lpEzKiRlSeMnRlKN1lX
         gAGkTWbFckfTeTsdqhWwm/hELCfbu4MFQ5VU8+ArCzRvJnra7bdzFSgWlreWCWF6cxE2
         apkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593728; x=1795198528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHvS6tob0EK4+l9biWcyRWjZDKOHPkoH6ye4ScNj4a0=;
        b=o92lPUoDEXr1v1Ooj0GCJ56fUwlYdaqn3MLAMsMRRvtGTlD0+CEs28h/ytuQAxguGn
         qMkCwOkwChKS/qen25E37/slJ/k/Z2NQ3FzlPeUQW+6DyHOBclGE3Imw+8+B4BtBYDdS
         HeZ49/VtIxqWBwVakMo9YlUJck8XaqSW2EW332Z6hXjfDTcsxs6uExJXKGpd/x8XAwiu
         nf/UedxfrIojcZ+fNr8JlP+Kq7pBR6buEIbv92l4T0fhGcnlemonPQvgHt1CSxXEaUIi
         RMxuRKCY4RYuwAnrjZn/zny0ab3YzuLbniOl4PEvMlBEn4Dl+IDnvTIA16+fyxzY7LI/
         XpgQ==
X-Gm-Message-State: APuU4Z8gVRObbppsVP23O32CzLhAuMk4OOTHt8QVK0uIBQW7aTV8XiWL
	a1/FyjOb9Nig/Rpr9bdkf1U3ytq0QHngT+MfsmOOZh5++ltCOtZ8fk5m
X-Gm-Gg: AYBFou0IAYG7NgQo1z0H9Y3eBtanG+FUezzL45onA8yGkzzWEbBUxANO4fp4ONEtu0k
	zsgeuoCxbLKcf25Ge2cEi9I5bF2iW2PCMOtAkyESyk298R4JjyVjVmx//rYYHiIL2HRYt9dOYcN
	2n8TLlj1o4RUw+DWzp3qY7vopqo7hF5mzcTnnLtDjp1gK/gFuh8Zi5JQ+8JgtuDbehpM83VJxdj
	qaqmgx4Xc0O8zNN7lXy64H68I/IOvQq6UVfceHogo/yzef4WNZVB/BSw/w+WbFsLR03ihiL9aaY
	lXsdHk8c+OcnegVrUWlGsabH3VcQnjEI+vPLj6cP4ZTxck88FgebUjNW5/Jd9N23TJIreYVUd+v
	o7n2I3LGnqWaxwpAxCbf5dwLH/ozPEHUQWI5W+IQf2FPOsgBvASjaS2UaeJJEeFiyp5ilxZwiry
	G/MgLiDOQkhDeDgS9GTR6Vj0kX2bun+K0eDGKppBR3wx2/rS1+whOX3w3O9FLoXdc2NiVav7GJa
	yqRN27laz+UbnzeZGjoQrIMpe8tNJPLGKzroB/acDvKxfsMQOOAZeocFLyJDEWh2b6AG0WB51YO
	ddxykptVplP/vnXotur8hjK7DuPmqAf/F1bzeP+OL96mT0VImXZuGgmnuAsPP0kAitJTPGtzYLK
	ytZUs69mgtei1OjGezcjW3bgP+Ohq6sM4rGeyx3gGPvKNj6xKOi+PYNrnktH3Vv+2ieqCoBsfFu
	TKE2UtVe5VYgQnxN6VeNGQd8u5tNovwWvo1yI92UJ4RYj9/Xlj6DM=
X-Received: by 2002:a05:6820:1381:b0:6d7:7f22:f59e with SMTP id 006d021491bc7-71ab5069789mr2248583eaf.38.1794593728266;
        Fri, 13 Nov 2026 10:15:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:27 -0700
Subject: [PATCH v4 11/58] mtd: rawnand: denali: retain chips across
 controller removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-11-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Jason Roberts <jason.e.roberts@intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101530_765303_EE121581 
X-CRM114-Status: GOOD (  18.36  )
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
