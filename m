Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601EDC87FCC
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EWnRylHLl0M/g2AXU4ULbHpuSzsdocATG2Hvh64Wezs=; b=W4c9wzAbxP5wId
	OzEr6CepGqV/dw03aesAmRNgePT70h+2rwgMG2YdfLwdtKbngQCYsIGM4pH5cXGfl/ioSWs++MpKY
	VlwLh+f6GEXbeYnJJocIAEuPsEYsXrhTmPFgeEgdT84EirRwMklIBY6uZNq9PR+zEAAmEgzlgEi5r
	+InE5qeE6uOBb4y+LRF+cbLZ5oAI8kCPFSLHbyz596fEiGMgD8w0DoUjSM9oXcdl3+HHzkqQO1gGs
	oGYtrsGdQt71ekf/qtqbNqK8Me2ohDpw/GLNh+eNFL6D3l40yrqRpqtK3mnL6HQ3wNWh0Gahon1T0
	D7bqkul1HicWr5Oa01Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOuq-00000003CL3-0zha;
	Thu, 31 Jul 2025 08:45:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOl1-00000003Ar9-1Twk
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 08:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85A8E5C5489;
	Thu, 31 Jul 2025 08:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAD0C4CEF7;
	Thu, 31 Jul 2025 08:35:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>
Cc: linux-mtd@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
Date: Thu, 31 Jul 2025 10:35:14 +0200
Message-ID: <def775b1d7afe43720d2a1778735e764a01cb017.1753950712.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_013523_430213_D52BFB7A 
X-CRM114-Status: GOOD (  13.46  )
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

Intel Discrete Graphics non-volatile memory is only present on Intel
discrete graphics devices, and its auxiliary device is instantiated by
the Intel i915 and Xe2 DRM drivers.  Hence add dependencies on DRM_I915
and DRM_XE, to prevent asking the user about this driver when
configuring a kernel without Intel graphics support.

Fixes: ceb5ab3cb6463795 ("mtd: add driver for intel graphics non-volatile memory device")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Use !=n as MTD_INTEL_DG can be built-in when DRM_I915 and DRM_XE are
    modular,
  - s/onlt/only/,
  - s/intel/Intel/.
---
 drivers/mtd/devices/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 46cebde79f34b0b7..e518dfeee654268a 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -185,8 +185,8 @@ config MTD_POWERNV_FLASH
 
 config MTD_INTEL_DG
 	tristate "Intel Discrete Graphics non-volatile memory driver"
-	depends on AUXILIARY_BUS
-	depends on MTD
+	depends on AUXILIARY_BUS && MTD
+	depends on DRM_I915!=n || DRM_XE!=n || COMPILE_TEST
 	help
 	  This provides an MTD device to access Intel Discrete Graphics
 	  non-volatile memory.
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
