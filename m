Received: from mail-qa0-x232.google.com ([2607:f8b0:400d:c00::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ufrcl-0006tI-Lk
 for linux-mtd@lists.infradead.org; Fri, 24 May 2013 13:01:36 +0000
Received: by mail-qa0-f50.google.com with SMTP id bn16so2250834qab.9
 for <linux-mtd@lists.infradead.org>; Fri, 24 May 2013 06:01:14 -0700 (PDT)
MIME-Version: 1.0
Sender: jphilippe.francois@gmail.com
In-Reply-To: <1368791418-14330-1-git-send-email-pekon@ti.com>
References: <1368791418-14330-1-git-send-email-pekon@ti.com>
Date: Fri, 24 May 2013 15:01:14 +0200
Message-ID: <CAGGh5h3Ca8OvwLVoA-V+GYnXirQhqxOgbz_AOAc9_0gkpHzoZw@mail.gmail.com>
Subject: Re: [PATCH 0/4 v2] mtd:nand:omap2: clean-up of supported ECC schemes
From: jean-philippe francois <jp.francois@cynove.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/17 Gupta, Pekon <pekon@ti.com>:
> From: "Gupta, Pekon" <pekon@ti.com>
>
> [Change v1 -> v2]
>         added   [PATCH 3/4] and [PATCH 4/4]
>
> [PATCH 1/4]: clean-up and optimization for supported ECC schemes.
> [PATCH 2/4]: add separate DT options each supported ECC scheme.
> [PATCH 3/4]: update BCH4 ECC implementation (using ELM or using lib/bch.h=
)
> [PATCH 4/4]: update DT attribute for ti,nand-ecc-opt
>
> After this patch series, omap2-nand driver will supports following ECC sc=
hemes:
> +---------------------------------------+---------------+---------------+
> | ECC scheme                            |ECC calculation|Error detection|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_HAMMING_CODE_DEFAULT          |S/W            |S/W            |
> |OMAP_ECC_HAMMING_CODE_HW               |H/W (GPMC)     |S/W            |
> |OMAP_ECC_HAMMING_CODE_HW_ROMCODE       |H/W (GPMC)     |S/W            |
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH4_CODE_HW_DETECTION_SW     |H/W (GPMC)     |S/W (lib/bch.h)|
> |OMAP_ECC_BCH4_CODE_HW                  |H/W (GPMC)     |H/W (ELM)      |
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW     |H/W (GPMC)     |S/W (lib/bch.h)|
> |OMAP_ECC_BCH8_CODE_HW                  |H/W (GPMC)     |H/W (ELM)      |
> +---------------------------------------+---------------+---------------+
> - Selection of OMAP_ECC_BCHx_CODE_HW_DETECTION_SW requires,
>         Kconfig: CONFIG_MTD_NAND_ECC_BCH: enables S/W based BCH ECC algor=
ithm.
>
> - Selection of OMAP_ECC_BCHx_CODE_HW requires,
>         Kconfig: CONFIG_MTD_NAND_OMAP_BCH: enables ELM H/W module.
>
>

Hi,

Thank you for not dropping BCH4 with software detection.
BCH4_CODE_HW_DETECTION_SW tested sucessfully on an existing nand with BCH4 =
ECC.
- Linux flashed kernel was read by u-boot sucessfully.
- existing ubifs sucessfully mounted.

Regards,
Jean-Philippe Fran=C3=A7ois


> Gupta, Pekon (4):
>   mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW ECC configurations in
>     device_probe
>   ARM: OMAP2+: cleaned-up DT support of various ECC schemes
>   mtd:nand:omap2: updated support for BCH4 ECC scheme
>   ARM: OMAP2+: updated ECC scheme attributes for omap2-nand DT
>
>  .../devicetree/bindings/mtd/gpmc-nand.txt          |  52 ++-
>  arch/arm/boot/dts/am335x-evm.dts                   |   2 +-
>  arch/arm/mach-omap2/gpmc.c                         |  17 +-
>  drivers/mtd/nand/Kconfig                           |   1 -
>  drivers/mtd/nand/omap2.c                           | 413 +++++++++------=
------
>  include/linux/platform_data/elm.h                  |   4 +
>  include/linux/platform_data/mtd-nand-omap2.h       |  22 +-
>  7 files changed, 253 insertions(+), 258 deletions(-)
>
> --
> 1.8.1
>
