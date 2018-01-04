Received: from mail-he1eur01on0049.outbound.protection.outlook.com
 ([104.47.0.49] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWuQ5-0000eR-UF
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 01:34:12 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, Poonam Aggrwal <poonam.aggrwal@nxp.com>,
 "Suresh Gupta" <suresh.gupta@nxp.com>, Ashish Kumar <ashish.kumar@nxp.com>,
 "Yogesh Narayan Gaur" <yogeshnarayan.gaur@nxp.com>, Rajat Srivastava
 <rajat.srivastava@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>
Subject: RE: [RFC 0/3] mtd: spi-nor: Add support of Sector Map Parameter Table
Date: Thu, 4 Jan 2018 01:33:51 +0000
Message-ID: <HE1PR04MB12417BAC1260587074962FFD971F0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <1514548432-13302-1-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1514548432-13302-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

Hi Cyrille,


> -----Original Message-----
> From: Prabhakar Kushwaha [mailto:prabhakar.kushwaha@nxp.com]
> Sent: Friday, December 29, 2017 5:24 PM
> To: linux-mtd@lists.infradead.org
> Cc: computersforpeace@gmail.com; boris.brezillon@free-electrons.com;
> marek.vasut@gmail.com; cyrille.pitchen@wedev4u.fr; Poonam Aggrwal
> <poonam.aggrwal@nxp.com>; Suresh Gupta <suresh.gupta@nxp.com>; Ashish
> Kumar <ashish.kumar@nxp.com>; Yogesh Narayan Gaur
> <yogeshnarayan.gaur@nxp.com>; Rajat Srivastava <rajat.srivastava@nxp.com>=
;
> Fabio Estevam <fabio.estevam@nxp.com>; Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com>
> Subject: [RFC 0/3] mtd: spi-nor: Add support of Sector Map Parameter Tabl=
e
>=20
> JESD216B defines Sector Map Parameter Table. It identifies the
> location and size of sectors within the main data array of the
> flash memory device and identifies which Erase Types are supported
> by each sector. This table is used when a memory device has sectors
> of more than one size Or, does not allow all Erase Type commands to
> be applied to all sectors.
>=20
> This patch-set add support of Sector Map Parameter Table parsing.
> It also update framework to support read/write anyreg commands
> required by S25FS512S flash.
>=20
> Tested with "S25FS512S" flash and by over-riding fsl_qspi_read_anyreg()
> return with desired configuration id i.e. 0x05. Flash was
> pre-programmed for Uniform 256-kB sectors via non-volatile registers.
>=20
> Prabhakar Kushwaha (3):
>   mtd: spi-nor: Add support of read/write any reg commands
>   mtd: spi-nor: Implement anyreg functions for fsl-quadspi
>   mtd: spi-nor: Add support of Sector Map Parameter Table
>=20
>  drivers/mtd/spi-nor/fsl-quadspi.c |  18 +++
>  drivers/mtd/spi-nor/spi-nor.c     | 266
> +++++++++++++++++++++++++++++++++++++-
>  include/linux/mtd/spi-nor.h       |  21 +++
>  3 files changed, 302 insertions(+), 3 deletions(-)
>=20

Can you please review this patch-set.=20
I want to incorporate review comments for the v1 patch.

Thanks
-pk
