MIME-Version: 1.0
References: <1545392724-6637-1-git-send-email-jianxin.pan@amlogic.com>
 <1545392724-6637-3-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1545392724-6637-3-git-send-email-jianxin.pan@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Dec 2018 18:07:12 +0100
Message-ID: <CAFBinCAeDtu-KTy=4bmAtBY9hGK8rRo=OW70tgEOyRBnQcdz1g@mail.gmail.com>
Subject: Re: [PATCH RESEND v8 2/2] mtd: rawnand: meson: add support for
 Amlogic NAND flash controller
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org,
 Liang Yang <liang.yang@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jianxin, Hi Liang,

On Fri, Dec 21, 2018 at 12:45 PM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>
> From: Liang Yang <liang.yang@amlogic.com>
>
> Add initial support for the Amlogic NAND flash controller which found
> in the Meson-GXBB/GXL/AXG SoCs.
>
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/mtd/nand/raw/Kconfig      |   10 +
>  drivers/mtd/nand/raw/Makefile     |    1 +
>  drivers/mtd/nand/raw/meson_nand.c | 1468 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 1479 insertions(+)
>  create mode 100644 drivers/mtd/nand/raw/meson_nand.c
>
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 1a55d3e..d05ff20 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -541,4 +541,14 @@ config MTD_NAND_TEGRA
>           is supported. Extra OOB bytes when using HW ECC are currently
>           not supported.
>
> +config MTD_NAND_MESON
> +       tristate "Support for NAND controller on Amlogic's Meson SoCs"
> +       depends on ARCH_MESON || COMPILE_TEST
> +       depends on COMMON_CLK_AMLOGIC
> +       select COMMON_CLK_REGMAP_MESON
I believe that "depends on COMMON_CLK_AMLOGIC" and "select
COMMON_CLK_REGMAP_MESON" are not necessary:
the driver should build fine without them because it's only
interfacing with the common clock framework.
the common clock framework is enabled by ARCH_MESON and for the
COMPILE_TEST case the common clock framework provides stub
implementations inside the headers.

> +       select MFD_SYSCON
> +       help
> +         Enables support for NAND controller on Amlogic's Meson SoCs.
> +         This controller is found on Meson GXBB, GXL, AXG SoCs.
you are explicitly mentioning GXBB here but you don't add a "GXBB" compatible.
I suggest to shorten this sentence ("This controller is found on Meson
SoCs.") because this driver can also support the 32-bit
Meson8/Meson8b/Meson8m2 SoCs with minor adjustments.


Regards
Martin
