Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4861CCD183
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Oct 2025 15:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sk8Lh6Pb33dK3+GcR8mLQCwkaiEsKKrG0C+1mKwjS5c=; b=U2JCi57PRk5NDM
	51QdkH7IJan0LHyFMxB7LpmKuMOdC9LBFHkCWo/ccCpEz85E3yuKtrZEYgRf5qAIjVQk0Q67Y7XlY
	8fUVupizEqTS32Vf9+iG8bi6VHM1OxptnnSticrjZKidemPa6m8YiVcUgkVa3G8keOEfxvBuZqYKT
	6zLxs7SSxJBGNCQLyTsO7ZPpCPO/pXNusXswC55Fo6r+i4yBaltbnIfRsCfLISTOfoY7I7mGXFumI
	O5pgh+TfQ+4KOTLsP3tD3FVu0NIRCOZfyfhj3amPsC63HSf2guPP4KQpMLsIAXZgbNQDrYrVi16pR
	0+slaYHg0FU5XHU8ryzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVD3-0000000B95r-2261;
	Sun, 19 Oct 2025 15:20:37 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAVCz-0000000B95E-1A0P
	for linux-mtd@lists.infradead.org;
	Sun, 19 Oct 2025 15:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760887233; x=1792423233;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cNjpz4hZNJmVrvl9B2SFuN3WAlWTG+z2D8+nRo9WN5M=;
  b=Zxu91mNYU316q9KRPnJRynXVIJDNMxRdW7ZlMWFHwg8hxpvR0HafH7HS
   E67LQkeLboDh060eudEL8QhDRe2HDCugeKiNoveaq4ngMOiFPu83QSd6h
   KAO3oBdG9Fmj97DANTDiQ2QPMpGsBYpnJNntzUhZmcAcn5IYZANaaqnMW
   T6mkcbgOwYHDQ5mmn+6WrRxrvXFzYQYu2CiMzd8ZEHeAZEHMYnxzK55iL
   NVyKJcMUz9XgqzBVln8DlAF0s3QFtffN+t5vY8aYUClJqtxNQqpbVSpGr
   zbD9C5tif1+KLsCntauszsXLpTwn9qqwv9p5mXUf2J2Yq1qxawPROX36s
   A==;
X-CSE-ConnectionGUID: IDhKfzkGQIaFiZrF2DXBjw==
X-CSE-MsgGUID: HqucESSaQDuPynBZtAZd2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="85648039"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="85648039"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 08:20:27 -0700
X-CSE-ConnectionGUID: kxbWKDMLTxWete2e2BopsA==
X-CSE-MsgGUID: gBvwE/G4TQy1J3O2OA9rOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="188442116"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 08:20:25 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] mtd: intel-dg: wake card on operations
Date: Sun, 19 Oct 2025 18:01:45 +0300
Message-ID: <20251019150145.3228079-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_082033_357557_E8047E6A 
X-CRM114-Status: GOOD (  16.34  )
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

Enable runtime PM in mtd driver to notify parent graphics driver
that whole card should be kept awake while nvm operations are
performed through this driver.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 72 +++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index b438ee5aacc3..9c8d1405219c 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -15,14 +15,18 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/pm_runtime.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
+#define INTEL_DG_NVM_RPM_TIMEOUT_MS 500
+
 struct intel_dg_nvm {
 	struct kref refcnt;
 	struct mtd_info mtd;
+	struct device *dev;
 	struct mutex lock; /* region access lock */
 	void __iomem *base;
 	void __iomem *base2;
@@ -421,6 +425,8 @@ static int intel_dg_nvm_init(struct intel_dg_nvm *nvm, struct device *device,
 	unsigned int i, n;
 	int ret;
 
+	nvm->dev = device;
+
 	/* clean error register, previous errors are ignored */
 	idg_nvm_error(nvm);
 
@@ -494,6 +500,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 	size_t total_len;
 	unsigned int idx;
 	ssize_t bytes;
+	int ret = 0;
 	loff_t from;
 	size_t len;
 	u8 region;
@@ -512,20 +519,28 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 	total_len = info->len;
 	addr = info->addr;
 
+	ret = pm_runtime_resume_and_get(nvm->dev);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
+		return ret;
+	}
+
 	guard(mutex)(&nvm->lock);
 
 	while (total_len > 0) {
 		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
 			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
 			info->fail_addr = addr;
-			return -ERANGE;
+			ret = -ERANGE;
+			break;
 		}
 
 		idx = idg_nvm_get_region(nvm, addr);
 		if (idx >= nvm->nregions) {
 			dev_err(&mtd->dev, "out of range");
 			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
-			return -ERANGE;
+			ret = -ERANGE;
+			break;
 		}
 
 		from = addr - nvm->regions[idx].offset;
@@ -541,14 +556,17 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 		if (bytes < 0) {
 			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
 			info->fail_addr += nvm->regions[idx].offset;
-			return bytes;
+			ret = bytes;
+			break;
 		}
 
 		addr += len;
 		total_len -= len;
 	}
 
-	return 0;
+	pm_runtime_mark_last_busy(nvm->dev);
+	pm_runtime_put_autosuspend(nvm->dev);
+	return ret;
 }
 
 static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
@@ -577,17 +595,25 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len > nvm->regions[idx].size - from)
 		len = nvm->regions[idx].size - from;
 
+	ret = pm_runtime_resume_and_get(nvm->dev);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		return ret;
+	}
+
 	guard(mutex)(&nvm->lock);
 
 	ret = idg_read(nvm, region, from, len, buf);
 	if (ret < 0) {
 		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
-		return ret;
+	} else {
+		*retlen = ret;
+		ret = 0;
 	}
 
-	*retlen = ret;
-
-	return 0;
+	pm_runtime_mark_last_busy(nvm->dev);
+	pm_runtime_put_autosuspend(nvm->dev);
+	return ret;
 }
 
 static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
@@ -616,17 +642,25 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (len > nvm->regions[idx].size - to)
 		len = nvm->regions[idx].size - to;
 
+	ret = pm_runtime_resume_and_get(nvm->dev);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
+		return ret;
+	}
+
 	guard(mutex)(&nvm->lock);
 
 	ret = idg_write(nvm, region, to, len, buf);
 	if (ret < 0) {
 		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
-		return ret;
+	} else {
+		*retlen = ret;
+		ret = 0;
 	}
 
-	*retlen = ret;
-
-	return 0;
+	pm_runtime_mark_last_busy(nvm->dev);
+	pm_runtime_put_autosuspend(nvm->dev);
+	return ret;
 }
 
 static void intel_dg_nvm_release(struct kref *kref)
@@ -753,6 +787,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 	}
 	nvm->nregions = n; /* in case where kasprintf fail */
 
+	devm_pm_runtime_enable(device);
+
+	pm_runtime_set_autosuspend_delay(device, INTEL_DG_NVM_RPM_TIMEOUT_MS);
+	pm_runtime_use_autosuspend(device);
+
+	ret = pm_runtime_resume_and_get(device);
+	if (ret < 0) {
+		dev_err(device, "rpm: get failed %d\n", ret);
+		goto err_norpm;
+	}
+
 	nvm->base = devm_ioremap_resource(device, &invm->bar);
 	if (IS_ERR(nvm->base)) {
 		ret = PTR_ERR(nvm->base);
@@ -781,9 +826,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
 	dev_set_drvdata(&aux_dev->dev, nvm);
 
+	pm_runtime_put(device);
 	return 0;
 
 err:
+	pm_runtime_put(device);
+err_norpm:
 	kref_put(&nvm->refcnt, intel_dg_nvm_release);
 	return ret;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
