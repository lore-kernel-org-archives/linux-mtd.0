Date: Wed, 12 Jan 2005 09:15:42 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050111215102.GA6289@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joern,

please, read the paper=20
http://www.semicon.toshiba.co.jp/eng/prd/memory/doc/pdf/nand_applicationgui=
de_e.pdf
I like this paper. I've just reread it and now I have no doubts that CRCs=
=20
are required on NAND. :-)

Shortly: errors are normal phenomena on NAND devices. Errors are mostly=20
handled by NAND ECCs, but
JFFS[23] MUST take care about failures and handle them properly. There=20
are permanent and occasional
errors exist. Blocks with permanent errors must be marked bad and it is=20
good to recover data...

On Tue, 11 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:
> On Tue, 11 January 2005 12:29:33 +0000, Artem B. Bityuckiy wrote:
> > Ferenc Havasi:
> > >If I am right CRCs are not only against the effect of unclean reboots=
=20
> > >but also to handle flash errors. On NAND flashes the ECC handles this
> > >problem but NOR doesn't have any error detection system.=20
> >=20
> > Joern Engel wrote:
> > >So either we can make sure this case never happens, or we can't.  It
> > >depends on the type of flash, for sure, and it may be pretty hard with
> > >some types.  But if it doesn't work at all, the flash is broken,
> > >period.
> >=20
> > Hi, that is really interesting, *why* do we need CRCs in JFFS2?
> >=20
> > Do we need CRC *only* to handle unclean reboots? If so, we may possibly=
=20
> > handle it another way, just putting some magic word at the end of node.=
=20
> > Possibly, no need for CRC at all.
> >=20
> > Joern stands that if Flash got rotten, we *do not need* to do something=
=20
> > special trying to recover data. Am I right?
>=20
> Pretty much.  Detecting the breakage is still a good thing, so we can
> report an error.  There are non-embedded devices with flash and users
> want to see the problem and replace their flash.  But apart from that,
> don't try too hard to fix something that cannot be fixed.
>=20
> > I still think we need to do recovery in case of NAND, mark the rotten=
=20
> > block bad and keep working, so we still need CRC. In case of NOR, we=20
> > possibly should just report error and do nothing (we can't mark block b=
ad=20
> > there). Do not know about ECC NOR.
> >=20
> > Comments?
>=20
> Ok, here is my approach.
>=20
> Claim: No mtd has problems with lost data due to bad blocks.  This is
> a complete non-issue and jffs[23] doesn't care.
>=20
> "No" means that less than .001% (add or remove some digits, depending
> on your needs) of all devices have this problem.  In those cases, the
> system just won't work and will be replaced.  Business as usual.
>=20
> Now, if any particular flash doesn't match this requirement, the mtd
> driver is supposed to mirror all blocks.  If either copy rots away,
> the data can still be read back from the other block.  After GC, the
> block can be marked as bad and everyone lives on happily ever after.
>=20
> Capacity is half the original, but that's better than losing
> /sbin/init now and then, right?  And maybe the flash is cheap enough
> that noone cares.
>=20
> Sane?
>=20
> > P.S. By the way, we could put CRCs at the end of blocks (*after* data) =
-=20
> > in this case CRC well be extremely strong detecting unclean reboots, is=
n't=20
> > it?
>=20
> Interesting idea.  Will make the code slightly messy, but it should be
> worth it.
>=20
> J=F6rn
>=20
> --=20
> Do not stop an army on its way home.
> -- Sun Tzu
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
