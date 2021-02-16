Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0347DC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C9A64DA1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4C9A64DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Z8Lnsf4yH3X/V67zCnb28lK1hXcBQPpvyeinkjxDGg=; b=E4rUOg+EZvoPkrtMIV/9HHfhD
	j4qihqkQl+0xnU+dCuGTldtI3ndAbY6aNpNzAgmqZPhU3kUq2oEQ/uY+HEm09dKDvtMYK7OKMGt3n
	iJsYf0kvhr4R/YHomMERt+BRW7nlEZhcDGn+vtsRnAfuI90Db4ETSR3R5pEyhtPdPgDVJCrw6Uu37
	UswkFofRuK1ecFq3HlUdoNDW4ESdcgbyQGnm6V4XK0QiqKOKFxE3BbIdGw57A7VF86tb1Qlwr5EZV
	gk02qvSrdQkYKe5M4Es1EEq3XvHJAO+gQSZDeVdHVu3a/yv6qvfJhCFmbKZHs2Mk+7B+dIe8gxgjT
	vtYoJyR1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4xH-0005yF-JI; Tue, 16 Feb 2021 18:20:11 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4x6-0005tP-S8
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 18:20:01 +0000
IronPort-SDR: NDyEOfJn+Qo4tf5lX0RmlCIeT7zdsp6mAvoq8FImG8qAswGCsePUK+frCS2hmSM86ZgM7+OWyD
 SzABrzCs27CQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="202169389"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="202169389"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:19:56 -0800
IronPort-SDR: /56wHeCZJHqJBFnP16+dD2MUfJU/MhTd50gQKWL8ZhRfI3jow5CcxlMk0/QP/fNGshUbiXC/8+
 SKGduywzZcmw==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399609078"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:19:53 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC PATCH 2/9] drm/i915/spi: intel_spi_region map
Date: Tue, 16 Feb 2021 20:19:18 +0200
Message-Id: <20210216181925.650082-3-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_132001_117739_C5A9BB0C 
X-CRM114-Status: GOOD (  11.50  )
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

Add the dGFX spi region map and convey it via mfd cell platform data
to the spi child device.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi.c | 9 +++++++++
 drivers/gpu/drm/i915/spi/intel_spi.h | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
index 07da7197bd5d..6f83f24f7208 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -14,11 +14,20 @@ static const struct resource spi_resources[] = {
 	DEFINE_RES_MEM_NAMED(GEN12_GUNIT_SPI_BASE, 0x80, "i915-spi-mmio"),
 };
 
+static const struct i915_spi_region regions[I915_SPI_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
 static const struct mfd_cell intel_spi_cell = {
 	.id = 2,
 	.name = "i915-spi",
 	.num_resources = ARRAY_SIZE(spi_resources),
 	.resources = spi_resources,
+	.platform_data = (void *)regions,
+	.pdata_size    = sizeof(regions),
 };
 
 void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
index 276551fed993..6b5bf053f7d3 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.h
+++ b/drivers/gpu/drm/i915/spi/intel_spi.h
@@ -8,6 +8,11 @@
 
 struct drm_i915_private;
 
+#define I915_SPI_REGIONS 13
+struct i915_spi_region {
+	const char *name;
+};
+
 struct intel_spi {
 	struct drm_i915_private *i915;
 };
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
