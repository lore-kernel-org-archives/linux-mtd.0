Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W04od-0002Pw-Jz
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2014 07:41:41 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Enric Balletbo Serra <eballetbo@iseebcn.com>, Stefan Roese <sr@denx.de>,
 Javier Martinez Canillas <javier@dowhile0.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Igor Grinberg
 <grinberg@compulab.co.il>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, "jp.francois@cynove.com"
 <jp.francois@cynove.com>, "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>
Subject: RE: [PATCH v1 0/2] mtd: nand: omap: booting from NAND using u-boot
Date: Mon, 6 Jan 2014 07:40:42 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA5E07C@DBDE04.ent.ti.com>
References: <1386925978-23705-1-git-send-email-pekon@ti.com>
In-Reply-To: <1386925978-23705-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Woodruff, Richard" <r-woodruff2@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, "Rini, Tom" <trini@ti.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "r.meier@siemens.com" <r.meier@siemens.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Balbi,
 Felipe" <balbi@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, linux-omap <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Enric, Nikita, and other OMAP3 users,

>
>As there were parallel set of patches running between u-boot and kernel.
>hence, some patch-sets caused regression for OMAP3x platforms when booting
>using u-boot specifically for ecc-schemes (like BCH4_SW).
>
>Hence this patch series fixes those regressions, and tests complete
>NAND boot sequence for multiple ecc-schemes on AM335x-EVM board.
>(following configurations are required for building u-boot driver which is
> compatible to kernel ecclayout for selected ecc-scheme)
>
>
>    (BCH8_HW)      (HAM1_HW)         (HAM1_HW)         (HAM1_HW)  (UBIFS)
>ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-Sys=
tem
>
>    (BCH8_HW)      (BCH8_SW)         (BCH8_SW)         (BCH8_SW)  (UBIFS)
>ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-Sys=
tem
>
>    (BCH8_HW)      (BCH8_HW)         (BCH8_HW)         (BCH8_HW)  (UBIFS)
>ROM ---------> SPL ---------> U-Boot ---------> Kernel ---------> File-Sys=
tem
>
>*Configurations used to build u-boot and kernel for end-to-end NAND boot*
>+------------+--------------------------------------------+---------------=
---+
>| ecc-scheme |  u-boot/SPL configs                        | kernel DTS    =
   |
>+------------+--------------------------------------------+---------------=
---+
>|            |                                            |               =
   |
>| HAM1_HW    | #define CONFIG_NAND_OMAP_ECCSCHEME     \   |ti,nand-ecc-opt=
s=3D |
>|            |         OMAP_ECC_HAM1_CODE_HW              |    "ham1"     =
   |
>| (1-bit     | #define CONFIG_SYS_NAND_ECCBYTES       3   |               =
   |
>| Hamming    | #define CONFIG_SYS_NAND_ECCPOS \           |               =
   |
>| using h/w) |      { 1, 2, 3, 4, 5, 6, 7, 8, 9, \        |               =
   |
>|            |        10, 11, 12 }                        |               =
   |
>|            | (for NAND page-size=3D2048)                  |             =
     |
>|            |                                            |               =
   |
>+------------+--------------------------------------------+---------------=
---+
>|            |                                            |               =
   |
>| BCH8_SW    | #define CONFIG_NAND_OMAP_ECCSCHEME    \    |ti,nand-ecc-opt=
s=3D |
>|            |         OMAP_ECC_BCH8_CODE_HW_DETECTION_SW |    "bch8"     =
   |
>|(8-bit BCH  | #define CONFIG_SYS_NAND_ECCBYTES       13  |(without ELM no=
de)|
>| using s/w  | #define CONFIG_BCH                         |               =
   |
>|library for | #undef CONFIG_SPL_NAND_AM33XX_BCH          |               =
   |
>|for ECC     | #define CONFIG_SPL_NAND_SIMPLE             |               =
   |
>| error      | #define CONFIG_SYS_NAND_ECCPOS \           |               =
   |
