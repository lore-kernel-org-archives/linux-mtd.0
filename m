Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0435DCD1280
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 12:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCTp938jSwT5zo2tHjIue9HwAUNubAJP1dePA53eZt0=; b=xuoC+pgK9SjHNe
	9vyhIszkxzyz8yuKY9KKiBjESXujeX3iT8Ga850JBVn6Mn73RKOJdOJaVLlEZzrg6/+4rfegD/DZn
	H5IB8hOuT99hXiRKs7sh7fegNmZgp9WhfzCk+5RC0F+nwivarHa85RFkgDz983V+1q4GwNjm39vNT
	mNsRQCOM40ncw5gQBOhSrSzH1qnRtRDmfeHtAdjqEudEeu3jTGn0fAh3E1mni3Mh2R3OWPGJh7DeV
	YiYM5RkOq/QDHVZsuGJ+Fs54MYxhWFjZVy61mrYUMvH9dlyTkQkxVKuImy39YHB0F4bxH0UGi8XRj
	RrKi+UvobLOEOOh1MC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoqN-0000000Dtbf-12Dy;
	Thu, 28 Mar 2024 12:26:55 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpoqD-0000000DtED-02vS
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 12:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628805; x=1743164805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sXq/tVm3G7cATprwOb2m7/tmxsL2XmDjuuC2FM05pac=;
  b=IDJASl8Py8+mfZ7fHjfFYL+Vt6kcb9CXPRZDSToKbF2mnVTKFKXyQcgi
   +a+0Di/dVKIUtmSxxFjiN7aBm9pR6XT+avrid+dZ1oTlh/NdJJmTOARyY
   3ScAvpdx/rsmRi2gSmHZP+u9Bj5xMzHjM0GO43DfDoJmCE58jAGMx3klN
   EvGKqPUwIPzW173H2YrKW3OzJ2QOH0kVfgjHrhHfORfgW70+d0UoFI92s
   i+ZdFxTJERztPXCgxX6rVX/dBhH86yjMZDJV2aVcqWXnFs4Mfz8u+a1gJ
   NK8ALip8TJ9u9VHaf1oY4ddEDVehrHAWQ4Q86hfhvuDWvjykUP+DaORjY
   Q==;
X-CSE-ConnectionGUID: u21W8I7XTaqnw0N70/DWtw==
X-CSE-MsgGUID: 8UOGtaTlSaGE8Vom2Og+/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17505513"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17505513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16657592"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:42 -0700
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
Subject: [PATCH 09/13] spi: intel-dg: implement mtd access handlers
Date: Thu, 28 Mar 2024 14:22:32 +0200
Message-Id: <20240328122236.1718111-10-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328122236.1718111-1-alexander.usyskin@intel.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_052645_217687_98900B8F 
X-CRM114-Status: GOOD (  16.56  )
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

Implement mtd read, erase, and write handlers.
For erase operation address and size should be 4K aligned.
For write operation address and size has to be 4bytes aligned.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/spi/spi-intel-dg.c | 152 +++++++++++++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-intel-dg.c b/drivers/spi/spi-intel-dg.c
index 4af8a2314fc7..9e8be7713f1a 100644
--- a/drivers/spi/spi-intel-dg.c
+++ b/drivers/spi/spi-intel-dg.c
@@ -174,7 +174,6 @@ static int intel_dg_spi_is_valid(struct intel_dg_spi *spi)
 	return 0;
 }
 
