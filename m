From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 17 Mar 2003 11:38:39 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1047915630.11512.81.camel@tubarao>
References: <1047428715.11517.50.camel@tubarao>
 <20030312102735.U1745@brecis.com>  <1047915630.11512.81.camel@tubarao>
Message-ID: <1047926318.11517.235.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-S5ixrRaefhmMdHKqH2Zj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-03-17 at 08:40, Thayne Harbaugh wrote:
> On Wed, 2003-03-12 at 09:27, Steve Wahl wrote:

<snip>

> > I would wager you are running into the same problem I did, and that
> > your chips compatibly support DQ5, if not as a watchdog, at least by
> > holding it low while programming.
>=20
> I have sent email to PMC and the official response is that the _only_
> bits that reflect erase/write operation status are I/O7 and I/O6
> (effectively DQ7 and DQ6).  I/O7 is inverted data during the operation
> and I/O6 toggles.  The PMC response was that AMD status bits aren't
> supported.  In practice, however, DQ5 is low during erase/write
> operations.  I am uneasy about using undocumented features.

I have been thinking about the above mentioned problem with DQ5.  I have
not seen DQ5 behavior documented in the SST49LF040 and Pm49FL00x
documentation and suspect that other chip documentation is similar. =20

Regardless of the current behavior of status bit 5 on these chips I
think the documentation should be followed.  This means that either the
cfi_cmdset_0002 driver needs to be adapted to work with the "simplified"
polling in _addition_ to the current polling of DQ5 (some switch is
added to poll correctly for a given device) or a new cfi_cmdset_xxxx is
written specifically for this simplified command set.

I'm not sure what would be a nice, clean way to switch polling
mechanisms, but I hesitate to duplicate code for a nearly identical
cfi_cmdset.

Thoughts?

--=20
Thayne Harbaugh
Linux Networx

--=-S5ixrRaefhmMdHKqH2Zj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+dhYufsBPTKE6HMkRAipjAJ4iuyS+8gP8U0aVZGF6w6e8UpremgCeLWIv
U/MGKz16uCV6QGXIdA6tzfQ=
=SbBb
-----END PGP SIGNATURE-----

--=-S5ixrRaefhmMdHKqH2Zj--
