Received: from wproxy.gmail.com ([64.233.184.206])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1ColYY-0002kg-Ke
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 11:41:17 -0500
Received: by wproxy.gmail.com with SMTP id 55so453529wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 08:41:08 -0800 (PST)
Message-ID: <6934efce050112084111ef438c@mail.gmail.com>
Date: Wed, 12 Jan 2005 08:41:04 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Clarification on NOR technology.  Remember that the ability to run
code XIP is effectively a requirement for a NOR chip.  This means no
read errors can leave the chip.  I don't see this changing in the
foreseeable future.  Any read errors that do occur would probably be
caused by a failed/incomplete program.

We probably do want to be able to easily retire, reprogram, and/or
test those blocks/pages that get read errors.  That would have to be
done in the filesystem and the chip driver needs to be able report a
read error occured.

Any chance of being able store special files XIP in JFFS3?=20
Uncompressed aligned page sized chunks, etc.


,Jared



On Wed, 12 Jan 2005 09:15:42 +0000 (GMT), Artem B. Bityuckiy
<dedekind@infradead.org> wrote:
> Hi Joern,
>=20
> please, read the paper
> http://www.semicon.toshiba.co.jp/eng/prd/memory/doc/pdf/nand_applicationg=
uide_e.pdf
> I like this paper. I've just reread it and now I have no doubts that CRCs
> are required on NAND. :-)
>=20
> Shortly: errors are normal phenomena on NAND devices. Errors are mostly
> handled by NAND ECCs, but
> JFFS[23] MUST take care about failures and handle them properly. There
> are permanent and occasional
> errors exist. Blocks with permanent errors must be marked bad and it is
> good to recover data...
>=20
> On Tue, 11 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:
> > On Tue, 11 January 2005 12:29:33 +0000, Artem B. Bityuckiy wrote:
> > > Ferenc Havasi:
> > > >If I am right CRCs are not only against the effect of unclean reboot=
s
> > > >but also to handle flash errors. On NAND flashes the ECC handles thi=
s
> > > >problem but NOR doesn't have any error detection system.
> > >
> > > Joern Engel wrote:
> > > >So either we can make sure this case never happens, or we can't.  It
> > > >depends on the type of flash, for sure, and it may be pretty hard wi=
th
> > > >some types.  But if it doesn't work at all, the flash is broken,
> > > >period.
> > >
> > > Hi, that is really interesting, *why* do we need CRCs in JFFS2?
> > >
> > > Do we need CRC *only* to handle unclean reboots? If so, we may possib=
ly
> > > handle it another way, just putting some magic word at the end of nod=
e.
> > > Possibly, no need for CRC at all.
> > >
> > > Joern stands that if Flash got rotten, we *do not need* to do somethi=
ng
> > > special trying to recover data. Am I right?
> >
> > Pretty much.  Detecting the breakage is still a good thing, so we can
> > report an error.  There are non-embedded devices with flash and users
> > want to see the problem and replace their flash.  But apart from that,
> > don't try too hard to fix something that cannot be fixed.
> >
> > > I still think we need to do recovery in case of NAND, mark the rotten
> > > block bad and keep working, so we still need CRC. In case of NOR, we
> > > possibly should just report error and do nothing (we can't mark block=
 bad
> > > there). Do not know about ECC NOR.
> > >
> > > Comments?
> >
> > Ok, here is my approach.
> >
> > Claim: No mtd has problems with lost data due to bad blocks.  This is
> > a complete non-issue and jffs[23] doesn't care.
> >
> > "No" means that less than .001% (add or remove some digits, depending
> > on your needs) of all devices have this problem.  In those cases, the
> > system just won't work and will be replaced.  Business as usual.
> >
> > Now, if any particular flash doesn't match this requirement, the mtd
> > driver is supposed to mirror all blocks.  If either copy rots away,
> > the data can still be read back from the other block.  After GC, the
> > block can be marked as bad and everyone lives on happily ever after.
> >
> > Capacity is half the original, but that's better than losing
> > /sbin/init now and then, right?  And maybe the flash is cheap enough
> > that noone cares.
> >
> > Sane?
> >
> > > P.S. By the way, we could put CRCs at the end of blocks (*after* data=
) -
> > > in this case CRC well be extremely strong detecting unclean reboots, =
isn't
> > > it?
> >
> > Interesting idea.  Will make the code slightly messy, but it should be
> > worth it.
> >
> > J=F6rn
> >
> > --
> > Do not stop an army on its way home.
> > -- Sun Tzu
> >
>=20
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
