Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NnZO9-0006r7-K5
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 15:24:33 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: Blair Barnett <bbarnett@nethra.us.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Fri, 5 Mar 2010 09:24:26 -0600
Subject: RE: ONFI 4GB and beyond NAND support
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D9C10DBEB@dlee01.ent.ti.com>
References: <4B907BC1.4030907@nethra.us.com>
In-Reply-To: <4B907BC1.4030907@nethra.us.com>
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



>=20
> I have two questions for the MTD gang, but couldn't find the answer in
> the archives, nor elsewhere on the web.
>=20
> 1. What's the plan, if any, for the MTD NAND layer to support the ONFI
> standard?
I guess somebody has to write the necessary code and send the patch.
ONFI NANds get all the necessary info from a param table I believe.=20

> 2. What's the plan, if any, for the MTD NAND layer to support 4 GB NANDs
> (and greater)?
This is already there for more than a year. Use the latest kernels

>=20
> The two questions could be linked, as we're looking at Micron 4 GB, 8 GB
> and 16 GB MLC parts that support the ONFI standard, that we'd like to
> use on a board that my company is building.
>=20
> I've hacked support for the 4 GB part by having the MTD layer recognize
> it as 4 GB - 1 erase block, which gets it inside the uint32_t limit.
> That hack won't really work for 8 GB and beyond. I'd certainly be
> willing to help with the design review and coding if I had a clue what
> folks were thinking.
This means that you are probably using an old kernel. Update to the newest =
kernels.

>=20
> Thanks in advance for any pointers!
>=20
> Blair Barnett
>=20
Sandeep
