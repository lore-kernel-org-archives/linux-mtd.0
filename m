Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B591C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:34:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA3CA651F7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA3CA651F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nYnsGGR5BH1PhCmNIouh+L5GQSGwMk/msZWcQD4ZNfc=; b=RTrVSOhVkvGfeSU+3CGtjVhrp
	dgHOUcY5M5FvEqZdfnMqwkNNFcLyp0pAjYKJOD6s8hx69HOBtmeM6Gvhia/urXz38Q9JflN5Hajdo
	6Uzh2FLlpcDwnf+pKOULQbz3VT7H6Gl6HriHnE6HPI+E+4das0JvzFc9hS432AiW0FawWt2anphlq
	nxUR1NpP+lA96bZQw2RxNB4E4KtSaAs8lR2fq4lIg13hRMJ3jkflRNDvZ0G2dfI1cWEzvGcS9yRbg
	tlsasOFUasDuOCPoY7+5HAn3SfgvN1p+Cl0GmgliqX2GRCRgqgo0qWBn3y6FmnOXnFz/Jbl4UDV+g
	y34couFjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9T8-00FVU6-2P; Mon, 08 Mar 2021 06:34:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9PM-00FUnM-Cv
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=y9wEpTIv1EAG9TIBuKRjAJ18Yy9mxXGH40lP2H923wk=; b=EmhrO5+G3kmW9Q7pfpLeXozeah
 5RpuJRFX8qV88QnIIQv/e9RDv+DfNwpp+abhq83kbu5MkQw5R9JefHwtvSHYZbcX7WSsOa3UavwIZ
 aPphhVMMots6AZhPphbndNCcysXZtkCNBCabGYOQnOJlnBE78ctZJigx8xntVCZo9YofPr190afzV
 zqmIsFU5S9ClOXC+OEuXHfrc0duOmojzLcpnQi3Lzhjogq3zQFyZbl3KIwO66R+rYib9uQ7FGl8MK
 3fismwY9LtOh8gtfoHhQ8FFzmzxnSZ4uKyQRs5RWCOEv7XRRpaBNuF6ZdjhgQWyRnOq/xZY2CmGY1
 5vYLs2Jw==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9PH-00F81V-6q
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:30:22 +0000
IronPort-SDR: BZ0IvgV70BDWXHl+u0pvx0jZji86PdyQklA4kDcc7ThChX4QdaJyi133yAO6how5R+eG+Jn5I+
 QKy/IdUoaWAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084487"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084487"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:23 -0800
IronPort-SDR: MY/0A5iLYhes/kzY16EZbxFIKWfti/TuB6njLQbEI+a8mq9vYJO1W+nhRwDDQxx3jZIRCNel89
 mpJX/+h/8WrA==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181981"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:19 -0800
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
Subject: [RFC PATCH 06/10 v2] drm/i915/spi: spi register with mtd
Date: Mon,  8 Mar 2021 08:27:44 +0200
Message-Id: <20210308062748.208017-7-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_063020_382690_9A9CFCB5 
X-CRM114-Status: GOOD (  16.87  )
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

Register the on-die spi device with the mtd subsystem.
Add mtd access stub functions.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
V2:
1. Rebase

 drivers/gpu/drm/i915/spi/i915_spi.c | 86 ++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/spi/i915_spi.c b/drivers/gpu/drm/i915/spi/i915_spi.c
index df6a461d520d..bdf58e14fd6b 100644
--- a/drivers/gpu/drm/i915/spi/i915_spi.c
+++ b/drivers/gpu/drm/i915/spi/i915_spi.c
@@ -15,7 +15,11 @@
 #include <linux/delay.h>
 #include <spi/intel_spi.h>
 
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+
 struct i915_spi {
+	struct mtd_info mtd;
 	void __iomem *base;
 	size_t size;
 	unsigned int nregions;
@@ -344,6 +348,73 @@ static int i915_spi_init(struct i915_spi *spi, struct device *device)
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
+	spi->mtd.writesize = SZ_4; /* 4 bytes granularity */
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
 static int i915_spi_probe(struct platform_device *platdev)
 {
 	struct resource *bar;
@@ -413,15 +484,28 @@ static int i915_spi_probe(struct platform_device *platdev)
 		return -ENODEV;
 	}
 
+	ret = i915_spi_init_mtd(spi, device, ret);
+	if (ret) {
+		dev_err(device, "i915-spi failed init mtd %d\n", ret);
+		return ret;
+	}
+
 	platform_set_drvdata(platdev, spi);
 
 	dev_dbg(device, "i915-spi is bound\n");
 
-	return 0;
+	return ret;
 }
 
 static int i915_spi_remove(struct platform_device *platdev)
 {
+	struct i915_spi *spi = platform_get_drvdata(platdev);
+
+	if (!spi)
+		return 0;
+
+	mtd_device_unregister(&spi->mtd);
+
 	platform_set_drvdata(platdev, NULL);
 
 	return 0;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
