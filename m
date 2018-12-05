Received: from mail-eopbgr680133.outbound.protection.outlook.com
 ([40.107.68.133] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUckI-0005J2-RO
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 19:22:08 +0000
From: Yong Qin <Yong.Qin@cypress.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, James Tomasetta <James.Tomasetta@cypress.com>,
 Jimmy Zhao <jimmy.zhao@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: SPI-NOR FS512S incorrect CR3NV[1] value
Date: Wed, 5 Dec 2018 19:21:51 +0000
Message-ID: <DM5PR06MB32285AC8B1327F52325D1AA28FA80@DM5PR06MB3228.namprd06.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
 <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
 <20181204100330.28acbecd@bbrezillon>
In-Reply-To: <20181204100330.28acbecd@bbrezillon>
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

Hi Boris,

Thanks for pointing this out.

Confirmed with our product team, this is the part of datasheet discrepancy.=
 Since FS512S only has 256KB sector size option, CR3NV[1] is don't care in =
FS512S and default value is set as 0 in factory.

Column 3 (CR3NV[1]) of table 70 in datasheet will be removed.

For software implementation, if identified the device is FS512S, then check=
ing the combination of CR3NV[3]  & CR1NV[2] is sufficient to decide if the =
device has top/bottom 4KB sectors, or uniform 256KB sectors.

Thanks,
Yong

-----Original Message-----
From: Boris Brezillon <boris.brezillon@bootlin.com>
Sent: Tuesday, December 4, 2018 4:04 AM
To: Yong Qin <Yong.Qin@cypress.com>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; Tudor Ambarus <tudor.=
ambarus@microchip.com>; cyrille.pitchen@wedev4u.fr; James Tomasetta <James.=
Tomasetta@cypress.com>; Jimmy Zhao <jimmy.zhao@nxp.com>; linux-mtd@lists.in=
fradead.org
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value

Hi Yong,

On Tue, 4 Dec 2018 01:37:14 +0000
Yong Qin <Yong.Qin@cypress.com> wrote:

> Hi Boris,
>
> Do you mean the SFDP table?

Sorry, I meant the SMPT (Sector Map Parameter Table) section of the SFDP ta=
ble. See page 130 of this datasheet [1].

> Can you please share me more detail of what is wrong, i.e., which
> parameter, what is expect value and what you get?

See "Table 70. Sector Map Parameter", CR3NV[1] is always set to one, and wh=
en we retrieve this value at runtime we get a 0. Which means we won't find =
a matching mapid when iterating over the map table, hence the bug reported =
by Yogesh.

If CR3NV[1] is always 0, then the SMPT should be fixed accordingly:

CR3NV[3]  CR1NV[2]  CR3NV[1]  Index  Value Description
0         0         0         00h    4 kB sectors at bottom with remainder =
256 kB sectors
0         1         0         02h    4 kB sectors at top with remainder 256=
 kB sectors
1         0         0         04h    Uniform 256 kB sectors

Regards,

Boris

[1]http://www.cypress.com/file/216376/download

This message and any attachments may contain confidential information from =
Cypress or its subsidiaries. If it has been received in error, please advis=
e the sender and immediately delete this message.
