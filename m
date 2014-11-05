Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm959-0005cU-I1
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 22:29:40 +0000
Received: by mail-pd0-f173.google.com with SMTP id v10so1602963pde.18
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 14:29:17 -0800 (PST)
Date: Wed, 5 Nov 2014 14:29:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 2/2] mtd: mxc_nand: use __iowrite32_copy for 32 bit copy
Message-ID: <20141105222913.GX23619@ld-irv-0074>
References: <1413821173-18347-1-git-send-email-vinod.koul@intel.com>
 <1413821173-18347-2-git-send-email-vinod.koul@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413821173-18347-2-git-send-email-vinod.koul@intel.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, Bo Shen <voice.shen@atmel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Mark Brown <broonie@linaro.org>,
 Huang Shijie <shijie8@gmail.com>, Jingoo Han <jg1.han@samsung.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>, Herve Codina <Herve.CODINA@celad.com>,
 Josh Wu <Josh.wu@atmel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 20, 2014 at 09:36:13PM +0530, Vinod Koul wrote:
> The driver was also using own method to do 32bit copy, turns out
> we have a kernel API so use that instead
> 
> Signed-off-by: Vinod Koul <vinod.koul@intel.com>
> ---
>  drivers/mtd/nand/mxc_nand.c |   10 +++-------
>  1 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index dba262b..3794cd7 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -280,14 +280,10 @@ static void memcpy32_fromio(void *trg, const void __iomem  *src, size_t size)
>  		*t++ = __raw_readl(s++);
>  }
>  
> -static void memcpy32_toio(void __iomem *trg, const void *src, int size)
> +static inline void memcpy32_toio(void __iomem *trg, const void *src, int size)
>  {
> -	int i;
> -	u32 __iomem *t = trg;
> -	const u32 *s = src;
> -
> -	for (i = 0; i < (size >> 2); i++)
> -		__raw_writel(*s++, t++);
> +	/* __iowrite32_copy use 32bit size values so divide by 4 */
> +	__iowrite32_copy(trg, src, size/4);

Fixed up the spacing around the division, and pushed to l2-mtd.git.

>  }
>  
>  static int check_int_v3(struct mxc_nand_host *host)

Brian
