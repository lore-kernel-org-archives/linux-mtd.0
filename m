Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBjld-0001oG-GQ
 for linux-mtd@lists.infradead.org; Thu, 26 Apr 2018 16:29:10 +0000
Date: Thu, 26 Apr 2018 18:28:43 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Arnout Vandecapelle <arnout@mind.be>,
 Dries Staelens <dries.staelens@barco.com>, Richard Weinberger
 <richard@nod.at>, Han Xu <han.xu@nxp.com>
Subject: Re: optimizing the nand read performance by reducing interrupts
 from 4 to 1
Message-ID: <20180426182843.02f60425@bbrezillon>
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

Hi Sam,

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

Are there any changes in this version? I don't see a changelog and the
version number has not been incremented.

> 
> Sam lefebvre 
> 
> ----------------------------------------------------------------
> Arnout Vandecappelle (Essensium/Mind) (2):
>       mtd: rawnand: gpmi: instantiate cmdfunc

Also, I nacked this patch in my previous review, so I'm not going to
accept it now, unless you have strong arguments to convince me.

One last thing, can you Cc the relevant maintainers next time (you can
use scripts/get_maintainers.pl to get the list).

Regards,

Boris
