Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ekqrR-00011E-El
 for linux-mtd@lists.infradead.org; Sun, 11 Feb 2018 12:36:03 +0000
Subject: Re: [PATCH 1/3] mtd: spi-nor: Add support of read/write any reg
 commands
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 poonam.aggrwal@nxp.com, suresh.gupta@nxp.com, yogeshnarayan.gaur@nxp.com
References: <1517494735-2766-1-git-send-email-prabhakar.kushwaha@nxp.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <1a667a8a-ae47-9baf-7506-00cc2513c2bf@wedev4u.fr>
Date: Sun, 11 Feb 2018 13:35:42 +0100
MIME-Version: 1.0
In-Reply-To: <1517494735-2766-1-git-send-email-prabhakar.kushwaha@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Prabhakar,

Le 01/02/2018 à 15:18, Prabhakar Kushwaha a écrit :
> Spansion flash provide support of Read Any Register and Write Any
> Register commands.  These commands provides a way to read or write
> all device registers - non-volatile and volatile.
> 
> These commands require special signature and handing from underlying
> flash controller.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  include/linux/mtd/spi-nor.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index de36969..a747215 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -265,6 +265,8 @@ struct flash_info;
>   *			read/write/erase/lock/unlock operations
>   * @read_reg:		[DRIVER-SPECIFIC] read out the register
>   * @write_reg:		[DRIVER-SPECIFIC] write data to the register
> + * @read_anyreg:	[DRIVER-SPECIFIC] read out from any register
> + * @write_anyreg	[DRIVER-SPECIFIC] write data to any register

For now, I'm not fond off adding new driver specific handlers such
.read_anyreg() or .write_anyreg() because if they are supposed to be
mandatory then you will have to provide an implementation for every single
SPI flash controller driver, including drivers/mtd/devices/m25p80.c and all
drivers under drivers/mtd/spi-nor/.

Otherwise, if those new handlers are optional, you will have to handle
carefully inside spi-nor.c the case where they are not implemented.

Besides, Boris is proposing a new common API for all SPI flash drivers to
send SPI flash commands to whatever kind of SPI flash memory, (Q)SPI NOR,
QSPI NAND, SPI SRAM, ...

His API is more generic and could handle the specific cases of the
Read/Write Any Reg SPI commands so I'd rather use his API instead of adding
too many dedicated handlers.

Please have a look at his series of patches:
https://patchwork.ozlabs.org/patch/869628/

Especially, check 'struct spi_mem_op' and the spi_mem_exec_op() function.

Best regards,

Cyrille

>   * @read:		[DRIVER-SPECIFIC] read data from the SPI NOR
>   * @write:		[DRIVER-SPECIFIC] write data to the SPI NOR
>   * @erase:		[DRIVER-SPECIFIC] erase a sector of the SPI NOR
> @@ -299,6 +301,10 @@ struct spi_nor {
>  	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
>  	int (*read_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
>  	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len);
> +	int (*read_anyreg)(struct spi_nor *nor, u8 opcode, u32 offset,
> +			   u8 *buf, int len);
> +	int (*write_anyreg)(struct spi_nor *nor, u8 opcode, u32 offset,
> +			    u8 *buf, int len);
>  
>  	ssize_t (*read)(struct spi_nor *nor, loff_t from,
>  			size_t len, u_char *read_buf);
> 
