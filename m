Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1110BC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:37:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D93F651DE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D93F651DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m8c7f9aNVU/sLe5+b+jpkWF0SZEzoDGu16GL5YfV700=; b=U2ffK5VUejnjpiJSsle9mK8U3
	hl2DJ4gl2gQKqclVBmr6tvjhS6KnhYqJ5Qx2pbwdTaE8YDyVoM1/S3oqvDLTtW3SjoAcvJprU4FsE
	OK9xi5Mr3Dekw4J6pEwgghem0ohaI3YoqtodAec3jSLlarNs3fna5vHpFQ5uIp87iNQNqpsjrLJrK
	2WmXo60NaFETRMA6yCTgPaQlUUe6r08ps4bopmapjXCqeaGmSqGLDR7W0KhMZvIXnyvLTfzg2tnQX
	o+Guno/+kHvlEdJ5hvY6Cy2v+kVRBNS/vFHVg39PYy6bTNTe95Au6gy7z8r1kk7MGmavV9QaYEmGI
	qxGRwmwTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9VG-00FVrX-7e; Mon, 08 Mar 2021 06:36:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Pq-00FUvI-D1
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IogtKpiq+e/z+mPu9g6IsrRVhp84X/WgCJLZuTm/33k=; b=Fs5N9kTYQ2gO0wk9lPu9vhE4Hc
 H50mikRIEr9tiu7hesY2dcQMSHfbXsfEcfK4v83RPlyTys4jvuuT9nqb6tzIbc/wDGcYhKDgBSqkz
 FgXjuh8j3OjoHXigXXMvW/Fgde2YJUHf3UunbwDT/ZcTaHhjDYTtCYByf4+lLUQXLntNHAuG19EcQ
 tbJwFVAlQTa65FmxbANJyGs/ntjNdwxz64QQtkUmErL7WDOffVFqDww4kTIp0euvNymSUcg8/Hpn/
 8UzCS0I26cbILkLWFNgh3i+rRqAN2oHOb023PNcOd9qXb5UPLg520cx8KstaTnwHu01skFF3Ihtw/
 mfuSl4Lg==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9PN-00F89s-Bq
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:30:43 +0000
IronPort-SDR: ALuTRAUhdP/ya3oGStrSahB0yzgXuc7MDL4B8KZGqv8EjhCK2Bs2ezKhbcO1t6p/u1BjiC2KG2
 NgEZbd/lPg/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084511"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084511"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:31 -0800
IronPort-SDR: 8E03uU3hoRk/FMR7EIEWVr2GexCm2Wo3DkfMWWZviADTLzAgaqdIoBAHoFzSFzDNkzQj0y8KgF
 TtxFZZsX1Beg==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409182018"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:27 -0800
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
Subject: [RFC PATCH 08/10 v2] drm/i915/spi: serialize spi access
Date: Mon,  8 Mar 2021 08:27:46 +0200
Message-Id: <20210308062748.208017-9-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_063027_259542_06A45AD4 
X-CRM114-Status: GOOD (  15.34  )
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

The SPI regions cannot be accessed in parallel because for each
region the region selector has to be set. Add a mutex to prevent
parallel access.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
V2:
1. Rebase

 drivers/gpu/drm/i915/spi/i915_spi.c | 32 +++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/spi/i915_spi.c b/drivers/gpu/drm/i915/spi/i915_spi.c
index 1e8a40339e6d..9de49d00297d 100644
--- a/drivers/gpu/drm/i915/spi/i915_spi.c
+++ b/drivers/gpu/drm/i915/spi/i915_spi.c
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
