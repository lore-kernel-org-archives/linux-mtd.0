Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBj25-0005gt-0p
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 15:42:07 +0000
Received: by mail-wm0-x243.google.com with SMTP id j4so13793191wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 26 Apr 2018 08:41:54 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Dries Staelens <dries.staelens@barco.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>,
 Arnout Vandecapelle <arnout@mind.be>
Subject: optimizing the nand read performance by reducing interrupts from 4 to
 1
Date: Thu, 26 Apr 2018 17:41:21 +0200
Message-Id: <20180426154134.8270-1-sam.lefebvre@essensium.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current implementation for gmpi nand flashes use existing libraries for composing                    
dma command chains in different pieces with mutliple interrupts. This invokes a lot of                   
unnecessary context switches. In order to make more optimal use of dma chaining capabilities
of the gpmi hardware, some rework must be performed to allow gpmi_ecc_read_page() 
and gpmi_ecc_read_subpage() submitting a range of dma's to reduce the interrupts from 
4 to 1 for every page read.

In the current situation, a page read for large page incurs 4 interrupts:
- DMA for READ0
- DMA for READSTART
- DMA for reading of page data
- BCH
                                                                                                         
This series is based on a previous post and contains some optimizations in the commits.
The changes in nand_command() and nand_command_lp() are omitted and commits are re-ordered
in such way that the changes for reducing the interrupts are moved to the end.

In order to do the preparation of this work, ready/busy signalling is aggregated and
error handling in gpmi_ecc_read_oob() has been reviewed.            

Some changes by Sasha Hauer are also adopted which contain some bugfixes and preliminary
cleanup of several parts in de code.

Sam lefebvre 

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (2):
      mtd: rawnand: gpmi: instantiate cmdfunc
      mtd: rawnand: gpmi: gpmi_nand_command(): simplification and formatting

Sam Lefebvre (5):
      mtd: rawnand: gpmi: set aggregate ready/busy signalling
      mtd: rawnand: gpmi: return generated errors in gpmi_ecc_read_oob()
      mtd: rawnand: gpmi: poll the BCH interrupt bit in start_dma_with_bch_irq()
      mtd: rawnand: gpmi: issue two commands in a single DMA chain
      mtd: rawnand: gmpi: chain gpmi_nand_command() with gpmi_ecc_read_page_data()

Sascha Hauer (6):
      mtd: nand: gpmi: drop dma_ops_type
      mtd: nand: gpmi: pass buffer and len around
      mtd: nand: gpmi: put only once used functions inline
      mtd: nand: gpmi: remove direct_dma_map_ok from driver data struct
      mtd: nand: gpmi: return valid value from bch_set_geometry()
      mtd: nand: gpmi: remove unnecessary variables

 drivers/dma/mxs-dma.c                      |   3 +
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  77 ++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 359 ++++++++++++++++-------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  37 ++-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h |   1 +
 5 files changed, 260 insertions(+), 217 deletions(-)
