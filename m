Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A25DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA37B64DA1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA37B64DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gAHhWrEb0qrZlC+I3D+Tx/+EmBy8cbloLALVJkbHKnU=; b=pbW65qp1ACGPN7I9G5U9b5Cix
	D52xoGxtCnRJw1238nPwsdYjfYlETODv2BeBW4rOMEX+n0rINIzti6RW7UmnTtYKYcpbSa5Jdip+i
	umupk0ZirPRAwpZ4nAUTS3u1deEi7EU1P6pcFhn42OkhvqwcKv5WzrRcQKserGFnk52BqtnmzCL+p
	5mDluwlzAdDtylbO91FuVC5e4XmMAHpmVZJ0UODLb2PSSR5LxLCKZm0zEf/MIFmFCmYosTJNxIF6Q
	waaKpSzG21oHWEOl/3BJPteXx3tCX5TUaxeWR0Xbirf9vJ0RVIaNPxb4qq9OIJDVjTuM5YNPFSztI
	7RRgCG3DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4xf-00067B-Ma; Tue, 16 Feb 2021 18:20:35 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4xH-0005xx-H6
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 18:20:15 +0000
IronPort-SDR: VwxfE+i0t6Jxjo6oA6Rr0yZpkrCONKiy3sfE3Sy4WcNoGO+8VCsSU5xdkSd747pMuKS0FNrl9C
 FEBMjpHXkkVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202169469"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202169469"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:10 -0800
IronPort-SDR: jlWW7UNI/mwQEjhAhXCFqxGnlg37B6ErK7DFwQE6i3ppIvHbXcboRHv/XDwKoTpLIHYu1WZMJj
 YlUee6fuCsrQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399609237"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:20:06 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC PATCH 6/9] drm/i915/spi: spi register with mtd
Date: Tue, 16 Feb 2021 20:19:22 +0200
Message-Id: <20210216181925.650082-7-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_132011_890164_17F96092 
X-CRM114-Status: GOOD (  17.45  )
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

Register the on-die spi device with the mtd subsystem.
Add mtd access stub functions.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 86 +++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi_drv.c b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
index df6a461d520d..bdf58e14fd6b 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi_drv.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
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
