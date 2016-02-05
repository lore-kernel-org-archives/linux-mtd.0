Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRiHQ-0007MQ-69
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2016 15:26:42 +0000
Received: by mail-wm0-x229.google.com with SMTP id p63so31362533wmp.1
 for <linux-mtd@lists.infradead.org>; Fri, 05 Feb 2016 07:26:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1454639113-16748-1-git-send-email-xuejiancheng@huawei.com>
References: <1454639113-16748-1-git-send-email-xuejiancheng@huawei.com>
Date: Fri, 5 Feb 2016 12:26:18 -0300
Message-ID: <CAAEAJfDnA5zkvHgqOkSjPZTJQp41N6_U=oO_OmR-4BSb7dUKoQ@mail.gmail.com>
Subject: Re: [PATCH v6] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, shijie.huang@intel.com,
 pengbinquan@huawei.com, han.xu@freescale.com, fabio.estevam@freescale.com,
 Joachim Eastwood <manabian@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 yanhaifeng@hisilicon.com,
 yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com,
 ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com,
 xuejiancheng@hisilicon.com
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

On 4 February 2016 at 23:25, Jiancheng Xue <xuejiancheng@huawei.com> wrote:
> Add hisilicon spi-nor flash controller driver
>
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> change log
> v6:
> Based on v4.5-rc2
> Fixed issues pointed by Ezequiel Garcia.
> v5:
> Fixed a compile error.
> v4:
> Rebased to v4.5-rc1
> v3:
> Added a compatible string "hisilicon,hi3519-sfc".
> v2:
> Fixed some compiling warings.
>
>  .../devicetree/bindings/spi/spi-hisi-sfc.txt       |  25 ++
> This file has already been acked by Rob Herring <robh@kernel.org>.
>  drivers/mtd/spi-nor/Kconfig                        |   6 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c                     | 494 +++++++++++++++=
++++++
>  4 files changed, 526 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-hisi-sfc.tx=
t
>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
>
> diff --git a/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt b/Doc=
umentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> new file mode 100644
> index 0000000..7407147
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
> @@ -0,0 +1,25 @@
> +HiSilicon SPI-NOR Flash Controller
> +
> +Required properties:
> +- compatible : Should be "hisilicon,hisi-sfc" and one of the following s=
trings:
> +               "hisilicon,hi3519-sfc"
> +- address-cells : number of cells required to define a chip select
> +        address on the SPI bus. Should be set to 1. See spi-bus.txt.
> +- size-cells : Should be 0.
> +- reg : Offset and length of the register set for the controller device.
> +- reg-names : Must include the following two entries: "control", "memory=
".
> +- clocks : handle to spi-nor flash controller clock.
> +
> +Example:
> +spi-nor-controller@10000000 {
> +       compatible =3D "hisilicon,hi3519-sfc", "hisilicon,hisi-sfc";
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       reg =3D <0x10000000 0x1000>, <0x14000000 0x1000000>;
> +       reg-names =3D "control", "memory";
> +       clocks =3D <&clock HI3519_FMC_CLK>;
> +       spi-nor@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +       };
> +};
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 0dc9275..763e48a 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -37,6 +37,12 @@ config SPI_FSL_QUADSPI
>           This controller does not support generic SPI. It only supports
>           SPI NOR.
>
> +config SPI_HISI_SFC
> +       tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
> +       depends on ARCH_HISI

I believe that using COMPILE_TEST would allow the build bots
to pick up your driver and report any issues.

See how NXP_SPIFI does it below.

> +       help
> +         This enables support for hisilicon SPI-NOR flash controller.
> +
>  config SPI_NXP_SPIFI
>         tristate "NXP SPI Flash Interface (SPIFI)"
>         depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 0bf3a7f8..8a6fa69 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_MTD_SPI_NOR)      +=3D spi-nor.o
>  obj-$(CONFIG_SPI_FSL_QUADSPI)  +=3D fsl-quadspi.o
> +obj-$(CONFIG_SPI_HISI_SFC)     +=3D hisi-sfc.o
>  obj-$(CONFIG_MTD_MT81xx_NOR)    +=3D mtk-quadspi.o
>  obj-$(CONFIG_SPI_NXP_SPIFI)    +=3D nxp-spifi.o
[..]
> +
> +               ret =3D mtd_device_register(mtd, NULL, 0);
> +               if (ret)
> +                       goto fail;
> +
> +               i++;
> +               host->num_chip++;
> +               if (i =3D=3D HIFMC_MAX_CHIP_NUM) {
> +                       dev_dbg(dev, "Flash device number exceeds the max=
inum chipselect number\n");
> +                       break;

Maybe dev_warn(FW_WARN ...) since it's a warning about a devicetree
(firmware) issue ?

Also: s/maxinum/maximum

Otherwise, looks fine:

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
