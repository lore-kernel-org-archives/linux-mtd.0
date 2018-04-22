Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAIfq-0006QS-Vx
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2018 17:21:17 +0000
Date: Sun, 22 Apr 2018 19:20:52 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: hisi: Avoid generic function names
Message-ID: <20180422192052.2da38a9c@bbrezillon>
In-Reply-To: <20180410200106.21173-1-ezequiel@collabora.com>
References: <20180410200106.21173-1-ezequiel@collabora.com>
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

On Tue, 10 Apr 2018 17:01:06 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> Using generic names such as get_if_type() is frowned
> upon: it suggests a core function (which is not),
> and then it makes code navigation harder.
> 
> Given drivers are often used as starting point
> to write other drivers, generic names tend to spread
> like the flu. Cure the problem.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Applied to spi-nor/next.

Thanks,

Boris

> ---
>  drivers/mtd/spi-nor/hisi-sfc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
> index 04f9fb5cd9b6..dea7b0c4b339 100644
> --- a/drivers/mtd/spi-nor/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/hisi-sfc.c
> @@ -112,7 +112,7 @@ struct hifmc_host {
>  	u32 num_chip;
>  };
>  
> -static inline int wait_op_finish(struct hifmc_host *host)
> +static inline int hisi_spi_nor_wait_op_finish(struct hifmc_host *host)
>  {
>  	u32 reg;
>  
> @@ -120,7 +120,7 @@ static inline int wait_op_finish(struct hifmc_host *host)
>  		(reg & FMC_INT_OP_DONE), 0, FMC_WAIT_TIMEOUT);
>  }
>  
> -static int get_if_type(enum spi_nor_protocol proto)
> +static int hisi_spi_nor_get_if_type(enum spi_nor_protocol proto)
>  {
>  	enum hifmc_iftype if_type;
>  
> @@ -208,7 +208,7 @@ static int hisi_spi_nor_op_reg(struct spi_nor *nor,
>  	reg = FMC_OP_CMD1_EN | FMC_OP_REG_OP_START | optype;
>  	writel(reg, host->regbase + FMC_OP);
>  
> -	return wait_op_finish(host);
> +	return hisi_spi_nor_wait_op_finish(host);
>  }
>  
>  static int hisi_spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
> @@ -259,9 +259,9 @@ static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
>  
>  	reg = OP_CFG_FM_CS(priv->chipselect);
>  	if (op_type == FMC_OP_READ)
> -		if_type = get_if_type(nor->read_proto);
> +		if_type = hisi_spi_nor_get_if_type(nor->read_proto);
>  	else
> -		if_type = get_if_type(nor->write_proto);
> +		if_type = hisi_spi_nor_get_if_type(nor->write_proto);
>  	reg |= OP_CFG_MEM_IF_TYPE(if_type);
>  	if (op_type == FMC_OP_READ)
>  		reg |= OP_CFG_DUMMY_NUM(nor->read_dummy >> 3);
> @@ -274,7 +274,7 @@ static int hisi_spi_nor_dma_transfer(struct spi_nor *nor, loff_t start_off,
>  		: OP_CTRL_WR_OPCODE(nor->program_opcode);
>  	writel(reg, host->regbase + FMC_OP_DMA);
>  
> -	return wait_op_finish(host);
> +	return hisi_spi_nor_wait_op_finish(host);
>  }
>  
>  static ssize_t hisi_spi_nor_read(struct spi_nor *nor, loff_t from, size_t len,
