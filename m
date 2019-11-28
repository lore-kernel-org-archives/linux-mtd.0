Return-Path: <SRS0=Piv4=ZU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96962C432C3
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 12:59:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 685DA2176D
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Nov 2019 12:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+Z3RQx5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 685DA2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B6ESru1v2Vn1dXelxNzLwvNLD70AWzvI9dV55k+6j4Q=; b=F+Z3RQx5Ss9m9S3SDZFuYwPMAH
	62AnMC3EffeOeTYLM8+7qysj4qDue2hzXFDzvukAMj77RccXkmZgo05HXtjEeLX3x8sS5w386nxBT
	JeqbQD9S4rvSDofbd1EysXpuZ7sDaVdYxsFhoEfH4jmQdFTIy/TLmCOTCd11GmDukt1CqEGYKdxPI
	twbu0W9fd625FjXTzmapA/9ued7+eR27xpAIE00yQtki69wr2JeglHvapeYuihml2t1JbjbaBbiUE
	58p722nA0IBEXaV4M/SsD95ib6qdHtV4gZW84hHovA0Epo7EPSztAb9FwGs+aSY+ktkuNA60z0txd
	mGkyV7Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaJNv-0005Ar-AT; Thu, 28 Nov 2019 12:59:03 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaJNk-0004zo-To
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2019 12:58:54 +0000
Received: from orion.localdomain ([95.117.37.214]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M6lYs-1iS5a63Cne-008K9w; Thu, 28 Nov 2019 13:54:36 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] (v3) drivers: hwmon: i5k_amb: simplify probing / device
 identification
Date: Thu, 28 Nov 2019 13:54:06 +0100
Message-Id: <20191128125406.10417-6-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191128125406.10417-1-info@metux.net>
References: <20191128125406.10417-1-info@metux.net>
X-Provags-ID: V03:K1:Nfm/ouWc4jRhP1248kvcV2nWBCbvyeuIdCR2JmLXcgSHdMu+yqx
 258WteSO6QCJnHCa1QNT5lY1wmMhjBYoIrcNIz2olr0AgfgeLTySHExNj7UAn5gP4y75/sM
 HPLwgJvL12h40FWrzELS0M87+dKqmV4LVujLIP7HKSNaY7JDl0rLzPYwecMPIXJJrOIoicw
 YXzQoKTGGsTjB31kjWAbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vjcQgIVAJKA=:aDHBRbTK2sWTuBcVnuFnxD
 P/teRJ5gu2sSoO9yFzMJu6pV8pTCI3AyrdeT5mmw/jAJJEnp+wE6cfQsDxud+eXGqvKI/Z3qP
 4KtENYmfyxrFULP1JjVR0NFInGC07iTQisNoesNQylSxeZgvuXfshD7/De5LL5yiGvKGuAVhZ
 8+VQEg+YZXXuG2AenQK3nAUt21mGEgVP92qjIvNlctVCDMYQf6iqic+bGQdCz8ynh4nCxmKaj
 NBLPqXZKTCrL3pFRuj8FDmJcSzXBSisg47etDwLrHOj4A2z4qgoWmq76nOUqZB5kfhHBmo0oT
 cA0u5opG/1krt7SUXr+TC8c8v4mNSNvBgBjJ5GXt63p2ZDhSZORtBbmUGo4zMkFq/JOhde0ea
 LZYuFSqcmevIKUbMShTJZn3l8CxukYPYLQmlYrnqW2Ua6EHJ+/KY+4WC0B8UaU27rkVPEIkTN
 IoUye/+evW68VmCPuc+eXvpcVOZbYFZuDN4wx4w5/UnswH3lW/4bg3knbHCueUfa/TzrKVdiD
 LaLNhPRkZkm+kMpY8JP3SgbLtWr8L6OrMv7yWnvgxzd+Lwc/8fj7V+TqwQt3YkStmB/WvNSkr
 hmQ72za4nxmRmrHTFYqwG93egoG63BuBIfAQvCcqDgRylMtFyk/oqqXCWELoK1gZQ/OkD5Tx5
 BaJWxNGwqc+BQlDmEH3FKsaguEbNDLBK/FBbkO8LtszNwapL+qhOUBqmS1OrwRpLsAeF9cUdc
 YHEC6/+tghQ1eQ2c5OMaA33FlObrt+fOLsw9ekuDl0DEHM0OtOype3sVEouk4o/iL4Bz0e5CQ
 6r0xWGVcarWs/oo6BytEnXxzIx4kJJHZzuw3/b+wx/8U2olOwcBBBcPB3e1KJj4M+wy41x3Yr
 CXgcobIA+Wr+GV2MXlAQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_045853_259284_4ED9F038 
