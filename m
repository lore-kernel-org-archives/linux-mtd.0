Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BDBC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:33:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9FDA651EB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9FDA651EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lhmOp4wLAOQHWsaysUYiXACwGmLSFzu5U5iiKRxIKV4=; b=dM+o5v90fCUnZ8XFCys9MWR45
	LsdIb8KgmS2SgXrwJ+WjOFPLRVmCZG0e3MHR3BRkg1ZD8BbP/XmQEoZW6+RJYK0t3I5JhvWeTg7/y
	c8JkKPNDExoao6Q9imXsfRk0jfN/qRcbOp6Pd6KDc2AsWsICq8hfKw7/lZDhHwpEbHFpPeZxKQzyE
	WdVj/3WKZ6ernRPvbcqQ2jmBUu8RWfBnkOlngjYMbuVcGCWvCG75To5fI92h1l+N691iWLP2AHLR9
	wlWqamPI8hmPXmXZ3jLxWrq3NmoPcp7B+eU6NH7GvaBFKb0iqWZs63+C3wf4N2eMW2YUxFpJi+XVQ
	y1y4vU86g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9RC-00FVAv-Sk; Mon, 08 Mar 2021 06:32:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9P8-00FUk0-8e
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=v7M56qOqxjqkSwdfHEhl5makJD8nO3O3zkhuwyoaqEA=; b=N9XG+mY5l+SMY+fzWt1QGraWbR
 5ATD9sP+2ZqR+5ZxYA6HVU648G8kkHff4s9cA+KdXiczowAOlSlRGL+Jhxh0DJo/3hPHTdabuCp4E
 dMwHi3kP5BJonw4g20z2cFY2JbQq4WuGBlJgP5pvom1vCegnX/KfHrxEfZBByPHp2+YSz+9zjh4gc
 iRGace13C1SpngMKz2bRNRrPzL07aIkaB0LCUAOFl/rxq54N9VZA9lLX+CunPbxRNYydo75ZKSdiI
 ANXTyc+Owf6AONOENwdvCAYZLbsdW3hJwI8hSpTrJfIut8RRz/wHMKs37iSK0JT1e5CtEDvEGO1rj
 CPW4Nx3Q==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9P2-00F81V-53
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:30:08 +0000
IronPort-SDR: hT3DIPjLvBn7/Sdgqe3ACE1a98MXzpvW+I6H5pfTEjcs18k5JhkRpurRvyZOaE5Jr8EBZnA5oh
 LIICX7B1jiHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084477"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:15 -0800
IronPort-SDR: b1DYI3j7iV+3NE6LvInSeATASjVm4Rr7FpjMol7lRfpYZNGnU9IiIBPXKmaET0IAoD21aM/ZT/
 kKbWNe30qq8g==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181934"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:12 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC PATCH 04/10 v2] drm/i915/spi: implement regions enumeration
Date: Mon,  8 Mar 2021 08:27:42 +0200
Message-Id: <20210308062748.208017-5-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_063005_146305_D956DA83 
X-CRM114-Status: GOOD (  17.22  )
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

Implement SPI device regions enumeration, as there is no access to
the spi controller, all the information has to be extracted
form the descriptor region.


Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
V2: Update the commit message.

 drivers/gpu/drm/i915/spi/i915_spi.c | 190 ++++++++++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/i915_spi.c b/drivers/gpu/drm/i915/spi/i915_spi.c
index 23261f35b71f..a1e7171d05db 100644
--- a/drivers/gpu/drm/i915/spi/i915_spi.c
+++ b/drivers/gpu/drm/i915/spi/i915_spi.c
@@ -16,14 +16,197 @@ struct i915_spi {
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
+static inline void spi_set_region_id(struct i915_spi *spi, u8 region)
+{
+	iowrite32((u32)region, spi->base + SPI_REGION_ID_REG);
+}
+
+static inline u32 spi_error(struct i915_spi *spi)
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
+static inline u32 spi_read32(struct i915_spi *spi, u32 address)
+{
+	void __iomem *base = spi->base;
+
+	iowrite32(address, base + SPI_ADDRESS_REG);
+
+	return ioread32(base + SPI_TRIGGER_REG);
+}
+
+static int spi_get_access_map(struct i915_spi *spi)
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
+static bool spi_region_readable(struct i915_spi *spi, u8 region)
+{
+	if (region < 12)
+		return spi->access_map & (1 << (region + 8)); /* [19:8] */
+	else
+		return spi->access_map & (1 << (region - 12)); /* [3:0] */
+}
+
+static bool spi_region_writeable(struct i915_spi *spi, u8 region)
+{
+	if (region < 12)
+		return spi->access_map & (1 << (region + 20)); /* [31:20] */
+	else
+		return spi->access_map & (1 << (region - 8)); /* [7:4] */
+}
+
+static int i915_spi_is_valid(struct i915_spi *spi)
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
+static int i915_spi_init(struct i915_spi *spi, struct device *device)
+{
+	int ret;
+	unsigned int i, n;
+
+	/* clean error register, previous errors are ignored */
+	spi_error(spi);
+
+	ret = i915_spi_is_valid(spi);
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
 static int i915_spi_probe(struct platform_device *platdev)
 {
 	struct resource *bar;
@@ -35,6 +218,7 @@ static int i915_spi_probe(struct platform_device *platdev)
 	size_t size;
 	char *name;
 	size_t name_size;
+	int ret;
 
 	device = &platdev->dev;
 
@@ -86,6 +270,12 @@ static int i915_spi_probe(struct platform_device *platdev)
 		return PTR_ERR(spi->base);
 	}
 
+	ret = i915_spi_init(spi, device);
+	if (ret < 0) {
+		dev_err(device, "cannot initialize spi\n");
+		return -ENODEV;
+	}
+
 	platform_set_drvdata(platdev, spi);
 
 	dev_dbg(device, "i915-spi is bound\n");
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
