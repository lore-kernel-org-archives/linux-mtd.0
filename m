Subject: Re: [PATCH] SST25L (non JEDEC) SPI Flash driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ryan Mallon <ryan@bluewatersys.com>
In-Reply-To: <4A3F017B.2010409@bluewatersys.com>
References: <4A3F017B.2010409@bluewatersys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2009 11:15:10 +0300
Message-Id: <1245658510.9487.32.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux kernel <linux-kernel@vger.kernel.org>,
	mike@steroidmicros.com, spi-devel-general@lists.sourceforge.net
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-22 at 15:58 +1200, Ryan Mallon wrote:
> Add support for the non JEDEC SST25L SPI Flash devices.
> 
> Signed-off-by: Andre Renaud <andre@bluewatersys.com>
> Signed-off-by: Ryan Mallon <ryan@bluewatersys.com>
> ---
> 
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 325fab9..c222514 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -104,6 +104,16 @@ config M25PXX_USE_FAST_READ
>  	help
>  	  This option enables FAST_READ access supported by ST M25Pxx.

Would it please be possible to get rid of this warning:

  CC [M]  drivers/mtd/devices/sst25l.o
drivers/mtd/devices/sst25l.c: In function ‘sst25l_write’:
drivers/mtd/devices/sst25l.c:306: warning: comparison of distinct pointer types lacks a cast

I see it on my x86_64.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
