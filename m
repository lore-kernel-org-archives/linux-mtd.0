Date: Wed, 26 Sep 2018 15:23:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Tony
 Lindgren <tony@atomide.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: omap1: add nand_chip declaration
Message-ID: <20180926152340.332b36e4@xps13>
In-Reply-To: <20180926130458.2406549-1-arnd@arndb.de>
References: <20180926130458.2406549-1-arnd@arndb.de>
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

Thanks for the fix, sorry for breaking the build.

Arnd Bergmann <arnd@arndb.de> wrote on Wed, 26 Sep 2018 15:04:38 +0200:

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
> ---
>  arch/arm/mach-omap1/common.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
> index 11b87a4c84d4..82f2c065040a 100644
> --- a/arch/arm/mach-omap1/common.h
> +++ b/arch/arm/mach-omap1/common.h
> @@ -82,6 +82,7 @@ void omap1_restart(enum reboot_mode, const char *);
> =20
>  extern void __init omap_check_revision(void);
> =20
> +struct nand_chip;
>  extern void omap1_nand_cmd_ctl(struct nand_chip *this, int cmd,
>  			       unsigned int ctrl);
> =20

Currently I see "#include <linux/mtd/mtd.h>" at the top of this file.
That's where the "struct mtd_info" that has been replaced by a "struct
nand_chip" was declared. The nand_chip object is declared in
<linux/mtd/rawnand.h>.

I think you can remove this include (unneeded anymore for what I see).
Then, either you keep the nand_chip forward declaration, or replace the
mtd.h include into the rawnand.h one?


Thanks,
Miqu=C3=A8l
