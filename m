Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUqfO-0003nF-RI
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 09:41:48 +0000
Received: by mail-pg0-x244.google.com with SMTP id p21-v6so7254239pgd.11
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2018 02:41:32 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: m25p80: Use SPI_MEM_OP_NO_DUMMY instead of
 SPI_MEM_OP_DUMMY(0, x)
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <20180601100325.11165-1-boris.brezillon@bootlin.com>
 <20180601100325.11165-2-boris.brezillon@bootlin.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b091249b-81b9-8924-73ac-6fdf4a9ecec7@gmail.com>
Date: Mon, 18 Jun 2018 11:41:15 +0200
MIME-Version: 1.0
In-Reply-To: <20180601100325.11165-2-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset=utf-8
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

On 06/01/2018 12:03 PM, Boris Brezillon wrote:
> SPI_MEM_OP_DUMMY(0, x) means there's 0 dummy bytes to send, which is
> similar to SPI_MEM_OP_NO_DUMMY except it's less clear. Use
> SPI_MEM_OP_NO_DUMMY instead of SPI_MEM_OP_DUMMY(0, x) in
> m25p80_write().
> Also stop updating op.dummy.buswidth since this value is only
> meaningful if you have dummy bytes.
> 
> Reported-by: Cyrille Pitchen <cyrille.pitchen@microchip.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Acked-by: Marek Vasut <marek.vasut@gmail.com>

> ---
>  drivers/mtd/devices/m25p80.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 73dd74330227..1dd5f0420b5a 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -68,7 +68,7 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>  	struct spi_mem_op op =
>  			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 1),
>  				   SPI_MEM_OP_ADDR(nor->addr_width, to, 1),
> -				   SPI_MEM_OP_DUMMY(0, 1),
> +				   SPI_MEM_OP_NO_DUMMY,
>  				   SPI_MEM_OP_DATA_OUT(len, buf, 1));
>  	size_t remaining = len;
>  	int ret;
> @@ -76,7 +76,6 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
>  	/* get transfer protocols. */
>  	op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
>  	op.addr.buswidth = spi_nor_get_protocol_addr_nbits(nor->write_proto);
> -	op.dummy.buswidth = op.addr.buswidth;
>  	op.data.buswidth = spi_nor_get_protocol_data_nbits(nor->write_proto);
>  
>  	if (nor->program_opcode == SPINOR_OP_AAI_WP && nor->sst_write_second)
> 


-- 
Best regards,
Marek Vasut
