Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4299CC4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:52:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE34720706
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWJxS42R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="MITSbwf0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE34720706
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BcgdusYQF7PgxLkPIlY1xdGi+EyJq14pWtSrYq917tg=; b=dWJxS42Rop652e/9AXKwAZ5vhP
	OL6ywVDHN8bE76ZA/OEWi8Zg+dY6IQQjnbwE3WVfvP+G/dWWiLqP0yCXpJUulRibj73KLHaro5dp1
	XjKUQjQr6FhNXRdVJ7bS1aZH1J+dXiKcMsB+JlMoa6kOMy04gqK7KnSBaPOBRdAeLtKyy5CCc364G
	H/MOmCARjnneKmMg9HM8jJ1YnKl2+vx2td3Ev5zGz+hVLUCTZ5GrepTqCVqogUNWNqh+nKjjH6h3X
	mGPNCKY23MWFJxoUt70JPdF8gQ1sHJb4wEHmeqb0RtUd2R881LCgCaJZOU1tydq/iw8lrNKU5WaX/
	vSGc0MPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNcWW-0007DU-Sd; Wed, 30 Sep 2020 13:52:00 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNcWT-0007Bi-QJ
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 13:51:58 +0000
Received: by mail-qt1-x842.google.com with SMTP id b2so1193421qtp.8
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEQhLVt+nh+NhMtSNXoFzmNW+708cqCmbOcewdCxEwo=;
 b=MITSbwf0aPYaB5cpIBa6M69JAEZah9LJ8zUnYMBRqHbYXe+Fvx8PUyhSPnJmJgfp6j
 +GM9BCLnXTHY6TxTRZuUxjOVq5PxCnsxxMwhq9fcOrEhXPJF0ziiCr+JpgXIhPaboKln
 mJcq6Zmga4UmdFd1aAGZCaIl558UTjwgq+aXnsyfjUQRWP/tGrmLQp8PL1ufDxSMsY8B
 b678kYir+8kqgu9MvAGBaYxIDFxIuGMvEP/5G5igAbAX9s3jZkW3GH4dvqKGab4+KbbQ
 5aNL4NUDvBk9B/0OAOVixFsty81Oe+ECBiPCmN4o7IJmco7oKEMtZmV1ggKRHZgvNrbP
 SrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZEQhLVt+nh+NhMtSNXoFzmNW+708cqCmbOcewdCxEwo=;
 b=eURYQMAHO2gBWI8OjxXJso5hx/A/CwnGc69uOkj937DlMrApIbL5/3EgImnTGbkGaD
 Nawk1jlaPADb3NGI7+nP8fbwjq/HGeBU+iR6Elosjm5S3LuXmsR+F7j0Z8cpr+j4V/dS
 LNTY1neNPKNlQSDAWz5cmfXdJgdjguCvBwekYq8F5+KNm4JNmel9wWXe4NS4+3gWoZhI
 8UD9c0oM+Ugsa8QmNfoF6Y3t5GnXkDupiZtWaREh6AxaNxL9HOwzzi1r9hW9cd3z5PRy
 vCFC5Sd+qZYiKxbgJgoIA7BKgOhW+q4IwGS8omAxCpvuqUL02CSGWHMeDJb/Oc+xowb+
 sqlA==
X-Gm-Message-State: AOAM532m1bKs33Hw5MBj6/gkQTZx3HcZiyqtC1qSpdXel8mGb7ADTbsR
 04rlvS7bz/J9n2C7qSdpaOo8eg==
X-Google-Smtp-Source: ABdhPJySyjG/L5gHspnKJijgYRoeiUk34kSlDLUMoGez3VDmnS2fA7DVC6L2GSgU6JYp+Bx7Xogw6A==
X-Received: by 2002:ac8:6f50:: with SMTP id n16mr2351271qtv.190.1601473916146; 
 Wed, 30 Sep 2020 06:51:56 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id b28sm2109788qka.117.2020.09.30.06.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 06:51:55 -0700 (PDT)
From: Daniel Gutson <daniel.gutson@eclypsium.com>
To: Daniel Gutson <daniel.gutson@eclypsium.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Hughes <hughsient@gmail.com>,
 Alex Bazhaniuk <alex@eclypsium.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] Platform integrity information in sysfs (version 9)
Date: Wed, 30 Sep 2020 10:51:48 -0300
Message-Id: <20200930135148.5651-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_095157_870001_D86EA099 
X-CRM114-Status: GOOD (  23.13  )
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
Cc: Richard Hughes <richard@hughsie.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch exports the BIOS Write Enable (bioswe), BIOS
Lock Enable (biosle), and the SMM BIOS Write Protect (SMM_BIOSWP) fields of
the BIOS Control register using the platform-integrity misc kernel module.
The idea is to keep adding more flags, not only from the BC but also from
other registers in following versions.

