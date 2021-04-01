Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E45FC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:16:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C0C6136E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C0C6136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BwvkCsQZdoUlblqOUgJuwi4QR8F9xDK0ig5+St7HF0I=; b=CR1KVFiXqGaTJct2QuA2xeyV3
	tYk6zE0FR7g+y84zPlXsmnBbWC+eVW6YD8M7vzJxZKnaI3DysihDzMxPQ+4a3B8FMzhMnTujqjaou
	tljCzTHn4a6tRsJnq/p5onwzIvyejo/SrtT1B3p3GPNWIfHCEcHyu+Y6doeKGgHMCVOsa1XaWeAbN
	sPLqEcGgN8hy3bIMgzkz/TX3TecWavZVRHBXoS1XecRW1yeFK4brId3b5TiIq/w0n8Tva2mvYOODa
	5k3nDcOOWK5LoNYP1AjZT3KXTWaxVzlv4YP8ihf/5B3rqFnkvKULBTBYl7qQtU4Ui6J9I//jyH5ua
	Bld7xZC9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRz3C-009ygt-Du; Thu, 01 Apr 2021 15:16:02 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRz2n-009yZY-EO
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:15:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d8so1165907plh.11
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+aoqp7/hh2ZJdg8Bt5Hf7dmndB59spkh4lB3mp0E74=;
 b=kGBK/r8CKBxUNprCLJ6ee9nOvbOqWpDSdZJUuszXHKcioB/BkSJAcMMc8wbwiBeQxg
 EYkP3PZT1RxY88LvRMhINgnkjtqMCFCPwWZdbe7ndIVaihFMZYNBkJBnvCGyob94oQud
 iNf7QlgVJgbXhj1el6Rlsm/nAlXZpyLhiSWfnFMCSFg/SoNZZc8mGvxvB4RFNDprXC73
 QuxrFsIKqb7uxLo/MgrWkrf3whDIrg8LmKPYhyZRGs3QVPGROa/qxdpFzDY0LDPM7i5A
 K/2D9YX8AhClTgoTUKXaMRJyMv2Spq53DRBW0txjxp2rEnnywWOgoReioJW49t5AKzMC
 yiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+aoqp7/hh2ZJdg8Bt5Hf7dmndB59spkh4lB3mp0E74=;
 b=DyseyZZBAuhO13C9PWRIQt7bbsM/qvDkihoLu0d9MWVt6yaD+nKjdI7l8y+bQ8IfV5
 ohw8Tb10rUuhuS3fzziYRw1CWwozqTHE5QTOlR3a/STaziShLHugG8ggPxwifyzhrQDv
 GsEBvI5WQbikIzjkQnFhc1+16rOubIR3hxsHNxLKB8TEGrBJmkuRLCNU7jxWXHG/Vyst
 zH8MP9i0TZ90OHwJva28+u8JyYesxLaVHFoXOGodVSagkflakZTa6ms3EpkAj3Xy79HL
 vgJwkaspUvJlg4cJV9brkcFqi8XrkjIL7KjK9V+5UsUMw9WVYcnmzdwxN7tLSHMA7mZR
 m5mg==
X-Gm-Message-State: AOAM532N51oV20JBpVRwgMllMzTaI5/hFFhHiF49lDa8EgXaSeQ53eMJ
 DBY9RYpDyLdeGNCOMRgt8LTr
X-Google-Smtp-Source: ABdhPJyLl09ogfVFgj/40f2XOlVbEF3wsCwgBy9MwM0lPlcS8zD1vWvy+BWlPcZDVcEBOZFpehentQ==
X-Received: by 2002:a17:903:2490:b029:e6:faf5:86df with SMTP id
 p16-20020a1709032490b02900e6faf586dfmr8239479plw.69.1617290135384; 
 Thu, 01 Apr 2021 08:15:35 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id 35sm5652769pgr.14.2021.04.01.08.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:15:35 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v9 3/4] mtd: rawnand: Add support for secure regions in NAND
 memory
Date: Thu,  1 Apr 2021 20:45:07 +0530
Message-Id: <20210401151508.143075-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
References: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_161537_635420_AD1595AC 
X-CRM114-Status: GOOD (  27.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

The regions are declared using a NAND chip DT property,
"secure-regions". So let's make use of this property in the raw NAND
core and skip access to the secure regions present in a system.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/nand_base.c | 107 ++++++++++++++++++++++++++++++-
 include/linux/mtd/rawnand.h      |  14 ++++
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c33fa1b1847f..c216d3eca915 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -278,11 +278,50 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 	return 0;
 }
 
+/**
+ * nand_region_is_secured() - Check if the region is secured
+ * @chip: NAND chip object
+ * @offset: Offset of the region to check
+ * @size: Size of the region to check
+ *
+ * Checks if the region is secured by comparing the offset and size with the
+ * list of secure regions obtained from DT. Returns true if the region is
+ * secured else false.
+ */
+static bool nand_region_is_secured(struct nand_chip *chip, loff_t offset, u64 size)
+{
+	int i;
+
+	/* Skip touching the secure regions if present */
+	for (i = 0; i < chip->nr_secure_regions; i++) {
+		const struct nand_secure_region *region = &chip->secure_regions[i];
+
+		if (offset + size <= region->offset ||
+		    offset >= region->offset + region->size)
+			continue;
+
+		pr_debug("%s: Region 0x%llx - 0x%llx is secured!",
+			 __func__, offset, offset + size);
+
+		return true;
+	}
+
+	return false;
+}
+
 static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int last_page = ((mtd->erasesize - mtd->writesize) >>
+			 chip->page_shift) & chip->pagemask;
+
 	if (chip->options & NAND_NO_BBM_QUIRK)
 		return 0;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, ofs, last_page))
