Return-Path: <SRS0=VhFc=JI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9B3C433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 14:34:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394AF610CA
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Apr 2021 14:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 394AF610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1RKA8LOahKb5BSkxcRuaFwrDS/TF6+k5kOAHbio6DBs=; b=pVAezbz9t3oAdgmtY2ibcNGE14
	wO60WN99c/XygiGWEbhxXO67S+QBTBV/8OxZdEc5fJq5Lwizju8XGBI79+oDSAcW1RDNVU5kUk09y
	5tyymeIaSL9cPQn1GqJm3lkxbGwVcKCQQo685Lb3oKz7+O6b7qcWw2sNyBZxdE0kBr7MMb3k9m2aM
	95Fdiiqs5G3k7H/3OpcbUY5uAyaRxhPSOHxYIfn5cqYm6YSJGiXS5SVjMElvKfeswWi4xljDUPgvV
	AsVM4FvrgBcqj2jCg4bJ+4EBaE8BSbwJ8As7AUMEd8OSfkFlNKX9iZVjDWGtAlhZgTXqqN2kuQ9Yh
	EvcdhD9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVb9E-004ZmG-RB; Sun, 11 Apr 2021 14:33:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVb9D-004ZmB-JS
 for linux-mtd@desiato.infradead.org; Sun, 11 Apr 2021 14:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=B/5t1SxxF6rSHEeTttiOctJcoCH6tFA5IgHWiuwXN9s=; b=Xz9PIg9KQfIDMu9rRBPwDThzx7
 k6J2SE/Xzgk10MQ5UYsaDQH9CVgsBEDCGcW26cvqL+ay+75UNtlZ7euaTI93I1lbEwf4OvRysHDD5
 EmUoToBU5MY4JgDLA79Z3w7PUat/PDBS8UT2aTH363fJ0vxmiZMMI+94oSoq10/xokTr07lu/7D7z
 Re1nxBUVI2yN0XTAP9j67C1fVyQSkuOnNUC7hHmveDbtUzJNIYwCa2AgAx+eR1oXdqpPuawaYCJYJ
 Tjcsi4F/BnzEniepsejXfFAVOfLcYayCSL/THJGmuC9mhCtE8ra6lNapHtAsiV4ss61cgatYXx9uQ
 kwRWjYAg==;
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVb98-005Yey-Mo
 for linux-mtd@lists.infradead.org; Sun, 11 Apr 2021 14:33:09 +0000
IronPort-SDR: VjxYToyTaqShdRh0Q4TpO+CcMv7ymGWtxZ2d5ycoAcW+2hKdqWOKGp+ITc+jvU5HnTmQjWGX1B
 0ZCE6YGEYyQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193599260"
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; d="scan'208";a="193599260"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2021 07:32:58 -0700
IronPort-SDR: ohNW9i3LM7rZ5ytBBsueE5ay8k5WuTXq/6MqYHCWppmepcfIdUvyhy63u5XkkwfiMRxYGioIUP
 mu1kQl5+BW1w==
X-IronPort-AV: E=Sophos;i="5.82,214,1613462400"; d="scan'208";a="423444936"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2021 07:32:56 -0700
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Tamar Mashiah <tamar.mashiah@intel.com>, Joe Perches <joe@perches.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH v3] mtd: intel-spi: add is_protected and is_bios_locked knobs
Date: Sun, 11 Apr 2021 17:32:47 +0300
Message-Id: <20210411143247.3045467-1-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_073306_821221_C15CD800 
X-CRM114-Status: GOOD (  31.84  )
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

From: Tamar Mashiah <tamar.mashiah@intel.com>

The manufacturing access to the PCH/SOC SPI device is traditionally
performed via user space driver accessing registers via /dev/mem
but due to security concerns /dev/mem access is being much restricted,
hence the reason for utilizing dedicated Intel PCH/SOC SPI controller
driver, which is already implemented in the Linux kernel.

Intel PCH/SOC SPI controller protects the flash storage via two
mechanisms one is the via region protection registers and second
via BIOS lock.

The device always boots with bios lock set, but during manufacturing
the bios lock has to be lifted in order to enable the write access.
So we add sysfs file (spi_bios_lock) to be able to do it on demand.
The bios lock is automatically attempted to be lifted by the driver
during initialization, this part is dropped.