The goal is that the attributes are avilable to fwupd when SecureBoot
is turned on.

Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
Tested-by: Richard Hughes <richard@hughsie.com>
---
 drivers/mtd/spi-nor/controllers/Kconfig       |  1 +
 .../mtd/spi-nor/controllers/intel-spi-pci.c   | 75 ++++++++++++++-
 .../spi-nor/controllers/intel-spi-platform.c  |  2 +-
 drivers/mtd/spi-nor/controllers/intel-spi.c   | 91 ++++++++++++++++++-
 drivers/mtd/spi-nor/controllers/intel-spi.h   |  9 +-
 5 files changed, 171 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
index 5c0e0ec2e6d1..e7eaef506fc2 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -29,6 +29,7 @@ config SPI_NXP_SPIFI
 
 config SPI_INTEL_SPI
 	tristate
+	depends on PLATFORM_INTEGRITY_DATA
 
 config SPI_INTEL_SPI_PCI
 	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index c72aa1ab71ad..644b1a6091dc 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -10,11 +10,19 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform-integrity.h>
 
 #include "intel-spi.h"
 
 #define BCR		0xdc
 #define BCR_WPD		BIT(0)
+#define BCR_BLE		BIT(1)
+#define BCR_SMM_BWP	BIT(5)
+
+struct cnl_spi_attr {
+	struct device_attribute dev_attr;
+	u32 mask;
+};
 
 static const struct intel_spi_boardinfo bxt_info = {
 	.type = INTEL_SPI_BXT,
@@ -24,6 +32,70 @@ static const struct intel_spi_boardinfo cnl_info = {
 	.type = INTEL_SPI_CNL,
 };
 
+#ifdef CONFIG_PLATFORM_INTEGRITY_DATA
+static ssize_t intel_spi_cnl_spi_attr_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf, u32 mask)
+{
+	u32 bcr;
+
+	if (dev->parent == NULL)
+		return -EIO;
+
+	if (pci_read_config_dword(container_of(dev->parent, struct pci_dev, dev),
+				  BCR, &bcr) != PCIBIOS_SUCCESSFUL)
+		return -EIO;
+
+	return sprintf(buf, "%d\n", (int)!!(bcr & mask));
+}
+
+static ssize_t bioswe_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_WPD);
+}
+static DEVICE_ATTR_RO(bioswe);
+
+static ssize_t biosle_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_BLE);
+}
+static DEVICE_ATTR_RO(biosle);
+
+static ssize_t smm_bioswp_show(struct device *dev, struct device_attribute *attr,
+			       char *buf)
+{
+	return intel_spi_cnl_spi_attr_show(dev, attr, buf, BCR_SMM_BWP);
+}
+static DEVICE_ATTR_RO(smm_bioswp);
+
+static struct attribute *cnl_attrs[] = {
+	&dev_attr_bioswe.attr,
+	&dev_attr_biosle.attr,
+	&dev_attr_smm_bioswp.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(cnl);
+
+static struct device *
+register_local_platform_integrity_device(struct device *parent,
+					 enum intel_spi_type type)
+{
+	return create_platform_integrity_device(parent,	"intel-spi",
+		cnl_groups);
+}
+
+#else
+
+static struct device *
+register_local_platform_integrity_device(struct device *parent,
+					 enum intel_spi_type type)
+{
+	return NULL;
+}
+#endif /* CONFIG_PLATFORM_INTEGRITY_DATA */
+
 static int intel_spi_pci_probe(struct pci_dev *pdev,
 			       const struct pci_device_id *id)
 {
@@ -50,7 +122,8 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
 	}
 	info->writeable = !!(bcr & BCR_WPD);
 
-	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info);
+	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info,
+			       register_local_platform_integrity_device);
 	if (IS_ERR(ispi))
 		return PTR_ERR(ispi);
 
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-platform.c b/drivers/mtd/spi-nor/controllers/intel-spi-platform.c
index f80f1086f928..5b1a9989426a 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-platform.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-platform.c
@@ -23,7 +23,7 @@ static int intel_spi_platform_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ispi = intel_spi_probe(&pdev->dev, mem, info);
+	ispi = intel_spi_probe(&pdev->dev, mem, info, NULL);
 	if (IS_ERR(ispi))
 		return PTR_ERR(ispi);
 
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index b54a56a68100..ff0d2afc9bf4 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -16,6 +16,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/platform_data/intel-spi.h>
+#include <linux/platform-integrity.h>
 
 #include "intel-spi.h"
 
@@ -95,6 +96,8 @@
 #define BYT_SSFSTS_CTL			0x90
 #define BYT_BCR				0xfc
 #define BYT_BCR_WPD			BIT(0)
+#define BYT_BCR_BLE			BIT(1)
+#define BYT_BCR_SMM_BWP			BIT(5)
 #define BYT_FREG_NUM			5
 #define BYT_PR_NUM			5
 
@@ -157,6 +160,7 @@ struct intel_spi {
 	bool erase_64k;
 	u8 atomic_preopcode;
 	u8 opcodes[8];
+	struct device *platform_integrity_device;
 };
 
 static bool writeable;
