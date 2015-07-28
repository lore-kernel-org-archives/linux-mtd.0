Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK9Pb-0006kV-7O
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 18:15:35 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: rework spi nor read and write.
Date: Tue, 28 Jul 2015 20:15:10 +0200
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 " =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?=" <zajec5@gmail.com>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Gabor Juhos <juhosg@openwrt.org>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= \(beanhuo\)" <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1438074682.git.hramrach@gmail.com>
 <79b4c3521cdb13872c7cf939ea25219399c1a345.1438074682.git.hramrach@gmail.com>
In-Reply-To: <79b4c3521cdb13872c7cf939ea25219399c1a345.1438074682.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507282015.10775.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, July 28, 2015 at 11:23:02 AM, Michal Suchanek wrote:
> The spi_nor read and write functions pass thru the mtd retlen to the
> chip-specific read and write function. This makes it difficult to check
> for errors in read and write functions and these errors are not checked.
> This leads to silent data corruption.
> 
> This patch styles the chip-specific read and write function as unix
> read(2) and write(2) and updates the retlen in the spi-nor generic driver.
> 
> This also makes it possible to check for write errors.
> When pl330 fails to transfer the flash data over SPI I get I/O error
> instead of 4M of zeroes.
> 
> I do not have sst and fsl hardware to test with.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c      | 33 ++++++++++++++---------
>  drivers/mtd/spi-nor/fsl-quadspi.c | 29 ++++++++++----------
>  drivers/mtd/spi-nor/spi-nor.c     | 57
> ++++++++++++++++++++++++++++----------- include/linux/mtd/spi-nor.h      
> |  8 +++---
>  4 files changed, 81 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index d313f948b..d8f064b 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -75,14 +75,15 @@ static int m25p80_write_reg(struct spi_nor *nor, u8
> opcode, u8 *buf, int len, return spi_write(spi, flash->command, len + 1);
>  }
> 
> -static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
> -			size_t *retlen, const u_char *buf)
> +static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
> +			    const u_char *buf)
>  {
>  	struct m25p *flash = nor->priv;
>  	struct spi_device *spi = flash->spi;
>  	struct spi_transfer t[2] = {};
>  	struct spi_message m;
>  	int cmd_sz = m25p_cmdsz(nor);
> +	ssize_t ret;
> 
>  	spi_message_init(&m);
> 
> @@ -100,9 +101,14 @@ static void m25p80_write(struct spi_nor *nor, loff_t
> to, size_t len, t[1].len = len;
>  	spi_message_add_tail(&t[1], &m);
> 
> -	spi_sync(spi, &m);
> +	ret = spi_sync(spi, &m);
> +	if (ret)
> +		return ret;
> 
> -	*retlen += m.actual_length - cmd_sz;
> +	ret = m.actual_length - cmd_sz;
> +	if (ret < 0)
> +		return -EIO;
> +	return ret;

I'd prefer to just add the return value and keep the retlen to keep error
codes and transfer length separate.

btw. you change the transfer length from unsigned to signed type -- long
transfer might get interpreted as an error.

[...]