Second, also the region protection status is exposed via sysfs file
as the manufacturing will need the both files in order to validate
that the device is properly sealed.

Cc: Joe Perches <joe@perches.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Tamar Mashiah <tamar.mashiah@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
V2: Add a newline to the string format in sysfs_emit() (Joe Perches <joe@perches.com>)
V3: Resend adding new  MTD SPI-NOR maintainers

 .../ABI/testing/sysfs-devices-intel-spi       | 16 ++++
 MAINTAINERS                                   |  1 +
 drivers/mfd/lpc_ich.c                         | 37 ++++++-
 .../mtd/spi-nor/controllers/intel-spi-pci.c   | 38 ++++++--
 drivers/mtd/spi-nor/controllers/intel-spi.c   | 96 ++++++++++++++++---
 include/linux/platform_data/x86/intel-spi.h   |  6 +-
 6 files changed, 167 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-intel-spi

diff --git a/Documentation/ABI/testing/sysfs-devices-intel-spi b/Documentation/ABI/testing/sysfs-devices-intel-spi
new file mode 100644
index 000000000000..515c36f8b5cf
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-intel-spi
@@ -0,0 +1,16 @@
+What:		/sys/devices/.../is_protected
+Date:		April 2021
+Contact:	Tomas Winkler <tomas.winkler@intel.com>
+Description:
+		The /sys/devices/.../is_protected attribute allows the user
+		space to check if the intel spi controller is write protected
+		from the host.
+
+What:		/sys/devices/.../bios_lock
+Date:		April 2021
+Contact:	Tomas Winkler <tomas.winkler@intel.com>
+Description:
+		The /sys/devices/.../bios_lock attribute allows the user
+		space to check if the intel spi controller is locked by bios
+		for writes. It is possible to unlock the bios lock by writing
+		"unlock" to the file.
diff --git a/MAINTAINERS b/MAINTAINERS
index ba561e5bc6f0..37c934f34ed7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11571,6 +11571,7 @@ Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
 C:	irc://irc.oftc.net/mtd
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
+F:	Documentation/ABI/testing/sysfs-devices-intel-spi
 F:	Documentation/devicetree/bindings/mtd/
 F:	drivers/mtd/
 F:	include/linux/mtd/
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 3bbb29a7e7a5..eceaf11bec93 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -1083,12 +1083,39 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
 	return ret;
 }
 
+static int lcp_ich_bios_unlock(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u32 bcr = 0;
+
+	pci_read_config_dword(pdev, BCR, &bcr);
+	if (!(bcr & BCR_WPD)) {
+		bcr |= BCR_WPD;
+		pci_write_config_dword(pdev, BCR, bcr);
+		pci_read_config_dword(pdev, BCR, &bcr);
+	}
+
+	if (!(bcr & BCR_WPD))
+		return -EIO;
+
+	return 0;
+}
+
+static bool lcp_ich_is_bios_locked(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u32 bcr = 0;
+
+	pci_read_config_dword(pdev, BCR, &bcr);
+	return !(bcr & BCR_WPD);
+}
+
 static int lpc_ich_init_spi(struct pci_dev *dev)
 {
 	struct lpc_ich_priv *priv = pci_get_drvdata(dev);
 	struct resource *res = &intel_spi_res[0];
 	struct intel_spi_boardinfo *info;
-	u32 spi_base, rcba, bcr;
+	u32 spi_base, rcba;
 
 	info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -1112,8 +1139,8 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 			res->start = spi_base + SPIBASE_LPT;
 			res->end = res->start + SPIBASE_LPT_SZ - 1;
 
-			pci_read_config_dword(dev, BCR, &bcr);
-			info->writeable = !!(bcr & BCR_WPD);
+			info->is_bios_locked = lcp_ich_is_bios_locked;
+			info->bios_unlock = lcp_ich_bios_unlock;
 		}
 		break;
 
@@ -1134,8 +1161,8 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 			res->start = spi_base & 0xfffffff0;
 			res->end = res->start + SPIBASE_APL_SZ - 1;
 
-			pci_bus_read_config_dword(bus, spi, BCR, &bcr);
-			info->writeable = !!(bcr & BCR_WPD);
+			info->is_bios_locked = lcp_ich_is_bios_locked;
+			info->bios_unlock = lcp_ich_bios_unlock;
 		}
 
 		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x1);
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 825610a2e9dc..f83f352f874d 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -24,12 +24,38 @@ static const struct intel_spi_boardinfo cnl_info = {
 	.type = INTEL_SPI_CNL,
 };
 
