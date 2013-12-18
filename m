Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtMTC-0008MJ-Cm
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 19:07:47 +0000
Received: by mail-ee0-f41.google.com with SMTP id t10so28706eei.28
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2013 11:07:24 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com, dwmw2@infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com, shijie8@gmail.com
Subject: [PATCH v6] gpmi-nand bitflips in erased regions.
Date: Wed, 18 Dec 2013 20:07:11 +0100
Message-Id: <1387393632-5338-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes in v6: Correction in obtaining the ecc_strength. 

Elie De Brauwer (1):
  mtd: gpmi: Deal with bitflips in erased regions regions

 drivers/mtd/nand/gpmi-nand/bch-regs.h  |  2 ++
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  | 18 ++++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 44 +++++++++++++++++++++++++++++++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |  1 +
 4 files changed, 62 insertions(+), 3 deletions(-)

-- 
1.8.5.1
