Date: Wed, 15 Feb 2012 18:18:42 -0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : add gpmi support for mx6q
Message-ID: <20120216021841.GG30946@r65073-Latitude-D630>
References: <1328505606-27981-1-git-send-email-b32955@freescale.com>
 <20120215183720.GA2399@r65073-Latitude-D630>
 <4F3C623A.3000301@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F3C623A.3000301@freescale.com>
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 16, 2012 at 09:56:10AM +0800, Huang Shijie wrote:
> Hi,
> >The imx6q only supports DT boot, but I do not see you are adding DT
> >probe for the driver, so I'm wondering how you tested the driver on
> >imx6q.
> >
> This patch is just the first patch  for mx6q. My following patches will
> add DT to the gpmi nand driver for mx6q. Due to the dependency
> issue, I will send the patches
> in the following order:
> [1] mtd/gpmi: add gpmi support for mx6q.
> [2] [PATCH v5] patch set about the MXS-DMA
> [3] add DT support to gpmi for mx6q.
> 
It should be:

 1. MXS-DMA series
 2. Add imx6q support with DT probe

> I tested this patch based on our bsp code.
> 
This is wrong approach.  You are submitting patches to mainline, so
you should test your patches on mainline tree. 

-- 
Regards,
Shawn
