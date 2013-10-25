Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZfXI-0001yo-Go
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 11:26:37 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option dependency
Date: Fri, 25 Oct 2013 11:26:06 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2AE93@DBDE04.ent.ti.com>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382696277-9063-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382696277-9063-4-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "marek.belisko@gmail.com" <marek.belisko@gmail.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Ezequiel Garcia [mailto:ezequiel.garcia@free-electrons.com]
> Subject: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option
> dependency
>=20
> This option does not need to depend in MTD_NAND, for it's enclosed
> under it. Also, it's wrong to make it depend in ARCH_OMAP3 only
> since the controller is used in a wider range of SoCs.
>=20
> Instead, just leave the dependency on the OMAP2 driver option.
>=20
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/nand/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index d885298..8187466 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -95,7 +95,7 @@ config MTD_NAND_OMAP2
>  	  platforms.
>=20
>  config MTD_NAND_OMAP_BCH
> -	depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3
> +	depends on MTD_NAND_OMAP2
>  	tristate "Enable support for hardware BCH error correction"
>  	default n
>  	select BCH
> --
> 1.8.1.5

Acked-by: Pekon Gupta <pekon@ti.com>
Reported-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

with regards, pekon
