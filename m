Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN4PS-0000ls-US
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 15:45:39 +0000
Received: by lagy4 with SMTP id y4so230702lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 08:45:37 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 25 Apr 2012 18:45:21 +0300
In-Reply-To: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tZHT0oqBdOLFOuYhW5z6"
Message-ID: <1335368735.6356.17.camel@koala>
Mime-Version: 1.0
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Lei Wen <leiwen@marvell.com>,
 Jamie Iles <jamie@jamieiles.com>, prabhakar@freescale.com,
 Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@gmail.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tZHT0oqBdOLFOuYhW5z6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-23 at 13:14 -0700, Brian Norris wrote:
> Artem: can you perform your regular compile tests? I compile-tested as ma=
ny as
> I could.

Here is what Aiaiai says when I test your patch-set. Note, the mackrell
failure is not your fault - is does not compile anymore and I did not
have time to look at it. But you broke the mxs build.

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_i386_defconfig,i386"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_i386_defconfig,i386", no issues

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_generic_defconfig,ia64,ia6=
4-linux-"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_generic_defconfig,ia64,ia64-linux-", n=
o issues

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_ppc6xx_defconfig,powerpc,p=
owerpc-linux-"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_ppc6xx_defconfig,powerpc,powerpc-linux=
-", no issues

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_omap2plus_defconfig,arm,ar=
m-unknown-linux-gnueabi-"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_omap2plus_defconfig,arm,arm-unknown-li=
nux-gnueabi-", no issues

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_at91cap9_defconfig,arm,arm=
-unknown-linux-gnueabi-"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_at91cap9_defconfig,arm,arm-unknown-lin=
ux-gnueabi-", no issues

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_imx_v6_v7_defconfig,arm,ar=
m-unknown-linux-gnueabi-"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_imx_v6_v7_defconfig,arm,arm-unknown-li=
nux-gnueabi-", no issues

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "l2_mxs_defconfig" (=
architecture arm)":

d8d1be5 mtd: nand: nand_base - pass proper 'use_oob' parameter

drivers/mtd/lpddr/lpddr_cmds.c:751:5: warning: no previous prototype for 'w=
ord_program' [-Wmissing-prototypes]
In file included from include/linux/kernel.h:19:0,
                 from include/linux/clk.h:15,
                 from drivers/mtd/nand/gpmi-nand/gpmi-nand.c:21:
include/linux/bitops.h: In function 'hweight_long':
include/linux/bitops.h:66:26: warning: signed and unsigned type in conditio=
nal expression [-Wsign-compare]
In file included from include/linux/dma-mapping.h:73:0,
                 from drivers/mtd/nand/gpmi-nand/gpmi-nand.h:22,
                 from drivers/mtd/nand/gpmi-nand/gpmi-nand.c:27:
arch/arm/include/asm/dma-mapping.h: In function 'dma_mapping_error':
arch/arm/include/asm/dma-mapping.h:126:18: warning: comparison between sign=
ed and unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'release_bch_irq':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:381:11: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'gpmi_dma_filter':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:400:15: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:400:49: warning: comparison between =
signed and unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'mx23_check_transcripti=
on_stamp':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1194:9: warning: variable 'byte' set=
 but not used [-Wunused-but-set-variable]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'mx23_write_transcripti=
on_stamp':
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1311:3: error: too few arguments to =
function 'chip->ecc.write_page_raw'
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1255:15: warning: variable 'byte' se=
t but not used [-Wunused-but-set-variable]
drivers/mtd/nand/gpmi-nand/gpmi-nand.c: At top level:
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1456:6: warning: no previous prototy=
pe for 'gpmi_nfc_exit' [-Wmissing-prototypes]
make[5]: *** [drivers/mtd/nand/gpmi-nand/gpmi-nand.o] Error 1

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_lantiq_defconfig,mips,mips=
-linux-"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_lantiq_defconfig,mips,mips-linux-", no=
 issues

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "l2_mackerel_defconf=
ig" (architecture arm)":

54043ff MIPS: Kbuild: remove -Werror

In file included from include/linux/kernel.h:19:0,
                 from include/linux/cache.h:4,
                 from include/linux/time.h:7,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from drivers/mtd/nand/sh_flctl.c:24:
include/linux/bitops.h: In function 'hweight_long':
include/linux/bitops.h:66:26: warning: signed and unsigned type in conditio=
nal expression [-Wsign-compare]
drivers/mtd/nand/sh_flctl.c: In function 'set_addr':
drivers/mtd/nand/sh_flctl.c:117:25: warning: comparison between signed and =
unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/sh_flctl.c: In function 'flctl_cmdfunc':
drivers/mtd/nand/sh_flctl.c:611:15: warning: comparison between signed and =
unsigned integer expressions [-Wsign-compare]
drivers/mtd/nand/sh_flctl.c:638:28: warning: comparison between signed and =
unsigned integer expressions [-Wsign-compare]
In file included from include/linux/kernel.h:19:0,
                 from include/linux/cache.h:4,
                 from include/linux/time.h:7,
                 from include/linux/stat.h:60,
                 from include/linux/module.h:10,
                 from init/version.c:10:
include/linux/bitops.h: In function 'hweight_long':
include/linux/bitops.h:66:26: warning: signed and unsigned type in conditio=
nal expression [-Wsign-compare]
arch/arm/mach-shmobile/built-in.o: In function `mackerel_sdhi0_gpio_cd':
pfc-sh7372.c:(.text+0x33ec): undefined reference to `mmc_detect_change'
make[1]: *** [.tmp_vmlinux1] Error 1

---------------------------------------------------------------------------=
-----

Bisectability test results for configuration "l2_u300_defconfig,arm,arm-unk=
nown-linux-gnueabi-"

Bisecability test passed

---------------------------------------------------------------------------=
-----

Successfully built configuration "l2_u300_defconfig,arm,arm-unknown-linux-g=
nueabi-", no issues

---------------------------------------------------------------------------=
-----

--=20
Best Regards,
Artem Bityutskiy


--=-tZHT0oqBdOLFOuYhW5z6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmBwUAAoJEJtuLFy+q7feBq8H/jfzGRdWWUdpkLc0PEhYOJxe
XZjHG+7wPEwn0mcJ52YC50cb0eHlC5atvY8GrG51wNQGv6KxMoS5MsUwTdKOdGCF
eRWOfiMvYCOtNRP/4020rrp/8bHtQ3+X50ZBwK560VAEh7VPWPKEfLZ1YtAK1efg
AQR8M/qyKmT/aLKHZee/VwyM2F3dzqfX3Eqt2suWbRye+3qeh24TrSn4igX35owQ
edvFmxtb4EKZjqJDE1vcezA4fIqf1h+bSXl4J4qSqUYItOgJ5bQp3dS9xG9owMv/
UPOLC5P7yljpooBqx8tiQKUus8T9l9KTZR/QeCTT1W0FFwHvzg7r3QImA2fbH5o=
=2FhQ
-----END PGP SIGNATURE-----

--=-tZHT0oqBdOLFOuYhW5z6--
