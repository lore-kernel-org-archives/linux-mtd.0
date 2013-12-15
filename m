Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsGgU-0000yx-LU
 for linux-mtd@lists.infradead.org; Sun, 15 Dec 2013 18:44:59 +0000
Received: by mail-ea0-f170.google.com with SMTP id k10so1824602eaj.29
 for <linux-mtd@lists.infradead.org>; Sun, 15 Dec 2013 10:44:33 -0800 (PST)
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: b32955@freescale.com, dwmw2@infradead.org, dedekind1@gmail.com,
 computersforpeace@gmail.com
Subject: [PATCH v2] mtd: gpmi: Bitflip support in erased regions
Date: Sun, 15 Dec 2013 19:44:20 +0100
Message-Id: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

This is version 2 of my patch for gpmi-nand which corrects bitflips in 
erased regions by correcting them in software.  Thanks to Huagn Shijie's
feedback I added a 'fast'-path and a 'slow'-path for erased blocks. 
Apparently the BCH's block's HW_BCH_STATUS0:ALLONES contains a bit which
indicates if the last block consisted out of all ones or not. This allows
us to easily discriminate between a read transaction of an erase block which 
requires fixing and a read transaction which does not require fixing. 

I did some benchmark testing (dd if=/dev/mtd1 of=/dev/null bs=1M) and 
on my i.MX28 platform the performance of this patch is close to the 
original version of the gpmi-nand driver (as currently present in 
3.9 vanilla). While my original version of the patch where all erased 
blocks where soft-corrected showed a 20% performance penalty. (One could
argue the performance penalty is a non-issue since the upper layer should 
be intelligent enough not to start reading empty pages, or at least not
at a very high frequency).

I'm currently still awaiting feedback of Huang Shijie regarding the setting
for BM_BCH_MODE_ERASE_THRESHOLD. Which I currently set to bch strength, 
since I think that from a regular block with bitflips the BCH block should 
be able to correct up to this level.

Feedback/comments welcome.


Elie De Brauwer (1):
  mtd: gpmi: Deal with bitflips in erased regions regions

 drivers/mtd/nand/gpmi-nand/bch-regs.h  |    2 ++
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   17 +++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   43 +++++++++++++++++++++++++++++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h |    1 +
 4 files changed, 60 insertions(+), 3 deletions(-)

-- 
1.7.10.4
