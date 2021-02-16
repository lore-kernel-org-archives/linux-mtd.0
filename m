Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5920C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EACB64E04
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EACB64E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4MKVg6D8HsMozsA46GEmjpN941HHG+UHoFeBFUhJ/c=; b=17tjtQp7cUnogS/c030D48/JY
	qGm1rCDqLMz0AIeCu6PgA83POT8iXIY3BcKkCj6UxavkpNJ4FnGXmGxyqLrSGJbHL9FXgbYaHE5Ja
	KvSRMFknt9pkMcO1JC2UWl5lxjWCBuHTwf0b+HMmlmYTuZrceEX8QZDW0mLo1TooBuPIeI4ZMLve8
	HLeYGKHHhe/mEZEsPqP2uKoX5W+K2NiZmGwCeFey6rFvoAh/UJTu0Se0mn1qpQK5FZSSXTkxY9N+F
	ng7bmeVtteIqYsh2B++IuOUxNtMAp1DCPESUAnJMPMsRbBM3fsjua+ugooXm99x/7s2eKYlcSnK7s
	pzeLIDvZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4xt-0006C9-E2; Tue, 16 Feb 2021 18:20:49 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4xN-0005xx-IF
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 18:20:21 +0000
IronPort-SDR: GNx2rNF8D+dKZXZxRaEC9P3rSMur7mV2pssrYp/P0hTbFpTNIq78W9+BiEeLXN3wcAhMc5ANbI
 ey+9I/jWi5tw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202169493"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202169493"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:16 -0800
IronPort-SDR: YNQnl7WoJX4IbUBVXJaO1KyEfxdevgmwQ7obhlFNd5UgijBu0/6D1bP3rxkneQ4g3PqyM7XZmd
 5QnJJQB03Veg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399609286"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:13 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC PATCH 8/9] drm/i915/spi: serialize spi access
Date: Tue, 16 Feb 2021 20:19:24 +0200
Message-Id: <20210216181925.650082-9-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_132017_857027_0A1F7853 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-mtd@lists.infradead.org, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The SPI regions cannot be accessed in parallel because for each
region the region selector has to be set. Add a mutex to prevent
parallel access.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 32 +++++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi_drv.c b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
index 1e8a40339e6d..9de49d00297d 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi_drv.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
@@ -20,6 +20,7 @@
 
 struct i915_spi {
 	struct mtd_info mtd;
+	struct mutex lock; /* region access lock */
 	void __iomem *base;
 	size_t size;
 	unsigned int nregions;
@@ -354,6 +355,7 @@ static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 	loff_t from;
 	size_t len;
 	size_t total_len;
+	int ret = 0;
 
 	if (!mtd || !info)
 		return -EINVAL;
@@ -370,18 +372,23 @@ static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 	total_len = info->len;
 	addr = info->addr;
 
+	if (!mutex_trylock(&spi->lock))
+		return -EBUSY;
+
 	while (total_len > 0) {
 		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
 			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
 			info->fail_addr = addr;
-			return -ERANGE;
+			ret = -ERANGE;
+			goto out;
 		}
 
 		idx = spi_get_region(spi, addr);
 		if (idx >= spi->nregions) {
 			dev_err(&mtd->dev, "out of range");
 			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
-			return -ERANGE;
+			ret = -ERANGE;
+			goto out;
 		}
 
 		from = addr - spi->regions[idx].offset;
@@ -397,14 +404,17 @@ static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 		if (bytes < 0) {
 			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
 			info->fail_addr += spi->regions[idx].offset;
-			return bytes;
+			ret = bytes;
+			goto out;
 		}
 
 		addr += len;
 		total_len -= len;
 	}
 
-	return 0;
+out:
+	mutex_unlock(&spi->lock);
+	return ret;
 }
 
 static int i915_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
@@ -440,14 +450,19 @@ static int i915_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len > spi->regions[idx].size - from)
 		len = spi->regions[idx].size - from;
 
+	if (!mutex_trylock(&spi->lock))
+		return -EBUSY;
+
 	ret = spi_read(spi, region, from, len, buf);
 	if (ret < 0) {
 		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
+		mutex_unlock(&spi->lock);
 		return ret;
 	}
 
 	*retlen = ret;
 
+	mutex_unlock(&spi->lock);
 	return 0;
 }
 
@@ -484,14 +499,19 @@ static int i915_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (len > spi->regions[idx].size - to)
 		len = spi->regions[idx].size - to;
 
+	if (!mutex_trylock(&spi->lock))
+		return -EBUSY;
+
 	ret = spi_write(spi, region, to, len, buf);
 	if (ret < 0) {
 		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
+		mutex_unlock(&spi->lock);
 		return ret;
 	}
 
 	*retlen = ret;
 
+	mutex_unlock(&spi->lock);
 	return 0;
 }
 
@@ -505,6 +525,8 @@ static int i915_spi_init_mtd(struct i915_spi *spi, struct device *device,
 
 	dev_dbg(device, "registering with mtd\n");
 
+	mutex_init(&spi->lock);
+
 	spi->mtd.owner = THIS_MODULE;
 	spi->mtd.dev.parent = device;
 	spi->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;
@@ -630,6 +652,8 @@ static int i915_spi_remove(struct platform_device *platdev)
 
 	mtd_device_unregister(&spi->mtd);
 
+	mutex_destroy(&spi->lock);
+
 	platform_set_drvdata(platdev, NULL);
 
 	return 0;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
