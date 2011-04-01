Date: Fri, 1 Apr 2011 11:47:31 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V3 2/6] dmaengine: add interrupt check for GPMI controller
Message-ID: <20110401034730.GE25866@S2100-06.ap.freescale.net>
References: <19858.62649.218523.984252@ipc1.ka-ro>
	<1301554968-29066-1-git-send-email-b32955@freescale.com>
	<19860.13566.651111.241538@ipc1.ka-ro>
	<4D94403F.6000000@freescale.com>
	<19860.16442.199644.984424@ipc1.ka-ro>
	<4D9444A6.2060109@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4D9444A6.2060109@freescale.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 31, 2011 at 05:08:54PM +0800, Huang Shijie wrote:
[...]
> >>>You should make the distinction based on the platform_id, which would
> >>>save you the ugly ifdef's and cpu_is_... macros.
> >>>
> >>>
> >>This in the DMA driver.
> >>Do you want me to change the DMA driver to add the platform_id?
> >>The DMA driver has already used the cpu_is_xx() macros.
> >>
> >The mxs-dma driver is already using platform ids!
> >
> >
> Do you mean the mxd_dma_type[] ?
> 
> How can i distinction the imx23 and imx28 with it ?
> It seems can not be used to do the work.
> 
You can drop the dmaengine patch from your gpmi series.  I will find
some time to fix this together with removing cpu_is_xx() and inclusion
of mxs.h, to get it prepared for i.mx50 aphb-dma support.

-- 
Regards,
Shawn
