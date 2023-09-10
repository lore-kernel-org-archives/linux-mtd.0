Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF59FEE57CD
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Sep 2023 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/VZ6ce9bogj0IhEUkxzi7xMFQNNgMF7bEJo4U5V8+g=; b=GfGrOsUyLO3ZA2
	KGCfzT5P1FTKFrX9hRrxWJuL7i4qAya40ekIKut9e6ZP8MZenM0ls8W3fE6/rvp1PcI0/kvhegXDX
	t2v9c66Qoq6l2BSKu0WxJnf8ZVFlhUWzjexB9/MacihkXixzRMQppDRNB5D25UlUi2Pan1m/IEtVc
	l2v3QFYaLU7/Z81zCUPC+ZR6ymNpuIGoX1ZuNYZ3tBerrigD4kAAQ8yKsUmikRtYJZPRH/htFBgc1
	ptt8Fw4xCkfcitU3E3Wm/6F+lBLFYFXvj+Ga6ZoHGYoRWtfT9R7L46LSxQjFHPXdL6ybc4Jso7lPG
	4k9z/+QR5XE+KQEP+OEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJo0-00GbEv-23;
	Sun, 10 Sep 2023 12:44:48 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJnw-00Gb8g-2M
	for linux-mtd@lists.infradead.org;
	Sun, 10 Sep 2023 12:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694349884; x=1725885884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ygZ8FPGXW0k6w3nwVWljhAQltSK6KY1gpNQcuEsBK4Q=;
  b=PbMcqK76T1+CvXyaClrSVT2js7+yiglfOO+h5s6QVYmv//WYKGYEHSn5
   VfBGLo4nNww8NNwkZg1PwM9xWHBrwiq3s6q8yxcIdfB2lkeOSV+gzK8bN
   i224jRMzCHX3W6hyGI1V6eyHhoIMISrnkunwIMNBBcuYnpi1EoTK3NZXI
   D9okRxZagpOSy3+n76Ch9un6waCYWHYotcqsovdlGIw5wR81cqaQZ5vjv
   SiQxlxQcZjEeekk00L+Kieeun5OFxfPCCPHqnTUitQ0uNP2ETEj3HlI7v
   QQb+dgkK6dqXfrCAXtyvp9lVCh95POAhae2JvJq+B4Q3fzCJhAOE7kKnG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441907111"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="441907111"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073815079"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="1073815079"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:41 -0700
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
	Tomas Winkler <tomas.winkler@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 06/10] drm/i915/spi: spi register with mtd
Date: Sun, 10 Sep 2023 15:39:45 +0300
Message-Id: <20230910123949.1251964-7-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230910123949.1251964-1-alexander.usyskin@intel.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_054444_905647_C3D74291 
X-CRM114-Status: GOOD (  16.97  )
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

From: Tomas Winkler <tomas.winkler@intel.com>

Register the on-die spi device with the mtd subsystem.
Refcount spi object on _get and _put mtd callbacks.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 118 +++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi_drv.c b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
index e3b78128ba76..355f9ad71602 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi_drv.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
@@ -15,8 +15,13 @@
 #include <linux/delay.h>
 #include "spi/intel_spi.h"
 
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+
 struct i915_spi {
 	struct kref refcnt;
+	struct mtd_info mtd;
+	struct mutex lock; /* region access lock */
 	void __iomem *base;
 	size_t size;
 	unsigned int nregions;
@@ -407,6 +412,29 @@ static int i915_spi_init(struct i915_spi *spi, struct device *device)
 	return n;
 }
 
+static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
+{
+	dev_err(&mtd->dev, "erasing %lld %lld\n", info->addr, info->len);
+
+	return 0;
+}
+
+static int i915_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
+			 size_t *retlen, u_char *buf)
+{
+	dev_err(&mtd->dev, "read %lld %zd\n", from, len);
+
+	return 0;
+}
+
+static int i915_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
+			  size_t *retlen, const u_char *buf)
+{
+	dev_err(&mtd->dev, "writing %lld %zd\n", to, len);
+
+	return 0;
+}
+
 static void i915_spi_release(struct kref *kref)
 {
 	struct i915_spi *spi = container_of(kref, struct i915_spi, refcnt);
@@ -415,9 +443,90 @@ static void i915_spi_release(struct kref *kref)
 	pr_debug("freeing spi memory\n");
 	for (i = 0; i < spi->nregions; i++)
 		kfree(spi->regions[i].name);
+	mutex_destroy(&spi->lock);
 	kfree(spi);
 }
 
