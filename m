Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5dU1-0001Ko-Qy
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 15:43:23 +0000
From: Marek Vasut <marex@denx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/4] mtd: m25p80: Set rx_nbits for Quad SPI transfers
Date: Tue, 21 Jan 2014 16:18:44 +0100
References: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
 <1390309159-19643-3-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1390309159-19643-3-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201401211618.44103.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, January 21, 2014 at 01:59:17 PM, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> 
> When using the Quad Read opcode, SPI masters still use Single SPI
> transfers, as spi_transfer.rx_nbits defaults to SPI_NBITS_SINGLE.
> Use SPI_NBITS_QUAD to fix this.
> 
> While an earlier version of commit 3487a63955c34ea508bcf4ca5131ddd953876e2d
> ("drivers: mtd: m25p80: add quad read support") did this correctly, it was
> forgotten in the version that got merged.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> ---
>  drivers/mtd/devices/m25p80.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 320c6a308630..ad1913909702 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -489,6 +489,16 @@ static inline int m25p80_dummy_cycles_read(struct m25p
> *flash) }
>  }
> 
> +static inline unsigned int m25p80_rx_nbits(const struct m25p *flash)
> +{
> +	switch (flash->flash_read) {
> +	case M25P80_QUAD:
> +		return 4;
> +	default:
> +		return 0;
> +	}
> +}
> +
>  /*
>   * Read an address range from the flash chip.  The address range
>   * may be any size provided it is within the physical boundaries.
> @@ -519,6 +529,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t
> from, size_t len, spi_message_add_tail(&t[0], &m);
> 
>  	t[1].rx_buf = buf;
> +	t[1].rx_nbits = m25p80_rx_nbits(flash);
>  	t[1].len = len;
>  	spi_message_add_tail(&t[1], &m);

Indeed.

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
