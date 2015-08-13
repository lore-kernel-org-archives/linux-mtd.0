Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPp1u-00086n-V2
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 09:42:35 +0000
Received: by wicja10 with SMTP id ja10so62151367wic.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 02:42:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CY1PR0301MB0780204E22E93D42F596043D8B7D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1437479828-30826-1-git-send-email-B48286@freescale.com>
 <CY1PR0301MB0780E3F6E2A1170A7A56A8538B8A0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CY1PR0301MB0780204E22E93D42F596043D8B7D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 13 Aug 2015 11:41:33 +0200
Message-ID: <CAOMqctSMyB+7=Rfw-hTvJ6YePn9y_QW8p6_jT8v=ejYZ9hF=hA@mail.gmail.com>
Subject: Re: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
To: Hou Zhiqiang <B48286@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "jonatas.rech@datacom.ind.br" <jonatas.rech@datacom.ind.br>,
 "Jane.Wan@gainspeed.com" <Jane.Wan@gainspeed.com>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>,
 "valentin.longchamp@keymile.com" <valentin.longchamp@keymile.com>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 Hu Vincent <Mingkai.Hu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 August 2015 at 11:03, Hou Zhiqiang <B48286@freescale.com> wrote:
> Hello,
>
> I want to add the 4-Byte addressing flashes support for the Freescale eSPI
> controller dirver. Appreciate your suggestions.
>
> Background:
> In the Freescale eSPI controller dirver, if the transaction length exceed
> 64KiB, the contents of the transaction was touched to update the command
> with assumed the 3-Byte address width. It is a workaround, due to the
> Freescale eSPI controller have a hardware limit that the maximum one-time
> transaction length is 64KiB, that isn't consistent with many other vendors'
> SPI controllers, and so far the SPI flash driver assume the SPI controller
> have the ability to complete the specified transaction length at one-time.
>
> But this workaround is only suit for 3-Byte addressing slaves, as time goes
> by, there are 4-Byte address width SPI flashes, so this assumption isn't
> correct and this workaround discombobulate the controller driver layer and
> protocol driver layer. So, this workaround should be removed and the SPI
> client driver should ensure the transaction completion.
>
> There are two solutions:
> 1. In spi-nor framework, compare the retlen with the transaction length
> specified, if the retlen less than the transaction length and with no error
> number returned, re-initiate the transaction with the updated address.
> Advantage:
> It won't affect other SPI controllers without this limit.
> Disadvantage:
> It is not a systematic solution.

This can probably break transactions that are performed on non-flash
slaves but look like flash read command.

>
> 2. Add quirk support, something like i2c quirk.
> Advantage:
> It is a systematic solution.
> Disadvantage:
> The quirk mechanism is only useful for Freescale eSPI controller, but it will
> affect whole SPI framework.

I added this quirk in m25p80.c since my current SPI master driver is
just broken so I tried to work around that. While the quirk itself is
rejected as non-syetematic this series that adds the required support
for checking the return value of the SPI master driver transfer
functions.

So you have options:

2a: add SPI master quirk and check it in m25p80.c and truncate the
transfer in m25p80.c

2b: truncate the transfer in SPI master driver and just return the
number of bytes transferred

This patch series should handle fragmenting the transfers in spi-nor.c

http://lists.infradead.org/pipermail/linux-mtd/2015-July/060466.html

3: if your controller has manual CS driving support fragment the
transfer in your SPI master driver into chunks the controler can
transfer in one go.

Thanks

Michal
