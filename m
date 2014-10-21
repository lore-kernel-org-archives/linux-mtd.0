Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgXNh-0001eX-FV
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 11:13:37 +0000
Date: Tue, 21 Oct 2014 16:05:40 +0530
From: Vinod Koul <vinod.koul@intel.com>
To: Herve Codina <herve.codina@celad.com>
Subject: Re: [PATCH 1/2] mtd: atmel_nand: use __iowrite32_copy for 32 bitcopy
Message-ID: <20141021103540.GJ28745@intel.com>
References: <1413821173-18347-1-git-send-email-vinod.koul@intel.com>
 <54462F6C.1030307@atmel.com> <54463356.400@celad.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54463356.400@celad.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Bo Shen <voice.shen@atmel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Mark Brown <broonie@linaro.org>,
 HuangShijie <shijie8@gmail.com>, Jingoo Han <jg1.han@samsung.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Josh Wu <josh.wu@atmel.com>,
 BartlomiejZolnierkiewicz <b.zolnierkie@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 EzequielGarcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2014 at 12:20:06PM +0200, Herve Codina wrote:
> Hi,
Please don't top post
> 
> I didn't go deeper in atmel_nand.c code to see other accesses but old
> copy use writel_relaxed which is a macro to __raw_writel((__force u32)
> cpu_to_le32(v),c)
> 
> __iowrite32_copy use directly __raw_writel(*src++, dst++)
> 
> So we skip cpu_to_le32. Is it ok for all system using atmel_nand ?
Also would be a good question if we need barriers as __iowrite32_copy()
doesn't guarantee any ordering.

-- 
~Vinod

> 
> Best regards,
> Herve Codina
> 
> 
> Le 21/10/2014 12:03, Josh Wu a écrit :
> > Hi, Vinod
> > 
> > On 10/21/2014 12:06 AM, Vinod Koul wrote:
> >> The driver was also using own method to do 32bit copy, turns out
> >> we have a kernel API so use that instead
> >>
> >> Signed-off-by: Vinod Koul <vinod.koul@intel.com>
> > 
> > Thanks for the patch.
> > Acked-by: Josh Wu <josh.wu@atmel.com>
> > 
> > BTW, is there any similar kernel API that is for the read from io?
> > 
> > Best Regards,
> > Josh Wu
> > 
> >> ---
> >>   drivers/mtd/nand/atmel_nand.c |   10 +++-------
> >>   1 files changed, 3 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> >> index e321c56..b03e80d 100644
> >> --- a/drivers/mtd/nand/atmel_nand.c
> >> +++ b/drivers/mtd/nand/atmel_nand.c
> >> @@ -265,14 +265,10 @@ static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
> >>   		*t++ = readl_relaxed(s++);
> >>   }
> >>   
> >> -static void memcpy32_toio(void __iomem *trg, const void *src, int size)
> >> +static inline void memcpy32_toio(void __iomem *trg, const void *src, int size)
> >>   {
> >> -	int i;
> >> -	u32 __iomem *t = trg;
> >> -	const u32 *s = src;
> >> -
> >> -	for (i = 0; i < (size >> 2); i++)
> >> -		writel_relaxed(*s++, t++);
> >> +	/* __iowrite32_copy use 32bit size values so divide by 4 */
> >> +	__iowrite32_copy(trg, src, size/4);
> >>   }
> >>   
> >>   /*
> > 

-- 
