Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5790C54E67
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 12:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVA+quUyjnGiTxFaavSYWt4fCAZHzqIpPmdlJI3uQG4=; b=Y/OxRPiCH4wIZO
	dlQnyN5NplUy8e88X7Z0/edVX1g2T2TYEoSP6Vq27dNrpVkvHtlXg6PI+/LpWz89pPTcKyF5joTKR
	l820TUa9l1GVULgiN17Ri/ylu/SB+KwNMEOm+AYCFkkzZEEYDJ5j7RLIYmgUTa9SNIpozV0MTxhQQ
	wGzujXPSOXlIhplyXKiYy50yiPx1VFykwE0w521Se/Pn3XvoePRWuBQqA5D2s6E0/DBUG0HQB2L8W
	3LXzjcKGB45ZjChTUn3YuIjYclXeWt+7ThfAGAEjTwuCJrUMEhw8OMaJ8SU1LV8H+bvlwOU+UpKpC
	7Tbk0QB24AtG89pHEsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoq7-0000000DtO3-2q0l;
	Thu, 28 Mar 2024 12:26:39 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoq3-0000000DtED-2IVy
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 12:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628796; x=1743164796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uqy+BRaTGrlZT701dUpBBU11lyKzmoJnhJuzWVAT9tc=;
  b=gpJx0Yd3yPYUsSaUizfskC1tUJIJTWeeFADl2bciXiiFCUpgubQIMexX
   1xkDNDNyOk/GaNVuHNL3hKAOqi3xHQcqupR8I3NCRV820I5ilcPYHgZw6
   HQtGe9VWGjX3UUbhnCnvChl3aEaV7tkpqvzKZGS+gucfzDlMzVyQPTcqU
   o127GD7FMIPFte3246E+kQFFVUaC/THItWjxeIXQ2bdqPO3V2c/iAomth
   dr1seAGZ47E7fT9rA6fXCsyCEqbfNYPN1vWBf6BWftWE9Lx1QkqcUy2SC
   vqPUpQXeSFXmrrKeQFaig1QyFszlAuB+rdPghX51nVsAhsUTacqwsTkPu
   g==;
X-CSE-ConnectionGUID: czFU20ZwT5OgFvpkAIPb2g==
X-CSE-MsgGUID: TJ9JyBSsT6Wj8gyy0/AI8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17505490"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17505490"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16657580"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:32 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 06/13] spi: intel-dg: implement region enumeration
Date: Thu, 28 Mar 2024 14:22:29 +0200
Message-Id: <20240328122236.1718111-7-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328122236.1718111-1-alexander.usyskin@intel.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_052635_646529_BA6EF2B0 
X-CRM114-Status: GOOD (  20.94  )
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

In intel-dg spi, there is no access to the spi controller,
the information is extracted from the descriptor region.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/spi/spi-intel-dg.c | 190 +++++++++++++++++++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
index 8dc5448fc901..8ef9dccc9062 100644
--- a/drivers/spi/spi-intel-dg.c
+++ b/drivers/spi/spi-intel-dg.c
@@ -17,14 +17,197 @@ struct intel_dg_spi {
 	void __iomem *base;
 	size_t size;
 	unsigned int nregions;
+	u32 access_map;
 	struct {
 		const char *name;
 		u8 id;
 		u64 offset;
 		u64 size;
+		unsigned int is_readable:1;
+		unsigned int is_writable:1;
 	} regions[];
 };
 
