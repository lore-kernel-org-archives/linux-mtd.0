Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AA8z-0004oA-8Z
	for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2003 16:02:13 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20030426102323.GB31391@wohnheim.fh-wedel.de>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	 <20030423204440.258661528E@desire.actrix.co.nz>
	 <000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
	 <20030425130134.GC27144@wohnheim.fh-wedel.de>
	 <000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
	 <1051312243.1172.388.camel@tubarao>
	 <20030426102323.GB31391@wohnheim.fh-wedel.de>
Message-Id: <1051542140.1171.500.camel@tubarao>
Mime-Version: 1.0
Date: 28 Apr 2003 09:02:20 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-KrgmreatRyT8M5+aRI44"
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KrgmreatRyT8M5+aRI44
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-04-26 at 04:23, J=F6rn Engel wrote:
> On Fri, 25 April 2003 17:10:43 -0600, Thayne Harbaugh wrote:
> >=20
> > The big question is how common is this problem (needing retries)?=20
> > Should this be more formalized and added to he chip drivers or should i=
t
> > be left up to individuals having to fix things for their special or les=
s
> > common cases?
>=20
> This looks more like an implementation problem. If you manage to add
> retry code somewhere central

Any suggestion where somewhere central is?  Right now I've been playing
with it down in the cmdset code - hardly a central place.  I'll have to
look at the mtdchar.c or something.  The nice thing about the cmdsets is
that they are the best place to retry an individual command - especially
individual writes.

> so that all drivers benefit from it,

Agreed - why do the work in each command set - duplicate code issues.

> there should hardly be a performance hit, even for drivers that don't
> need it.

The performance hit is very small - loop while a counter is less than a
set maximum test - compared to the time of a command (erase/write).

> And once in a central place, it would be trivial to add a
> config option for this.

Agreed.

> But someone has to do it. :)
>=20
> J=F6rn

The whole thing just makes me sick.  It's ugly putting in such a hack.=20
One little voice in my head keeps telling me that there's an error in
software and I just have to find and fix the bug.  Another little voice
in my head keeps telling me that broken hardware is more common than
most people want to believe.

I haven't been very aggressive about adding the retry code because right
now I'm interested in more data points: Am I the only one that sees the
problem of a flash chip that occasionally drops commands or are others
seeing this same problem?  Is this problem more common but people don't
see it because the flash filesystems think that a location is bad and
mark it as unusable?

I'm more than happy to do the work if others think it's a good thing and
if someone has a suggestion where/how it should be done.

--=20
Thayne Harbaugh
Linux Networx

--=-KrgmreatRyT8M5+aRI44
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+rUJ7fsBPTKE6HMkRAgtkAJ9GW0GOudmQtk//Ym0JaA1QXf0aawCfYr/a
XZWUgdzK3XpOAjREvKCc2vo=
=4AU9
-----END PGP SIGNATURE-----

--=-KrgmreatRyT8M5+aRI44--
