Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA8CD1280
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 12:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Vl1UHbXVVyY1J3KIYatEkPqoZBywbr9y4AkDF90eQQ=; b=1Dma0RrGOL0eIe
	ucdr7DgC5hy6PGUqnXfCW0wqLmNSYL5PMgT9DpkmEuGMmV/3cbTqq4Mf6/dCIeOys4RCDSTxYUci+
	/vB+WjIqb5XXheUYSl0okE+sytlBxI6TbkC9RLPmIPOp9mwssDtZ+WUecgXUXD3jhUnhlpFae1Hev
	Kw5wWpogN4syu4OviVoJ0iio8CiizuPFDyrQp15WVHK+iAgtCee3OqlCFxZMW5HFLk4tzZR/q+lKL
	mFOn04zd2NT60QH9mGO/wlmKseZZoTRdFnwXhucSH8tKAcmRsyu6N+m2qesk+gA/DE/bzse4hM+9D
	1aUmn2BrxvCbGTvsBP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpopx-0000000DtH1-1788;
	Thu, 28 Mar 2024 12:26:29 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpopu-0000000DtED-15zw
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 12:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628786; x=1743164786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0DbXhb2tsKCAcvpzv5zMcZ3BA91k4uRD9zDgtnWLzYE=;
  b=XwfabJyBOdFT67wewjYtgvsVleYxI5/1i6rItbIv/CUDQSxFjSELSmwl
   7tpHjhSM9/yIpKmE6mUbZpnZMfDaP9BJ+zLVMK06Sk4oD9XfB75Cy4WFl
   QCVI2xqHvGg5XshWj4PirSGWIHwtG1k6687EFTKf2yJP+9lFP2EQV8v82
   v6QD/EtF9xMaEOU16YyjwLT+lv2LO3SjurFqn/Q+iINYowczvUlQGwwt2
   Mj7z4aSSvNEla4LQmrWRj/f/Arf/Lm/UVdBldO9wz60ioCxEYdS/u9uxL
   bKZ0KAExtb+VzGN4diy7SvPvz1Ah9V70MVJ7YI4y5Sao1AgmEfDk5tZBE
   A==;
X-CSE-ConnectionGUID: HILuhp5wStGks2kTa8XgSw==
X-CSE-MsgGUID: ZRp5Ib7mQRm8RdGz2pvQHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17505466"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17505466"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16657569"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:23 -0700
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
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [PATCH 03/13] drm/i915/spi: add intel_spi_region map
Date: Thu, 28 Mar 2024 14:22:26 +0200
Message-Id: <20240328122236.1718111-4-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328122236.1718111-1-alexander.usyskin@intel.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_052626_461823_A5D13F20 
X-CRM114-Status: GOOD (  10.79  )
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

Add the dGFX spi region map and convey it via auxiliary device
to the spi child device.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
index 17e4c7861ef5..8dd4065551e2 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -11,6 +11,13 @@
 
 #define GEN12_GUNIT_SPI_SIZE 0x80
 
+static const struct intel_dg_spi_region regions[INTEL_DG_SPI_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
 static void i915_spi_release_dev(struct device *dev)
 {
 }
@@ -31,6 +38,7 @@ void intel_spi_init(struct drm_i915_private *dev_priv)
 	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
 	spi->bar.flags = IORESOURCE_MEM;
 	spi->bar.desc = IORES_DESC_NONE;
+	spi->regions = regions;
 
 	aux_dev->name = "spi";
 	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
