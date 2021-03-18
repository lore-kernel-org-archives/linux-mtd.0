Return-Path: <SRS0=Kfvc=IQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E62C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:47:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FDB64F04
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Mar 2021 12:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73FDB64F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5HFr46g2O90f0xR4KuBad8npZ7E4utEVateT476Vpmg=; b=i3KtIoGNVVlEFmvKZq6CplBMO
	9jmYU9j1YN2iFIII9lcSEUNVxl+khPhZr3TQ9TGwpspssIox6XQOPTpTkfzBq6TosyaNoUFy5Jr31
	KYgfoON3fRX+AeTtDkwAXCQGK5KcgGFlkKNF7cuc9v/T7hFhrNZeX+VrTecvl/oTwhvHN2CS6hU9j
	+UWnN+Jp/m73lPF0TJahDnsWuhQbY7H6TJgxuw3TSu9ngBNZohSj6mYdeFAyaoYIu3GA9ctWL8gkv
	fDnTLaU88dh/4c//rjLa8yDhYavp9bQg2jkHO6hj5EDH66Lm+id6Ult6QXpueVPfS7BUhf+k/Kc/U
	HENIJladQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMs2d-005FSW-6k; Thu, 18 Mar 2021 12:46:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMs0a-005F85-Cx
 for linux-mtd@lists.infradead.org; Thu, 18 Mar 2021 12:46:15 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso3061089pjb.4
 for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2021 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhGMHYMmcLeKrhiSxz8FXTAntRfx6etYiml4bVTAZK8=;
 b=LOtn5eEwtiV1zaBqABmHp/3o1br1Eel9swgd8xNI1ysAHBsMY2zvKSF7Hm9l4l/hK7
 U79gOvfgg6lIk0jRbzuMvnFl8i1Zm42INDUU6FzRdWDbuEO5rBrRyRPV23BH43GaqRb4
 ZgQ2pGobh7yCHThN0NaRRTL3KmMF3nQbJH3Itd5Q/zLnHlEw0DQzjsGcP/BS1EGV584A
 B87SptBeZRmqHhWi3zwV/0JAflz8ZATwVw9lYdM7kijZVrqolqlbMSbJ43/Dfxz2k13c
 ba6f1gNS+na89goRriUQfAyMQEQd5rtlQvvHMFzPl0XnlirVFxvgEcF4jo8cGkC4PrS6
 RTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhGMHYMmcLeKrhiSxz8FXTAntRfx6etYiml4bVTAZK8=;
 b=g5PmhPeKg6Z0uoni+K4ySmeHo8xyqKhTVIazPKCdY4T2MkGMMmRl3mrjZuaCnZL0QU
 ihkuRSkw9p7hNOrXExRk5XHyo6wubw+nBZyaHqBPfmk4u3cTRZMkzXiwey2NWrDVw2TO
 W7Qrve4DgR0Q947PaQC0pgyp4Agkh5qAM7eq0VA+ZQJF7TenvvE81xH8yfieMYVH+HMn
 7MTUIQRu4FHGOHV54VN+fWo6Md03jv4a52sG9GFPm8/cFrboSu7LLkQZn6YlHg7YUw0z
 w58Fq4jUv04pmK507mDR7knk1yk4VSAa3i+6rwKuvjmeOPe31SlxzMFsPLE5DsUsFD4T
 yU4w==
X-Gm-Message-State: AOAM531zD8s0IjyEiXN/Plx6Bk77Qc5/+mpmuMatNGX6/MpCQfiorNip
 6Dgg95wNmnJz6PRRpc3KX6Cq
X-Google-Smtp-Source: ABdhPJwWhLMWXwHQwJGmwyBr6XF2pjRjpgL8zsWEsHhNHtdq0K6wt4IxAeCAX7CbjTS9j6lwXuKlPg==
X-Received: by 2002:a17:90b:344c:: with SMTP id
 lj12mr4347160pjb.208.1616071450780; 
 Thu, 18 Mar 2021 05:44:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6d00:4737:af26:182c:a57e:1d9e])
 by smtp.gmail.com with ESMTPSA id w84sm2530694pfc.142.2021.03.18.05.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 05:44:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 3/3] mtd: rawnand: Add support for secure regions in NAND
 memory
Date: Thu, 18 Mar 2021 18:13:42 +0530
Message-Id: <20210318124342.32745-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318124342.32745-1-manivannan.sadhasivam@linaro.org>
References: <20210318124342.32745-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_124613_238131_085EFEF8 
X-CRM114-Status: GOOD (  26.60  )
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
 drivers/mtd/nand/raw/nand_base.c | 111 +++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |   4 ++
 2 files changed, 115 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c33fa1b1847f..d2958549ba46 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -278,11 +278,47 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 	return 0;
 }
 
+/**
+ * nand_check_secure_region() - Check if the region is secured
+ * @chip: NAND chip object
+ * @offset: Offset of the region to check
+ * @size: Size of the region to check
+ *
+ * Checks if the region is secured by comparing the offset and size with the
+ * list of secure regions obtained from DT. Returns -EIO if the region is
+ * secured else 0.
+ */
+static int nand_check_secure_region(struct nand_chip *chip, loff_t offset, u32 size)
+{
+	int i, j;
+
+	/* Skip touching the secure regions if present */
+	for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
+		/* First compare the start offset */
+		if (offset >= chip->secure_regions[j] &&
+		    (offset < chip->secure_regions[j] + chip->secure_regions[j + 1]))
+			return -EIO;
+		/* ...then offset + size */
+		else if (offset < chip->secure_regions[i] &&
+			 (offset + size) >= chip->secure_regions[i])
+			return -EIO;
+	}
+
+	return 0;
+}
+
 static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 {
+	int ret;
+
 	if (chip->options & NAND_NO_BBM_QUIRK)
 		return 0;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, ofs, 0);
