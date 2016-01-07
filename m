Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGy6L-00062N-FU
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 00:06:50 +0000
Received: by mail-pa0-x22b.google.com with SMTP id do7so5926313pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 16:06:29 -0800 (PST)
Date: Wed, 6 Jan 2016 16:06:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
Message-ID: <20160107000626.GS109450@google.com>
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 11, 2015 at 09:57:12PM +0200, Robert Jarzmik wrote:
> Add verbose debug for register accesses. This enables easier debugging
> by following where and how hardware is stimulated, and how it answers.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 1259cc558ce9..ed44bddcc43f 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -127,11 +127,23 @@
>  #define EXT_CMD_TYPE_MONO	0 /* Monolithic read/write */
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
> +			 "%s():%d nand_writel(0x%x, %s)\n",		\
> +			 __func__, __LINE__, (val), #off);		\

The stringification of 'off' works for now, but I think that'd be a bit
restrictive in the future, if we ever want to (e.g.) do arithmetic to
compute the offset, like:

	nand_writel(info, SOME_REGISTER_MACRO + idx * 4, foo);

You might be better off just printing the hex value of the offset.

Regards,
Brian

> +		writel_relaxed((val), (info)->mmio_base + (off));	\
> +	} while (0)
> +
> +#define nand_readl(info, off)						\
> +	({								\
> +		unsigned int _v;					\
> +		_v = readl_relaxed((info)->mmio_base + (off));		\
> +		dev_vdbg(&info->pdev->dev,				\
> +			 "%s():%d nand_readl(%s): 0x%x\n",		\
> +			 __func__, __LINE__, #off, _v);			\
> +		_v;							\
> +	})
>  
>  /* error code and state */
>  enum {
> -- 
> 2.1.4
> 