+static int intel_spi_pci_bios_unlock(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u32 bcr = 0;
+
+	pci_read_config_dword(pdev, BCR, &bcr);
+	if (!(bcr & BCR_WPD)) {
+		bcr |= BCR_WPD;
+		pci_write_config_dword(pdev, BCR, bcr);
+		pci_read_config_dword(pdev, BCR, &bcr);
+	}
+
+	if (!(bcr & BCR_WPD))
+		return -EIO;
+
+	return 0;
+}
+
+static bool intel_spi_pci_is_bios_locked(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	u32 bcr = 0;
+
+	pci_read_config_dword(pdev, BCR, &bcr);
+	return !(bcr & BCR_WPD);
+}
+
 static int intel_spi_pci_probe(struct pci_dev *pdev,
 			       const struct pci_device_id *id)
 {
 	struct intel_spi_boardinfo *info;
 	struct intel_spi *ispi;
-	u32 bcr;
 	int ret;
 
 	ret = pcim_enable_device(pdev);
@@ -41,14 +67,8 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
 	if (!info)
 		return -ENOMEM;
 
-	/* Try to make the chip read/write */
-	pci_read_config_dword(pdev, BCR, &bcr);
-	if (!(bcr & BCR_WPD)) {
-		bcr |= BCR_WPD;
-		pci_write_config_dword(pdev, BCR, bcr);
-		pci_read_config_dword(pdev, BCR, &bcr);
-	}
-	info->writeable = !!(bcr & BCR_WPD);
+	info->is_bios_locked = intel_spi_pci_is_bios_locked;
+	info->bios_unlock = intel_spi_pci_bios_unlock;
 
 	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info);
 	if (IS_ERR(ispi))
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index a413892ff449..bbe0639de702 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -131,7 +131,8 @@
  * @sregs: Start of software sequencer registers
  * @nregions: Maximum number of regions
  * @pr_num: Maximum number of protected range registers
- * @writeable: Is the chip writeable
+ * @is_protected: Whether the regions are write protected
+ * @is_bios_locked: Whether the spi is locked by BIOS
  * @locked: Is SPI setting locked
  * @swseq_reg: Use SW sequencer in register reads/writes
  * @swseq_erase: Use SW sequencer in erase operation
@@ -149,7 +150,8 @@ struct intel_spi {
 	void __iomem *sregs;
 	size_t nregions;
 	size_t pr_num;
-	bool writeable;
+	bool is_protected;
+	bool is_bios_locked;
 	bool locked;
 	bool swseq_reg;
 	bool swseq_erase;
@@ -326,7 +328,7 @@ static int intel_spi_init(struct intel_spi *ispi)
 				val = readl(ispi->base + BYT_BCR);
 			}
 
-			ispi->writeable = !!(val & BYT_BCR_WPD);
+			ispi->is_bios_locked = !(val & BYT_BCR_WPD);
 		}
 
 		break;
@@ -862,6 +864,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 	int i;
 
 	memset(part, 0, sizeof(*part));
+	ispi->is_protected = false;
 
 	/* Start from the mandatory descriptor region */
 	part->size = 4096;
@@ -886,7 +889,7 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 		 * whole partition read-only to be on the safe side.
 		 */
 		if (intel_spi_is_protected(ispi, base, limit))
-			ispi->writeable = false;
+			ispi->is_protected = true;
 
 		end = (limit << 12) + 4096;
 		if (end > part->size)
@@ -894,6 +897,60 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 	}
 }
 