+	if (ret)
+		return ret;
+
 	if (chip->legacy.block_bad)
 		return chip->legacy.block_bad(chip, ofs);
 
@@ -397,6 +433,11 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, to, ops->ooblen);
+	if (ret)
+		return ret;
+
 	chipnr = (int)(to >> chip->chip_shift);
 
 	/*
@@ -565,6 +606,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 
 	if (!chip->bbt)
 		return 0;
+
+	/* Check if the region is secured */
+	if (nand_check_secure_region(chip, ofs, 0))
+		return -EIO;
+
 	/* Return info from the table */
 	return nand_isreserved_bbt(chip, ofs);
 }
@@ -2737,6 +2783,11 @@ static int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
 	uint8_t *ecc_code = chip->ecc.code_buf;
 	unsigned int max_bitflips = 0;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, ((loff_t)page << chip->page_shift), 0);
+	if (ret)
+		return ret;
+
 	chip->ecc.read_page_raw(chip, buf, 1, page);
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
@@ -3127,6 +3178,11 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	int retry_mode = 0;
 	bool ecc_fail = false;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, from, readlen);
+	if (ret)
+		return ret;
+
 	chipnr = (int)(from >> chip->chip_shift);
 	nand_select_target(chip, chipnr);
 
@@ -3458,6 +3514,11 @@ static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, from, readlen);
+	if (ret)
+		return ret;
+
 	stats = mtd->ecc_stats;
 
 	len = mtd_oobavail(mtd, ops);
@@ -3709,6 +3770,11 @@ static int nand_write_page_swecc(struct nand_chip *chip, const uint8_t *buf,
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
 	const uint8_t *p = buf;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, ((loff_t)page << chip->page_shift), 0);
+	if (ret)
+		return ret;
+
 	/* Software ECC calculation */
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
 		chip->ecc.calculate(chip, p, &ecc_calc[i]);
@@ -3979,6 +4045,11 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, to, writelen);
+	if (ret)
+		return ret;
+
 	column = to & (mtd->writesize - 1);
 
 	chipnr = (int)(to >> chip->chip_shift);
@@ -4180,6 +4251,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, instr->addr, len);
+	if (ret)
+		return ret;
+
 	/* Grab the lock and see if the device is available */
 	ret = nand_get_device(chip);
 	if (ret)
@@ -4995,10 +5071,32 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
+static int of_get_nand_secure_regions(struct nand_chip *chip)
+{
+	struct device_node *dn = nand_get_flash_node(chip);
+	struct property *prop;
+	int length, nr_elem;
+
+	prop = of_find_property(dn, "secure-regions", &length);
+	if (prop) {
+		nr_elem = length / sizeof(u64);
+		chip->nr_secure_regions = nr_elem / 2;
+
+		chip->secure_regions = kcalloc(nr_elem, sizeof(*chip->secure_regions), GFP_KERNEL);
+		if (!chip->secure_regions)
+			return -ENOMEM;
+
+		of_property_read_u64_array(dn, "secure-regions", chip->secure_regions, nr_elem);
+	}
+
+	return 0;
+}
+
 static int rawnand_dt_init(struct nand_chip *chip)
 {
 	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
 	struct device_node *dn = nand_get_flash_node(chip);
+	int ret;
 
 	if (!dn)
 		return 0;
@@ -5015,6 +5113,16 @@ static int rawnand_dt_init(struct nand_chip *chip)
 	of_get_nand_ecc_user_config(nand);
 	of_get_nand_ecc_legacy_user_config(chip);
 
+	/*
+	 * Look for secure regions in the NAND chip. These regions are supposed
+	 * to be protected by a secure element like Trustzone. So the read/write
+	 * accesses to these regions will be blocked in the runtime by this
+	 * driver.
+	 */
+	ret = of_get_nand_secure_regions(chip);
+	if (!ret)
+		return ret;
+
 	/*
 	 * If neither the user nor the NAND controller have requested a specific
 	 * ECC engine type, we will default to NAND_ECC_ENGINE_TYPE_ON_HOST.
@@ -6068,6 +6176,9 @@ void nand_cleanup(struct nand_chip *chip)
 	/* Free manufacturer priv data. */
 	nand_manufacturer_cleanup(chip);
 
+	/* Free secure regions data */
+	kfree(chip->secure_regions);
+
 	/* Free controller specific allocations after chip identification */
 	nand_detach(chip);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6b3240e44310..d385c4fe8b0f 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1086,6 +1086,8 @@ struct nand_manufacturer {
  *          NAND Controller drivers should not modify this value, but they're
  *          allowed to read it.
  * @read_retries: The number of read retry modes supported
+ * @secure_regions: Array representing the secure regions
+ * @nr_secure_regions: Number of secure regions
  * @controller: The hardware controller	structure which is shared among multiple
  *              independent devices
  * @ecc: The ECC controller structure
@@ -1135,6 +1137,8 @@ struct nand_chip {
 	unsigned int suspended : 1;
 	int cur_cs;
 	int read_retries;
+	u64 *secure_regions;
+	u8 nr_secure_regions;
 
 	/* Externals */
 	struct nand_controller *controller;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
