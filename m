Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqJJk-000811-4R
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 11:50:44 +0000
Date: Wed, 13 Apr 2016 13:50:22 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] mtd: nand: omap2: allow compiling with COMPILE_TEST
Message-ID: <20160413135022.669c883f@bbrezillon>
In-Reply-To: <1460546045-31553-1-git-send-email-zajec5@gmail.com>
References: <1460546045-31553-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
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

On Wed, 13 Apr 2016 13:14:05 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> This driver doesn't seem to have any compile-time arch dependencies. I
> was able to compile it on CONFIG_MIPS, CONFIG_ARM and CONFIG_X86_64.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index f05e0e9..6a9c917 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -89,7 +89,8 @@ config MTD_NAND_AMS_DELTA
> =20
>  config MTD_NAND_OMAP2
>  	tristate "NAND Flash device on OMAP2, OMAP3 and OMAP4"
> -	depends on ARCH_OMAP2PLUS
> +	depends on ARCH_OMAP2PLUS || COMPILE_TEST

Is it working when HAS_DMA is not set?

> +	depends on OF
>  	help
>            Support for NAND flash on Texas Instruments OMAP2, OMAP3 and O=
MAP4
>  	  platforms.



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
