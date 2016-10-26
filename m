Received: from mail-sn1nam02on0055.outbound.protection.outlook.com
 ([104.47.36.55] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzN3h-0007rq-2P
 for linux-mtd@lists.infradead.org; Wed, 26 Oct 2016 12:11:57 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: Richard Weinberger <richard@nod.at>, Christoph Hellwig <hch@infradead.org>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "Punnaiah Choudary
 Kalluri" <punnaia@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: RE: UBIFS LEB properties tree with odd addresses
Date: Wed, 26 Oct 2016 12:11:23 +0000
Message-ID: <DA6901612C71B84D91459DE817C418AE26E0069D@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <DA6901612C71B84D91459DE817C418AE26E0016D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <e7f63f72-0dc1-54f4-b94c-2efef3e7af6b@nod.at>
In-Reply-To: <e7f63f72-0dc1-54f4-b94c-2efef3e7af6b@nod.at>
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

Hi Richard,

-----Original Message-----
From: Richard Weinberger [mailto:richard@nod.at]=20
Sent: Wednesday, October 26, 2016 2:44 AM
To: Naga Sureshkumar Relli <nagasure@xilinx.com>; Christoph Hellwig <hch@in=
fradead.org>
Cc: dwmw2@infradead.org; computersforpeace@gmail.com; dedekind1@gmail.com; =
adrian.hunter@intel.com; michal.simek@xilinx.com; Punnaiah Choudary Kalluri=
 <punnaia@xilinx.com>; linux-mtd@lists.infradead.org; linux-kernel@vger.ker=
nel.org; Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: UBIFS LEB properties tree with odd addresses

Naga Sureshkumar Relli,
>     Even bytes i.e. 0, 2, 4,... are transmitted on Lower Data Bus
>     Odd bytes i.e. 1, 3, 5,.. are transmitted on Upper Data Bus.

> But these details are hidden from UBI?

Yes, Our controller driver will take care of these byte striping.

> So for temporary hack we did the following change In fs/ubifs/lpt.c In=20
> do_calc_lpt_geom(), added the following
> +       if (c->pnode_sz % 2)
> +               c->pnode_sz +=3D 1;=20
> +       if (c->ltab_sz % 2)
> +               c->ltab_sz +=3D 1;
>=20
> Please kindly suggest, I need your inputs, changing the pnode_sz and ltab=
_sz to even in lpt.c, will it impact on any others?

> Hmm, the calculations in lpt.c use basic properties of the MTD (number of=
 blocks, etc...).
> Can you please double check which property causes the failure and also ve=
rify whether the MTD driver provides correct properties. i.e. page sizes, b=
lock size, number of blocks, ...

Yes, only pnode_sz and ltab_sz are odd values

And MTD info, here are my logs
In Single Flash mode:
Mtd->erasesize =3D 64KiB
Mtd->size =3D 64MiB
Mtd->numeraseregions =3D 0
Nor->pagesize =3D 256

In Dual parallel mode:
Mtd->erasesize =3D 128KiB
Mtd->size =3D 128MiB
Mtd->numeraseregions =3D 0
Nor->pagesize =3D 512

Thanks,
Naga Sureshkumar Relli
