Received: from fastmail.fm ([209.61.183.86] helo=www.fastmail.fm)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189S4Z-0003BR-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 15:26:28 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Date: Wed, 6 Nov 2002 15:56:31 UT
From: "Jeffrey Lim" <jfsworld@fastmail.fm>
To: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: MTD newbie wants programming a 28F800 with a 2.2.18 kernel
Message-Id: <20021106155631.CFAE92FD30@server4.fastmail.fm>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 6 Nov 2002 13:56:46 +0100, "Gettert, Wolfram"
<Wolfram.Gettert@fci.com> said:
>=20
> Do you try to tell me not to use the patch but getting the most recent
> MTD
> code from 2.5.x and get it running under 2.2.18?
> Perhaps it's just the easiest way? Of course I get the best MTD code.
>=20
>=20
> Wolfram
>=20

yes - why not? The CVS code is for the most part the best code to get,
since any corrections for any earlier code will be incorporated here.

Unless you're sure that you have something already working, or that the
CVS has a problem, you should always consider taking a look at the CVS...

-jf




> > -----Original Message-----
> > From: J=F6rn Engel [mailto:joern@wohnheim.fh-wedel.de]
> > Sent: Mittwoch, 6. November 2002 10:27
> > To: Gettert, Wolfram
> > Cc: 'linux-mtd@lists.infradead.org'
> > Subject: Re: MTD newbie wants programming a 28F800 with a=20
> > 2.2.18 kernel
> >=20
> > On Wed, 6 November 2002 09:25:25 +0100, Gettert, Wolfram wrote:
> > > I am completely new to MTD. My job is to program a 28F800=20
> > boot block flash
> > > running a 2.2.18 kernel.
> > > ...
> >=20
> > As always, bugging the company to finally upgrade to a recent kernel
> > is a good thing, although unrealistic. :-)
> >=20
> > Most of the mtd code in cvs should be running on any kernel from 2.2.0
> > up to 2.5.current. David has done an excellent job there. So you
> > should take a peek into cvs, whenever you have a problem.
> >=20
> > Apart from that, try to cut down on the number of #ifdefs, consider
> > sending a patch to David and good luck!
> >=20
> > J=F6rn
> >=20
> > --=20
> > Everything should be made as simple as possible, but not simpler.
> > -- Albert Einstein
> >=20

=20
--
  "It's an extraordinary world!" - jfsworld <at> fastmail.fm
=20
=20
