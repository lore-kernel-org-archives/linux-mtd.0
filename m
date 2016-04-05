Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anVVD-0005qF-Oo
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2016 18:15:00 +0000
Received: by mail-pa0-x236.google.com with SMTP id td3so15283998pab.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Apr 2016 11:14:38 -0700 (PDT)
Date: Tue, 5 Apr 2016 11:14:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vignesh R <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [RESEND][PATCH] mtd: devices: m25p80: add support for mmap read
 request
Message-ID: <20160405181427.GA5561@localhost>
References: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Mark, Cyrille

On Tue, Mar 29, 2016 at 11:16:17AM +0530, Vignesh R wrote:
> Certain SPI controllers may provide accelerated hardware interface to
> read from m25p80 type flash devices in order to provide better read
> performance. SPI core supports such devices with spi_flash_read() API.
> Call spi_flash_read(), if supported, to make use of such interface.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---

Applied, with a small diff.

> Resend v5:
> Rebased on top of v4.6-rc1
> v5: http://www.spinics.net/lists/devicetree/msg106696.html
> 
>  drivers/mtd/devices/m25p80.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index c9c3b7fa3051..7730e633d7d3 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -131,6 +131,26 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>  	/* convert the dummy cycles to the number of bytes */
>  	dummy /= 8;
>  
> +	if (spi_flash_read_supported(spi)) {
> +		struct spi_flash_read_message msg;
> +		int ret;
> +

I added a memset(&msg, 0, sizeof(msg)), since spi_flash_read() doesn't
guarantee msg.retlen is zeroed for failures. Do we want a
spi_flash_read_message_init() function, to mirror spi_message_init()?

> +		msg.buf = buf;
> +		msg.from = from;
> +		msg.len = len;
> +		msg.read_opcode = nor->read_opcode;
> +		msg.addr_width = nor->addr_width;
> +		msg.dummy_bytes = dummy;
> +		/* TODO: Support other combinations */

Speaking of "other combinations": does the TI QSPI controller support
MMAP'ed read modes other than 1/1/{1,2,4}? It doesn't seem to implement
support, and the SPI core doesn't handle this. So if we merge any of
Cyrille's work on other modes, then this is going to break quickly.

> +		msg.opcode_nbits = SPI_NBITS_SINGLE;
> +		msg.addr_nbits = SPI_NBITS_SINGLE;
> +		msg.data_nbits = m25p80_rx_nbits(nor);
> +
> +		ret = spi_flash_read(spi, &msg);
> +		*retlen = msg.retlen;
> +		return ret;
> +	}
> +
>  	spi_message_init(&m);
>  	memset(t, 0, (sizeof t));
>  

Brian