X-CRM114-Status: GOOD (  12.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, vigneshr@ti.com,
 richard@nod.at, linux-pci@vger.kernel.org, rrichter@marvell.com,
 james.morse@arm.com, linux-crypto@vger.kernel.org, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org, linux-edac@vger.kernel.org, linux@roeck-us.net,
 tim@buttersideup.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Simpilify the probing by putting all chip-specific data directly
into the pci match table, removing the redundant chipset_ids table.

Changes v3:
    * use pci_get_device_by_id() introduces by a previous patch
      of this queue

Changes v2:
    * use PCI_DEVICE_DATA() macro in the pci match table
    * directly pass the pci device id to i5k_channel_probe(),
      instead of computing it internally by extra offset parameter

Submitted: 2019-06-06
Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/hwmon/i5k_amb.c | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
index b09c39abd3a8..cb85607d104f 100644
--- a/drivers/hwmon/i5k_amb.c
+++ b/drivers/hwmon/i5k_amb.c
@@ -414,16 +414,14 @@ static int i5k_amb_add(void)
 }
 
 static int i5k_find_amb_registers(struct i5k_amb_data *data,
-					    unsigned long devid)
+				  const struct pci_device_id *devid)
 {
 	struct pci_dev *pcidev;
 	u32 val32;
 	int res = -ENODEV;
 
 	/* Find AMB register memory space */
-	pcidev = pci_get_device(PCI_VENDOR_ID_INTEL,
-				devid,
-				NULL);
+	pcidev = pci_get_device_by_id(devid);
 	if (!pcidev)
 		return -ENODEV;
 
@@ -447,14 +445,15 @@ static int i5k_find_amb_registers(struct i5k_amb_data *data,
 	return res;
 }
 
-static int i5k_channel_probe(u16 *amb_present, unsigned long dev_id)
+static int i5k_channel_probe(u16 *amb_present, unsigned int vendor,
+			     unsigned int device)
 {
 	struct pci_dev *pcidev;
 	u16 val16;
 	int res = -ENODEV;
 
 	/* Copy the DIMM presence map for these two channels */
-	pcidev = pci_get_device(PCI_VENDOR_ID_INTEL, dev_id, NULL);
+	pcidev = pci_get_device(vendor, device, NULL);
 	if (!pcidev)
 		return -ENODEV;
 
@@ -473,23 +472,12 @@ static int i5k_channel_probe(u16 *amb_present, unsigned long dev_id)
 	return res;
 }
 
-static struct {
-	unsigned long err;
-	unsigned long fbd0;
-} chipset_ids[]  = {
-	{ PCI_DEVICE_ID_INTEL_5000_ERR, PCI_DEVICE_ID_INTEL_5000_FBD0 },
-	{ PCI_DEVICE_ID_INTEL_5400_ERR, PCI_DEVICE_ID_INTEL_5400_FBD0 },
-	{ 0, 0 }
-};
-
-#ifdef MODULE
 static const struct pci_device_id i5k_amb_ids[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5000_ERR) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5400_ERR) },
+	{ PCI_DEVICE_DATA(INTEL, 5000_ERR, PCI_DEVICE_ID_INTEL_5000_FBD0) },
+	{ PCI_DEVICE_DATA(INTEL, 5400_ERR, PCI_DEVICE_ID_INTEL_5400_FBD0) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, i5k_amb_ids);
-#endif
 
 static int i5k_amb_probe(struct platform_device *pdev)
 {
@@ -504,22 +492,26 @@ static int i5k_amb_probe(struct platform_device *pdev)
 	/* Figure out where the AMB registers live */
 	i = 0;
 	do {
-		res = i5k_find_amb_registers(data, chipset_ids[i].err);
+		res = i5k_find_amb_registers(data, &i5k_amb_ids[i]);
 		if (res == 0)
 			break;
 		i++;
-	} while (chipset_ids[i].err);
+	} while (i5k_amb_ids[i].device);
 
 	if (res)
 		goto err;
 
 	/* Copy the DIMM presence map for the first two channels */
-	res = i5k_channel_probe(&data->amb_present[0], chipset_ids[i].fbd0);
+	res = i5k_channel_probe(&data->amb_present[0],
+				i5k_amb_ids[i].vendor,
+				i5k_amb_ids[i].driver_data);
 	if (res)
 		goto err;
 
 	/* Copy the DIMM presence map for the optional second two channels */
-	i5k_channel_probe(&data->amb_present[2], chipset_ids[i].fbd0 + 1);
+	i5k_channel_probe(&data->amb_present[2],
+			  i5k_amb_ids[i].vendor,
+			  i5k_amb_ids[i].driver_data+1);
 
 	/* Set up resource regions */
 	reso = request_mem_region(data->amb_base, data->amb_len, DRVNAME);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
