Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F553EE14D8
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Sep 2023 12:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOWyTAYO/rAJCFa9cV63baxwGajB7/R6/mk94votnsc=; b=iJdl9jdhk4Vgr/
	n8g3lVnfAN5aJ8L/rCdrut3QUMFo5pC2o4jFb8Ir+b7LjTMdjUWNMFcyQuQ6nu5NCPUTZ5mnH655Y
	wd6iXjNVYlsF6kLHKkXztXrYUC3bEU1xMVjE99ml+zrRmSDpX/mDjanaPQBgHbTZqeG+TaLAMqz1L
	xIX84Jx12bOWKhqKobgWjeE/sNGDgFcMlHClcR+3IMbG0WNB2G0lVt12rcou/2PrMyJJBIkFuE0wM
	wOruAF9EQeoPq/i57VWNfwS996sTg0ERYfpQ6SRhy1m65DApeAiCwM99zB02yKh+gjPlckYNARRs5
	95En5BlUxeyqqCs9WbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJo8-00GbKU-1K;
	Sun, 10 Sep 2023 12:44:56 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJo5-00Gb8g-1U
	for linux-mtd@lists.infradead.org;
	Sun, 10 Sep 2023 12:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694349893; x=1725885893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0dBk/4fMArENbWUjH92PyfYG5dAy2flmPQHcoRC5pw4=;
  b=anUuJ6pnrQDBJ7sir2Z+PCj2X3pf/Kf/2RmXsmiaH8w1O41d9S8mRxNh
   Y8tgmFx1/4nsG/HBx0UKA8jiCziE6VbdiaovcdEBALAZFdDDjR2T3AGg/
   Mgs9bNHbUKK4pV2idoEHmz30+wxrjwOmblLdjKB5FCXSEL1/q5MxKaJTN
   MvR5jMOVAp9Q5Q666VaDf3BzByXBrZ2Gvk/24BjZ6RLs+7JuYbYBK2XcZ
   PuS9cf7XknQ1M+rxJE1g91tfGKSMw0ci+5MnZlbFMCUx9Za/eD9z/TwM4
   obGZUwtybtiv+u176g7FsAct0UCwWb2HiIezCwHqjzxA+vfO3uAbUzWjn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441907132"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="441907132"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073815139"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="1073815139"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:50 -0700
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
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 09/10] drm/i915/spi: wake card on operations
Date: Sun, 10 Sep 2023 15:39:48 +0300
Message-Id: <20230910123949.1251964-10-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230910123949.1251964-1-alexander.usyskin@intel.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_054453_597593_433DB198 
X-CRM114-Status: GOOD (  13.47  )
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

Enable runtime PM in spi driver to notify i915 that
whole card should be kept awake while spi operations are
performed through this driver.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi_drv.c b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
index 22b804ebadc0..6b514b137fd0 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi_drv.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
@@ -13,12 +13,15 @@
 #include <linux/sizes.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/delay.h>
+#include <linux/pm_runtime.h>
 #include "spi/intel_spi.h"
 #include "i915_reg_defs.h"
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
+#define I915_SPI_RPM_TIMEOUT 500
+
 struct i915_spi {
 	struct kref refcnt;
 	struct mtd_info mtd;
@@ -473,6 +476,12 @@ static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 	total_len = info->len;
 	addr = info->addr;
 
+	ret = pm_runtime_resume_and_get(mtd->dev.parent);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&spi->lock);
 
 	while (total_len > 0) {
@@ -514,6 +523,8 @@ static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 
 out:
 	mutex_unlock(&spi->lock);
+	pm_runtime_mark_last_busy(mtd->dev.parent);
+	pm_runtime_put_autosuspend(mtd->dev.parent);
 	return ret;
 }
 
@@ -547,6 +558,12 @@ static int i915_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len > spi->regions[idx].size - from)
 		len = spi->regions[idx].size - from;
 
+	ret = pm_runtime_resume_and_get(mtd->dev.parent);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&spi->lock);
 
 	ret = spi_read(spi, region, from, len, buf);
@@ -559,6 +576,8 @@ static int i915_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	*retlen = ret;
 
 	mutex_unlock(&spi->lock);
+	pm_runtime_mark_last_busy(mtd->dev.parent);
+	pm_runtime_put_autosuspend(mtd->dev.parent);
 	return 0;
 }
 
@@ -592,6 +611,12 @@ static int i915_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (len > spi->regions[idx].size - to)
 		len = spi->regions[idx].size - to;
 
+	ret = pm_runtime_resume_and_get(mtd->dev.parent);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		return ret;
+	}
+
 	mutex_lock(&spi->lock);
 
 	ret = spi_write(spi, region, to, len, buf);
@@ -604,6 +629,8 @@ static int i915_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	*retlen = ret;
 
 	mutex_unlock(&spi->lock);
+	pm_runtime_mark_last_busy(mtd->dev.parent);
+	pm_runtime_put_autosuspend(mtd->dev.parent);
 	return 0;
 }
 
@@ -749,6 +776,17 @@ static int i915_spi_probe(struct auxiliary_device *aux_dev,
 		}
 	}
 
+	pm_runtime_enable(device);
+
+	pm_runtime_set_autosuspend_delay(device, I915_SPI_RPM_TIMEOUT);
+	pm_runtime_use_autosuspend(device);
+
+	ret = pm_runtime_resume_and_get(device);
+	if (ret < 0) {
+		dev_err(device, "rpm: get failed %d\n", ret);
+		goto err_norpm;
+	}
+
 	spi->base = devm_ioremap_resource(device, &ispi->bar);
 	if (IS_ERR(spi->base)) {
 		dev_err(device, "mmio not mapped\n");
@@ -773,9 +811,13 @@ static int i915_spi_probe(struct auxiliary_device *aux_dev,
 
 	dev_dbg(device, "i915-spi is bound\n");
 
+	pm_runtime_put(device);
 	return 0;
 
 err:
+	pm_runtime_put(device);
+err_norpm:
+	pm_runtime_disable(device);
 	kref_put(&spi->refcnt, i915_spi_release);
 	return ret;
 }
@@ -787,6 +829,8 @@ static void i915_spi_remove(struct auxiliary_device *aux_dev)
 	if (!spi)
 		return;
 
+	pm_runtime_disable(&aux_dev->dev);
+
 	mtd_device_unregister(&spi->mtd);
 
 	dev_set_drvdata(&aux_dev->dev, NULL);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