@@ -305,7 +309,69 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
 				  INTEL_SPI_TIMEOUT * 1000);
 }
 
-static int intel_spi_init(struct intel_spi *ispi)
+#ifdef CONFIG_PLATFORM_INTEGRITY_DATA
+static ssize_t byt_spi_attr_show(struct device *dev,
+				 struct device_attribute *attr, char *buf,
+				 u32 mask)
+{
+	u32 bcr;
+	struct intel_spi *ispi;
+
+	if (dev->parent == NULL)
+		return -EIO;
+
+	ispi = dev_get_drvdata(dev->parent);
+
+	bcr = readl(ispi->base + BYT_BCR);
+	return sprintf(buf, "%d\n", (int)!!(bcr & mask));
+}
+
+static ssize_t bioswe_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	return byt_spi_attr_show(dev, attr, buf, BYT_BCR_WPD);
+}
+static DEVICE_ATTR_RO(bioswe);
+
+static ssize_t biosle_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	return byt_spi_attr_show(dev, attr, buf, BYT_BCR_BLE);
+}
+static DEVICE_ATTR_RO(biosle);
+
+static ssize_t smm_bioswp_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return byt_spi_attr_show(dev, attr, buf, BYT_BCR_SMM_BWP);
+}
+static DEVICE_ATTR_RO(smm_bioswp);
+
+static struct attribute *byt_attrs[] = {
+	&dev_attr_bioswe.attr,
+	&dev_attr_biosle.attr,
+	&dev_attr_smm_bioswp.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(byt);
+
+static struct device *
+register_local_platform_integrity_device(struct device *parent,
+					 enum intel_spi_type type)
+{
+	switch (type) {
+	case INTEL_SPI_BYT:
+		return create_platform_integrity_device(parent, "intel-spi",
+							byt_groups);
+
+	default:
+		return NULL;
+	}
+}
+#endif /* CONFIG_PLATFORM_INTEGRITY_DATA */
+
+static int intel_spi_init(struct intel_spi *ispi,
+			  register_platform_integrity_t register_pi_cb)
 {
 	u32 opmenu0, opmenu1, lvscc, uvscc, val;
 	int i;
@@ -422,6 +488,15 @@ static int intel_spi_init(struct intel_spi *ispi)
 
 	intel_spi_dump_regs(ispi);
 
+#ifdef CONFIG_PLATFORM_INTEGRITY_DATA
+	if (register_pi_cb == NULL)
+		register_pi_cb = register_local_platform_integrity_device;
+	ispi->platform_integrity_device = register_pi_cb(ispi->dev,
+							 ispi->info->type);
+	if (IS_ERR(ispi->platform_integrity_device))
+		ispi->platform_integrity_device = NULL;
+#endif
+
 	return 0;
 }
 
@@ -904,7 +979,8 @@ static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 };
 
 struct intel_spi *intel_spi_probe(struct device *dev,
-	struct resource *mem, const struct intel_spi_boardinfo *info)
+	struct resource *mem, const struct intel_spi_boardinfo *info,
+	register_platform_integrity_t register_platform_integrity_cb)
 {
 	const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ |
@@ -930,7 +1006,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	ispi->info = info;
 	ispi->writeable = info->writeable;
 
-	ret = intel_spi_init(ispi);
+	ret = intel_spi_init(ispi, register_platform_integrity_cb);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -960,6 +1036,15 @@ EXPORT_SYMBOL_GPL(intel_spi_probe);
 
 int intel_spi_remove(struct intel_spi *ispi)
 {
+#ifdef CONFIG_PLATFORM_INTEGRITY_DATA
+	if (ispi->platform_integrity_device != NULL) {
+		destroy_platform_integrity_device(
+			ispi->platform_integrity_device);
+
+		ispi->platform_integrity_device = NULL;
+	}
+#endif /* CONFIG_PLATFORM_INTEGRITY_DATA */
+
 	return mtd_device_unregister(&ispi->nor.mtd);
 }
 EXPORT_SYMBOL_GPL(intel_spi_remove);
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.h b/drivers/mtd/spi-nor/controllers/intel-spi.h
index e2f41b8827bf..5b00df0d4f19 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.h
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.h
@@ -14,8 +14,13 @@
 struct intel_spi;
 struct resource;
 
-struct intel_spi *intel_spi_probe(struct device *dev,
-	struct resource *mem, const struct intel_spi_boardinfo *info);
+typedef struct device *(*register_platform_integrity_t)(struct device *parent,
+			enum intel_spi_type type);
+
+struct intel_spi *intel_spi_probe(struct device *dev, struct resource *mem,
+				  const struct intel_spi_boardinfo *info,
+				  register_platform_integrity_t register_pi_cb);
+
 int intel_spi_remove(struct intel_spi *ispi);
 
 #endif /* INTEL_SPI_H */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