+static int i915_spi_get_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master;
+	struct i915_spi *spi;
+
+	if (!mtd)
+		return -ENODEV;
+
+	master = mtd_get_master(mtd);
+	spi = master->priv;
+	if (WARN_ON(!spi))
+		return -EINVAL;
+	pr_debug("get spi %s %d\n", mtd->name, kref_read(&spi->refcnt));
+	kref_get(&spi->refcnt);
+
+	return 0;
+}
+
+static void i915_spi_put_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master;
+	struct i915_spi *spi;
+
+	if (!mtd)
+		return;
+
+	master = mtd_get_master(mtd);
+	spi = master->priv;
+	if (WARN_ON(!spi))
+		return;
+	pr_debug("put spi %s %d\n", mtd->name, kref_read(&spi->refcnt));
+	kref_put(&spi->refcnt, i915_spi_release);
+}
+
+static int i915_spi_init_mtd(struct i915_spi *spi, struct device *device,
+			     unsigned int nparts)
+{
+	unsigned int i;
+	unsigned int n;
+	struct mtd_partition *parts = NULL;
+	int ret;
+
+	dev_dbg(device, "registering with mtd\n");
+
+	spi->mtd.owner = THIS_MODULE;
+	spi->mtd.dev.parent = device;
+	spi->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;
+	spi->mtd.type = MTD_DATAFLASH;
+	spi->mtd.priv = spi;
+	spi->mtd._write = i915_spi_write;
+	spi->mtd._read = i915_spi_read;
+	spi->mtd._erase = i915_spi_erase;
+	spi->mtd._get_device = i915_spi_get_device;
+	spi->mtd._put_device = i915_spi_put_device;
+	spi->mtd.writesize = SZ_1; /* 1 byte granularity */
+	spi->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
+	spi->mtd.size = spi->size;
+
+	parts = kcalloc(spi->nregions, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	for (i = 0, n = 0; i < spi->nregions && n < nparts; i++) {
+		if (!spi->regions[i].is_readable)
+			continue;
+		parts[n].name = spi->regions[i].name;
+		parts[n].offset  = spi->regions[i].offset;
+		parts[n].size = spi->regions[i].size;
+		if (!spi->regions[i].is_writable)
+			parts[n].mask_flags = MTD_WRITEABLE;
+		n++;
+	}
+
+	ret = mtd_device_register(&spi->mtd, parts, n);
+
+	kfree(parts);
+
+	return ret;
+}
+
 static int i915_spi_probe(struct auxiliary_device *aux_dev,
 			  const struct auxiliary_device_id *aux_dev_id)
 {
@@ -449,6 +558,7 @@ static int i915_spi_probe(struct auxiliary_device *aux_dev,
 	if (!spi)
 		return -ENOMEM;
 
+	mutex_init(&spi->lock);
 	kref_init(&spi->refcnt);
 
 	spi->nregions = nregions;
@@ -481,6 +591,12 @@ static int i915_spi_probe(struct auxiliary_device *aux_dev,
 		goto err;
 	}
 
+	ret = i915_spi_init_mtd(spi, device, ret);
+	if (ret) {
+		dev_err(device, "i915-spi failed init mtd %d\n", ret);
+		goto err;
+	}
+
 	dev_set_drvdata(&aux_dev->dev, spi);
 
 	dev_dbg(device, "i915-spi is bound\n");
@@ -499,6 +615,8 @@ static void i915_spi_remove(struct auxiliary_device *aux_dev)
 	if (!spi)
 		return;
 
+	mtd_device_unregister(&spi->mtd);
+
 	dev_set_drvdata(&aux_dev->dev, NULL);
 
 	kref_put(&spi->refcnt, i915_spi_release);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
