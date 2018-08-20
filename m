Received: from mail-co1nam04on0607.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::607]
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1frjBW-0007Jx-Pe
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2018 12:21:28 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "absahu@codeaurora.org"
 <absahu@codeaurora.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "kyungmin.park@samsung.com"
 <kyungmin.park@samsung.com>, "frieder.schrempf@exceet.de"
 <frieder.schrempf@exceet.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "nagasureshkumarrelli@gmail.com"
 <nagasureshkumarrelli@gmail.com>, Michal Simek <michals@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "peterpandong@micron.com"
 <peterpandong@micron.com>
Subject: RE: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for
 Arasan NAND Flash Controller
Date: Mon, 20 Aug 2018 12:21:12 +0000
Message-ID: <MWHPR02MB2623C6F80AC8DB81A9791EA4AF320@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1534511964-20342-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1534511964-20342-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20180817195903.49963b25@bbrezillon>
 <MWHPR02MB2623D48B5DBAFCE2B5D03747AF3C0@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180820105355.11bd50a8@bbrezillon>
 <MWHPR02MB2623218B2BD3D102B07AC862AF320@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20180820141026.0e7208ae@bbrezillon>
In-Reply-To: <20180820141026.0e7208ae@bbrezillon>
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

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, August 20, 2018 5:40 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: richard@nod.at; absahu@codeaurora.org; linux-kernel@vger.kernel.org;
> marek.vasut@gmail.com; kyungmin.park@samsung.com; frieder.schrempf@exceet=
.de; linux-
> mtd@lists.infradead.org; miquel.raynal@bootlin.com; nagasureshkumarrelli@=
gmail.com;
> Michal Simek <michals@xilinx.com>; computersforpeace@gmail.com; dwmw2@inf=
radead.org;
> peterpandong@micron.com
> Subject: Re: [LINUX PATCH v10 2/2] mtd: rawnand: arasan: Add support for =
Arasan
> NAND Flash Controller
>=20
> On Mon, 20 Aug 2018 10:49:38 +0000
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
>=20
> >
> > Thanks for your suggestion and are you saying something like Marvell pa=
rser patterns for
> nfcv1 as below?
> >
> > static const struct nand_op_parser marvell_nfcv1_op_parser =3D NAND_OP_=
PARSER(
> > 	/* Naked commands not supported, use a function for each pattern */
> > 	NAND_OP_PARSER_PATTERN(
> > 		marvell_nfc_read_id_type_exec,
> > 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > 		NAND_OP_PARSER_PAT_ADDR_ELEM(false,
> MAX_ADDRESS_CYC_NFCV1),
> > 		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
> > 	NAND_OP_PARSER_PATTERN(
> > 		marvell_nfc_erase_cmd_type_exec,
> > 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > 		NAND_OP_PARSER_PAT_ADDR_ELEM(false,
> MAX_ADDRESS_CYC_NFCV1),
> > 		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > 		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > 	);
> > That means, a separate hook for each pattern, is that you are suggestin=
g?
>=20
> Yes.

Ok, I will update the driver and will send next version.

Thanks,
Naga Sureshkumar Relli.
