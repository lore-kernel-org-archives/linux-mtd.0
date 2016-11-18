Received: from mail-he1eur01on0121.outbound.protection.outlook.com
 ([104.47.0.121] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7gng-0001fc-9z
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 10:53:45 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: RE: [PATCH 1/3] mtd: spi-nor: Add die_cnt field and flags
Date: Fri, 18 Nov 2016 10:53:19 +0000
Message-ID: <AM4PR0701MB213010A6B6B0284D8E30427DFEB00@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-2-git-send-email-marcin.krzeminski@nokia.com>
 <0386ac08-f41e-1e10-d0e6-a16624bba952@atmel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cyrille,

....
> >
> > If think you should first check whether nor->erase() is implemented by
> > the SPI controller driver and call it instead of nor->write_reg().
> >
> > For instance, some SPI controllers are mapped to the system memory to
> > speed up Fast Read operations. In which case, they could also enable
> > data cache to fasten even more the read operations.
> >
> > So when the spi-nor framework calls nor->erase() or nor->write(),
> > those handlers might need to invalidate the cache before performing
> > the next read.
> >
> > This is just an example but generally speaking, don't forget the
> > nor->erase() handler! :)
> >
> Thanks for extensive clarification, I will include this in v2.
>=20
> Regards,
> Marcin
>=20
I've just sent v2 with added check for nor->erase() handler.
As we talked on IRC, with the example you gave above there is
a bug in case of chip erase command, because the driver will not
know that whole flash has been erased.
Maybe there is a need to have a handler in spi-nor framework
for memory invalidation?

Thanks,
Marcin
