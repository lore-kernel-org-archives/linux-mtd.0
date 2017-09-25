Received: from mail-co1nam03on0628.outbound.protection.outlook.com
 ([2a01:111:f400:fe48::628]
 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwMso-0007RP-LH
 for linux-mtd@lists.infradead.org; Mon, 25 Sep 2017 06:28:49 +0000
From: Mathias Thore <Mathias.Thore@infinera.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: Regression for NOR flash with multiple erase block regions
Date: Mon, 25 Sep 2017 06:28:18 +0000
Message-ID: <a1416ffa136946f4bc6006324315ffb1@sv-ex13-prd1.infinera.com>
References: <4762f230bbd3437990b9f5baa61ab095@sv-ex13-prd1.infinera.com>
 <74af973f5ae542c3b53240c95949628c@svr-chch-ex1.atlnz.lc>
 <20170922220455.04f89f08@bbrezillon>
In-Reply-To: <20170922220455.04f89f08@bbrezillon>
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

> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: den 22 september 2017 22:05
>=20
> On Fri, 22 Sep 2017 18:27:42 +0000
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
>=20
> > Hi Mathias,
> >
> > On 23/09/17 01:12, Mathias Thore wrote:
> > > Hello,
> > >
> > > Commit 1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 included in Linux
> 4.13 (
> > >
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/d
> rivers/mtd/mtdpart.c?h=3Dv4.13&id=3D1eeef2d7483a7e3f8d2dd2a5b9939b3b814
> dc549
> > > ) introduces a regression for NOR flash with multiple erase block
> > > regions of different sizes.
> > >
> > > Only the largest erase block size seems to be considered when
> > > determining if partitions are aligned. Partitions in smaller regions
> > > will be mounted as read-only. With Linux 4.12 and earlier, read/write
> > > access was available for these partitions.
>=20
> I don't understand how this could work before this patch? I mean, we
> were previously using mtd_mod_by_eb() to check part alignment and
> this functions is just returning the remainder of the off / erasesize
> division. So, assuming the erasesize of your NOR did not change
> between 4.12 and 4.13, I don't see how this commit could cause the
> regression you're describing here.

Looking at the earlier code, in the call to mtd_mod_by_eb, the parameter is=
 slave->mtd. The slave mtd struct holds the correct erase size. The new cod=
e uses wr_alignment for all alignment tests, which comes from master/parent=
, and seems to always hold the largest possible erase size.

The flash in question has 4 erase blocks of size 0x8000 at the start, and t=
hen the rest of the erase blocks are size 0x20000. Here is some data from t=
races I added around the point of failure:

0x000000000000-0x000000008000 : "XYZ"
dbg: wr_alignment 0x00020000
dbg: parent->flags & MTD_NO_ERASE =3D 0
dbg: parent->writesize 0x00000001
dbg: parent->erasesize 0x00020000
dbg: slave->mtd.writesize 0x00000001
dbg: slave->mtd.erasesize 0x00008000
dbg: slave->offset 0x0000000000000000
dbg: slave->mtd.size 0x0000000000008000
dbg: remainder (start) 0x00000000
dbg: remainder (end) 0x00008000
mtd: partition "XYZ" doesn't end on an erase/write block -- force read-only

>=20
> Maybe MTD_NO_ERASE is set on your NOR, and ->writesize is used in place
> of ->erasesize to check the alignment, but ->writesize is normally set
> to 1 on NOR devices, so again, no real reasons for this failure.
> >
> > Sorry about that. I think a fix would be to re-calculate the
> > wr_alignment as we're looking at each erase block. Unfortunately I'm
> > about to get on a plane for 13 hours so I'm pretty much a write off for
> > the next couple of days.
> >
> > I'll take a look when I get back on-line unless Boris beats me to it.
