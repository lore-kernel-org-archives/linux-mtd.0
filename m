Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SS96q-0003ZI-DI
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 15:48:01 +0000
From: "Philip, Avinash" <avinashphilip@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: RE: mtd oob test is failing consistently at same places in NAND flash
Date: Wed, 9 May 2012 15:46:17 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E936732@DBDE01.ent.ti.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
 <20120508132354.GA16164@parrot.com>
 <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
 <20120508184516.GA16380@parrot.com>
 <518397C60809E147AF5323E0420B992E3E9366EF@DBDE01.ent.ti.com>
 <20120509152437.GA12280@parrot.com>
In-Reply-To: <20120509152437.GA12280@parrot.com>
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

On Wed, May 09, 2012 at 20:54:37, Ivan Djelic wrote:
> On Wed, May 09, 2012 at 04:12:05PM +0100, Philip, Avinash wrote:
> > On Wed, May 09, 2012 at 00:15:16, Ivan Djelic wrote:
> > > On Tue, May 08, 2012 at 04:09:46PM +0100, Philip, Avinash wrote:
> > > > On Tue, May 08, 2012 at 18:53:54, Ivan Djelic wrote:
> > > > > On Tue, May 08, 2012 at 01:33:06PM +0100, Philip, Avinash wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > We are having an 8-bit NAND part (MT29F2G08ABAEAWP from=20
> > > > > > Micron) connected to GPMC Module (General purpose memory contro=
ller) from TI.
> > > > >=20
> > > > > Hi,
> > > > > How is ecc performed ?
> > > > > Using NAND internal ecc ? or with GPMC 1-bit Hamming ? 4-bit/8-bi=
t BCH ?
> > > > > Which version of omap2 driver are you using ?
> > > > > Is OOB also ECC-protected ?
> > > >=20
> > > > Hardware ECC is performing.
> > > > 4-bit BCH ECC scheme is used.

One correction: we are using 8-bit BCH ECC scheme is used.

> > > > I am using omap2 driver in Linux 3.2.0 Kernel. Don't know omap2 dri=
ver version.
> > >=20
> > > You are probably using a patched kernel, since 3.2.0 does not have GP=
MC BCH support ?!
> > > What is your ecc layout ? Does it expose oobfree regions ?
> > >
> >=20
> > Yes, we had using patched kernel. OOB free region is exposed.
> >=20
> > ECC layout will be as follows.
> >=20
> > 0-1	-> BAD block marking
> > 2-57  -> ECC byte position, ( 14 bytes for 512 byte)
> > 58-63 -> oob free bytes
> >=20
> > mtd->ecclayout->eccbytes		=3D 56
> > mtd->ecclayout->eccpos[0]	=3D 2
> > mtd->ecclayout->oobavail		=3D 6
> > mtd->ecclayout->oobfree[0].offset	=3D 58
> > mtd->ecclayout->oobfree[0].length	=3D 6
> >=20
>=20
> OK, then it is quite normal that mtd_oobtest should fail when it encounte=
rs a bitflip (one that does not match the programmed data) in those unprote=
cted 6 bytes (58-63). What do you think ?


Is this behavior is expected for which OOB area left unprotected?
(I am not sure, What I understood is with failure in OOB area, ECC won't be=
 useful.
Is it ideally we should have ECC protection for OOB area also required?)

Basically I am testing why bit flips is happening in OOB area. Some observa=
tion related
to mtd_oob test in the setup we are having is
1. Modify mtd_oob test to write patterns (0x0, 0x55, 0xAA, 0xff), then test=
 is getting passed
for all patterns.
2. On inserting a delay of 10 ms after erase_whole_device() in mtd oob test=
, test is getting passed.

I can't correlate how test is getting passed on modifying pattern as we are=
 covering all bits in
either of the patterns.

On inserting delay test is getting passed, will point to me some problems i=
n command issue. I am
debugging on this.

Any suggestions will be helpful.

Thanks
Avinash
