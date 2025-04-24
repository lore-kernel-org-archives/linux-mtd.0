Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F71C369DF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Apr 2025 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9lZPag2Rg9GJjywQH29MQ8zkSxoY2KOcnAFBzgp0+Q=; b=wxuE9kCCpi9qNL
	U4/cR9YX5LWTNhQCUGP5qPKDLpnpVSjLZqhwasoOrZhJJfrBNUvcYZ2UzfYyDuOfGqO6pFHw1VSk5
	e2OMKtiyKUV5y4VPGweK8h1PZV9/zpEwydbqr/wQjUW/Ny7rKiSZxDLSx2h/CA+VsK1OdaEg6B+u7
	RpgVle3R5QqEe+InVB26kuL/CmtyOW0vzD3pjukGnjuKyvcXVEP/Hwn9tf2qNkUHI4L3PLAVBFnQl
	nEdJXomzZ/lwQoSJsYmtN/QcyWDkj/x973o4fHzB1eiJm0Y3i07BFD464lE1A0EZ+jXMFQeM15NwQ
	0R9iPsSQOv5C+tUJBQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7x2g-0000000EHa5-1eHV;
	Thu, 24 Apr 2025 13:55:06 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wmM-0000000ECPE-2h9x
	for linux-mtd@lists.infradead.org;
	Thu, 24 Apr 2025 13:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745501895; x=1777037895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfNlQaQAx8Vv722WAjFHHGbTA8WrwldfoILRmHYeMfU=;
  b=LaFj0PMoXJ4bBjwzb/cnRVEohsBKcswCgi0byvWI3F/OcMEgQ61T/nxL
   FDnib9lqCEeeeMZXVaJ38lOW3opxZD2MkfiGyDqQBHg9sdaLIH35wBeju
   yk+PWGBeivm8MRKZ8iIWMhX3bvOoetaNYvC6ibhMQjOvutn50XN8PNqXO
   kKmo/9L2GYMt4SSFrBMJ03DDo6akpU6L5Vf8WVRNBl9WZOElQCJnQgQZO
   aEkzX65UN4C6B+Q/FGa6VPvTTq/ij14YdcaOfmirAA/GWN4tFoUuKag4J
   LjxlsASajG18BRHfQovsPvMF31c/xuBcfRtrXuQPNwO7hu1Me+2CbVsVP
   g==;
X-CSE-ConnectionGUID: BPyl2+huQSaRGERorBZn5w==
X-CSE-MsgGUID: bR/TXFZ8T82fId3i+ILyeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46368144"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="46368144"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:38:14 -0700
X-CSE-ConnectionGUID: nHWAOawOQfqe7uQydpE6xg==
X-CSE-MsgGUID: 7mzQyZraSqaEt0t4H7Zopg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="136701395"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:38:09 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v9 07/12] mtd: intel-dg: wake card on operations
Date: Thu, 24 Apr 2025 16:25:31 +0300
Message-ID: <20250424132536.3043825-8-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424132536.3043825-1-alexander.usyskin@intel.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_063814_695544_6DF805AE 
X-CRM114-Status: GOOD (  17.62  )
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

Enable runtime PM in mtd driver to notify graphics driver that
whole card should be kept awake while nvm operations are
performed through this driver.

CC: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Karthik Poosa <karthik.poosa@intel.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 79 +++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 3535f7b64429..9f4bb15a03b8 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -15,11 +15,14 @@
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/pm_runtime.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/sizes.h>
 #include <linux/types.h>
 
+#define INTEL_DG_NVM_RPM_TIMEOUT 500
+
 struct intel_dg_nvm {
 	struct kref refcnt;
 	struct mtd_info mtd;
@@ -460,6 +463,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 	loff_t from;
 	size_t len;
 	size_t total_len;
+	int ret = 0;
 
 	if (WARN_ON(!nvm))
 		return -EINVAL;
@@ -474,20 +478,28 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 	total_len = info->len;
 	addr = info->addr;
 
+	ret = pm_runtime_resume_and_get(&mtd->dev);
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
+			goto out;
 		}
 
 		idx = idg_nvm_get_region(nvm, addr);
 		if (idx >= nvm->nregions) {
 			dev_err(&mtd->dev, "out of range");
 			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
-			return -ERANGE;
+			ret = -ERANGE;
+			goto out;
 		}
 
 		from = addr - nvm->regions[idx].offset;
@@ -503,14 +515,18 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
 		if (bytes < 0) {
 			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
 			info->fail_addr += nvm->regions[idx].offset;
-			return bytes;
+			ret = bytes;
+			goto out;
 		}
 
 		addr += len;
 		total_len -= len;
 	}
 
-	return 0;
+out:
+	pm_runtime_mark_last_busy(&mtd->dev);
+	pm_runtime_put_autosuspend(&mtd->dev);
+	return ret;
 }
 
 static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
@@ -539,17 +555,25 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len > nvm->regions[idx].size - from)
 		len = nvm->regions[idx].size - from;
 
+	ret = pm_runtime_resume_and_get(&mtd->dev);
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
+	pm_runtime_mark_last_busy(&mtd->dev);
+	pm_runtime_put_autosuspend(&mtd->dev);
+	return ret;
 }
 
 static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
@@ -578,17 +602,25 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (len > nvm->regions[idx].size - to)
 		len = nvm->regions[idx].size - to;
 
+	ret = pm_runtime_resume_and_get(&mtd->dev);
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
+	pm_runtime_mark_last_busy(&mtd->dev);
+	pm_runtime_put_autosuspend(&mtd->dev);
+	return ret;
 }
 
 static void intel_dg_nvm_release(struct kref *kref)
@@ -670,6 +702,15 @@ static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device *device
 
 	kfree(parts);
 
+	if (ret)
+		goto out;
+
+	devm_pm_runtime_enable(&nvm->mtd.dev);
+
+	pm_runtime_set_autosuspend_delay(&nvm->mtd.dev, INTEL_DG_NVM_RPM_TIMEOUT);
+	pm_runtime_use_autosuspend(&nvm->mtd.dev);
+
+out:
 	return ret;
 }
 
@@ -719,6 +760,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 	}
 	nvm->nregions = n; /* in case where kasprintf fail */
 
+	devm_pm_runtime_enable(device);
+
+	pm_runtime_set_autosuspend_delay(device, INTEL_DG_NVM_RPM_TIMEOUT);
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
 		dev_err(device, "mmio not mapped\n");
@@ -740,9 +792,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
 
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