-__maybe_unused
 static unsigned int spi_get_region(const struct intel_dg_spi *spi, loff_t from)
 {
 	unsigned int i;
@@ -206,7 +205,6 @@ static ssize_t spi_rewrite_partial(struct intel_dg_spi *spi, loff_t to,
 	return len;
 }
 
-__maybe_unused
 static ssize_t spi_write(struct intel_dg_spi *spi, u8 region,
 			 loff_t to, size_t len, const unsigned char *buf)
 {
@@ -265,7 +263,6 @@ static ssize_t spi_write(struct intel_dg_spi *spi, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t spi_read(struct intel_dg_spi *spi, u8 region,
 			loff_t from, size_t len, unsigned char *buf)
 {
@@ -324,7 +321,6 @@ static ssize_t spi_read(struct intel_dg_spi *spi, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t
 spi_erase(struct intel_dg_spi *spi, u8 region, loff_t from, u64 len, u64 *fail_addr)
 {
@@ -413,18 +409,164 @@ static int intel_dg_spi_init(struct intel_dg_spi *spi, struct device *device)
 
 static int intel_dg_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 {
-	return 0;
+	struct intel_dg_spi *spi;
+	unsigned int idx;
+	u8 region;
+	u64 addr;
+	ssize_t bytes;
+	loff_t from;
+	size_t len;
+	size_t total_len;
+	int ret = 0;
+
+	if (!mtd || !info)
+		return -EINVAL;
+
+	spi = mtd->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(info->addr, SZ_4K) || !IS_ALIGNED(info->len, SZ_4K)) {
+		dev_err(&mtd->dev, "unaligned erase %llx %llx\n",
+			info->addr, info->len);
+		info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+		return -EINVAL;
+	}
+
+	total_len = info->len;
+	addr = info->addr;
+
+	mutex_lock(&spi->lock);
+
+	while (total_len > 0) {
+		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
+			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
+			info->fail_addr = addr;
+			ret = -ERANGE;
+			goto out;
+		}
+
+		idx = spi_get_region(spi, addr);
+		if (idx >= spi->nregions) {
+			dev_err(&mtd->dev, "out of range");
+			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+			ret = -ERANGE;
+			goto out;
+		}
+
+		from = addr - spi->regions[idx].offset;
+		region = spi->regions[idx].id;
+		len = total_len;
+		if (len > spi->regions[idx].size - from)
+			len = spi->regions[idx].size - from;
+
+		dev_dbg(&mtd->dev, "erasing region[%d] %s from %llx len %zx\n",
+			region, spi->regions[idx].name, from, len);
+
+		bytes = spi_erase(spi, region, from, len, &info->fail_addr);
+		if (bytes < 0) {
+			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
+			info->fail_addr += spi->regions[idx].offset;
+			ret = bytes;
+			goto out;
+		}
+
+		addr += len;
+		total_len -= len;
+	}
+
+out:
+	mutex_unlock(&spi->lock);
+	return ret;
 }
 
 static int intel_dg_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 			     size_t *retlen, u_char *buf)
 {
+	struct intel_dg_spi *spi;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (!mtd)
+		return -EINVAL;
+
+	spi = mtd->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+
+	idx = spi_get_region(spi, from);
+
+	dev_dbg(&mtd->dev, "reading region[%d] %s from %lld len %zd\n",
+		spi->regions[idx].id, spi->regions[idx].name, from, len);
+
+	if (idx >= spi->nregions) {
+		dev_err(&mtd->dev, "out of ragnge");
+		return -ERANGE;
+	}
+
+	from -= spi->regions[idx].offset;
+	region = spi->regions[idx].id;
+	if (len > spi->regions[idx].size - from)
+		len = spi->regions[idx].size - from;
+
+	mutex_lock(&spi->lock);
+
+	ret = spi_read(spi, region, from, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
+		mutex_unlock(&spi->lock);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	mutex_unlock(&spi->lock);
 	return 0;
 }
 
 static int intel_dg_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 			      size_t *retlen, const u_char *buf)
 {
+	struct intel_dg_spi *spi;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (!mtd)
+		return -EINVAL;
+
+	spi = mtd->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+
+	idx = spi_get_region(spi, to);
+
+	dev_dbg(&mtd->dev, "writing region[%d] %s to %lld len %zd\n",
+		spi->regions[idx].id, spi->regions[idx].name, to, len);
+
+	if (idx >= spi->nregions) {
+		dev_err(&mtd->dev, "out of range");
+		return -ERANGE;
+	}
+
+	to -= spi->regions[idx].offset;
+	region = spi->regions[idx].id;
+	if (len > spi->regions[idx].size - to)
+		len = spi->regions[idx].size - to;
+
+	mutex_lock(&spi->lock);
+
+	ret = spi_write(spi, region, to, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
+		mutex_unlock(&spi->lock);
+		return ret;
+	}
+
+	*retlen = ret;
+
+	mutex_unlock(&spi->lock);
 	return 0;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
