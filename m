Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 199CL0-00046w-Oo
	for <linux-mtd@lists.infradead.org>; Sat, 26 Apr 2003 00:10:39 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Alex Samoutin <samoutin@hotbox.ru>
In-Reply-To: <000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	 <20030423204440.258661528E@desire.actrix.co.nz>
	 <000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
	 <20030425130134.GC27144@wohnheim.fh-wedel.de>
	 <000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
Message-Id: <1051312243.1172.388.camel@tubarao>
Mime-Version: 1.0
Date: 25 Apr 2003 17:10:43 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-sEznoZ6QgKRaHlH2Q5ej"
cc: linux-mtd@lists.infradead.org
cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-sEznoZ6QgKRaHlH2Q5ej
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-04-25 at 16:23, Alex Samoutin wrote:
> > > cause. As I mentioned NAND driver (nand.c) has lock mechanism to prev=
ent
> > > this situation. But it doesn't work in my case. I don't know why - th=
e
> code
> > > look Ok. A added some additional locks and it solved this problem.

You added locks?

> >
> > Ah, sorry for me misinterpreting you original post. I thought, you had
> > found a problem in yaffs.
> >
> > Do you have a patch for this? Even if it is ugly and slow, correct
> > code is better than broken one.
> >
> This is diff file for drivers/mtd/nand.c  (I made to many changes to crea=
te
> a patch)
>=20
> 151a152,154
> > static struct semaphore sam;
> > #define NAND_WRITE_RETRY 1

Hmmm - looks like you have more than just locking - you also have some
retry logic for failed commands.

I'm jumping in because I have some chips that appear to be broken - they
occasionally drop operations (erase/write).  Eric Beiderman and I have
been through the code (specifically cfi_cmdset_0002.c) and can't find
anywhere that the software might be at fault.  Until I connect a logic
analyzer I can't be certain it's the hardware either - although none of
the other models of flash chip have this problem and everything points
to bad hardware.

Right now Eric and I are debating adding retry logic.  When a command is
"dropped" it seems to always succeed when sent a second time (don't have
any examples that failed on the second try).  I'm interested because
your situation seems to be related.  Is the problem that the chip
sometimes ignores a command?  Does your retry fix things?

The big question is how common is this problem (needing retries)?=20
Should this be more formalized and added to he chip drivers or should it
be left up to individuals having to fix things for their special or less
common cases?

--=20
Thayne Harbaugh
Linux Networx

--=-sEznoZ6QgKRaHlH2Q5ej
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+qcBzfsBPTKE6HMkRApMfAKCBdZf4Lujx6QHcvJ/2HcKqy3BycgCfY5yf
UQgOVPrTnFP+8SJx6Zow+1w=
=otfI
-----END PGP SIGNATURE-----

--=-sEznoZ6QgKRaHlH2Q5ej--
