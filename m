Received: from mail-bn3nam01on071b.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::71b]
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUd0y-00035p-0b
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 19:39:22 +0000
From: Yong Qin <Yong.Qin@cypress.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, James Tomasetta <James.Tomasetta@cypress.com>,
 Jimmy Zhao <jimmy.zhao@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: SPI-NOR FS512S incorrect CR3NV[1] value
Date: Wed, 5 Dec 2018 19:39:05 +0000
Message-ID: <DM5PR06MB3228CD9567B7FE7E74A685D68FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181204100330.28acbecd@bbrezillon>
 <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181205202753.47ebe911@bbrezillon> <20181205202940.0ba2f25d@bbrezillon>
In-Reply-To: <20181205202940.0ba2f25d@bbrezillon>
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

Thanks Boris for your understanding.

FS512S has been in production for many years. It is very difficult to chang=
e the chip now. Any changes to the chip may also have impact on the custome=
rs who have been using this device for production.

Cypress continues improving its products and documents quality. We will try=
 to avoid this kind of mistakes in the future.

Thanks,
Yong

-----Original Message-----
From: Boris Brezillon <boris.brezillon@bootlin.com>
Sent: Wednesday, December 5, 2018 2:30 PM
To: Yong Qin <Yong.Qin@cypress.com>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; Tudor Ambarus <tudor.=
ambarus@microchip.com>; cyrille.pitchen@wedev4u.fr; James Tomasetta <James.=
Tomasetta@cypress.com>; Jimmy Zhao <jimmy.zhao@nxp.com>; linux-mtd@lists.in=
fradead.org
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value

On Wed, 5 Dec 2018 20:27:53 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Wed, 5 Dec 2018 19:21:51 +0000
> Yong Qin <Yong.Qin@cypress.com> wrote:
>
> > Hi Boris,
> >
> > Thanks for pointing this out.
> >
> > Confirmed with our product team, this is the part of datasheet
> > discrepancy. Since FS512S only has 256KB sector size option,
> > CR3NV[1] is don't care in FS512S and default value is set as 0 in facto=
ry.
> >
> > Column 3 (CR3NV[1]) of table 70 in datasheet will be removed.
> >
> > For software implementation, if identified the device is FS512S,
> > then checking the combination of CR3NV[3]  & CR1NV[2] is sufficient
> > to decide if the device has top/bottom 4KB sectors, or uniform 256KB
> > sectors.
>
> Again, fixing the datasheet is not enough, the SMPT section on the
> flash needs to be fixed too.

To be honest, it's already too late for this part, but please try to avoid =
this sort of mistakes on your future chips.

This message and any attachments may contain confidential information from =
Cypress or its subsidiaries. If it has been received in error, please advis=
e the sender and immediately delete this message.
