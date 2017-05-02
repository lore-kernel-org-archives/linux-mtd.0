Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5cn8-0000NN-So
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 18:44:56 +0000
Date: Tue, 2 May 2017 20:44:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH 1/2] mtd: nand: Add Hisilicon machine dependency
Message-ID: <20170502204433.7aebb5ca@bbrezillon>
In-Reply-To: <20170502174843.6877-2-ezequiel@vanguardiasur.com.ar>
References: <20170502174843.6877-1-ezequiel@vanguardiasur.com.ar>
 <20170502174843.6877-2-ezequiel@vanguardiasur.com.ar>
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

On Tue,  2 May 2017 14:48:42 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> The Hisilicon NAND driver is only needed for a specific
> platform, so avoid cluttering the configuration.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index c3029528063b..04f4a556bc93 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -542,6 +542,7 @@ config MTD_NAND_SUNXI
> =20
>  config MTD_NAND_HISI504
>  	tristate "Support for NAND controller on Hisilicon SoC Hip04"
> +	depends on ARCH_HISI

			     ||=C2=A0COMPILE_TEST

so that we can still compile test the driver easily.

Same goes for patch 2.

>  	depends on HAS_DMA
>  	help
>  	  Enables support for NAND controller on Hisilicon SoC Hip04.
