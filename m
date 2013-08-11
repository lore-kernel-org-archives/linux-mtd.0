Date: Sat, 10 Aug 2013 23:09:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 0/4] mtd: gpmi: support two nand chips at most
Message-ID: <20130811060921.GB16906@norris.computersforpeace.net>
References: <1371197185-27491-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371197185-27491-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 14, 2013 at 04:06:21PM +0800, Huang Shijie wrote:
> Current gpmi-nand driver only supports one chips. But we may meet
> some embarrassing situation, such as Micron MT29F32G08QAA.
> This nand chip has two DIEs internally. Each die has its own chip select pin,
> so this chip acts as two nand chips.
> 
> If we only scan one chip, we may find that we only get 2G for this chip,
> but in actually, this chip's size is 4G.
> 
> So scan two chips by default.
> 
> In order to support two nand chips, we have to do the following:
>    1.) We only have one dma channel now, so decouple the chip select
>       from the DMA channel, We can use the dma 0 to access all the nand chips.
> 
>    2.) fix the wrong method of checking the ready/busy status.
>       In the imx6, all the ready/busy pins are binding together, we
>       should check ready/busy status of chip 0 for the all the chips. 
> 
> Tested this patch set with MT29F32G08QAA.
> 
> 
> Huang Shijie (4):
>   mtd: gpmi: decouple the chip select from the DMA channel
>   mtd: gpmi: use DMA channel 0 for all the nand chips
>   mtd: gpmi: scan two nand chips
>   mtd: gpmi: imx6: fix the wrong method for checking ready/busy
> 
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c  |   14 ++++++++++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    7 +++----
>  drivers/mtd/nand/gpmi-nand/gpmi-regs.h |    3 +++
>  3 files changed, 20 insertions(+), 4 deletions(-)

What's the status on this patch set? It doesn't look like it got merged.
Do you have any testing for this? It looks sane enough to me.

Brian
