Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFFDCCD1AA
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Oct 2025 12:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qzf9WFJS/IgnPC0nj4Gi229Khb4dz7BlYVy87AAxEVA=; b=kSPWEYORxQrQn4
	JNw0j+BM6cKNpOWzumoNMRgOHD8ga0+DlbuK7uwlpB2yx1pBijEqAHtFJ3STGodEa9xWYdkVNxyV9
	+5k2c5krtkm2XPsSxIoVKaMF98cMe054p/guDwnbbN/te1OwJsmQru4DYFMHTyFV3/+xr8EQ5xsvC
	vzHAuyC8XlBFj3OIzjl3HECChtHGuVMF9qePN6v/a5i2fjMs+R1zjGdlrPBc/Fe71ChlB8hERCTkx
	WuDDHIppMahyxQd3wFgjjKm1o7qy6vLKEUnOfNWyvA0jjCtewrTWAnkbF8r71EM0Lp3galq/KeX+7
	Cv21PMy++kECYvjqS5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBpr-0000000H2Tm-0JBn;
	Tue, 21 Oct 2025 12:51:31 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBpo-0000000H2Sx-1gIe
	for linux-mtd@lists.infradead.org;
	Tue, 21 Oct 2025 12:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761051088; x=1792587088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jcnd0yDPXv2FFZ0tUi7p+G4qgcA41pgSy7DuPQOxb9c=;
  b=cyodGXHda1qUMZYTo2glC3ubne2wNsRC6hwCBPUHAkGfAFNsM//Nzvpj
   /zTFQ9z3OI8yGLVSe6AN8/wOPyVLKg4GbjCxk0zsQyrQr59F47NTnSAay
   B+V3Ijoa1D8WEtf70fa8QgtpO7TZsbLK2ENo8j79rAi2RfmIHnjfAzlbH
   Z51TRkjVvqdYsB7KsupNEcApp8VsLL0k4sHLKNEngTPd47/8KqS8Iquvq
   4xK/HILUipvPJlt7P5LpEQ4nWAodc6BFPiYmO/tIJAA+6TR8mJ+WXbGbt
   5Gy3I5FDtYoXF/nsHJWXKheZyAHsJLZ9wjOFjtvX5NOMBmmc+OgOu4aWY
   g==;
X-CSE-ConnectionGUID: 48xkgBHWQNqiPgDU1p3Jig==
X-CSE-MsgGUID: jus6UMdcSge89HWiY8fPmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67038486"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="67038486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 05:51:26 -0700
X-CSE-ConnectionGUID: /bFMHN06SAeVDS7Jvez1xA==
X-CSE-MsgGUID: o08R1Yq0S4qNQ4KK+ydQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="214539998"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 05:51:24 -0700
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
Subject: [PATCH v2] mtd: intel-dg: wake card on operations
Date: Tue, 21 Oct 2025 15:32:46 +0300
Message-ID: <20251021123246.3629282-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_055128_450901_21EF8BD1 
X-CRM114-Status: GOOD (  17.41  )
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

The Intel DG cards do not have separate power control for
persistent memory.
The memory is available when the whole card is awake.

Enable runtime PM in mtd driver to notify parent graphics driver
that whole card should be kept awake while nvm operations are
performed through this driver.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---

V2: Address review comments (Andrey S)

 drivers/mtd/devices/mtd_intel_dg.c | 70 +++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index b438ee5aacc3..d1916ec5e087 100644
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
 
@@ -498,6 +504,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 	size_t len;
 	u8 region;
 	u64 addr;
+	int ret;
 
 	if (WARN_ON(!nvm))
 		return -EINVAL;
@@ -512,20 +519,29 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 	total_len = info->len;
 	addr = info->addr;
 
+	ret = pm_runtime_resume_and_get(nvm->dev);
+	if (ret < 0) {
+		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
+		return ret;
+	}
+
+	ret = 0;
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
@@ -541,14 +557,16 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
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
+	pm_runtime_put_autosuspend(nvm->dev);
+	return ret;
 }
 
 static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
@@ -577,17 +595,24 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
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
+	pm_runtime_put_autosuspend(nvm->dev);
+	return ret;
 }
 
 static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
@@ -616,17 +641,24 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
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
+	pm_runtime_put_autosuspend(nvm->dev);
+	return ret;
 }
 
 static void intel_dg_nvm_release(struct kref *kref)
@@ -753,6 +785,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
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
@@ -781,9 +824,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
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
