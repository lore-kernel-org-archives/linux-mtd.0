From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MTD/GPMI : select more modules for GPMI by default
Date: Sat, 31 Dec 2011 08:01:38 +0100
References: <1325220337-23165-1-git-send-email-b32955@freescale.com>
 <20111231054432.GE12182@S2100-06.ap.freescale.net>
 <4EFEA210.30606@freescale.com>
In-Reply-To: <4EFEA210.30606@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201112310801.39019.marek.vasut@gmail.com>
Cc: shijie8@gmail.com, Huang Shijie <b32955@freescale.com>,
 Artem.Bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> =E4=BA=8E 2011=E5=B9=B412=E6=9C=8831=E6=97=A5 13:44, Shawn Guo =E5=86=99=
=E9=81=93:
> > On Fri, Dec 30, 2011 at 12:45:37PM +0800, Huang Shijie wrote:
> >> The gpmi-nand driver needs the mxs-dma driver. So select the
> >> MXS_DMA by default. So does the MTD_CHAR.
> >>=20
> >> Signed-off-by: Huang Shijie<b32955@freescale.com>
> >> ---
> >>=20
> >>   drivers/mtd/nand/Kconfig |    2 ++
> >>   1 files changed, 2 insertions(+), 0 deletions(-)
> >>=20
> >> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >> index 07c4774..1b14a3a 100644
> >> --- a/drivers/mtd/nand/Kconfig
> >> +++ b/drivers/mtd/nand/Kconfig
> >> @@ -420,6 +420,8 @@ config MTD_NAND_NANDSIM
> >>=20
> >>   config MTD_NAND_GPMI_NAND
> >>  =20
> >>           bool "GPMI NAND Flash Controller driver"
> >>           depends on MTD_NAND&&  (SOC_IMX23 || SOC_IMX28)
> >>=20
> >> +	select MXS_DMA
> >=20
> > We should probably have it depend on MXS_DMA rather than select it.
>=20
> IMHO, I think `select` is better. :)
> The MXS_DMA not only service for NAND, but SD card, etc.
> In logic, the GPMI does not depends on MXS_DMA, the GPMI may use SDMA
> too(just in logically).

And does it use that ? Technically, it's still dependent on MXS_DMA, right =
?=20
Also, why select mtd_char, it's totally unrelated.

M
>=20
>=20
> Best Regards
> Huang Shijie
>=20
> > Regards,
> > Shawn
> >=20
> >> +	select MTD_CHAR
> >>=20
> >>   	select MTD_PARTITIONS
> >>   	select MTD_CMDLINE_PARTS
> >>   =09
> >>           help
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
