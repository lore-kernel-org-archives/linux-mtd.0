Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ6eN-0004aW-37
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 04:31:27 +0000
Received: by lbbtg9 with SMTP id tg9so38962687lbb.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 21:31:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CY1PR0301MB07804C16D086589B621FD9498B7C0@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1437479828-30826-1-git-send-email-B48286@freescale.com>
 <CY1PR0301MB0780E3F6E2A1170A7A56A8538B8A0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CY1PR0301MB0780204E22E93D42F596043D8B7D0@CY1PR0301MB0780.namprd03.prod.outlook.com>
 <CAOMqctSMyB+7=Rfw-hTvJ6YePn9y_QW8p6_jT8v=ejYZ9hF=hA@mail.gmail.com>
 <CY1PR0301MB07804C16D086589B621FD9498B7C0@CY1PR0301MB0780.namprd03.prod.outlook.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 14 Aug 2015 06:30:25 +0200
Message-ID: <CAOMqctRy8ozO9JCz2kxPttUj9yrXiHjemfZ2_ib5R4JjkY=k+Q@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 August 2015 at 05:40, Hou Zhiqiang <B48286@freescale.com> wrote:
>
>
>> -----Original Message-----
>> From: Michal Suchanek [mailto:hramrach@gmail.com]
>> Sent: 2015=E5=B9=B48=E6=9C=8813=E6=97=A5 17:42
>> To: Hou Zhiqiang-B48286
>> Cc: linux-mtd@lists.infradead.org; computersforpeace@gmail.com;
>> dwmw2@infradead.org; jonatas.rech@datacom.ind.br; Jane.Wan@gainspeed.com=
;
>> shijie.huang@intel.com; valentin.longchamp@keymile.com;
>> hkallweit1@gmail.com; beanhuo@micron.com; Hu Mingkai-B21284
>> Subject: Re: [PATCH] RFC: mtd/spi-nor: add checking for the spi_nor_read
>>
>> On 13 August 2015 at 11:03, Hou Zhiqiang <B48286@freescale.com> wrote:
>> > Hello,
>> >
>> > I want to add the 4-Byte addressing flashes support for the Freescale
>> > eSPI controller dirver. Appreciate your suggestions.
>> >
>> > Background:
>> > In the Freescale eSPI controller dirver, if the transaction length
>> > exceed 64KiB, the contents of the transaction was touched to update
>> > the command with assumed the 3-Byte address width. It is a workaround,
>> > due to the Freescale eSPI controller have a hardware limit that the
>> > maximum one-time transaction length is 64KiB, that isn't consistent
>> with many other vendors'
>> > SPI controllers, and so far the SPI flash driver assume the SPI
>> > controller have the ability to complete the specified transaction
>> length at one-time.
>> >
>> > But this workaround is only suit for 3-Byte addressing slaves, as time
>> > goes by, there are 4-Byte address width SPI flashes, so this
>> > assumption isn't correct and this workaround discombobulate the
>> > controller driver layer and protocol driver layer. So, this workaround
>> > should be removed and the SPI client driver should ensure the
>> transaction completion.
>> >
>> > There are two solutions:
>> > 1. In spi-nor framework, compare the retlen with the transaction
>> > length specified, if the retlen less than the transaction length and
>> > with no error number returned, re-initiate the transaction with the
>> updated address.
>> > Advantage:
>> > It won't affect other SPI controllers without this limit.
>> > Disadvantage:
>> > It is not a systematic solution.
>>
>> This can probably break transactions that are performed on non-flash
>> slaves but look like flash read command.
>>
>> >
>> > 2. Add quirk support, something like i2c quirk.
>> > Advantage:
>> > It is a systematic solution.
>> > Disadvantage:
>> > The quirk mechanism is only useful for Freescale eSPI controller, but
>> > it will affect whole SPI framework.
>>
>> I added this quirk in m25p80.c since my current SPI master driver is jus=
t
>> broken so I tried to work around that. While the quirk itself is rejecte=
d
>> as non-syetematic this series that adds the required support for checkin=
g
>> the return value of the SPI master driver transfer functions.
>>
>> So you have options:
>>
>> 2a: add SPI master quirk and check it in m25p80.c and truncate the
>> transfer in m25p80.c
>>
>> 2b: truncate the transfer in SPI master driver and just return the numbe=
r
>> of bytes transferred
>>
>
> I expect this way, so the spi slave driver should check the retlen with t=
he
> transaction length and do some loop transfer, and make sure getting all d=
ata
> this transaction wanted.
>
>> This patch series should handle fragmenting the transfers in spi-nor.c
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2015-July/060466.html
>>
>
> Please correct me if I'm wrong, AFAIU the mtd layer will check the retlen=
 and
> if it isn't equal to the transaction length, the EIO will be returned.

I never had this happen because with this patch series spi-nor checks
the amount of data transferred and continues until the whole length is
transferred. Without it just sets retlen to length regardless of
amount of data transferred.

Thanks

Michal
