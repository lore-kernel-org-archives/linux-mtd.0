Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SS8Zk-0002Af-RT
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 15:13:16 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: RE: mtd oob test is failing consistently at same places in NAND flash
Date: Wed, 9 May 2012 15:12:05 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9366EF@DBDE01.ent.ti.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
 <20120508132354.GA16164@parrot.com>
 <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
 <20120508184516.GA16380@parrot.com>
In-Reply-To: <20120508184516.GA16380@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 09, 2012 at 00:15:16, Ivan Djelic wrote:
> On Tue, May 08, 2012 at 04:09:46PM +0100, Philip, Avinash wrote:
> > On Tue, May 08, 2012 at 18:53:54, Ivan Djelic wrote:
> > > On Tue, May 08, 2012 at 01:33:06PM +0100, Philip, Avinash wrote:
> > > > Hi,
> > > >=20
> > > > We are having an 8-bit NAND part (MT29F2G08ABAEAWP from Micron)=20
> > > > connected to GPMC Module (General purpose memory controller) from T=
I.
> > >=20
> > > Hi,
> > > How is ecc performed ?
> > > Using NAND internal ecc ? or with GPMC 1-bit Hamming ? 4-bit/8-bit BC=
H ?
> > > Which version of omap2 driver are you using ?
> > > Is OOB also ECC-protected ?
> >=20
> > Hardware ECC is performing.
> > 4-bit BCH ECC scheme is used.
> > I am using omap2 driver in Linux 3.2.0 Kernel. Don't know omap2 driver =
version.
>=20
> You are probably using a patched kernel, since 3.2.0 does not have GPMC B=
CH support ?!
> What is your ecc layout ? Does it expose oobfree regions ?
>

Yes, we had using patched kernel. OOB free region is exposed.

ECC layout will be as follows.

0-1	-> BAD block marking
2-57  -> ECC byte position, ( 14 bytes for 512 byte)
58-63 -> oob free bytes

mtd->ecclayout->eccbytes		=3D 56
mtd->ecclayout->eccpos[0]	=3D 2
mtd->ecclayout->oobavail		=3D 6
mtd->ecclayout->oobfree[0].offset	=3D 58
mtd->ecclayout->oobfree[0].length	=3D 6

Regards
Avinash

> > No, OOB is not ECC protected.
>=20
> Well, in that case, isn't it normal that mtd_oobtest should fail if there=
 happens to be a single bitflip in the available OOB area ? (of size mtd->e=
cclayout->oobavail for each page)
>
> BR,
> --
> Ivan
>=20
