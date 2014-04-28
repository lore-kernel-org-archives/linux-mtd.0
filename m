Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WedoV-0002Us-EZ
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 05:09:12 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v3 0/4]  mtd: nand: omap: add support for BCH16_ECC
Date: Mon, 28 Apr 2014 05:08:36 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC5D3F@DBDE04.ent.ti.com>
References: <1395660006-27560-1-git-send-email-pekon@ti.com>
In-Reply-To: <1395660006-27560-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 "Balbi,
 Felipe" <balbi@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Gupta, Pekon
>
>*changes v2 -> v3*
>[PATCH v2 3/4] rebased to http://lists.infradead.org/pipermail/linux-mtd/2=
014-March/052655.html
>- no change in other patches
>
>
>*changes v1 -> v2*
> rebased and cleaned on following versions of pending patches
>  (1) [PATCH v8 0/6] mtd: nand: omap: optimized chip->ecc.correct() for H/=
W ECC schemes
>  http://lists.infradead.org/pipermail/linux-mtd/2014-February/052092.html
>
>  (2) [PATCH v6 0/4] mtd: nand: omap: optimize chip->ecc.calculate() for H=
/W ECC schemes
>  http://lists.infradead.org/pipermail/linux-mtd/2014-February/052272.html
>
>  (3) [PATCH v5 0/4] mtd: nand: omap: optimize chip->ecc.hwctl() for H/W E=
CC schemes
>  http://lists.infradead.org/pipermail/linux-mtd/2014-March/052327.html
>
>  (4) [PATCH v6 0/4] mtd: devices: elm: add checks ELM H/W constrains, dri=
ver code cleanup
>  http://lists.infradead.org/pipermail/linux-mtd/2014-March/052455.html
>
> Tested on Beaglebone-LT(white) NAND cape having NAND Device with
>       bus-width=3D16, block-size=3D256k, page-size=3D4k, oob-size=3D224
>
>
>*original v1*
>http://lists.infradead.org/pipermail/linux-mtd/2013-July/047562.html
>
>With increase in NAND flash densities and shrinking of technology
>NAND flash has become more suspectible to multiple bit-flips.
>Thus stronger ECC schemes are required for detecting and correcting multip=
le
>simultaneous bit-flips in same NAND page. But stronger ECC schemes have la=
rge
>ECC syndrome which require more space in OOB/Spare.
>
>This patch add support for BCH16 ecc-scheme on OMAP NAND driver:
>(a) BCH16 ecc-scheme can correct 16 bit-flips per 512Bytes of data.
>(b) BCH16 ecc-scheme generates 26-bytes of ECC syndrome / 512B.
>
>Due to (b) this scheme can only be used with NAND devices which have enoug=
h
>OOB to satisfy following equation:
>OOBsize per page >=3D 26 * (page-size / 512)
>
>
>Pekon Gupta (4):
>  mtd: nand: omap: add support for BCH16_ECC - GPMC driver updates
>  mtd: nand: omap: add support for BCH16_ECC - ELM driver updates
>  mtd: nand: omap: add support for BCH16_ECC - NAND driver updates
>  mtd: nand: omap: Documentation: How to select correct ECC scheme for
>    your device ?
>
> .../devicetree/bindings/mtd/gpmc-nand.txt          | 39 +++++++++
> arch/arm/mach-omap2/gpmc.c                         | 15 ++++
> drivers/mtd/devices/elm.c                          | 42 ++++++++++
> drivers/mtd/nand/omap2.c                           | 94 +++++++++++++++++=
+++++
> include/linux/platform_data/elm.h                  |  3 +-
> include/linux/platform_data/mtd-nand-omap2.h       |  5 ++
> 6 files changed, 197 insertions(+), 1 deletion(-)
>
>--
>1.8.5.1.163.gd7aced9

If this patch series looks good, them please accept it. This one is needed
for supporting NAND boot with 4K page-sized NAND devices, on TI platforms.

Following patch also needs your attention, it fixes a long term issue.
"mtd: nand: omap: fix BCHx ecc.correct to return detected bit-flips in eras=
ed-page"


with regards, pekon
