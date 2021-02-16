Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E871C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F24E64E08
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F24E64E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RW7ms9jVwYcywq72YWI9amnDc0Hgh5Fxgxuiw0oSPKs=; b=cpIgRxP21swq1DatSirZgXiRV
	wzL4+GwBDpPo8snfV0bvYfe8ljZuN+PGPwBiEgqIXE9pZLDkna1ZSsGlUd1avSiph4czn9xiIXD4n
	N34a6zWJlk5Hzi2hoMbIJCZEh3SEXyQKd6zn47jPJRP/Yly4sInxwkQlCDaR4REiwLVl5lSCPnEgY
	kK6kMCm3X8iqfvPgWc2jnuiERq+H9I7A2TzxOEeO+VrSd+EyjF4inkP+88578q2bBcCE2QHaGey5X
	tyVB9zeBN+vMCcQw1eNfinUb3MlnJLN8qm6l+b80LfJ+2G55La7mGr+ngVo0walc8lW6PGzTiczvX
	UVMbfZXtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4xm-0006A9-Cf; Tue, 16 Feb 2021 18:20:42 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4xK-0005uH-1k
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 18:20:18 +0000
IronPort-SDR: cmXZWyN/1BAZgjNiMpQtplvj6geW08m+i6unXs0uMcZVslYXyACMfS4sTOmCWSOMTMxHM9/200
 88wcMvDwZoZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202169484"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202169484"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:13 -0800
IronPort-SDR: g/eKOjsFxE37QzNpXe0HQnRPCQY/VYOgYLlBmykUlc49jFJkoAIMQUQU8moCqgZpvaA7WpDWx8
 eQ+to+EDqwsQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399609261"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:10 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC PATCH 7/9] drm/i915/spi: mtd: implement access handlers
Date: Tue, 16 Feb 2021 20:19:23 +0200
Message-Id: <20210216181925.650082-8-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_132015_354387_9D7B018C 
X-CRM114-Status: GOOD (  15.73  )
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

Implement mtd read, erase, and write handlers.
For erase operation address and size should be 4K aligned.
For write operation address and size has to be 4bytes aligned.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 138 +++++++++++++++++++++--
 1 file changed, 131 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi_drv.c b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
index bdf58e14fd6b..1e8a40339e6d 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi_drv.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
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
