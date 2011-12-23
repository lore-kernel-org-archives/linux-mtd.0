Subject: Re: [PATCH 0/4] Fix the left DMA_NONE from dma_transfer_direction
 migration
From: Vinod Koul <vinod.koul@intel.com>
To: Shawn Guo <shawn.guo@linaro.org>
In-Reply-To: <1323791286-29574-1-git-send-email-shawn.guo@linaro.org>
References: <1323791286-29574-1-git-send-email-shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Dec 2011 21:33:49 +0530
Message-ID: <1324656229.1633.12.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Chris Ball <cjb@laptop.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-12-13 at 23:48 +0800, Shawn Guo wrote:
> I have been working on -rc recently, and have not noticed the failure
> until I ran next tree today.  The mxs-mmc driver is broken on next
> tree because the DMA_NONE was left over from the dma_transfer_direction
> migration for mxs-dma and its client drivers.
> 
> This seires is trying to fix it up.
Applied, Thanks

> 
> Huang Shijie (1):
>       mtd: fix compile error for gpmi-nand
> 
> Shawn Guo (3):
>       dmaengine: add DMA_TRANS_NONE to dma_transfer_direction
>       mmc: mxs-mmc: fix the dma_transfer_direction migration
>       mtd: gpmi-nand: move to dma_transfer_direction
> 
>  drivers/dma/mxs-dma.c                 |    2 +-
>  drivers/mmc/host/mxs-mmc.c            |    3 +
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c |   22 ++++++-----
>  include/linux/dmaengine.h             |    1 +
>  include/linux/mtd/gpmi-nand.h         |   68 +++++++++++++++++++++++++++++++++
>  5 files changed, 85 insertions(+), 11 deletions(-)
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- 
~Vinod
