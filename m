Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NGCI6-0006Rz-9p
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 14:04:23 +0000
Received: by bwz4 with SMTP id 4so1138476bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Dec 2009 06:04:16 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 3 Dec 2009 19:33:56 +0530
Message-ID: <ce9ab5790912030603x4fb51ec1la3ea19ab9b06934@mail.gmail.com>
Subject: [PATCH 0/2]OMAP: Introducing gpmc-nand.c
To: linux-omap@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Tony Lindgren <tony@atomide.com>, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From fadc45cca4026d26d00a759efdc681303b0d3097 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Thu, 3 Dec 2009 18:35:23 +0530
Subject: [PATCH] OMAP: Introducing gpmc-nand.c

This patch series introduces generic gpmc-nand.c for nand device
related gpmc init.

Vimal Singh (2):
  Correcting GPMC_CONFIG1_DEVICETYPE_NAND
  Introducing 'gpmc-nand.c' for GPMC specific NAND init

 arch/arm/mach-omap2/Makefile           |    3 +
 arch/arm/mach-omap2/gpmc-nand.c        |  141 ++++++++++++++++++++++++++++++++
 arch/arm/plat-omap/include/plat/gpmc.h |    2 +-
 arch/arm/plat-omap/include/plat/nand.h |    6 ++
 drivers/mtd/nand/omap2.c               |   26 +-----
 5 files changed, 154 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm/mach-omap2/gpmc-nand.c
