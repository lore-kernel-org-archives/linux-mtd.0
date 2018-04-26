Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBnAo-0001aN-3p
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 20:07:24 +0000
Date: Thu, 26 Apr 2018 22:07:09 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Arnout Vandecapelle <arnout@mind.be>,
 Dries Staelens <dries.staelens@barco.com>, Han Xu <han.xu@nxp.com>
Subject: Re: optimizing the nand read performance by reducing interrupts
 from 4 to 1
Message-ID: <20180426220709.736ed60c@bbrezillon>
In-Reply-To: <20180426154134.8270-1-sam.lefebvre@essensium.com>
References: <20180426154134.8270-1-sam.lefebvre@essensium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 26 Apr 2018 17:41:21 +0200
Sam Lefebvre <sam.lefebvre@essensium.com> wrote:

> The current implementation for gmpi nand flashes use existing libraries for composing                    
> dma command chains in different pieces with mutliple interrupts. This invokes a lot of                   
> unnecessary context switches. In order to make more optimal use of dma chaining capabilities
> of the gpmi hardware, some rework must be performed to allow gpmi_ecc_read_page() 
> and gpmi_ecc_read_subpage() submitting a range of dma's to reduce the interrupts from 
> 4 to 1 for every page read.
> 
> In the current situation, a page read for large page incurs 4 interrupts:
> - DMA for READ0
> - DMA for READSTART
> - DMA for reading of page data
> - BCH
>                                                                                                          
> This series is based on a previous post and contains some optimizations in the commits.
> The changes in nand_command() and nand_command_lp() are omitted and commits are re-ordered
> in such way that the changes for reducing the interrupts are moved to the end.
> 
> In order to do the preparation of this work, ready/busy signalling is aggregated and
> error handling in gpmi_ecc_read_oob() has been reviewed.            
> 
> Some changes by Sasha Hauer are also adopted which contain some bugfixes and preliminary
> cleanup of several parts in de code.
> 
> Sam lefebvre 
> 
> ----------------------------------------------------------------
> Arnout Vandecappelle (Essensium/Mind) (2):
>       mtd: rawnand: gpmi: instantiate cmdfunc
>       mtd: rawnand: gpmi: gpmi_nand_command(): simplification and formatting
> 
> Sam Lefebvre (5):
>       mtd: rawnand: gpmi: set aggregate ready/busy signalling

Still waiting for Han's review on this one, but it looks good to me.

>       mtd: rawnand: gpmi: return generated errors in gpmi_ecc_read_oob()
>       mtd: rawnand: gpmi: poll the BCH interrupt bit in start_dma_with_bch_irq()
>       mtd: rawnand: gpmi: issue two commands in a single DMA chain
>       mtd: rawnand: gmpi: chain gpmi_nand_command() with gpmi_ecc_read_page_data()
> 
> Sascha Hauer (6):
>       mtd: nand: gpmi: drop dma_ops_type
>       mtd: nand: gpmi: pass buffer and len around
>       mtd: nand: gpmi: put only once used functions inline
>       mtd: nand: gpmi: remove direct_dma_map_ok from driver data struct
>       mtd: nand: gpmi: return valid value from bch_set_geometry()
>       mtd: nand: gpmi: remove unnecessary variables

Applied patches 1 to 6 after fixing the subject prefix.

For the remaining patches, I'm still opposed to the idea of replacing
->cmd_ctrl() by ->cmdfunc(), but I'm almost sure you can do the same
kind of optimization by changing the GPMI ->read/write_page()
implementation.

Actually, it's likely to be simpler/cleaner than hacking a custom
->cmdfunc() implementation, and you'll have what you were looking for:
optimized read/write paths. 

> 
>  drivers/dma/mxs-dma.c                      |   3 +
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c  |  77 ++++---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 359 ++++++++++++++++-------------
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  37 ++-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h |   1 +
>  5 files changed, 260 insertions(+), 217 deletions(-)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