>|correction) |     {2,  3,  4,  5,  6,  7,  8,  9, 10, \  |               =
   |
>|            |     11, 12, 13, 14, \                      |               =
   |
>|            |     16, 17, 18, 19, 20, 21, 22, 23, 24, \  |               =
   |
>|            |     25, 26, 27, 28, \                      |               =
   |
>|            |     30, 31, 32, 33, 34, 35, 36, 37, 38, \  |               =
   |
>|            |     39, 40, 41, 42, \                      |               =
   |
>|            |     44, 45, 46, 47, 48, 49, 50, 51, 52, \  |               =
   |
>|            |     53, 54, 55, 56, }                      |               =
   |
>|            | (for NAND page-size=3D2048)                  |             =
     |
>|            | #define CONFIG_SYS_NAND_ECCSIZE       512  |               =
   |
>|            |                                            |               =
   |
>+------------+--------------------------------------------+---------------=
---+
>|            |                                            |               =
   |
>| BCH8_HW    | #define CONFIG_NAND_OMAP_ECCSCHEME    \    |ti,nand-ecc-opt=
s=3D |
>|            |         OMAP_ECC_BCH8_CODE_HW              |    "bch8"     =
   |
>|(8-bit BCH  | #define CONFIG_SYS_NAND_ECCBYTES       14  |               =
   |
>| using ELM  | #define CONFIG_SPL_NAND_AM33XX_BCH         |(with ELM node)=
   |
>| h/w engine | #define CONFIG_SYS_NAND_ECCPOS  \          |ti,elm-id=3D<&e=
lm>  |
>|for ECC     |       {2,  3,  4,  5,  6,  7,  8,  9, \    |               =
   |
>| error      |       10, 11, 12, 13, 14, 15, 16, 17, \    |               =
   |
>|correction) |       18, 19, 20, 21, 22, 23, 24, 25, \    |               =
   |
>|            |       26, 27, 28, 29, 30, 31, 32, 33, \    |               =
   |
>|            |       34, 35, 36, 37, 38, 39, 40, 41, \    |               =
   |
>|            |       42, 43, 44, 45, 46, 47, 48, 49, \    |               =
   |
>|            |       50, 51, 52, 53, 54, 55, 56, 57, }    |               =
   |
>|            | (for NAND page-size=3D2048)                  |             =
     |
>|            | #define CONFIG_SYS_NAND_ECCSIZE       512  |               =
   |
>|            |                                            |               =
   |
>+------------+--------------------------------------------+---------------=
---+
>
>#* In addition following patches need to be pulled for u-boot:
>   http://lists.denx.de/pipermail/u-boot/2013-December/168506.html
>   http://lists.denx.de/pipermail/u-boot/2013-December/169021.html
>
>
>Test1: flash ubi image from u-boot and boot the kernel
>   U-boot> mw 0x82000000 0xff <u-boot.img size aligned to NAND block bound=
ary>
>   U-boot> fatload mmc 0 0x82000000 u-boot.img
>   U-boot> nand erase <u-boot_offset> <u-boot.img size>
>   U-boot> nand write 0x82000000  <u-boot_offset> <u-boot.img size>
>   U-boot> setenv bootargs 'console=3DttyO0,115200n8 noinitrd mem=3D256M \
>                root=3Dubi0 rw rootfstype=3Dubifs ubi.mtd=3D<mtdpart-of-ro=
otfs>,\
>                <page-size> ip=3Doff init=3D/init'
>   U-boot> bootm <kernel_offset>
>
>Test2: update u-boot.img from kernel and re-boot
>   Kernel> flash_erase /dev/<mtdpart-of-u-boot>  0 0
>   Kernel> nandwrite -s 0  /dev/<mtdpart-of-u-boot>   u-boot.img
>   Kernel> reboot
>
>Signed-off-by: Pekon Gupta <pekon@ti.com>
>---

Though I have done initial level of testing on AM335x as mentioned above,
But will it be possible for you to test and confirm if these set of patches
solve regressions on your OMAP3 boards ?


with regards, pekon
