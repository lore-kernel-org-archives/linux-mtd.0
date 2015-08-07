Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNqvo-0002jT-Je
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 23:20:09 +0000
Received: by pdco4 with SMTP id o4so50054964pdc.3
 for <linux-mtd@lists.infradead.org>; Fri, 07 Aug 2015 16:19:48 -0700 (PDT)
Date: Fri, 7 Aug 2015 16:19:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Axel Lin <axel.lin@ingics.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: brcmnand: Fix misuse of IS_ENABLED
Message-ID: <20150807231945.GF60523@google.com>
References: <1438835377.28215.2.camel@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438835377.28215.2.camel@ingics.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 06, 2015 at 12:29:37PM +0800, Axel Lin wrote:
> While IS_ENABLED() is perfectly fine for CONFIG_* symbols, it is not
> for other symbols such as __BIG_ENDIAN that is provided directly by
> the compiler.
> 
> Switch to use CONFIG_CPU_BIG_ENDIAN instead of __BIG_ENDIAN.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> v2:
> Based on Florian's comment:
> Switch to use CONFIG_CPU_BIG_ENDIAN instead of __BIG_ENDIAN.

Applied to l2-mtd.git with:

Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")

Thanks,
Brian

>  drivers/mtd/nand/brcmnand/brcmnand.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.h b/drivers/mtd/nand/brcmnand/brcmnand.h
> index a20c736..169f99e 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.h
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.h
> @@ -50,7 +50,7 @@ static inline u32 brcmnand_readl(void __iomem *addr)
>  	 * Other architectures (e.g., ARM) either do not support big endian, or
>  	 * else leave I/O in little endian mode.
>  	 */
> -	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
> +	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>  		return __raw_readl(addr);
>  	else
>  		return readl_relaxed(addr);
> @@ -59,7 +59,7 @@ static inline u32 brcmnand_readl(void __iomem *addr)
>  static inline void brcmnand_writel(u32 val, void __iomem *addr)
>  {
>  	/* See brcmnand_readl() comments */
> -	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(__BIG_ENDIAN))
> +	if (IS_ENABLED(CONFIG_MIPS) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>  		__raw_writel(val, addr);
>  	else
>  		writel_relaxed(val, addr);
> -- 
> 2.1.0
> 
> 
> 