+static ssize_t intel_spi_is_protected_show(struct device *dev,
+					   struct device_attribute *attr, char *buf)
+{
+	struct intel_spi *ispi = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", ispi->is_protected);
+}
+static DEVICE_ATTR_ADMIN_RO(intel_spi_is_protected);
+
+static ssize_t intel_spi_bios_lock_show(struct device *dev,
+					struct device_attribute *attr, char *buf)
+{
+	struct intel_spi *ispi = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", ispi->is_bios_locked);
+}
+
+static ssize_t intel_spi_bios_lock_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t len)
+{
+	struct intel_spi *ispi = dev_get_drvdata(dev);
+	struct mtd_info *child, *master = mtd_get_master(&ispi->nor.mtd);
+	int err;
+
+	if (!ispi->info->is_bios_locked)
+		return -EOPNOTSUPP;
+
+	if (strcmp(buf, "unlock") != 0)
+		return -EINVAL;
+
+	if (ispi->info->is_bios_locked(dev)) {
+		err = ispi->info->bios_unlock(dev);
+		if (err)
+			return err;
+	}
+
+	ispi->is_bios_locked = false;
+
+	if (ispi->is_protected || !writeable)
+		return -EPERM;
+
+	/* Device is now writable */
+	ispi->nor.mtd.flags |= MTD_WRITEABLE;
+
+	mutex_lock(&master->master.partitions_lock);
+	list_for_each_entry(child, &ispi->nor.mtd.partitions, part.node)
+		child->flags |= MTD_WRITEABLE;
+	mutex_unlock(&master->master.partitions_lock);
+
+	return len;
+}
+static DEVICE_ATTR_ADMIN_RW(intel_spi_bios_lock);
+
 static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 	.read_reg = intel_spi_read_reg,
 	.write_reg = intel_spi_write_reg,
@@ -902,6 +959,15 @@ static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 	.erase = intel_spi_erase,
 };
 
+int intel_spi_remove(struct intel_spi *ispi)
+{
+	device_remove_file(ispi->dev, &dev_attr_intel_spi_is_protected);
+	device_remove_file(ispi->dev, &dev_attr_intel_spi_bios_lock);
+
+	return mtd_device_unregister(&ispi->nor.mtd);
+}
+EXPORT_SYMBOL_GPL(intel_spi_remove);
+
 struct intel_spi *intel_spi_probe(struct device *dev,
 	struct resource *mem, const struct intel_spi_boardinfo *info)
 {
@@ -927,7 +993,9 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 
 	ispi->dev = dev;
 	ispi->info = info;
-	ispi->writeable = info->writeable;
+	ispi->is_bios_locked = info->is_bios_locked(dev);
+	dev_dbg(ispi->dev, "is_bios_locked: %d writeable: %d\n",
+		ispi->is_bios_locked, writeable);
 
 	ret = intel_spi_init(ispi);
 	if (ret)
@@ -946,22 +1014,28 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	intel_spi_fill_partition(ispi, &part);
 
 	/* Prevent writes if not explicitly enabled */
-	if (!ispi->writeable || !writeable)
+	if (ispi->is_protected || ispi->is_bios_locked || !writeable)
 		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
 
 	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
 	if (ret)
 		return ERR_PTR(ret);
 
+	ret = device_create_file(ispi->dev, &dev_attr_intel_spi_is_protected);
+	if (ret)
+		goto err;
+	ret = device_create_file(ispi->dev, &dev_attr_intel_spi_bios_lock);
+	if (ret)
+		goto err;
+
 	return ispi;
+
+err:
+	intel_spi_remove(ispi);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(intel_spi_probe);
 
-int intel_spi_remove(struct intel_spi *ispi)
-{
-	return mtd_device_unregister(&ispi->nor.mtd);
-}
-EXPORT_SYMBOL_GPL(intel_spi_remove);
 
 MODULE_DESCRIPTION("Intel PCH/PCU SPI flash core driver");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
diff --git a/include/linux/platform_data/x86/intel-spi.h b/include/linux/platform_data/x86/intel-spi.h
index 7f53a5c6f35e..335dbb40620f 100644
--- a/include/linux/platform_data/x86/intel-spi.h
+++ b/include/linux/platform_data/x86/intel-spi.h
@@ -19,11 +19,13 @@ enum intel_spi_type {
 /**
  * struct intel_spi_boardinfo - Board specific data for Intel SPI driver
  * @type: Type which this controller is compatible with
- * @writeable: The chip is writeable
+ * @is_bios_locked: report if the device is locked by BIOS
+ * @bios_unlock: handler to unlock the bios
  */
 struct intel_spi_boardinfo {
 	enum intel_spi_type type;
-	bool writeable;
+	bool (*is_bios_locked)(struct device *dev);
+	int (*bios_unlock)(struct device *dev);
 };
 
 #endif /* INTEL_SPI_PDATA_H */
-- 
2.26.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
