Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF2FC19F4F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JxETX1Bz/vrR48PfKNhjGWTcOwVJah4X7s5hCzI/6OQ=; b=nfu2w+Mqpc2rGr
	IME6RKRqhGhep4y0DpMVbtvTXzcz6ImcHbtneMP1ML4jR41VZswNMHjBbhjRNAHq96u7V/hdyOa2K
	uydlqXiHIlhwZ9omyI76XGCysqvmmw00AYs3tYonEThXRgExS3WFI3PPnvlwGmJMIEcx2xavvGed/
	dsqOg1YeV0Hz+ECc+tvq+vEO0UV6EACnjaTyJH8WWqiITP38WI3nYFTPXUTDJ0a+QcvHEoF/MJbjO
	2/brTJ2azjy6W19h4V6iAPFsuWX1XYaSIjp36KO7fY7R1WOT/8d6v3LUZ+7l9NfBhhNqeV68/czPC
	Ba+yxB3MGMo9NyjQS0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iyF-0000000FyAd-36Gj;
	Wed, 08 May 2024 15:12:39 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4iy6-0000000Fy8k-3Xdt
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 15:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715181151; x=1746717151;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NeKIszsGqh9jwuCffltG5mcAS23lZDfRVcT3V/NAucg=;
  b=T5Y7IjsDIT3pEXlNS/3DTK4Qjx3DWG7z2V5bMgQiBnqBdz/FlOVhOn06
   F97qAQDjBdh5VBYLsoEb2S5inSUjojA36OHITowDFMLadQ8jh7vDQIi9h
   ZJvQHwatBDmtfzvsHZ8BE24wa35Cl7tVqA8+b0G2QlasFsW5O7bJ6qymk
   j8VDkPWnxGEBrzPAGaBZFIQf6bMgOrwWp5SeLi6zfjSk5FRxdXX1TWrcY
   wqu3o8zaN6P/sCCAjtKYv2qCwyIjTo39fi8vpRxQng7tSW0Or3ySllNwo
   ChMUcBFLtf568yPzn5P8LtA1eS/OfcqjvobPPwHoaEJ2DeK225HOlsONU
   g==;
X-CSE-ConnectionGUID: O+BT1QNOT5qtGVv2qk7upw==
X-CSE-MsgGUID: 0IwjjLvcQLW7o7D2RuOzeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="13995758"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="13995758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 08:12:29 -0700
X-CSE-ConnectionGUID: slK9hIdPTcSp/pfKo+282w==
X-CSE-MsgGUID: lEg6CzfaRZydWglcXvrh8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33442219"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2024 08:12:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4F32F11F; Wed, 08 May 2024 18:12:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v1 1/1] mtd: physmap: Use *-y instead of *-objs in Makefile
Date: Wed,  8 May 2024 18:11:53 +0300
Message-ID: <20240508151222.1443491-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_081230_913072_F0782D8E 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Note, the original approach is weirdest from the existing.
Only a few drivers use this (-objs-y) one most likely by mistake.

 drivers/mtd/maps/Makefile | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index a9083c888e3b..019f1e92cc41 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -17,13 +17,12 @@ obj-$(CONFIG_MTD_ICHXROM)	+= ichxrom.o
 obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
-physmap-objs-y			+= physmap-core.o
-physmap-objs-$(CONFIG_MTD_PHYSMAP_BT1_ROM) += physmap-bt1-rom.o
-physmap-objs-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
-physmap-objs-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
-physmap-objs-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
-physmap-objs			:= $(physmap-objs-y)
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
+physmap-y			:= physmap-core.o
+physmap-$(CONFIG_MTD_PHYSMAP_BT1_ROM) += physmap-bt1-rom.o
+physmap-$(CONFIG_MTD_PHYSMAP_VERSATILE) += physmap-versatile.o
+physmap-$(CONFIG_MTD_PHYSMAP_GEMINI) += physmap-gemini.o
+physmap-$(CONFIG_MTD_PHYSMAP_IXP4XX) += physmap-ixp4xx.o
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
 obj-$(CONFIG_MTD_SA1100)	+= sa1100-flash.o
-- 
2.43.0.rc1.1336.g36b5255a03ac


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
