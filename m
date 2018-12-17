Received: from mail-he1eur01on0619.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::619]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYmJ5-00027I-9P
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 06:23:12 +0000
From: Pankaj Bansal <pankaj.bansal@nxp.com>
To: James Tomasetta <James.Tomasetta@cypress.com>
CC: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Yong Qin
 <Yong.Qin@cypress.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, Jimmy Zhao
 <jimmy.zhao@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Boris Brezillon
 <boris.brezillon@bootlin.com>
Subject: RE: SPI-NOR FS512S incorrect CR3NV[1] value
Date: Mon, 17 Dec 2018 06:22:53 +0000
Message-ID: <HE1PR0402MB332301D5899A13EB3DBE67C9F1BC0@HE1PR0402MB3323.eurprd04.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181204100330.28acbecd@bbrezillon>
 <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181205202753.47ebe911@bbrezillon>
 <CY4PR06MB33041BF7999EA076D429DB66F6A90@CY4PR06MB3304.namprd06.prod.outlook.com>
 <VI1PR04MB5726B1366A2F09F304406AEA99AA0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <BN6PR06MB32974DB116D27B9939A23090F6AA0@BN6PR06MB3297.namprd06.prod.outlook.com>
 <20181207161703.25efabc5@bbrezillon>
In-Reply-To: <20181207161703.25efabc5@bbrezillon>
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

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Friday, December 7, 2018 8:47 PM
> To: James Tomasetta <James.Tomasetta@cypress.com>
> Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; Yong Qin
> <Yong.Qin@cypress.com>; Tudor Ambarus <tudor.ambarus@microchip.com>;
> cyrille.pitchen@wedev4u.fr; Jimmy Zhao <jimmy.zhao@nxp.com>; linux-
> mtd@lists.infradead.org; Pankaj Bansal <pankaj.bansal@nxp.com>
> Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value
>=20
> On Fri, 7 Dec 2018 15:02:09 +0000
> James Tomasetta <James.Tomasetta@cypress.com> wrote:
>=20
> > Yogesh,
> >
> > Attached is the latest CY driver for linux which might help.  It does
> > not use the SFDP.
>=20
> Yes, and that's exactly what we are trying to address. SFDP was designed =
to
> provide a generic way to expose various information (memory organization,
> supported cmdset/features, ...). If manufacturers don't take care when
> populating these tables, we're back to the current situation where everyt=
hing
> has to be described on a per-chip basis (far from ideal).
>=20
> > We are working to see if we can update the default value of the device
> > to 1.

Did you find a way to make the default value of Nonvolatile registers same =
as SFDP header?
We need it for UEFI boot loader.

>=20
> I think it's too late for this part (we'll find a way to fixup the SMPT t=
able at
> runtime). But please be careful next time you design a chip.
