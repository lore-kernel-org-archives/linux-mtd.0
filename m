Received: from lelnx193.ext.ti.com ([198.47.27.77])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elCXH-0001Qo-Av
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 11:44:40 +0000
Subject: Re: [RFC PATCH 5/6] mtd: spi-nor: Use the spi_mem_xx() API
To: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Peter Pan <peterpansjtu@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Kamal Dasu
 <kdasu.kdev@gmail.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-6-boris.brezillon@bootlin.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <933bd372-8b75-183f-0b03-563cabbbcc68@ti.com>
Date: Mon, 12 Feb 2018 17:14:21 +0530
MIME-Version: 1.0
In-Reply-To: <20180205232120.5851-6-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tuesday 06 February 2018 04:51 AM, Boris Brezillon wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> The spi_mem_xxx() API has been introduced to replace the
> spi_flash_read() one. Make use of it so we can get rid of
> spi_flash_read().
> 
> Note that using spi_mem_xx() also simplifies the code because this API
> takes care of using the regular spi_sync() interface when the optimized
> ->mem_ops interface is not implemented by the controller.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
[...]
>  /*
> @@ -138,92 +121,42 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  			   u_char *buf)
>  {
>  	struct m25p *flash = nor->priv;
> -	struct spi_device *spi = flash->spi;
> -	unsigned int inst_nbits, addr_nbits, data_nbits, data_idx;
> -	struct spi_transfer t[3];
> -	struct spi_message m;
> -	unsigned int dummy = nor->read_dummy;
> -	ssize_t ret;
> -	int cmd_sz;
> +	u8 addrs[4];
> +	struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> +				   SPI_MEM_OP_ADDRS(nor->addr_width, addrs, 1),
> +				   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> +				   SPI_MEM_OP_DATA_OUT(len, buf, 1));

					^^^^ SPI_MEM_OP_DATA_IN

[...]

-- 
Regards
Vignesh
