Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac0Bm-00072X-Ji
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 00:35:23 +0000
Received: by mail-wm0-x234.google.com with SMTP id p65so40152617wmp.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 16:35:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
Date: Fri, 4 Mar 2016 21:35:00 -0300
Message-ID: <CAAEAJfCS1LN4yOYoY1ykJogDhZemdmEb7v32RE-s9vcr7B8DZg@mail.gmail.com>
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jagan Teki <jteki@openedev.com>,
 Gabor Juhos <juhosg@openwrt.org>, shijie.huang@intel.com,
 mika.westerberg@linux.intel.com, furquan@google.com, han.xu@freescale.com,
 fabio.estevam@freescale.com, Joachim Eastwood <manabian@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 yanhaifeng@hisilicon.com,
 yanghongwei@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com,
 ml.yang@hisilicon.com, gaofei@hisilicon.com, zhangzhenxing@hisilicon.com,
 xuejiancheng@hisilicon.com, Binquan Peng <pengbinquan@huawei.com>
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

Hi Jiancheng,

On 26 February 2016 at 05:11, Jiancheng Xue <xuejiancheng@huawei.com> wrote=
:
[..]
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 0dc9275..c86d7cf 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -37,6 +37,12 @@ config SPI_FSL_QUADSPI
>           This controller does not support generic SPI. It only supports
>           SPI NOR.
>
> +config SPI_HISI_SFC
> +       tristate "Hisilicon SPI-NOR Flash Controller(SFC)"
> +       depends on ARCH_HISI || COMPILE_TEST

I believe you are missing a "depends on HAS_IOMEM".
The NXP_SPIFI driver below does the right thing in this
regard.

Otherwise, you'll get a build failure on ARCH=3Dum.

drivers/built-in.o: In function `hisi_spi_nor_probe':
hisi-sfc.c:(.text+0x57ca5): undefined reference to `devm_ioremap_resource'
hisi-sfc.c:(.text+0x57d0e): undefined reference to `dmam_alloc_coherent'

Care to send a new one?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
