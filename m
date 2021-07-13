Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF39C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:09:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD1C361073
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 13:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD1C361073
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sn6lcgw+8mHQf43M4wadb9ITj1fO+ApRMoEftIrai4s=; b=c+gpmVk9LojZut
	Ad+uXxOLJIB81CJKXSVtRhniC/VSb5lRbYGHaAGSw0H8aXJ1FPDOyTaS5zg94r13o0UBErl0JWajA
	yc7amGIm4RWB7pxKp2tYYK7gKAp7eKaIFDz6rqxYDRhYdRozChyXjY9dLwpfi9OxYsLILnzphoYZ4
	RqdNGdKV5sP+aEwhRSWF4v/u0yQE7q02sVtg7f4MlZIvCfxL0RozHlN1yKQtu8KvG5s5sho9nzPiq
	PlLgyRX+V5zh0IP1T20kXvNw1earr8OvMdrqqn2WohQ8cREVCUvqSJu6T4e10/3vqFAGUq99Pzrjz
	sS2tylK68CfgKLEXMumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3I9q-00ATCP-J5; Tue, 13 Jul 2021 13:09:06 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3I7E-00ASLN-TQ
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 13:06:28 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16DD6IWO010688;
 Tue, 13 Jul 2021 08:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626181578;
 bh=eSd/J0tH/G83wfT+ceworgPZKhetY99l6KcPV41TaSU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=lLEy9MYpdQ7ywXWnRJbkShNfP1B1jCdVBp0/OIR4k0BcwMyalCVZ/FgRaHrPMBBBX
 Xa95vcEoAmlV4RwEw4/hqogLrRrDG+xwZv15+d2+YzJ3fzfD25IVYLynydfBaMtzxt
 OmlqegsNFk640faoPsJ/4VGxkQfIvd0NC3TwCJpA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16DD6I0B086848
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Jul 2021 08:06:18 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Jul 2021 08:06:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 13 Jul 2021 08:06:18 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16DD5daH109825;
 Tue, 13 Jul 2021 08:06:14 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, Boris
 Brezillon <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Apurva Nandan <a-nandan@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 07/13] mtd: spinand: Allow enabling Octal DTR mode in the core
Date: Tue, 13 Jul 2021 13:05:32 +0000
Message-ID: <20210713130538.646-8-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20210713130538.646-1-a-nandan@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_060625_077766_36DA0D3E 
X-CRM114-Status: GOOD (  16.95  )
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

Enable Octal DTR SPI mode, i.e. 8D-8D-8D mode, if the SPI NAND flash
device supports it. Mixed OSPI (1S-1S-8S & 1S-8S-8S), mixed DTR modes
(1S-1D-8D), etc. aren't supported yet.

The method to switch to Octal DTR SPI mode may vary across
manufacturers. For example, for Winbond, it is enabled by writing
values to the volatile configuration register. So, let the
manufacturer's code have their own implementation for switching to
Octal DTR SPI mode. Mixed OSPI (1S-1S-8S & 1S-8S-8S), mixed DTR modes
(1S-1D-8D), etc. aren't supported yet.

Check for the SPI NAND device's support for Octal DTR mode using
spinand flags, and if the op_templates allow 8D-8D-8D, call
octal_dtr_enable() manufacturer op. If the SPI controller doesn't
supports these modes, the selected op_templates would prevent switching
to the Octal DTR mode. And finally update the spinand reg_proto
if success.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/core.c | 46 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  3 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 1e619b6d777f..19d8affac058 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -256,6 +256,48 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static bool spinand_op_is_octal_dtr(const struct spi_mem_op *op)
+{
+	return  op->cmd.buswidth == 8 && op->cmd.dtr &&
+		op->addr.buswidth == 8 && op->addr.dtr &&
+		op->data.buswidth == 8 && op->data.dtr;
+}
+
+static int spinand_init_octal_dtr_enable(struct spinand_device *spinand)
+{
+	struct device *dev = &spinand->spimem->spi->dev;
+	int ret;
+
+	if (!(spinand->flags & SPINAND_HAS_OCTAL_DTR_BIT))
+		return 0;
+
+	if (!(spinand_op_is_octal_dtr(spinand->op_templates.read_cache) &&
+	      spinand_op_is_octal_dtr(spinand->op_templates.write_cache) &&
+	      spinand_op_is_octal_dtr(spinand->op_templates.update_cache)))
+		return 0;
+
+	if (!spinand->manufacturer->ops->octal_dtr_enable) {
+		dev_err(dev,
+			"Missing ->octal_dtr_enable(), unable to switch mode\n");
+		return -EINVAL;
+	}
+
+	ret = spinand->manufacturer->ops->octal_dtr_enable(spinand);
+	if (ret) {
+		dev_err(dev,
+			"Failed to enable Octal DTR SPI mode (err = %d)\n",
+			ret);
+		return ret;
+	}
+
+	spinand->reg_proto = SPINAND_OCTAL_DTR;
+
+	dev_dbg(dev,
+		"%s SPI NAND switched to Octal DTR SPI (8D-8D-8D) mode\n",
+		spinand->manufacturer->name);
+	return 0;
+}
+
 static int spinand_ecc_enable(struct spinand_device *spinand,
 			      bool enable)
 {
@@ -1189,6 +1231,10 @@ static int spinand_init_flash(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
+	ret = spinand_init_octal_dtr_enable(spinand);
+	if (ret)
+		return ret;
+
 	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
 	if (ret)
 		return ret;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 35816b8cfe81..daa2ac5c3110 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -271,6 +271,7 @@ struct spinand_devid {
  * @init: initialize a SPI NAND device
  * @adjust_op: modify the ops for any variation in their cmd, address, dummy or
  *	       data phase by the manufacturer
+ * @octal_dtr_enable: switch the SPI NAND flash into Octal DTR SPI mode
  * @cleanup: cleanup a SPI NAND device
  *
  * Each SPI NAND manufacturer driver should implement this interface so that
@@ -280,6 +281,7 @@ struct spinand_manufacturer_ops {
 	int (*init)(struct spinand_device *spinand);
 	void (*adjust_op)(struct spi_mem_op *op,
 			  const enum spinand_proto reg_proto);
+	int (*octal_dtr_enable)(struct spinand_device *spinand);
 	void (*cleanup)(struct spinand_device *spinand);
 };
 
@@ -348,6 +350,7 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_OCTAL_DTR_BIT	BIT(2)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
