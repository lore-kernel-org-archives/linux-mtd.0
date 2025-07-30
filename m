Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44933C87FC9
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 10:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mQWMOwFlp3OIdnLiaPx4Dsw3edVn9T6qKeOcm2a+HV4=; b=RaifvqaHKb0tDI
	DgDT+ARjBfX6T9Nb9tYjsbK6y4sG5pT7eRQT2e+SijQ15861GT91cRvV/CWgedKiGBqe+wOjpb9Gw
	hNf04aK+ihD6JxmT3JPLw1NFjiAz6ObQZRo9V333Ya6G1Ra3tvEdL/fecJQFf0rENVe6zx9SFNEBh
	pMpysNBjxqufetMlkxK2eAyX24vvPuAm9hwyAJN4FakwOUFbEbWt36AJkSy3TxHbIo4ztoADcuTu5
	ac/yta/+r8wmrcyNUgwK2IdEKiFWrVbn1wXXYcudbXZt4YhvvLqbc/WN2cexgeK4+65sNqdiMNkU2
	dqDn5ePZELVk5ISUgGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3yj-00000001Dz1-1JmG;
	Wed, 30 Jul 2025 10:24:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3wZ-00000001Dqb-3TwQ
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 10:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47B7D443BC;
	Wed, 30 Jul 2025 10:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40F0C4CEE7;
	Wed, 30 Jul 2025 10:21:52 +0000 (UTC)
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
Subject: [PATCH] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
Date: Wed, 30 Jul 2025 12:21:49 +0200
Message-ID: <07f67ab8ee78f6bf2559131e193381aafff7479a.1753870424.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_032155_885729_FD53150D 
X-CRM114-Status: GOOD (  12.74  )
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

Intel Discrete Graphics non-volatile memory is onlt present on intel
discrete graphics devices, and its auxiliary device is instantiated by
the Intel i915 and Xe2 DRM drivers.  Hence add dependencies on DRM_I915
and DRM_XE, to prevent asking the user about this driver when
configuring a kernel without Intel graphics support.

Fixes: ceb5ab3cb6463795 ("mtd: add driver for intel graphics non-volatile memory device")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/devices/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 46cebde79f34b0b7..f0ab74d695347117 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -185,8 +185,8 @@ config MTD_POWERNV_FLASH
 
 config MTD_INTEL_DG
 	tristate "Intel Discrete Graphics non-volatile memory driver"
-	depends on AUXILIARY_BUS
-	depends on MTD
+	depends on AUXILIARY_BUS && MTD
+	depends on DRM_I915 || DRM_XE || COMPILE_TEST
 	help
 	  This provides an MTD device to access Intel Discrete Graphics
 	  non-volatile memory.
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
