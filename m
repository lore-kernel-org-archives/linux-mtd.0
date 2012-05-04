Message-ID: <1336127859.4275.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: add device tree support to gpmi-nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 04 May 2012 13:37:39 +0300
In-Reply-To: <4FA3AEDF.8010009@freescale.com>
References: <1336101182-5200-1-git-send-email-b32955@freescale.com>
 <1336124510.4275.7.camel@sauron.fi.intel.com>
 <4FA3AEDF.8010009@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wwc97GT/seh1QKCF+T/h"
Mime-Version: 1.0
Cc: shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wwc97GT/seh1QKCF+T/h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-04 at 18:26 +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B405=E6=9C=8804=E6=97=A5 17:41, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> > On Fri, 2012-05-04 at 11:13 +0800, Huang Shijie wrote:
> >> This patch just adds the DT support to gpmi-nand.
> >>
> >> Signed-off-by: Huang Shijie<b32955@freescale.com>
> >> ---
> >> Please select the CONFIG_USE_OF before you do the compiler-test.
> >> thanks.
> > It should compile without CONFIG_USE_OF also just fine. Currently it
> > does not.
> >
> why not select CONFIG_USE_OF as the gpmi-nand is converted to a DT driver=
.

Yes, it can be done as well. My point is that you should not break
compilation. These 2 patches do not compile with for me - aiaiai
reports:

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "l2_mxs_defconfig" (=
architecture arm)":

d791f1c mtd: gpmi: add gpmi support for mx6q

drivers/mtd/nand/gpmi-nand/gpmi-lib.c:437:36: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/gpmi-nand/gpmi-lib.c:579:35: warning: comparison between s=
igned and unsigned integer expressions [-Wsign-compare]
In file included from include/linux/kernel.h:19:0,
                 from include/linux/clk.h:15,
                 from drivers/mtd/nand/gpmi-nand/gpmi-nand.c:21:
include/linux/bitops.h: In function 'hweight_long':
include/linux/bitops.h:66:26: warning: signed and unsigned type in conditio=
nal expression [-Wsign-compare]
In file included from include/linux/dma-mapping.h:73:0,
                 from drivers/mtd/nand/gpmi-nand/gpmi-nand.h:22,
                 from drivers/mtd/nand/gpmi-nand/gpmi-nand.c:28:
arch/arm/include/asm/dma-mapping.h: In function 'dma_mapping_error':
arch/arm/include/asm/dma-mapping.h:126:18: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'release_bch_irq':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:382:11: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'acquire_dma_channels':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:430:2: error: implicit declaration o=
f function 'of_property_read_u32' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'mx23_check_transcripti=
on_stamp':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1186:9: warning: variable 'byte' set=
 but not used [-Wunused-but-set-variable]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'mx23_write_transcripti=
on_stamp':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1247:15: warning: variable 'byte' se=
t but not used [-Wunused-but-set-variable]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1448:6: warning: no previous prototy=
pe for 'gpmi_nfc_exit' [-Wmissing-prototypes]
cc1: some warnings being treated as errors
make[5]: *** [drivers/mtd/nand/gpmi-nand/gpmi-nand.o] Error 1

---------------------------------------------------------------------------=
-----


--=20
Best Regards,
Artem Bityutskiy

--=-wwc97GT/seh1QKCF+T/h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPo7FzAAoJECmIfjd9wqK0zwMP/1UkLDfjQxN5mAB4P/J6lD5X
oRxnAcTnyinSZnxosAQFMSfFT3IsUaGcyEqFc8uxOEUMXEZUU/N1+NqpoJYFCzrb
IR09wgA8N4432VHt9G8fs+T/WsJYBn/sCtEctJvrKx77hmbalRnaXX650MJXp4Cj
w5ifM76QpRqCU9c0I4LOMZkdvJQoSiw2vVNiLa448yHb/qDOPO7aUlZG997JdU3S
GrJCY3VzQXK17xOIhL2hu/v+Jfo8ADiCW9SyqJWGgObNAz4pB8H+YGZpCvW+bION
Pkl4ZBoFuoSipSj1vTBtp0UdezXVCzd8KN+A7XfzLzCcQZzkCEaltzfJhwseCG3L
GPQmajWyIhPj089N3yNOssJQLHrEG3paXzqUKcFad0f9dLk070qZxQxRW4CKD6tj
xA5ONAcI1dcOHTPFcJd8PaTxcr3QFK1wjrlN7NFnqTk9kltTKkxyc931v7oX8jmO
Su4cYVsUNks2HYbUTTkDrlTVDUzgQv6KjE1WujXPA8lNeZKrAnexjys2SxueeCIW
9SQVNntr5RYN2jWPxK/WTZ38J0eLe0HqALdUt8/f2637drvVSH6eaz+mlUmfFszY
AX+2VOewfhnF/v1q1Blj0CPtvGmwMRSc30VCxfKhDuKwwtKNH9omz+z5ikZilL8s
pJr1z6ftmJUjCJwpPq21
=a/yf
-----END PGP SIGNATURE-----

--=-wwc97GT/seh1QKCF+T/h--
