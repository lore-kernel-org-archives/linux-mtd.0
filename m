Date: Wed, 26 Sep 2018 16:52:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Tony
 Lindgren <tony@atomide.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Paul Burton <paul.burton@mips.com>, Wolfram
 Sang <wsa@the-dreams.de>, Suman Anna <s-anna@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] ARM: omap1: add nand_chip declaration
Message-ID: <20180926165240.77a78fc4@xps13>
In-Reply-To: <20180926142029.619397-1-arnd@arndb.de>
References: <20180926142029.619397-1-arnd@arndb.de>
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

Hi Arnd,

Arnd Bergmann <arnd@arndb.de> wrote on Wed, 26 Sep 2018 16:20:16 +0200:

> Recent MTD changes caused a minor build regression on OMAP1:
>=20
> In file included from arch/arm/mach-omap1/devices.c:31:
> arch/arm/mach-omap1/common.h:85:39: error: 'struct nand_chip' declared in=
side parameter list will not be visible outside of this definition or decla=
ration [-Werror]
>=20
> Fixes: 1002aed789bc ("mtd: rawnand: plat_nand: Pass a nand_chip object to=
 all platform_nand_ctrl hooks")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ----
> v2: remove unused linux/mtd/mtd.h inclusion
> ---
>  arch/arm/mach-omap1/common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
> index 11b87a4c84d4..504b959ba5cf 100644
> --- a/arch/arm/mach-omap1/common.h
> +++ b/arch/arm/mach-omap1/common.h
> @@ -26,7 +26,6 @@
>  #ifndef __ARCH_ARM_MACH_OMAP1_COMMON_H
>  #define __ARCH_ARM_MACH_OMAP1_COMMON_H
> =20
> -#include <linux/mtd/mtd.h>
>  #include <linux/platform_data/i2c-omap.h>
>  #include <linux/reboot.h>
> =20
> @@ -82,6 +81,7 @@ void omap1_restart(enum reboot_mode, const char *);
> =20
>  extern void __init omap_check_revision(void);
> =20
> +struct nand_chip;
>  extern void omap1_nand_cmd_ctl(struct nand_chip *this, int cmd,
>  			       unsigned int ctrl);
> =20

Boris pointed me that the commit introducing the regression is still
in nand/next, so do you mind if I squash both patches with it?

Regards,
Miqu=C3=A8l