+		return -EIO;
+
 	if (chip->legacy.block_bad)
 		return chip->legacy.block_bad(chip, ofs);
 
@@ -397,6 +436,10 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, to, ops->ooblen))
+		return -EIO;
+
 	chipnr = (int)(to >> chip->chip_shift);
 
 	/*
@@ -565,6 +608,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 
 	if (!chip->bbt)
 		return 0;
+
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, ofs, 0))
+		return -EIO;
+
 	/* Return info from the table */
 	return nand_isreserved_bbt(chip, ofs);
 }
@@ -3127,6 +3175,10 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	int retry_mode = 0;
 	bool ecc_fail = false;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, from, readlen))
+		return -EIO;
+
 	chipnr = (int)(from >> chip->chip_shift);
 	nand_select_target(chip, chipnr);
 
@@ -3458,6 +3510,10 @@ static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, from, readlen))
+		return -EIO;
+
 	stats = mtd->ecc_stats;
 
 	len = mtd_oobavail(mtd, ops);
@@ -3979,6 +4035,10 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, to, writelen))
+		return -EIO;
+
 	column = to & (mtd->writesize - 1);
 
 	chipnr = (int)(to >> chip->chip_shift);
@@ -4180,6 +4240,10 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, instr->addr, instr->len))
+		return -EIO;
+
 	/* Grab the lock and see if the device is available */
 	ret = nand_get_device(chip);
 	if (ret)
@@ -4995,6 +5059,31 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
+static int of_get_nand_secure_regions(struct nand_chip *chip)
+{
+	struct device_node *dn = nand_get_flash_node(chip);
+	int nr_elem, i, j;
+
+	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
+	if (!nr_elem)
+		return 0;
+
+	chip->nr_secure_regions = nr_elem / 2;
+	chip->secure_regions = kcalloc(chip->nr_secure_regions, sizeof(*chip->secure_regions),
+				       GFP_KERNEL);
+	if (!chip->secure_regions)
+		return -ENOMEM;
+
+	for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
+		of_property_read_u64_index(dn, "secure-regions", j,
+					   &chip->secure_regions[i].offset);
+		of_property_read_u64_index(dn, "secure-regions", j + 1,
+					   &chip->secure_regions[i].size);
+	}
+
+	return 0;
+}
+
 static int rawnand_dt_init(struct nand_chip *chip)
 {
 	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
@@ -5953,6 +6042,16 @@ static int nand_scan_tail(struct nand_chip *chip)
 			goto err_free_interface_config;
 	}
 
+	/*
+	 * Look for secure regions in the NAND chip. These regions are supposed
+	 * to be protected by a secure element like Trustzone. So the read/write
+	 * accesses to these regions will be blocked in the runtime by this
+	 * driver.
+	 */
+	ret = of_get_nand_secure_regions(chip);
+	if (ret)
+		goto err_free_interface_config;
+
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
 		return 0;
@@ -5960,10 +6059,13 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/* Build bad block table */
 	ret = nand_create_bbt(chip);
 	if (ret)
-		goto err_free_interface_config;
+		goto err_free_secure_regions;
 
 	return 0;
 
+err_free_secure_regions:
+	kfree(chip->secure_regions);
+
 err_free_interface_config:
 	kfree(chip->best_interface_config);
 
@@ -6051,6 +6153,9 @@ void nand_cleanup(struct nand_chip *chip)
 
 	nanddev_cleanup(&chip->base);
 
+	/* Free secure regions data */
+	kfree(chip->secure_regions);
+
 	/* Free bad block table memory */
 	kfree(chip->bbt);
 	kfree(chip->data_buf);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6b3240e44310..17ddc900a1dc 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1036,6 +1036,16 @@ struct nand_manufacturer {
 	void *priv;
 };
 
+/**
+ * struct nand_secure_region - NAND secure region structure
+ * @offset: Offset of the start of the secure region
+ * @size: Size of the secure region
+ */
+struct nand_secure_region {
+	u64 offset;
+	u64 size;
+};
+
 /**
  * struct nand_chip - NAND Private Flash Chip Data
  * @base: Inherit from the generic NAND device
@@ -1086,6 +1096,8 @@ struct nand_manufacturer {
  *          NAND Controller drivers should not modify this value, but they're
  *          allowed to read it.
  * @read_retries: The number of read retry modes supported
+ * @secure_regions: Structure containing the secure regions info
+ * @nr_secure_regions: Number of secure regions
  * @controller: The hardware controller	structure which is shared among multiple
  *              independent devices
  * @ecc: The ECC controller structure
@@ -1135,6 +1147,8 @@ struct nand_chip {
 	unsigned int suspended : 1;
 	int cur_cs;
 	int read_retries;
+	struct nand_secure_region *secure_regions;
+	u8 nr_secure_regions;
 
 	/* Externals */
 	struct nand_controller *controller;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
