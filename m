Date: Thu, 19 Jan 2012 21:04:06 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 01/10] MXS-DMA : move the mxs-dma.h to a more common place
Message-ID: <20120119130404.GI2247@S2101-09.ap.freescale.net>
References: <1326953767-24155-1-git-send-email-b32955@freescale.com>
 <1326953767-24155-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1326953767-24155-2-git-send-email-b32955@freescale.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@intel.com, b29396@freescale.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, w.sang@pengutronix.de,
 linux-mtd@lists.infradead.org, artem.bityutskiy@intel.com, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 19, 2012 at 02:15:58PM +0800, Huang Shijie wrote:
> Move the header to a more common place.
> The DMA engine is not only used in mx23/mx28, but also used
> in mx50/mx6q.
> It will also be used in the future chips.
> 
> Rename it to mxs-dma.h
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  arch/arm/mach-mxs/include/mach/dma.h |   28 ----------------------------
>  include/linux/mxs-dma.h              |   28 ++++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 28 deletions(-)
>  delete mode 100644 arch/arm/mach-mxs/include/mach/dma.h
>  create mode 100644 include/linux/mxs-dma.h
> 
I'm wondering if it would be better to create folder include/linux/fsl
for mxs-dma.h accommodation, so that any headers that need to shared
between mxs and imx later can find a place.  Considering that Freescale
has many IPs shared between MPCxxx (PowerPC) and i.MX (ARM) families,
it could also be a good place for any headers that need to be shared
between these two product lines from Freescale.

-- 
Regards,
Shawn
