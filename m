Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AvAL-0003YY-34
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 18:14:45 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Alex Samoutin <samoutin@hotbox.ru>
Message-Id: <1051722893.1171.3546.camel@tubarao>
Mime-Version: 1.0
Date: 30 Apr 2003 11:14:53 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-dG+b4zJgli4qDgXVG/OL"
cc: tglx@linutronix.de
cc: linux-mtd@lists.infradead.org
Subject: Broken Flash chips - Was Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-dG+b4zJgli4qDgXVG/OL
Content-Type: text/plain; charset=iso-8859-7
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-04-30 at 10:54, Alex Samoutin wrote:=20
> Hi Thayne,
>=20
>=20
>=20
> >I'm jumping in because I have some chips that appear to be broken - they
>=20
> >occasionally drop operations (erase/write)

> Yes I had absolutely the same problem. Some times first write command was
> ignored, but second always successful. However I have no problem with era=
se
> operations, only write some times was ignored.

Slightly different than mine (mine can fail erase and write), but still
a concern.

> (For Thomas) It=A2s not a bad H/W or incorrect timing. I=A2ve played with=
 timing
> and result was the same. Also I have 5 boards with Toshiba NAND chip and =
2
> of them are working fine without retry, but other 3 need retry for normal
> operation.

Slightly different than mine.  The only chips I have that "drop"
commands are SST 49LF040 (NOR).  I have several samples from different
batches and I have yet to see a single chip not drop a command in
several million operations - I haven't seen a single SST 49LF040 work
perfectly.  This is different than the other chips I have that work
perfectly through billions of operations.

What is the part number for the Toshiba NAND chip you have?

I'm trying to establish how many chips are erratic, if they have similar
problems, if retries will help all/some of the problems and where
retries should go.

The more reports and information, the better.

Thanks.

>=20
>=20
> Alex.

--=20
Thayne Harbaugh
Linux Networx

--=-dG+b4zJgli4qDgXVG/OL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+sASMfsBPTKE6HMkRAm6MAJ4ooTZkafXUD4+qNS4J0ZVNoQkNQACdFOtF
PNPNli96ANv1/oAyKl08yK8=
=Jl20
-----END PGP SIGNATURE-----

--=-dG+b4zJgli4qDgXVG/OL--
