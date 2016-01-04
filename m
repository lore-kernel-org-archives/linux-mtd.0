Received: from mail-bl2on0113.outbound.protection.outlook.com ([65.55.169.113]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGCUJ-0003cR-9t
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 21:16:24 +0000
Date: Mon, 4 Jan 2016 15:02:24 -0600
From: Han Xu <han.xu@freescale.com>
To: Yuan Yao <yao.yuan@freescale.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <yao.yuan@nxp.com>
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: fsl-quadspi: extend support for
 some special requerment.
Message-ID: <20160104210223.GB27554@chopperman.am.freescale.net>
References: <1450954821-7483-1-git-send-email-yao.yuan@freescale.com>
 <1450954821-7483-4-git-send-email-yao.yuan@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1450954821-7483-4-git-send-email-yao.yuan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 24, 2015 at 07:00:21PM +0800, Yuan Yao wrote:
> Add extra info in LUT table to support some special requerments.
> Spansion S25FS-S family flash need some special operations.

What's the special requirement, detail it.

> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
> Changed in v2:
> Update my email to <yao.yuan@nxp.com>
> ---
>  drivers/mtd/spi-nor/fsl-quadspi.c | 41 +++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h       |  4 ++++
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 9ab2b51..081ae85 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -205,6 +205,8 @@
>  #define SEQID_RDCR		9
>  #define SEQID_EN4B		10
>  #define SEQID_BRWR		11
> +#define SEQID_RDAR		12
> +#define SEQID_WRAR		13
>  
>  #define QUADSPI_MIN_IOMAP SZ_4M
>  
> @@ -476,6 +478,28 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),
>  			base + QUADSPI_LUT(lut_base));
>  
> +	/*
> +	 * Read any device register.
> +	 * Used for Spansion S25FS-S family flash only.
> +	 */
> +	lut_base = SEQID_RDAR * 4;
> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_SPANSION_RDAR) |
> +			LUT1(ADDR, PAD1, ADDR24BIT),
> +			base + QUADSPI_LUT(lut_base));
> +	qspi_writel(q, LUT0(DUMMY, PAD1, 8) | LUT1(FSL_READ, PAD1, 1),
> +			base + QUADSPI_LUT(lut_base + 1));
> +
> +	/*
> +	 * Write any device register.
> +	 * Used for Spansion S25FS-S family flash only.
> +	 */
> +	lut_base = SEQID_WRAR * 4;
> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_SPANSION_WRAR) |
> +			LUT1(ADDR, PAD1, ADDR24BIT),
> +			base + QUADSPI_LUT(lut_base));
> +	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 1),
> +			base + QUADSPI_LUT(lut_base + 1));
> +
>  	fsl_qspi_lock_lut(q);
>  }
>  
> @@ -484,7 +508,12 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>  {
>  	switch (cmd) {
>  	case SPINOR_OP_READ_1_1_4:
> +	case SPINOR_OP_READ4_1_1_4:
>  		return SEQID_QUAD_READ;
> +	case SPINOR_OP_SPANSION_RDAR:
> +		return SEQID_RDAR;
> +	case SPINOR_OP_SPANSION_WRAR:
> +		return SEQID_WRAR;
>  	case SPINOR_OP_WREN:
>  		return SEQID_WREN;
>  	case SPINOR_OP_WRDI:
> @@ -835,8 +864,12 @@ static int fsl_qspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  {
>  	int ret;
>  	struct fsl_qspi *q = nor->priv;
> +	u32 to = 0;
> +
> +	if (opcode == SPINOR_OP_SPANSION_RDAR)
> +		memcpy(&to, nor->cmd_buf, 4);
>  
> -	ret = fsl_qspi_runcmd(q, opcode, 0, len);
> +	ret = fsl_qspi_runcmd(q, opcode, to, len);
>  	if (ret)
>  		return ret;
>  
> @@ -848,9 +881,13 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
>  {
>  	struct fsl_qspi *q = nor->priv;
>  	int ret;
> +	u32 to = 0;
> +
> +	if (opcode == SPINOR_OP_SPANSION_RDAR)
> +		memcpy(&to, nor->cmd_buf, 4);

RADR or WRAR? This is hacking code, why need these two commands?

>  
>  	if (!buf) {
> -		ret = fsl_qspi_runcmd(q, opcode, 0, 1);
> +		ret = fsl_qspi_runcmd(q, opcode, to, 1);
>  		if (ret)
>  			return ret;
>  
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index fac3f6f..7a2f193 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -74,6 +74,10 @@
>  /* Used for Spansion flashes only. */
>  #define SPINOR_OP_BRWR		0x17	/* Bank register write */
>  
> +/* Used for Spansion S25FS-S family flash only. */
> +#define SPINOR_OP_SPANSION_RDAR	0x65	/* Read any device register */
> +#define SPINOR_OP_SPANSION_WRAR	0x71	/* Write any device register */
> +
>  /* Used for Micron flashes only. */
>  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
>  #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
> -- 
> 2.1.0.27.g96db324
> 

-- 
Best Regards,

Han "Allen" Xu
