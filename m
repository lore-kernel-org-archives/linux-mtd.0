Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJXZr-0007Xq-1U
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 01:19:23 +0000
Received: by mail-pa0-f48.google.com with SMTP id ey11so13608073pad.7
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 17:19:01 -0800 (PST)
Date: Thu, 5 Feb 2015 17:18:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jim Kuo <jimtingkuo@gmail.com>
Subject: Re: [PATCH 1/2] m25p80, spi-nor: Update id list of Macronix chips
Message-ID: <20150206011857.GC30781@ld-irv-0074>
References: <1423161845-24282-1-git-send-email-jimtingkuo@gmail.com>
 <1423161845-24282-2-git-send-email-jimtingkuo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423161845-24282-2-git-send-email-jimtingkuo@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ben Hutchings <ben@decadent.org.uk>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 06, 2015 at 02:44:04AM +0800, Jim Kuo wrote:
> Update the Macronix chip IDs. And add two functions to m25p80.c to
> support some undefined read/write actions.
> 
> Signed-off-by: Jim Kuo <jimtingkuo@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c  | 83 ++++++++++++++++++++++++++++++++++++++++---
>  drivers/mtd/spi-nor/spi-nor.c | 44 ++++++++++++++++-------
>  2 files changed, 110 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 85e35467..731f568 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -170,6 +170,74 @@ static int m25p80_erase(struct spi_nor *nor, loff_t offset)
>  	return 0;
>  }
>  
> +static int m25p80_write_xfer(struct spi_nor *nor,
> +		struct spi_nor_xfer_cfg *cfg, u8 *buf, size_t len)
> +{
> +	struct m25p *flash = nor->priv;
> +	struct spi_device *spi = flash->spi;
> +	struct spi_transfer t[2] = {};
> +	struct spi_message m;
> +	unsigned int dummy = cfg->dummy_cycles;
> +	int ret;
> +
> +	dummy /= 8;
> +
> +	if (cfg->wren) {
> +		ret = nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0, 0);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	spi_message_init(&m);
> +
> +	flash->command[0] = cfg->cmd;
> +	m25p_addr2cmd(nor, cfg->addr, flash->command);
> +
> +	t[0].tx_buf = flash->command;
> +	t[0].len = cfg->cmd_pins + cfg->addr_pins + dummy;
> +	spi_message_add_tail(&t[0], &m);
> +
> +	t[1].tx_buf = buf;
> +	t[1].tx_nbits = cfg->mode_pins;
> +	t[1].len = len;
> +	spi_message_add_tail(&t[1], &m);
> +
> +	spi_sync(spi, &m);
> +
> +	return 0;
> +}
> +
> +static int m25p80_read_xfer(struct spi_nor *nor,
> +		struct spi_nor_xfer_cfg *cfg, u8 *buf, size_t len)
> +{
> +	struct m25p *flash = nor->priv;
> +	struct spi_device *spi = flash->spi;
> +	struct spi_transfer t[2];
> +	struct spi_message m;
> +	unsigned int dummy = cfg->dummy_cycles;
> +
> +	dummy /= 8;
> +
> +	spi_message_init(&m);
> +	memset(t, 0, sizeof(t));
> +
> +	flash->command[0] = cfg->cmd;
> +	m25p_addr2cmd(nor, cfg->addr, flash->command);
> +
> +	t[0].tx_buf = flash->command;
> +	t[0].len = cfg->cmd_pins + cfg->addr_pins + dummy;
> +	spi_message_add_tail(&t[0], &m);
> +
> +	t[1].rx_buf = buf;
> +	t[1].rx_nbits = cfg->mode_pins;
> +	t[1].len = len;
> +	spi_message_add_tail(&t[1], &m);
> +
> +	spi_sync(spi, &m);
> +
> +	return 0;
> +}
> +

All of the above is pointless. The write_xfer/read_xfer functions are
not even used. (They should probably just be dropped, since they're
doing nothing as-is.)