+#define SPI_TRIGGER_REG       0x00000000
+#define SPI_VALSIG_REG        0x00000010
+#define SPI_ADDRESS_REG       0x00000040
+#define SPI_REGION_ID_REG     0x00000044
+/*
+ * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
+ * [23:16]-Reserved
+ * [31:24]-Erase SPI RegionID
+ */
+#define SPI_ERASE_REG         0x00000048
+#define SPI_ACCESS_ERROR_REG  0x00000070
+#define SPI_ADDRESS_ERROR_REG 0x00000074
+
+/* Flash Valid Signature */
+#define SPI_FLVALSIG          0x0FF0A55A
+
+#define SPI_MAP_ADDR_MASK     0x000000FF
+#define SPI_MAP_ADDR_SHIFT    0x00000004
+
+#define REGION_ID_DESCRIPTOR  0
+/* Flash Region Base Address */
+#define FRBA      0x40
+/* Flash Region __n - Flash Descriptor Record */
+#define FLREG(__n)  (FRBA + ((__n) * 4))
+/*  Flash Map 1 Register */
+#define FLMAP1_REG  0x18
+#define FLMSTR4_OFFSET 0x00C
+
+#define SPI_ACCESS_ERROR_PCIE_MASK 0x7
+
+static inline void spi_set_region_id(struct intel_dg_spi *spi, u8 region)
+{
+	iowrite32((u32)region, spi->base + SPI_REGION_ID_REG);
+}
+
+static inline u32 spi_error(struct intel_dg_spi *spi)
+{
+	u32 reg = ioread32(spi->base + SPI_ACCESS_ERROR_REG) &
+		  SPI_ACCESS_ERROR_PCIE_MASK;
+
+	/* reset error bits */
+	if (reg)
+		iowrite32(reg, spi->base + SPI_ACCESS_ERROR_REG);
+
+	return reg;
+}
+
+static inline u32 spi_read32(struct intel_dg_spi *spi, u32 address)
+{
+	void __iomem *base = spi->base;
+
+	iowrite32(address, base + SPI_ADDRESS_REG);
+
+	return ioread32(base + SPI_TRIGGER_REG);
+}
+
+static int spi_get_access_map(struct intel_dg_spi *spi)
+{
+	u32 flmap1;
+	u32 fmba;
+	u32 fmstr4;
+	u32 fmstr4_addr;
+
+	spi_set_region_id(spi, REGION_ID_DESCRIPTOR);
+
+	flmap1 = spi_read32(spi, FLMAP1_REG);
+	if (spi_error(spi))
+		return -EIO;
+	/* Get Flash Master Baser Address (FMBA) */
+	fmba = ((flmap1 & SPI_MAP_ADDR_MASK) << SPI_MAP_ADDR_SHIFT);
+	fmstr4_addr = fmba + FLMSTR4_OFFSET;
+
+	fmstr4 = spi_read32(spi, fmstr4_addr);
+	if (spi_error(spi))
+		return -EIO;
+
+	spi->access_map = fmstr4;
+	return 0;
+}
+
+static bool spi_region_readable(struct intel_dg_spi *spi, u8 region)
+{
+	if (region < 12)
+		return spi->access_map & (1 << (region + 8)); /* [19:8] */
+	else
+		return spi->access_map & (1 << (region - 12)); /* [3:0] */
+}
+
+static bool spi_region_writeable(struct intel_dg_spi *spi, u8 region)
+{
+	if (region < 12)
+		return spi->access_map & (1 << (region + 20)); /* [31:20] */
+	else
+		return spi->access_map & (1 << (region - 8)); /* [7:4] */
+}
+
+static int intel_dg_spi_is_valid(struct intel_dg_spi *spi)
+{
+	u32 is_valid;
+
+	spi_set_region_id(spi, REGION_ID_DESCRIPTOR);
+
+	is_valid = spi_read32(spi, SPI_VALSIG_REG);
+	if (spi_error(spi))
+		return -EIO;
+
+	if (is_valid != SPI_FLVALSIG)
+		return -ENODEV;
+
+	return 0;
+}
+
+static int intel_dg_spi_init(struct intel_dg_spi *spi, struct device *device)
+{
+	int ret;
+	unsigned int i, n;
+
+	/* clean error register, previous errors are ignored */
+	spi_error(spi);
+
+	ret = intel_dg_spi_is_valid(spi);
+	if (ret) {
+		dev_err(device, "The SPI is not valid %d\n", ret);
+		return ret;
+	}
+
+	if (spi_get_access_map(spi))
+		return -EIO;
+
+	for (i = 0, n = 0; i < spi->nregions; i++) {
+		u32 address, base, limit, region;
+		u8 id = spi->regions[i].id;
+
+		address = FLREG(id);
+		region = spi_read32(spi, address);
+
+		base = (region & 0x0000FFFF) << 12;
+		limit = (((region & 0xFFFF0000) >> 16) << 12) | 0xFFF;
+
+		dev_dbg(device, "[%d] %s: region: 0x%08X base: 0x%08x limit: 0x%08x\n",
+			id, spi->regions[i].name, region, base, limit);
+
+		if (base >= limit || (i > 0 && limit == 0)) {
+			dev_dbg(device, "[%d] %s: disabled\n",
+				id, spi->regions[i].name);
+			spi->regions[i].is_readable = 0;
+			continue;
+		}
+
+		if (spi->size < limit)
+			spi->size = limit;
+
+		spi->regions[i].offset = base;
+		spi->regions[i].size = limit - base + 1;
+		/* No write access to descriptor; mask it out*/
+		spi->regions[i].is_writable = spi_region_writeable(spi, id);
+
+		spi->regions[i].is_readable = spi_region_readable(spi, id);
+		dev_dbg(device, "Registered, %s id=%d offset=%lld size=%lld rd=%d wr=%d\n",
+			spi->regions[i].name,
+			spi->regions[i].id,
+			spi->regions[i].offset,
+			spi->regions[i].size,
+			spi->regions[i].is_readable,
+			spi->regions[i].is_writable);
+
+		if (spi->regions[i].is_readable)
+			n++;
+	}
+
+	dev_dbg(device, "Registered %d regions\n", n);
+
+	/* Need to add 1 to the amount of memory
+	 * so it is reported as an even block
+	 */
+	spi->size += 1;
+
+	return n;
+}
+
 static void intel_dg_spi_release(struct kref *kref)
 {
 	struct intel_dg_spi *spi = container_of(kref, struct intel_dg_spi, refcnt);
@@ -92,6 +275,13 @@ static int intel_dg_spi_probe(struct auxiliary_device *aux_dev,
 		goto err;
 	}
 
+	ret = intel_dg_spi_init(spi, device);
+	if (ret < 0) {
+		dev_err(device, "cannot initialize spi\n");
+		ret = -ENODEV;
+		goto err;
+	}
+
 	dev_set_drvdata(&aux_dev->dev, spi);
 
 	dev_dbg(device, "bound\n");
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
