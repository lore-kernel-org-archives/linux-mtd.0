Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9RHP-000328-Og
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 08:20:32 +0000
Received: by mail-wr0-x243.google.com with SMTP id v15-v6so2517754wrm.10
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2018 01:20:16 -0700 (PDT)
From: Sam Lefebvre <sam.lefebvre@essensium.com>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>,
	Sam Lefebvre <sam.lefebvre@essensium.com>
Subject: Reducing the number of interrupts by page reads, part 1 
Date: Fri, 20 Apr 2018 10:19:28 +0200
Message-Id: <20180420081946.16088-1-sam.lefebvre@essensium.com>
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
of the gpmi hardware, some rework must be performed to allow gpmi_ecc_read_page() submitting 
a range of dma's to reduce the interrupts from 4 to 1 for every page read.

In the current situation, a page read for large page incurs 4 interrupts:
- DMA for READ0
- DMA for READSTART
- DMA for reading of page data
- BCH
                                                                                                         
This series is the first part which contains some preparation work and primary modifications             
to reduce the number of interrrupts from 4 to 3 for each page read action by removing the
interrupt for READ0.                               

Some changes by Sasha Hauer are also adopted which contain some bugfixes and preliminary
cleanup of several parts in de code.

Sam lefebvre 

----------------------------------------------------------------                                        
Arnout Vandecappelle (Essensium/Mind) (8):                                                              
      mtd: rawnand: make nand_command() and nand_command_lp() more similar                              
      mtd: rawnand: factor nand_command_lp() into nand_command()                                        
      mtd: rawnand: gpmi: instantiate cmdfunc                                                           
      mtd: rawnand: gpmi: gpmi_ccs_delay() is not needed                                                
      mtd: rawnand: gpmi: explicit delays are not needed                                                
      mtd: rawnand: gpmi: no explicit wait is needed after sending a command                            
      mtd: rawnand: gpmi: cmd_ctrl is no longer needed                                                  
      mtd: rawnand: gpmi: inline gpmi_cmd_ctrl()                                                        
                                                                                                        
Sam Lefebvre (Essensium/Mind) (4):                                                                     
      mtd: rawnand: gpmi: return generated errors in gpmi_ecc_read_oob()                                
      mtd: rawnand: gpmi: set aggregate ready/busy signalling                                           
      mtd: rawnand: gpmi: gpmi_nand_command(): use separate sgl for the two commands                    
      mtd: rawnand: gpmi: issue two commands in a single DMA chain                                      
                                                                                                        
Sascha Hauer (6):                                                                                       
      mtd: nand: gpmi: drop dma_ops_type                                                                
      mtd: nand: gpmi: pass buffer and len around                                                       
      mtd: nand: gpmi: put only once used functions inline                                              
      mtd: nand: gpmi: remove direct_dma_map_ok from driver data struct                                 
      mtd: nand: gpmi: return valid value from bch_set_geometry()                                       
      mtd: nand: gpmi: remove unnecessary variables                                                     
                                                                                                        
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  71 ++++++------                                          
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 330 ++++++++++++++++++++++++++++--------------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  34 ++----                                                
 drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h |   1 +                                                     
 drivers/mtd/nand/raw/nand_base.c           | 259 +++++++++++++-----------------------------            
 5 files changed, 304 insertions(+), 391 deletions(-)                                                   
