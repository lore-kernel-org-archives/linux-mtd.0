Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4FCDC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:35:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D3B651DE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62D3B651DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hPf1AxQGrcLEnIqSop9DKuNkQctcZyt43ea9utYWVJc=; b=XBcIQtu0QohZ4Cp4Cte52U7Qw
	rDNabvtezjSRnmt7ky9EZ8PeFtdfYci2Hlxai2qNgUlca1wDvxgqSVRUwHSqGvWP3TmHcaF+N/vUp
	omWpiA1c5YXf2jwnbcb5xPhdYQ7bv3ddZNGS3Oyl6hTQnggbUc9oBDtBFQKVNwjS9VZmT845/tL4E
	EJEcQFQcXMps7ncd71SxZ8rI0zZl2kUYDjJqAiubH4v4IgloDUbzATglhV/1ezTi2eCkvezJPSiFf
	X58cbo/DpvxIQniuq3mC2P1qJfY6vYWcH7707iuGsREhUY1b4bl0X8oCmm/RqnB/+1f31u12mDygf
	nKp0hE0EQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9U7-00FVe1-0t; Mon, 08 Mar 2021 06:35:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Pf-00FUsf-Pc
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=i0AMbvwJRf43lWGwOYr0pWnJq0Ie3kG+QTafLKDSLNM=; b=MLJQ3UaK8tvEG88UAXvX3cR1jl
 YGPAuBECxlsPZ3UnrYFOfvk30WWvmx45gjLqxLW6Pk4C1TO7DV9IgbnJofVSPSZhgbkvAHeCJe8ys
 VdkFTcNehjUlBKukTBtTSu0UW+G44nD0HPxZRoJ4ThQCsD5l4sOpQbN9QN46+kXuZqmbAUOIt2/oa
 vkET5E2I9/J/yPBqp30llGK5+htnmfKOlZRBCMfjRTZ5nkmtaRVYvCPhRg5/JN5c/dLzUJhYgjCxw
 ik3sN0blh7ORCeqDFdn3V5W88doZeq5iJH++LP7zmLOmB0Cu4dLErT9hY+kiP4x+yAFfSFZBVmARi
 r8oeE3Ng==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9PM-00F81V-Ae
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:30:30 +0000
IronPort-SDR: Bktz4ZALiwbkUDk+rJbDdSIfdH3cNN3ylG+kK9gE5YG2fo1oJ5i2i25+jB3gUMp0UmoC9VNrNY
 oyFdsvCLT24g==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084497"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084497"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:27 -0800
IronPort-SDR: YaG8UgBBFu3NnNGKqnVf1pXZTiJ2qyM1F5GI6CRelJS0GMi0M8bsrHPqJ3LUv0VRLKKCePaqrN
 j2DsjElyoiHA==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181995"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:23 -0800
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
Subject: [RFC PATCH 07/10 v2] drm/i915/spi: mtd: implement access handlers
Date: Mon,  8 Mar 2021 08:27:45 +0200
Message-Id: <20210308062748.208017-8-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_063026_505771_44B465FD 
X-CRM114-Status: GOOD (  15.01  )
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
---
V2:
1. Rebase

 drivers/gpu/drm/i915/spi/i915_spi.c | 138 ++++++++++++++++++++++++++--
 1 file changed, 131 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/spi/i915_spi.c b/drivers/gpu/drm/i915/spi/i915_spi.c
index bdf58e14fd6b..1e8a40339e6d 100644
--- a/drivers/gpu/drm/i915/spi/i915_spi.c
+++ b/drivers/gpu/drm/i915/spi/i915_spi.c
@@ -173,7 +173,6 @@ static int i915_spi_is_valid(struct i915_spi *spi)
 	return 0;
 }
 
-__maybe_unused
 static unsigned int spi_get_region(const struct i915_spi *spi, loff_t from)
 {
 	unsigned int i;
@@ -188,7 +187,6 @@ static unsigned int spi_get_region(const struct i915_spi *spi, loff_t from)
 	return i;
 }
 
-__maybe_unused
 static ssize_t spi_write(struct i915_spi *spi, u8 region,
 			 loff_t to, size_t len, const unsigned char *buf)
 {
@@ -219,7 +217,6 @@ static ssize_t spi_write(struct i915_spi *spi, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t spi_read(struct i915_spi *spi, u8 region,
 			loff_t from, size_t len, unsigned char *buf)
 {
@@ -261,7 +258,6 @@ static ssize_t spi_read(struct i915_spi *spi, u8 region,
 	return len;
 }
 
-__maybe_unused
 static ssize_t
 spi_erase(struct i915_spi *spi, u8 region, loff_t from, u64 len, u64 *fail_addr)
 {
@@ -350,7 +346,63 @@ static int i915_spi_init(struct i915_spi *spi, struct device *device)
 
 static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 {
-	dev_err(&mtd->dev, "erasing %lld %lld\n", info->addr, info->len);
+	struct i915_spi *spi;
+	unsigned int idx;
+	u8 region;
+	u64 addr;
+	ssize_t bytes;
+	loff_t from;
+	size_t len;
+	size_t total_len;
+
+	if (!mtd || !info)
+		return -EINVAL;
+
+	spi = mtd->priv;
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
+	while (total_len > 0) {
+		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
+			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
+			info->fail_addr = addr;
+			return -ERANGE;
+		}
+
+		idx = spi_get_region(spi, addr);
+		if (idx >= spi->nregions) {
+			dev_err(&mtd->dev, "out of range");
+			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
+			return -ERANGE;
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
+			return bytes;
+		}
+
+		addr += len;
+		total_len -= len;
+	}
 
 	return 0;
 }
@@ -358,7 +410,43 @@ static int i915_spi_erase(struct mtd_info *mtd, struct erase_info *info)
 static int i915_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 			 size_t *retlen, u_char *buf)
 {
-	dev_err(&mtd->dev, "read %lld %zd\n", from, len);
+	struct i915_spi *spi;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (!mtd)
+		return -EINVAL;
+
+	spi = mtd->priv;
+
+	if (!IS_ALIGNED(from, sizeof(u32))) {
+		dev_err(&mtd->dev, "unaligned read %lld %zd\n", from, len);
+		return -EINVAL;
+	}
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
+	ret = spi_read(spi, region, from, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
+		return ret;
+	}
+
+	*retlen = ret;
 
 	return 0;
 }
@@ -366,7 +454,43 @@ static int i915_spi_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int i915_spi_write(struct mtd_info *mtd, loff_t to, size_t len,
 			  size_t *retlen, const u_char *buf)
 {
-	dev_err(&mtd->dev, "writing %lld %zd\n", to, len);
+	struct i915_spi *spi;
+	ssize_t ret;
+	unsigned int idx;
+	u8 region;
+
+	if (!mtd)
+		return -EINVAL;
+
+	spi = mtd->priv;
+
+	if (!(IS_ALIGNED(len, 4) && IS_ALIGNED(to, 4))) {
+		dev_err(&mtd->dev, "unaligned write %lld %zd\n", to, len);
+		return -EINVAL;
+	}
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
+	ret = spi_write(spi, region, to, len, buf);
+	if (ret < 0) {
+		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
+		return ret;
+	}
+
+	*retlen = ret;
 
 	return 0;
 }
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
