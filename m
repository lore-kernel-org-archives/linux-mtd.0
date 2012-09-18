Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TDmc3-0002m6-FM
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2012 01:28:33 +0000
Date: Mon, 17 Sep 2012 20:28:17 -0500
From: Scott Wood <scottwood@freescale.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <CAN8TOE9QCnq7AKT9t8VKc2iQE9VXT7USDQjJ7vR640FMweqJDQ@mail.gmail.com>
 (from computersforpeace@gmail.com on Mon Sep 17 20:06:54 2012)
Message-ID: <1347931697.19543.24@snotra>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; delsp=Yes; format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/17/2012 08:06:54 PM, Brian Norris wrote:
> Hi Shmulik, Matthieu, and others,
>=20
> On Mon, Aug 6, 2012 at 3:21 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Wed, Jul 25, 2012 at 4:02 AM, Shmulik Ladkani
> >> I guess utilizing badblockbits may provide good coverage to that
> >> condition.
> >
> > Yes, I agree that badblockbits is a good solution. I'm still not =20
> sure
> > that any of the above arguments really suggest that we *can't* apply
> > ECC, but for any important case, badblockbits would be more robust. =20
> I
> > think I will look into fleshing out Matthieu's RFC at some point,
> > unless he's already working on it.
>=20
> I've done a little work at trying to flesh out this RFC, as I'm
> thinking that we should more cleanly separate NAND BBT code and NAND
> BBM code - i.e., bad block *table* vs. bad block *marker*. Markers
> should be handled in a standard way in nand_base.c
> (nand_default_block_markbad and nand_block_bad) and then nand_bbt.c
> can be left the generic, focused job of handling the table. Now, that
> all sounds nice, but I've run across at least one difficulty... This
> approach should lead to the removal of nand_chip.badblock_pattern
> entirely, as we would only be supporting the nand_base.c badblock
> marker pattern, using nand_chip.badblockpos and a few
> nand_chip.bbt_options flags. This leads me to analyzing all the
> strange forms of badblock_pattern seen in various drivers. I'm not
> sure all of them are even well thought out...
>=20
> The following files use badblock_pattern to varying degrees. Some are
> just duplicating some nand_base stuff, where we can replace the
> badblock_pattern with something simple like "chip->badblockpos =3D 0" or
> setting a few "chip->bbt_options |=3D NAND_BBT_SCAN*" options. But it's
> not all so simple:
>=20
> arch/arm/mach-pxa/corgi.c
> arch/arm/mach-pxa/eseries.c
> arch/arm/mach-pxa/poodle.c
> arch/arm/mach-pxa/spitz.c
> arch/arm/mach-pxa/tosa.c
> drivers/mtd/nand/bcm_umi_nand.c
> drivers/mtd/nand/docg4.c
> drivers/mtd/nand/fsl_elbc_nand.c
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> drivers/mtd/nand/nand_base.c
> drivers/mtd/nand/omap2.c
> drivers/mtd/nand/sh_flctl.c
> drivers/mtd/nand/sharpsl.c
> drivers/mtd/nand/tmio_nand.c
> drivers/mtd/onenand/onenand_bbt.c
> include/linux/mfd/tmio.h
> include/linux/mtd/sharpsl.h
>=20
> Any thoughts on how to tackle this? Or is it even worth doing
> properly? Is there a policy for dealing with old/unmaintained drivers
> here, if I can't get a response from driver authors?

fsl_elbc_nand uses this for historical reasons, to retain compatibility =20
with the original OOB layout which only reserved one byte for the bad =20
block marker and let users write to the second byte.  This controller =20
only supports 8-bit chips.

See commit 97ae023648e764f794ffb9c52da109d6caf09c47

-Scott=
