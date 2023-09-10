Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2EEEEB580
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Sep 2023 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzb9ssY7YKxIns6Y3gg5d9xPwk86P/dhA/WM3HXMZxY=; b=00pOzT3C+c7xTe
	yxTlbya6Q4wtNsiWb0a76FXnjgxvJd+kmfcx1AGpqKQOJrtv7asANGTVA4Wzh1g5z98DiIQP3lPnU
	TS/gZK6/3etNewpZAxlocUWAupQDJ+e85v1MqwVlmE9RogXeEVXSnKZY5bHHD1VWlQDnrm17WuJAV
	kGo/4/gnIuHxVokOcL07nrByCi5EAT4JMkdv5LSUDJXIIuydYoG12Lg3rxRvQ0/ec+UZsySEqjgkY
	xkl410v9nDM7vXlHvsKLraiMveCvoVPoex1DI2+enCKGMF39wmPEpXbEwOh0JzmO1viwADhaI/kH6
	h+f3lYI598lV20a/WU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJno-00Gb9x-0d;
	Sun, 10 Sep 2023 12:44:36 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJnk-00Gb8g-2J
	for linux-mtd@lists.infradead.org;
	Sun, 10 Sep 2023 12:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694349872; x=1725885872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uIkMXLBToS8k9v4mhNt4li7U3gCwkQCK1h0lVKyVp8M=;
  b=ACdHioP25sxihJyS8e94HEKPSA/8+r7lIx4IOFtLlsvw9uoJFWDxhbow
   jfDGdWrV966eQLUBZ0r2ZgRaJsEIZuLebRD4rIHcjaTjHbanWSw/K7BDa
   4i5DUs3yaM1iatWoEWxHuA4QB7fwONEA77MekHm6MEuAtwakcvgYF5WAn
   BoM1vb3Unv74EB4sp92vkzwTPY7fBZMz17bQl1UCQAQVCVZScq+ZBNy6r
   SDFnVtrtN2WmzeoP3+c1bNF5ol2Vrk1jlDQnMbZouukjpg+J9Vi1H62Iq
   xN406VOeGVfu1b9ZAdFmbQUSN236eqye0Bvw1crLQ4akSZV/i/ZKlhVRS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441907087"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="441907087"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073815007"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="1073815007"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:29 -0700
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
	Tomas Winkler <tomas.winkler@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 02/10] drm/i915/spi: add intel_spi_region map
Date: Sun, 10 Sep 2023 15:39:41 +0300
Message-Id: <20230910123949.1251964-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230910123949.1251964-1-alexander.usyskin@intel.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_054432_847184_8CD08013 
X-CRM114-Status: GOOD (  11.85  )
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

From: Tomas Winkler <tomas.winkler@intel.com>

Add the dGFX spi region map and convey it via auxiliary device
to the spi child device.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi.c | 8 ++++++++
 drivers/gpu/drm/i915/spi/intel_spi.h | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
index 9eb5ab6bc4b9..c697ca226e34 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -10,6 +10,13 @@
 
 #define GEN12_GUNIT_SPI_SIZE 0x80
 
+static const struct i915_spi_region regions[I915_SPI_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
 static void i915_spi_release_dev(struct device *dev)
 {
 }
@@ -29,6 +36,7 @@ void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *dev_priv)
 	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
 	spi->bar.flags = IORESOURCE_MEM;
 	spi->bar.desc = IORES_DESC_NONE;
+	spi->regions = regions;
 
 	aux_dev->name = "spi";
 	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
index a58bf79dcbc9..1ecf1a8581b4 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.h
+++ b/drivers/gpu/drm/i915/spi/intel_spi.h
@@ -10,10 +10,16 @@
 
 struct drm_i915_private;
 
+#define I915_SPI_REGIONS 13
+struct i915_spi_region {
+	const char *name;
+};
+
 struct intel_spi {
 	struct auxiliary_device aux_dev;
 	struct drm_i915_private *i915;
 	struct resource bar;
+	const struct i915_spi_region *regions;
 };
 
 #define auxiliary_dev_to_intel_spi_dev(auxiliary_dev) \
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
