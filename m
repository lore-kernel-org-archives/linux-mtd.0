Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsGLq-0007J6-RN
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 17:51:23 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: RE: [PATCH v3 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Thu, 27 Jun 2013 17:50:33 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E0763@DBDE04.ent.ti.com>
References: <1372010299-30141-1-git-send-email-pekon@ti.com>
In-Reply-To: <1372010299-30141-1-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "arnd@arndb.de" <arnd@arndb.de>, "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "Benoit Cousson \(benoit.cousson@linaro.org\)" <benoit.cousson@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To OMAP3/4/5 and AM335x users,

Though I have tested the following series on AM335x-EVM,=20
but it would be good if it can also be tested on other platforms like
OMAP3/4/5 custom boards which use NAND.

This would be helpful, as this patch series provides base for further=20
enhancement and cleanup of omap2-nand driver.


with regards, pekon


> -----Original Message-----
> From: Gupta, Pekon
> Sent: Sunday, June 23, 2013 11:28 PM
> To: tony@atomide.com; artem.bityutskiy@linux.intel.com; Cousson, Benoit
> Cc: arnd@arndb.de; Philip, Avinash; Balbi, Felipe; linux-
> mtd@lists.infradead.org; linux-omap@vger.kernel.org;
> jp.francois@cynove.com; Gupta, Pekon
> Subject: [PATCH v3 0/4] mtd:nand:omap2: clean-up of supported ECC
> schemes
>=20
> (with Author Name fixed)
> Changes v2 -> v3
> - PATCH-1: re-arranged code to remove redundancy, added
> NAND_BUSWIDTH_AUTO
> - PATCH-2: updated nand-ecc-opt DT mapping and Documentation
> - PATCH-3: code-cleaning + changes to match PATCH-1
> - PATCH-4 <DROPPED> update DT attribute for ti,nand-ecc-opt
> 	- received feedback to keep DT mapping independent of linuxism
> - PATCH-4:<NEW> : ARM: dts: AM33xx: updated default ECC scheme in nand-
> ecc-opt
> 	- independent patch for AM335x-evm.dts update based on PATCH-2
>=20
> Changes v1 -> v2
> 	added 	[PATCH 3/4] and [PATCH 4/4]
>=20
> Patches in this series:
> [PATCH 1/4]: clean-up and optimization for supported ECC schemes.
> [PATCH 2/4]: add separate DT options each supported ECC scheme.
> [PATCH 3/4]: update BCH4 ECC implementation (using ELM or using lib/bch.h=
)
> [PATCH 4/4]: ARM: dts: AM33xx: updated default ECC scheme in nand-ecc-
> opt
>=20
> After this patch series, omap2-nand driver will supports following ECC
> schemes:
> +---------------------------------------+---------------+---------------+
> | ECC scheme				|ECC calculation|Error detection|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_HAMMING_CODE_DEFAULT		|S/W		|S/W
> 		|
> |OMAP_ECC_HAMMING_CODE_HW		|H/W (GPMC)	|S/W
> 	|
> |OMAP_ECC_HAMMING_CODE_HW_ROMCODE	|H/W (GPMC)	|S/W
> 		|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH4_CODE_HW_DETECTION_SW	|H/W (GPMC)	|S/W
> (lib/bch.h)|
> |OMAP_ECC_BCH4_CODE_HW			|H/W (GPMC)	|H/W (ELM)
> 	|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW	|H/W (GPMC)	|S/W
> (lib/bch.h)|
> |OMAP_ECC_BCH8_CODE_HW			|H/W (GPMC)	|H/W (ELM)
> 	|
> +---------------------------------------+---------------+---------------+
> - Selection of OMAP_ECC_BCHx_CODE_HW_DETECTION_SW requires,
> 	Kconfig: CONFIG_MTD_NAND_ECC_BCH: enables S/W based BCH
> ECC algorithm.
>=20
> - Selection of OMAP_ECC_BCHx_CODE_HW requires,
> 	Kconfig: CONFIG_MTD_NAND_OMAP_BCH: enables ELM H/W
> module.
>=20
>=20
> Pekon Gupta (4):
>   mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC configurations in
>     device_probe
>   ARM: OMAP2+: cleaned-up DT support of various ECC schemes
>   mtd:nand:omap2: updated support for BCH4 ECC scheme
>   ARM: dts: AM33xx: updated default ECC scheme in nand-ecc-opt
>=20
>  .../devicetree/bindings/mtd/gpmc-nand.txt          |  65 ++-
>  arch/arm/boot/dts/am335x-evm.dts                   |   2 +-
>  arch/arm/mach-omap2/gpmc.c                         |  14 +-
>  drivers/mtd/nand/Kconfig                           |   7 +-
>  drivers/mtd/nand/omap2.c                           | 482 ++++++++++-----=
------
>  include/linux/platform_data/elm.h                  |   4 +
>  include/linux/platform_data/mtd-nand-omap2.h       |  22 +-
>  7 files changed, 307 insertions(+), 289 deletions(-)
>=20
> --
> 1.8.1