>  /*
>   * board specific setup should have ensured the SPI clock used here
>   * matches what the READ command supports, at least until this driver
> @@ -199,6 +267,8 @@ static int m25p_probe(struct spi_device *spi)
>  	nor->erase = m25p80_erase;
>  	nor->write_reg = m25p80_write_reg;
>  	nor->read_reg = m25p80_read_reg;
> +	nor->write_xfer = m25p80_write_xfer;
> +	nor->read_xfer = m25p80_read_xfer;
>  
>  	nor->dev = &spi->dev;
>  	nor->mtd = &flash->mtd;
> @@ -261,10 +331,15 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"mr25h256"},	{"mr25h10"},
>  	{"gd25q32"},	{"gd25q64"},
>  	{"160s33b"},	{"320s33b"},	{"640s33b"},
> -	{"mx25l2005a"},	{"mx25l4005a"},	{"mx25l8005"},	{"mx25l1606e"},
> -	{"mx25l3205d"},	{"mx25l3255e"},	{"mx25l6405d"},	{"mx25l12805d"},
> -	{"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
> -	{"mx66l1g55g"},
> +	{"mx25l512e"},	{"mx25l5121e"},	{"mx25l1006e"},	{"mx25l1021e"},
> +	{"mx25l2006e"},	{"mx25l4006e"},	{"mx25u4035"},	{"mx25v4035"},
> +	{"mx25l8006e"},	{"mx25u8035"},	{"mx25v8035"},	{"mx25l1606e"},
> +	{"mx25l1633e"},	{"mx25l1635e"},	{"mx25u1635e"},	{"mx25l3206e"},
> +	{"mx25l3239e"},	{"mx25l3225d"},	{"mx25l3255e"},	{"mx25l6406e"},
> +	{"mx25l6439e"},	{"mx25l12839f"},	{"mx25l12855e"},
> +	{"mx25u12835f"},	{"mx25l25635e"},	{"mx25l25655e"},
> +	{"mx25u25635f"},	{"mx66l51235f"},	{"mx66u51235f"},
> +	{"mx66l1g45g"},	{"mx66l1g55g"},
>  	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q256a"},
>  	{"n25q512a"},	{"n25q512ax3"},	{"n25q00"},
>  	{"pm25lv512"},	{"pm25lv010"},	{"pm25lq032"},
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 0f8ec3c..a6c7337 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -545,19 +545,37 @@ static const struct spi_device_id spi_nor_ids[] = {
>  	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
>  
>  	/* Macronix */
> -	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },

Nak.

> -	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },

Nak.

> -	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },

Nak.

(you get the picture)

> -	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
> -	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, 0) },
> -	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
> -	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, 0) },
> -	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
> -	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> -	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> -	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
> -	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },

This is a load of junk. You can't just remove table entries that already
have a name entry. It's not my fault that flash vendors continuously
output new flash generations that reuse IDs from the previous. We need
name stability, for anyone who might be using these name strings to bind
to the m25p80 driver.

> +	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,    1, SECT_4K) },
> +	{ "mx25l5121e",  INFO(0xc22210, 0, 64 * 1024,    1, SECT_4K) },
> +	{ "mx25l1006e",  INFO(0xc22011, 0, 64 * 1024,    2, SECT_4K) },
> +	{ "mx25l1021e",  INFO(0xc22211, 0, 64 * 1024,    2, SECT_4K) },
> +	{ "mx25l2006e",  INFO(0xc22012, 0, 64 * 1024,    4, SECT_4K) },
> +	{ "mx25l4006e",  INFO(0xc22013, 0, 64 * 1024,    8, SECT_4K) },
> +	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,    8, SECT_4K) },
> +	{ "mx25v4035",   INFO(0xc22553, 0, 64 * 1024,    8, SECT_4K) },
> +	{ "mx25l8006e",  INFO(0xc22014, 0, 64 * 1024,   16, 0) },
> +	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,   16, 0) },
> +	{ "mx25v8035",   INFO(0xc22554, 0, 64 * 1024,   16, 0) },
> +	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,   32, SECT_4K) },
> +	{ "mx25l1633e",  INFO(0xc22415, 0, 64 * 1024,   32, 0) },
> +	{ "mx25l1635e",  INFO(0xc22515, 0, 64 * 1024,   32, 0) },
> +	{ "mx25u1635e",  INFO(0xc22535, 0, 64 * 1024,   32, 0) },
> +	{ "mx25l3206e",  INFO(0xc22016, 0, 64 * 1024,   64, 0) },
> +	{ "mx25l3239e",  INFO(0xc22536, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
> +	{ "mx25l3225d",  INFO(0xc25e16, 0, 64 * 1024,   64, 0) },
> +	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,   64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx25l6406e",  INFO(0xc22017, 0, 64 * 1024,  128, 0) },
> +	{ "mx25l6439e",  INFO(0xc22537, 0, 64 * 1024,  128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx25l12839f", INFO(0xc22018, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
> +	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024,  256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024,  256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024,  512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024,  512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024,  512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

You need to do a lot better job of documenting your patches (i.e.,
describe why you're doing these things) if you want me to take them.

What's more, the SFDP support you're trying to add should be done in a
way where you *don't* need to muck with the ID table every time. With
SFDP you can get most/all this information anyway, and devices should
just be able to bind to this driver using a generic name like
"spi-nor,sfdp" or something like that, instead of having to expand this
table.

>  
>  	/* Micron */
>  	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, 0) },

Brian
