Received: from mail-eopbgr780127.outbound.protection.outlook.com
 ([40.107.78.127] helo=NAM03-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUwXY-0000lq-5y
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 16:30:19 +0000
From: James Tomasetta <James.Tomasetta@cypress.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Yong Qin
 <Yong.Qin@cypress.com>
CC: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, Jimmy Zhao <jimmy.zhao@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: SPI-NOR FS512S incorrect CR3NV[1] value
Date: Thu, 6 Dec 2018 16:30:02 +0000
Message-ID: <CY4PR06MB33041BF7999EA076D429DB66F6A90@CY4PR06MB3304.namprd06.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181204100330.28acbecd@bbrezillon>
 <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181205202753.47ebe911@bbrezillon>
In-Reply-To: <20181205202753.47ebe911@bbrezillon>
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

Boris,

Is there an issue with updating the software?  Is the issue that there is a=
 ROM bootloader checking this?  Is this for the LX2 or the old LS family?

James

-----Original Message-----
From: Boris Brezillon <boris.brezillon@bootlin.com>
Sent: Wednesday, December 5, 2018 1:28 PM
To: Yong Qin <Yong.Qin@cypress.com>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; Tudor Ambarus <tudor.=
ambarus@microchip.com>; cyrille.pitchen@wedev4u.fr; James Tomasetta <James.=
Tomasetta@cypress.com>; Jimmy Zhao <jimmy.zhao@nxp.com>; linux-mtd@lists.in=
fradead.org
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value

On Wed, 5 Dec 2018 19:21:51 +0000
Yong Qin <Yong.Qin@cypress.com> wrote:

> Hi Boris,
>
> Thanks for pointing this out.
>
> Confirmed with our product team, this is the part of datasheet
> discrepancy. Since FS512S only has 256KB sector size option, CR3NV[1]
> is don't care in FS512S and default value is set as 0 in factory.
>
> Column 3 (CR3NV[1]) of table 70 in datasheet will be removed.
>
> For software implementation, if identified the device is FS512S, then
> checking the combination of CR3NV[3]  & CR1NV[2] is sufficient to
> decide if the device has top/bottom 4KB sectors, or uniform 256KB
> sectors.

Again, fixing the datasheet is not enough, the SMPT section on the flash ne=
eds to be fixed too.

This message and any attachments may contain confidential information from =
Cypress or its subsidiaries. If it has been received in error, please advis=
e the sender and immediately delete this message.
