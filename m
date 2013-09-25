Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOfOw-0001uC-RG
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 03:04:31 +0000
Message-ID: <52425319.1000705@freescale.com>
Date: Wed, 25 Sep 2013 11:06:01 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B409=E6=9C=8824=E6=97=A5 20:10, Sourav Poddar =E5=86=
=99=E9=81=93:
> Some flash like spansion flash also support quad read mode.
> This patch add support for enabling quad mode in m25p80.
>
> Patch enables quad mode bit on the flash device, add an api
> for quad read defines a communuication
> parameter(t[1].rx_nbits =3D SPI_NBITS_QUAD) to let know the
> spi controller that quad read should be used.
>
> Tested on DRA7 board with S25fl256s spansion device by doing a
> flash erase, write and read.
>
> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
> ---
>   drivers/mtd/devices/m25p80.c |  102 +++++++++++++++++++++++++++++++++=
++++-----
>   1 files changed, 91 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.=
c
> index 26b14f9..2b6ee4b 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -41,6 +41,7 @@
>   #define	OPCODE_WRSR		0x01	/* Write status register 1 byte */
>   #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low frequency) */
>   #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */
> +#define	OPCODE_QUAD_READ	0x6b	/* QUAD READ */
>   #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
>   #define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
>   #define	OPCODE_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
> @@ -52,6 +53,7 @@
>   /* 4-byte address opcodes - used on Spansion and some Macronix flashe=
s. */
>   #define	OPCODE_NORM_READ_4B	0x13	/* Read data bytes (low frequency) *=
/
>   #define	OPCODE_FAST_READ_4B	0x0c	/* Read data bytes (high frequency) =
*/
> +#define	OPCODE_QUAD_READ_4B     0x6c    /* Read data bytes */
>   #define	OPCODE_PP_4B		0x12	/* Page program (up to 256 bytes) */
>   #define	OPCODE_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
>
> @@ -95,6 +97,7 @@ struct m25p {
>   	u8			program_opcode;
>   	u8			*command;
>   	bool			fast_read;
> +	bool			quad_read;
>   };
>
>   static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
> @@ -336,6 +339,75 @@ static int m25p80_erase(struct mtd_info *mtd, stru=
ct erase_info *instr)
>   	return 0;
>   }
>
> +static int quad_enable(struct m25p *flash)
> +{
> +	u8 cmd[3];
> +	cmd[0] =3D OPCODE_WRSR;
> +	cmd[1] =3D 0x00;
> +	cmd[2] =3D 0x02;
> +
> +	write_enable(flash);
> +
> +	spi_write(flash->spi,&cmd, 3);
> +
> +	if (wait_till_ready(flash))
> +		return 1;
> +
> +	return 0;
> +}
> +
why not add a more common function, such as write_sr_cr()?

see the my patch=20
:http://lists.infradead.org/pipermail/linux-mtd/2013-August/048438.html
> +static int m25p80_quad_read(struct mtd_info *mtd, loff_t from, size_t =
len,

I think we can reuse the m25p80_read(), and there is no need to add a=20
new function.
> +	size_t *retlen, u_char *buf)
> +{
> +	struct m25p *flash =3D mtd_to_m25p(mtd);
> +	struct spi_transfer t[2];
> +	struct spi_message m;
> +	uint8_t opcode;
> +
> +	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
> +			__func__, (u32)from, len);
> +
> +	spi_message_init(&m);
> +	memset(t, 0, (sizeof(t)));
> +
> +	t[0].tx_buf =3D flash->command;
> +	t[0].len =3D m25p_cmdsz(flash) + (flash->quad_read ? 1 : 0);
> +	spi_message_add_tail(&t[0],&m);
> +
> +	t[1].rx_buf =3D buf;
> +	t[1].len =3D len;
> +	t[1].rx_nbits =3D SPI_NBITS_QUAD;
> +	spi_message_add_tail(&t[1],&m);
> +
> +	mutex_lock(&flash->lock);
> +
> +	/* Wait till previous write/erase is done. */
> +	if (wait_till_ready(flash)) {
> +		/* REVISIT status return?? */
> +		mutex_unlock(&flash->lock);
> +		return 1;
> +	}
> +
> +	/* FIXME switch to OPCODE_QUAD_READ.  It's required for higher
> +	 * clocks; and at this writing, every chip this driver handles
> +	 * supports that opcode.
> +	*/
> +
> +	/* Set up the write data buffer. */
> +	opcode =3D flash->read_opcode;
> +	flash->command[0] =3D opcode;
> +	m25p_addr2cmd(flash, from, flash->command);
> +
> +	spi_sync(flash->spi,&m);
> +
> +	*retlen =3D m.actual_length - m25p_cmdsz(flash) -
> +			(flash->quad_read ? 1 : 0);
> +
> +	mutex_unlock(&flash->lock);
> +
> +	return 0;
> +}
> +
>   /*
>    * Read an address range from the flash chip.  The address range
>    * may be any size provided it is within the physical boundaries.
> @@ -979,15 +1051,9 @@ static int m25p_probe(struct spi_device *spi)
>   		}
>   	}
>
> -	flash =3D kzalloc(sizeof *flash, GFP_KERNEL);
> +	flash =3D devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
>   	if (!flash)
>   		return -ENOMEM;
> -	flash->command =3D kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
> -					GFP_KERNEL);
> -	if (!flash->command) {
> -		kfree(flash);
> -		return -ENOMEM;
> -	}
>
>   	flash->spi =3D spi;
>   	mutex_init(&flash->lock);
> @@ -1015,7 +1081,14 @@ static int m25p_probe(struct spi_device *spi)
>   	flash->mtd.flags =3D MTD_CAP_NORFLASH;
>   	flash->mtd.size =3D info->sector_size * info->n_sectors;
>   	flash->mtd._erase =3D m25p80_erase;
> -	flash->mtd._read =3D m25p80_read;
> +
> +	flash->quad_read =3D false;
> +	if (spi->mode&&  SPI_RX_QUAD) {
> +		quad_enable(flash);
what about the quad_enable() failed, you should read back the Quad bit=20
and check it.

thanks
Huang Shijie
