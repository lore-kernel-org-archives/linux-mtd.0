Received: from mail-eopbgr770102.outbound.protection.outlook.com
 ([40.107.77.102] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTzeR-00041E-Jq
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 01:38:02 +0000
From: Yong Qin <Yong.Qin@cypress.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Yogesh Narayan Gaur
 <yogeshnarayan.gaur@nxp.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, James Tomasetta <James.Tomasetta@cypress.com>,
 Jimmy Zhao <jimmy.zhao@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: SPI-NOR FS512S incorrect CR3NV[1] value
Date: Tue, 4 Dec 2018 01:37:14 +0000
Message-ID: <DM5PR06MB322865B43A86A57E77C92F748FAF0@DM5PR06MB3228.namprd06.prod.outlook.com>
References: <VI1PR04MB57263A8FC62719342DAB593499AE0@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181203083814.74662f38@bbrezillon>
In-Reply-To: <20181203083814.74662f38@bbrezillon>
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

Do you mean the SFDP table? Can you please share me more detail of what is =
wrong, i.e., which parameter, what is expect value and what you get?

Thanks,
Yong

-----Original Message-----
From: Boris Brezillon <boris.brezillon@bootlin.com>
Sent: Monday, December 3, 2018 2:38 AM
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>; cyrille.pitchen@wedev4u.fr=
; Yong Qin <Yong.Qin@cypress.com>; James Tomasetta <James.Tomasetta@cypress=
.com>; Jimmy Zhao <jimmy.zhao@nxp.com>; linux-mtd@lists.infradead.org
Subject: Re: SPI-NOR FS512S incorrect CR3NV[1] value

On Mon, 3 Dec 2018 04:33:53 +0000
Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> + Linux MTD mailing list group
>
> Hi Tudor,
>
> As confirmed by cypress team, default value of CR3NV[1] is 0 for flash FS=
512S and this is having the 256KB uniform erase sector option.
> There is discrepancy between FS512s datasheet and the actual shipped chip=
.

It's not only the datasheet that is wrong, the BFPT section is wrong too, a=
nd this one can't be fixed :-/.

This message and any attachments may contain confidential information from =
Cypress or its subsidiaries. If it has been received in error, please advis=
e the sender and immediately delete this message.
