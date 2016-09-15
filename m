Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkZ12-0003Ab-QG
 for linux-mtd@lists.infradead.org; Thu, 15 Sep 2016 15:56:00 +0000
Received: by mail-qk0-x234.google.com with SMTP id w204so57911224qka.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Sep 2016 08:55:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160915154139.3003332-1-arnd@arndb.de>
References: <20160915154139.3003332-1-arnd@arndb.de>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 15 Sep 2016 12:55:34 -0300
Message-ID: <CAAEAJfBuPRqudNdDv_BWcDi7vtDFWM4L4NzGJkPtLss_BtUTzg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: don't include linux/mtd/cfi.h from header
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 September 2016 at 12:41, Arnd Bergmann <arnd@arndb.de> wrote:
> The newly added broadcom qspi driver in drivers/spi produces a build
> warning when CONFIG_MTD is disabled:
>
> include/linux/mtd/cfi.h:76:2: #warning No CONFIG_MTD_CFI_Ix selected. No =
NOR chip support can work. [-Werror=3Dcpp]
>
> Since drivers like this one don't actually need the cfi.h header,
> we can just remove it from the spi-nor.h file and add it to
> the only place that actually needs it.
>

AFAICS, the mtd/cfi.h header is needed only for CFI_MFR_xxx,
which are defined in the spi-nor.h header.

Maybe we are better moving those to spi-nor.c as well.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: fa236a7ef240 ("spi: bcm-qspi: Add Broadcom MSPI driver")
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  include/linux/mtd/spi-nor.h   | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.=
c
> index d0fc165d7d66..94afcb9fdaf7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -21,6 +21,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/of_platform.h>
>  #include <linux/spi/flash.h>
> +#include <linux/mtd/cfi.h>
>  #include <linux/mtd/spi-nor.h>
>
>  /* Define max times to check status register before we give up. */
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index c425c7b4c2a0..60ef29565743 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -11,7 +11,6 @@
>  #define __LINUX_MTD_SPI_NOR_H
>
>  #include <linux/bitops.h>
> -#include <linux/mtd/cfi.h>
>  #include <linux/mtd/mtd.h>
>
>  /*
> --
> 2.9.0
>



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
