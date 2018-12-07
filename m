Received: from mail-eopbgr140070.outbound.protection.outlook.com
 ([40.107.14.70] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV7tB-0008Ks-Mo
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 04:37:26 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: James Tomasetta <James.Tomasetta@cypress.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Yong Qin <Yong.Qin@cypress.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, Jimmy Zhao <jimmy.zhao@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Pankaj
 Bansal <pankaj.bansal@nxp.com>
Subject: RE: SPI-NOR FS512S incorrect CR3NV[1] value
Date: Fri, 7 Dec 2018 04:37:04 +0000
Message-ID: <VI1PR04MB5726B1366A2F09F304406AEA99AA0@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181204100330.28acbecd@bbrezillon>
 <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181205202753.47ebe911@bbrezillon>
 <CY4PR06MB33041BF7999EA076D429DB66F6A90@CY4PR06MB3304.namprd06.prod.outlook.com>
In-Reply-To: <CY4PR06MB33041BF7999EA076D429DB66F6A90@CY4PR06MB3304.namprd06.prod.outlook.com>
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

Hi James,

This issue has been caught when we are updating the Linux OS from older ker=
nel version to newer version.
In older version, there wasn't logic to check SFDP and SMPT param and hence=
 this issue was never been caught.

But with newer Linux kernel OS version, we have hit this issue.

Also, presently in u-boot bootloader there is no check for SFDP and SMPT pa=
ram for this flash and hence not been caught there.

But, we have hit this same issue when trying to update UEFI bootloader. New=
 UEFI bootloader is parsing SFDP param and SMPT table.

IMO, as this issue is SPI-NOR flash issue, thus this would be independent o=
f the target. We have observed this on older LS family target(LS1046ARDB) a=
s well as on LX2 on which this flash is connected.

--
Regards
Yogesh Gaur

> -----Original Message-----
> From: James Tomasetta [mailto:James.Tomasetta@cypress.com]
> Sent: Thursday, December 6, 2018 10:00 PM
> To: Boris Brezillon <boris.brezillon@bootlin.com>; Yong Qin
> <Yong.Qin@cypress.com>
> Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; Tudor Ambarus
> <tudor.ambarus@microchip.com>; cyrille.pitchen@wedev4u.fr; Jimmy Zhao
> <jimmy.zhao@nxp.com>; linux-mtd@lists.infradead.org
> Subject: RE: SPI-NOR FS512S incorrect CR3NV[1] value
>=20
> Boris,
>=20
> Is there an issue with updating the software?  Is the issue that there is=
 a ROM
> bootloader checking this?  Is this for the LX2 or the old LS family?
>=20
> James
>=20
> -----Original Message-----
> From: Boris Brezillon <boris.brezillon@bootlin.com>
> Sent: Wednesday, December 5, 2018 1:28 PM
> To: Yong Qin <Yong.Qin@cypress.com>
> Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; Tudor Ambarus
> <tudor.ambarus@microchip.com>; cyrille.pitchen@wedev4u.fr; James
> Tomasetta <James.Tomasetta@cypress.com>; Jimmy Zhao
> <jimmy.zhao@nxp.com>; linux-mtd@lists.infradead.org
> Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value
>=20
> On Wed, 5 Dec 2018 19:21:51 +0000
> Yong Qin <Yong.Qin@cypress.com> wrote:
>=20
> > Hi Boris,
> >
> > Thanks for pointing this out.
> >
> > Confirmed with our product team, this is the part of datasheet
> > discrepancy. Since FS512S only has 256KB sector size option, CR3NV[1]
> > is don't care in FS512S and default value is set as 0 in factory.
> >
> > Column 3 (CR3NV[1]) of table 70 in datasheet will be removed.
> >
> > For software implementation, if identified the device is FS512S, then
> > checking the combination of CR3NV[3]  & CR1NV[2] is sufficient to
> > decide if the device has top/bottom 4KB sectors, or uniform 256KB
> > sectors.
>=20
> Again, fixing the datasheet is not enough, the SMPT section on the flash =
needs
> to be fixed too.
>=20
> This message and any attachments may contain confidential information fro=
m
> Cypress or its subsidiaries. If it has been received in error, please adv=
ise the
> sender and immediately delete this message.
