Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Yylt-0003MB-Jh
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 02:56:57 +0100
From: Joshua Wise <joshua@joshuawise.com>
To: ebiederman@lnxi.com (Eric W. Biederman)
Date: Sat, 5 Jul 2003 21:57:04 -0400
References: <200307042232.43815.joshua@joshuawise.com>
	<200307051406.08109.joshua@joshuawise.com> <m3k7aw8sua.fsf@maxwell.lnxi.com>
In-Reply-To: <m3k7aw8sua.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200307052157.06325.joshua@joshuawise.com>
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: jedec_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Saturday 05 July 2003 7:19 pm, Eric W. Biederman wrote:
> > But IMHO it does a bad job of doing it. It needs to go through each chip
> > in order, and try each chip's unlock addresses in order, as opposed to
> > guessing at unlock addresses based on interleave and chip type.

Bah, I was just pissed off :), I meant go through each chip in the array.

> I would hate to get to the point where the order of the table entries
> matters.  Magic table orders are very hard to maintain properly, and
> very easy for one inattentive update to break.  jedec_probe does get
> a manufacturer id and a device id which makes it good enough that with
> a few refinements it should be able to handle this.  A better
> algorithm for selecting the unlock addresses is certainly desirable,
> and now we have a test case, where it actually matters.

Right. This is what I mean - jedec_probe cannot use the generic probing=20
functions that assume that we can query chips by doing something like Q/R/Y=
,=20
it instead should loop.

> cfi_private in this case is more badly named then anything.  It holds
> generic parameters that describe NOR flash devices.   The history
> is that the cfi code was written first with a generic infrastructure.

Right, right - I was just confused to hell and back :)

> And then it was realized that chips that implemented the older probe
> had the same set of requirements and the same set of commands, just
> a less convenient probe method, that does not provide all of the
> information needed to use a random flash chip.  Instead that
> information needs to be looked up in a table.

goto part_where_joshua_whines_about_using_generic_probing; // :)

> To clarify I meant things like the command set/chip drivers and the
> like.  In particular I meant a driver for sufficiently strange
> hardware can fill in a mtd_info structure with a fully custom set
> of methods and all of the upper layers will work.

Oh, interesting.

> Hmm.  I am surprised that this has problems as it looks like a pretty
> standard part.  But looking at the table of commands on page 19 it
> does appear that the standard guesses we make don't seem to line up.

Indeed, I got it working over JTAG with relatively little trouble (the main=
=20
issue being that to program, it must be used in word mode.)

> Does it work if you just hard code the address in jedec_probe_chip?
> Just to confirm which piece needs to get fixed.

I'd assume that it would. Is jedec_probe_chip used anywhere other than=20
jedec_probe?

> Eric
~joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/B4HwPn9tWOqA4LMRAvoRAJ0RQ4mXtk+FGIZIAfR1WsuBx2gYnwCfYTs3
xwZ1xpcJsyoyjO6HTFZnHIw=3D
=3DkoC6
=2D----END PGP SIGNATURE-----
