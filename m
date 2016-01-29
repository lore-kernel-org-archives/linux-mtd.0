Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPAKi-0007yZ-47
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 14:47:33 +0000
Received: by mail-qk0-x22a.google.com with SMTP id o6so24982253qkc.2
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 06:47:11 -0800 (PST)
Date: Fri, 29 Jan 2016 11:47:07 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx_nand: add register access debug
Message-ID: <20160129144707.GB1437@laptop.cereza>
References: <1453753785-9635-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453753785-9635-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 Jan 09:29 PM, Robert Jarzmik wrote:
> Add verbose debug for register accesses. This enables easier debugging
> by following where and how hardware is stimulated, and how it answers.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index e453ae9a17fa..0845d09e14c1 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -136,11 +136,23 @@
>  #define READ_ID_BYTES		7
>  
>  /* macros for registers read/write */
> -#define nand_writel(info, off, val)	\
> -	writel_relaxed((val), (info)->mmio_base + (off))
> -
> -#define nand_readl(info, off)		\
> -	readl_relaxed((info)->mmio_base + (off))
> +#define nand_writel(info, off, val)					\
> +	do {								\
> +		dev_vdbg(&info->pdev->dev,				\
> +			 "%s():%d nand_writel(0x%x, 0x%04x)\n",		\
> +			 __func__, __LINE__, (val), (off));		\
> +		writel_relaxed((val), (info)->mmio_base + (off));	\
> +	} while (0)
> +
> +#define nand_readl(info, off)						\
> +	({								\
> +		unsigned int _v;					\
> +		_v = readl_relaxed((info)->mmio_base + (off));		\
> +		dev_vdbg(&info->pdev->dev,				\
> +			 "%s():%d nand_readl(0x%04x): 0x%x\n",		\
> +			 __func__, __LINE__, (off), _v);		\
> +		_v;							\
> +	})
>  

With verbose debug enabled, it looks like this:

[..]
[   99.909883] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():793 nand_readl(0x0014): 0x1
[   99.909896] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():843 nand_writel(0x1, 0x0014)
[   99.909902] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():857 nand_writel(0x300d3000, 0x0048)
[   99.909909] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():858 nand_writel(0x60000, 0x0048)
[   99.909915] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():859 nand_writel(0x0, 0x0048)
[   99.909921] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():863 nand_writel(0x820, 0x0048)
[   99.910037] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():793 nand_readl(0x0014): 0x2

Maybe it would look clearer with:

[   99.910037] pxa3xx-nand f10d0000.nand: pxa3xx_nand_irq():793 nand_readl(0x0014) = 0x2

But if you feel it's just bikeshedding then:

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
