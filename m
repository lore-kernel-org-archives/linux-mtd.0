Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcd38-0007f7-Lh
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 19:41:53 +0000
Subject: Re: [PATCH] [RFC] mtd: atmel-quadspi: fix build issues
To: Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Ludovic Barre <ludovic.barre@st.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170721222204.3402340-1-arnd@arndb.de>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <fa857ef2-0ae6-5383-c178-3a86fa557332@wedev4u.fr>
Date: Tue, 1 Aug 2017 21:41:23 +0200
MIME-Version: 1.0
In-Reply-To: <20170721222204.3402340-1-arnd@arndb.de>
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

Hi Arnd,

Le 22/07/2017 à 00:21, Arnd Bergmann a écrit :
> I ran into a link-time error with the atmel-quadspi driver on the
> EBSA110 platform:
> 
> drivers/mtd/built-in.o: In function `atmel_qspi_run_command':
> :(.text+0x1ee3c): undefined reference to `_memcpy_toio'
> :(.text+0x1ee48): undefined reference to `_memcpy_fromio'
> 
> The problem is that _memcpy_toio/_memcpy_fromio are not available
> on that platform, and we have to prevent building the driver there.
> 
> A related problem is that the functions are not portable APIs
> and should not be called directly from a device driver. On
> little-endian machines, the regular memcpy_toio/memcpy_fromio
> functions are defined as optimized versions using multi-byte
> transfers that are much faster.
> 
> Cyrille mentioned that initially using memcpy_toio/memcpy_fromio
> did not work, but I suspect that this was the result of a bug
> that has since been fixed. With that change, we can also
> compile-test on other architectures.
> 
> Link: http://lists.infradead.org/pipermail/linux-mtd/2016-July/068583.html
> Fixes: 161aaab8a067 ("mtd: atmel-quadspi: add driver for Atmel QSPI controller")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mtd/spi-nor/Kconfig         | 2 +-
>  drivers/mtd/spi-nor/atmel-quadspi.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 293c8a4d1e49..22e5fc4080f8 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -41,7 +41,7 @@ config SPI_ASPEED_SMC
>  
>  config SPI_ATMEL_QUADSPI
>  	tristate "Atmel Quad SPI Controller"
> -	depends on ARCH_AT91 || (ARM && COMPILE_TEST)
> +	depends on ARCH_AT91 || (COMPILE_TEST && !ARCH_EBSA110)
>  	depends on OF && HAS_IOMEM
>  	help
>  	  This enables support for the Quad SPI controller in master mode.
> diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
> index ba76fa8f2031..ff3849106e77 100644
> --- a/drivers/mtd/spi-nor/atmel-quadspi.c
> +++ b/drivers/mtd/spi-nor/atmel-quadspi.c
> @@ -208,9 +208,9 @@ static int atmel_qspi_run_transfer(struct atmel_qspi *aq,
>  	if (cmd->enable.bits.address)
>  		ahb_mem += cmd->address;
>  	if (cmd->tx_buf)
> -		_memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
> +		memcpy_toio(ahb_mem, cmd->tx_buf, cmd->buf_len);
>  	else
> -		_memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
> +		memcpy_fromio(cmd->rx_buf, ahb_mem, cmd->buf_len);
>

At least on AT91 platforms and likely on most ARM boards,
memcpy_fromio == memcpy_toio == memcpy.

I got some sama5d2 hardware last week, so I'll try to test your patch
within few days because as you said maybe memcpy() was broken when I
developed this driver at first but now memcpy() is likely to have been
fixed so it might be interesting to get rid of _memcpy_fromio() and
_memcpy_toio() because this is not the first time those 2 functions have
created issues when building the Atmel Quad SPI driver on other platforms.

So thanks for you're patch, I'll give it a try :)

Best regards,

Cyrille


>  	return 0;
>  }
> 
