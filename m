Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezHZW-0006MK-Ec
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2018 07:57:12 +0000
Date: Fri, 23 Mar 2018 08:56:56 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, han.xu@nxp.com,
 festevam@gmail.com, marek.vasut@gmail.com, frieder.schrempf@exceet.de,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com
Subject: Re: [PATCH v8 1/2] mtd: fsl-quadspi: add support to create dynamic
 LUT entry
Message-ID: <20180323085656.2eb56a19@bbrezillon>
In-Reply-To: <1521788544-17950-2-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1521788544-17950-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1521788544-17950-2-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Hi Yogesh,

On Fri, 23 Mar 2018 12:32:23 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> @@ -916,6 +1025,23 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
>  {
>  	struct fsl_qspi *q = nor->priv;
>  	int ret;
> +	struct fsl_qspi_mem_op *op = q->op_data;
> +
> +	fsl_clr_qspi_mem_data(op);
> +
> +	/*
> +	 * Fill required entry of struct fsl_qspi_mem_op to prepare
> +	 * LUT for requested cmd.
> +	 * Erase operation works on single pad.
> +	 */
> +	op->cmd.opcode = nor->erase_opcode;
> +	op->cmd.pad = 1;
> +
> +	op->addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
> +	op->addr.pad = 1;
> +
> +	/* Dummy and Data info not required for Erase cmd */
> +	fsl_qspi_prepare_lut(nor, op);
>  
>  	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
>  		nor->mtd.erasesize / 1024, q->chip_base_addr, (u32)offs);
> @@ -967,12 +1093,18 @@ static int fsl_qspi_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
> +	struct fsl_qspi_mem_op *mem_op_data;
>  	int ret, i = 0;
>  
>  	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
>  	if (!q)
>  		return -ENOMEM;
>  
> +	mem_op_data = kmalloc(sizeof(struct fsl_qspi_mem_op), GFP_KERNEL);
> +	if (!mem_op_data)
> +		return -ENOMEM;
> +	q->op_data = mem_op_data;
> +

Why do you need to dynamically allocate this object? Actually, it's not
even needed to embed it in fsl_qspi, just put a fsl_qspi_mem_op object
on the stack when you need one.

Regards,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
