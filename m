Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYeWg-00008P-PV
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 17:46:36 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Andrea Marson
 <andrea.marson@dave.eu>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Thu, 19 Mar 2015 17:45:48 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973EFD4@NTXBOIMBX03.micron.com>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu> <20150319101246.26806e95@bbrezillon>
In-Reply-To: <20150319101246.26806e95@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea
 Scian <rnd4@dave-tech.it>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,
You seem to have a pretty good understanding of NAND.  Now that I have a di=
agram, it will make this easier to explain.  Refer to page 8 of the present=
ation.  When we program and MLC device we program the Lower Page first.  In=
 a perfect world all bits would set to discrete values like -.5v and 2.0v, =
called Vt erased and Vt programmed.  But, in reality Vts end up in a distri=
bution, due to process, location of cell with a block, couplings, previous =
state of the cell, etc.  The diagram we are looking at is a representation =
of the distribution of all cells in the die, so if we programmed only the l=
ower page and measured the potential on all cells, they would fall into 2 d=
istributions around -.5v and 2.0v, I refer to them as L0 and L1.  L0 is def=
ined as erased, or 1h and L1 is defined as programmed or 0h.  And yes there=
 is a bit, to indicate if the middle or upper page is programmed.  Now, pro=
gram the middle page (this is MLC 2bits/cell btw).  First read the lower pa=
ge and get it's current value.  If the lower page of a cell is 1 and you wa=
nt to store a 1 in the upper page of the cell, then tighten the distributio=
n around -.5 and call this new L0.  If the lower page of the cell is 1 and =
you want to upper page to be 0, then move and tighten L0 to new L1.  If the=
 lower page is 0 and you want the upper page to be a 0, then add charge to =
L1 and tighten, call this new L2.  Finally if you lower page is 0 and you w=
ant the upper page to be 1 add a little more charge and tighten to the new =
L3.  Now if you could measure the potential of every cell in the array they=
 would fall into 4 tighter distributions, L0 to L3, representing all for co=
nditions. 00, 01, 10, 11. I'm not going to go into the TLC, just follow the=
 arrows. =20

If you have a power loss during a program, only the page you're programming=
 gets affected, not all distributions.  The programming process is designed=
 to make it easier to recover the lower page if there's a power loss while =
programming the upper page.  =20

These guys have a pretty good explaination.  http://www.supertalent.com/dat=
asheets/SLC_vs_MLC%20whitepaper.pdf=20

Hope this helps.

Jeff Lauruhn
NAND Application Engineer


-----Original Message-----
From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]=20
Sent: Thursday, March 19, 2015 2:13 AM
To: Andrea Marson
Cc: Jeff Lauruhn (jlauruhn); linux-mtd@lists.infradead.org; Andrea Scian; R=
ichard Weinberger; dedekind1@gmail.com
Subject: Re: RFC: detect and manage power cut on MLC NAND

On Thu, 19 Mar 2015 09:47:21 +0100
Andrea Marson <andrea.marson@dave.eu> wrote:

> > Disturb is a block level affect, as long as partition A and B are in di=
fferent blocks there will be no disturb between them.   Disturbs, does not =
damage cells; ERASE returns cells to undisturbed levels.
> I think there are two options here: MTD partitioning and UBI=20
> partitioning. AFAIK one should prefer UBI partitioning to preserve=20
> device-wide wear leveling. Boris, am I right?

Both of them act at block level, meaning that your the partition size must =
be a multiple of the block size (logical block size in case of UBI volume a=
nd physical block size in case of MTD partition).
IOW, you shouldn't bother whether you're using UBI on top of MTD or directl=
y using MTD partitions, both are immune to cross partition/volume read/writ=
e disturbance.


>=20
> > Officially I would say don't use SLC emulation, but technically I know =
what your doing.   The reason I say no is because we have very precise reci=
pes designed to create very tight distibutions, and although the first pass=
 distributions might look like an SLC, they are really designed with the ex=
pectation of the upper page being programmed.  Not a true SLC.
> > With MLC lithography of 25 nm and less  the difference between each lev=
el (L0, L1, L2 and L3) is just a few 10's of electrons.  The distribution h=
ave to be very tight, in order to meet retention requirements.
> This is quite interesting, however I'm afraid I have not fully=20
> understood it.

Me neither :-/.

> Let me try to rephrase it. Please correct me if I'm wrong.
>=20
> 1) Technically speaking, it is possible to use an MLC memory in SLC=20
> mode, even if this is not recommended because MLC is not designed for=20
> this usage.

That's what I understood, but I'm not sure to understand the constraints br=
ought by SLC mode (only programming one of the paired pages).
Jeff, Are you trying to explain what's described here [1] in slide 8 (BTW I=
'm not sure to understand this diagram).
If that's the case, could you explain us, how the NAND chip knows which thr=
eshold should be used (does it somehow store the information of which page =
has already been programmed)

[1]http://www.bswd.com/FMS09/FMS09-T2A-Grunzke.pdf

--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
