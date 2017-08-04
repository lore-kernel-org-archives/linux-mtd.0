Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddX6T-00043Z-Cj
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 07:33:03 +0000
Date: Fri, 4 Aug 2017 09:32:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Jingoo Han <jg1.han@samsung.com>, Simon Baatz <gmbnomis@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Arvind Yadav
 <arvind.yadav.cs@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: orion-nand: fix build error with ARMv4
Message-ID: <20170804093240.25753a23@bbrezillon>
In-Reply-To: <20170721203814.3363448-1-arnd@arndb.de>
References: <20170721203814.3363448-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 21 Jul 2017 22:38:06 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> orion_nand_read_buf uses an inline assembly with the "ldrd"
> instruction, which is only available from ARMv5 upwards. This
> used to be fine, since all users have an ARMv5 or ARMv7 CPU,
> but now we can also build a multiplatform kernel with ARMv4
> support enabled in addition to the "kirkwood" (mvebu) platform.
> 
> This provides an alternative to call the readsl() function that
> is supposed to have the same effect and is also optimized for
> performance.
> 
> I first posted a version of this patch back in 2014, and there
> was some discussion about it then. This fixes the bugs identified
> back then and should be a reasonable alternative for the rare
> corner case.

Looks good to me. Applied to nand/next. Let's see if anyone complains
before the merge window.

Thanks,

Boris

> 
> Link: https://patchwork.kernel.org/patch/4144791/
> Cc: Jingoo Han <jg1.han@samsung.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/nand/orion_nand.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index 209170ed2b76..41cb7acfc044 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -54,13 +54,16 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	void __iomem *io_base = chip->IO_ADDR_R;
> +#if __LINUX_ARM_ARCH__ >= 5
>  	uint64_t *buf64;
> +#endif
>  	int i = 0;
>  
>  	while (len && (unsigned long)buf & 7) {
>  		*buf++ = readb(io_base);
>  		len--;
>  	}
> +#if __LINUX_ARM_ARCH__ >= 5
>  	buf64 = (uint64_t *)buf;
>  	while (i < len/8) {
>  		/*
> @@ -74,6 +77,10 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>  		buf64[i++] = x;
>  	}
>  	i *= 8;
> +#else
> +	readsl(io_base, buf, len/4);
> +	i = len / 4 * 4;
> +#endif
>  	while (i < len)
>  		buf[i++] = readb(io_base);
>  }
