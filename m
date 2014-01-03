Received: from mail-ee0-x230.google.com ([2a00:1450:4013:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzCHd-0008Lf-EU
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2014 21:27:57 +0000
Received: by mail-ee0-f48.google.com with SMTP id e49so6834847eek.35
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2014 13:27:35 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com, dwmw2@infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com, shijie8@gmail.com
Subject: [PATCH v7] mtd: gpmi: Deal with bitflips in erased regions
Date: Fri,  3 Jan 2014 22:27:18 +0100
Message-Id: <1388784439-23004-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

This is v7 of my patch which attempts to correct bitflips in erased regions.
Tests on hardware have shown that the ALLONES bit used in earlier versions
to distinguish between fast/slow path is not behaving as expected when 
also using the erase threshold. This patch takes a step back and always 
performs the correction when an erased region is detected.

Feedback is welcomed.

Elie De Brauwer (1):
  mtd: gpmi: Deal with bitflips in erased regions

 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  1 +
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |  9 +++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 43 +++++++++++++++++++++++++++++++---
 3 files changed, 50 insertions(+), 3 deletions(-)

-- 
1.8.5.2
