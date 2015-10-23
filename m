Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZphJ2-00078k-OF
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 18:43:14 +0000
Received: by pacfv9 with SMTP id fv9so130764911pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 23 Oct 2015 11:42:52 -0700 (PDT)
Date: Fri, 23 Oct 2015 11:42:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <b45815@freescale.com>
Cc: linux@roeck-us.net, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: fsl-quadspi: change the obfuscate macro definition
Message-ID: <20151023184249.GM13239@google.com>
References: <1445624308-27449-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445624308-27449-1-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 23, 2015 at 01:18:28PM -0500, Han Xu wrote:
> Change the READ/WRITE to FSL_READ/FSL_WRITE to de-obfuscate the
> concatenating string in LUT macro.

This isn't "de-obfuscating" anything. I was saying that your LUT0() and
LUT1() macros are obfuscating things by prepending LUT_ for you
automatically. That only saves you characters, but it makes it more
difficult to read (i.e., obfuscates) -- and incidentally, it also makes
this all more fragile, causing build errors.

So while this patch is probably OK, it's only fixing the build errors,
without actually improving readability.

I'm fine if that's the choice you'd rather make, but if so, I'll rewrite
the commit message for you.

Regards,
Brian

> Signed-off-by: Han Xu <b45815@freescale.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index dc38389..7b10ed4 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -155,15 +155,15 @@
>  #define LUT_MODE		4
>  #define LUT_MODE2		5
>  #define LUT_MODE4		6
> -#define LUT_READ		7
> -#define LUT_WRITE		8
> +#define LUT_FSL_READ		7
> +#define LUT_FSL_WRITE		8
>  #define LUT_JMP_ON_CS		9
>  #define LUT_ADDR_DDR		10
>  #define LUT_MODE_DDR		11
>  #define LUT_MODE2_DDR		12
>  #define LUT_MODE4_DDR		13
> -#define LUT_READ_DDR		14
> -#define LUT_WRITE_DDR		15
> +#define LUT_FSL_READ_DDR		14
> +#define LUT_FSL_WRITE_DDR		15
>  #define LUT_DATA_LEARN		16
>  
>  /*
> @@ -366,7 +366,7 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  
>  	writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
>  			base + QUADSPI_LUT(lut_base));
> -	writel(LUT0(DUMMY, PAD1, dummy) | LUT1(READ, PAD4, rxfifo),
> +	writel(LUT0(DUMMY, PAD1, dummy) | LUT1(FSL_READ, PAD4, rxfifo),
>  			base + QUADSPI_LUT(lut_base + 1));
>  
>  	/* Write enable */
> @@ -387,11 +387,11 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  
>  	writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
>  			base + QUADSPI_LUT(lut_base));
> -	writel(LUT0(WRITE, PAD1, 0), base + QUADSPI_LUT(lut_base + 1));
> +	writel(LUT0(FSL_WRITE, PAD1, 0), base + QUADSPI_LUT(lut_base + 1));
>  
>  	/* Read Status */
>  	lut_base = SEQID_RDSR * 4;
> -	writel(LUT0(CMD, PAD1, SPINOR_OP_RDSR) | LUT1(READ, PAD1, 0x1),
> +	writel(LUT0(CMD, PAD1, SPINOR_OP_RDSR) | LUT1(FSL_READ, PAD1, 0x1),
>  			base + QUADSPI_LUT(lut_base));
>  
>  	/* Erase a sector */
> @@ -410,17 +410,17 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  
>  	/* READ ID */
>  	lut_base = SEQID_RDID * 4;
> -	writel(LUT0(CMD, PAD1, SPINOR_OP_RDID) | LUT1(READ, PAD1, 0x8),
> +	writel(LUT0(CMD, PAD1, SPINOR_OP_RDID) | LUT1(FSL_READ, PAD1, 0x8),
>  			base + QUADSPI_LUT(lut_base));
>  
>  	/* Write Register */
>  	lut_base = SEQID_WRSR * 4;
> -	writel(LUT0(CMD, PAD1, SPINOR_OP_WRSR) | LUT1(WRITE, PAD1, 0x2),
> +	writel(LUT0(CMD, PAD1, SPINOR_OP_WRSR) | LUT1(FSL_WRITE, PAD1, 0x2),
>  			base + QUADSPI_LUT(lut_base));
>  
>  	/* Read Configuration Register */
>  	lut_base = SEQID_RDCR * 4;
> -	writel(LUT0(CMD, PAD1, SPINOR_OP_RDCR) | LUT1(READ, PAD1, 0x1),
> +	writel(LUT0(CMD, PAD1, SPINOR_OP_RDCR) | LUT1(FSL_READ, PAD1, 0x1),
>  			base + QUADSPI_LUT(lut_base));
>  
>  	/* Write disable */
> -- 
> 1.9.1
> 
