MIME-Version: 1.0
In-Reply-To: <AANLkTinxMQjZIG4G1d9WVOiUX8-zHjTuTc1eRuInDRGW@mail.gmail.com>
References: <AANLkTinxMQjZIG4G1d9WVOiUX8-zHjTuTc1eRuInDRGW@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Fri, 18 Jun 2010 14:59:46 +0800
Message-ID: <AANLkTilOIds0GEPmTWgi_y7UzJT4g9qx6iAtDJDgVxWu@mail.gmail.com>
Subject: Re: [PATCH 08/25] mmp: add nand support to pxa168
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <david.woodhouse@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 18, 2010 at 1:34 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 55adf11cb4ba8ba0b88148c9bce0cc08f94b97bd Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Mon, 31 May 2010 14:57:49 +0800
> Subject: [PATCH 08/25] mmp: add nand support to pxa168
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> ---
> =C2=A0arch/arm/configs/pxa168_defconfig | =C2=A0 =C2=A09 ++++++++-
> =C2=A0drivers/mtd/nand/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A02 +-
> =C2=A02 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/configs/pxa168_defconfig
> b/arch/arm/configs/pxa168_defconfig
> index 113511f..a01ea99 100644
> --- a/arch/arm/configs/pxa168_defconfig
> +++ b/arch/arm/configs/pxa168_defconfig
> @@ -438,7 +438,14 @@ CONFIG_EXTRA_FIRMWARE=3D""
> =C2=A0# CONFIG_DEBUG_DEVRES is not set
> =C2=A0# CONFIG_SYS_HYPERVISOR is not set
> =C2=A0# CONFIG_CONNECTOR is not set
> -# CONFIG_MTD is not set
> +CONFIG_MTD=3Dy
> +CONFIG_MTD_PARTITIONS=3Dy
> +CONFIG_MTD_CMDLINE_PARTS=3Dy
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLKDEVS=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_MTD_NAND=3Dy
> +CONFIG_MTD_NAND_PXA3xx=3Dy
> =C2=A0# CONFIG_PARPORT is not set
> =C2=A0# CONFIG_BLK_DEV is not set
> =C2=A0# CONFIG_MISC_DEVICES is not set
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 9a35d92..0d29b5d 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -394,7 +394,7 @@ endchoice
>
> =C2=A0config MTD_NAND_PXA3xx
> =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate "Support for NAND flash devices on PX=
A3xx"
> - =C2=A0 =C2=A0 =C2=A0 depends on MTD_NAND && (PXA3xx || ARCH_MMP)
> + =C2=A0 =C2=A0 =C2=A0 depends on MTD_NAND && PLAT_PXA

I'd prefer this not being changed, as pxa3xx_nand isn't applicable to
pxa25x/pxa27x.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This enables the driver for the NAND fl=
ash device found on
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PXA3xx processors
> --
> 1.7.0.4
>
