Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NhkT-0006V0-8h
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 00:32:53 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: carolyn.j.smith@exgate.tek.com
In-Reply-To: <212D7E61C1F7D511B9270002A507DE7D24B635@us-bv-m10.bv.tek.com>
References: <212D7E61C1F7D511B9270002A507DE7D24B635@us-bv-m10.bv.tek.com>
Message-Id: <1054769574.1135.247.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 04 Jun 2003 17:32:54 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-KMCKU0QHGjoqF74Rkd1C"
cc: linux-mtd@lists.infradead.org
Subject: RE: 4 AM29LV800B's in 16-bit mode?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KMCKU0QHGjoqF74Rkd1C
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-06-04 at 13:26, carolyn.j.smith@exgate.tek.com wrote:
> >wich version of jedec_probe.c, v1.26 or later?
>=20
> Yes, I'm using version 1.26 of jedec_probe.c.

We're at least looking at the same code.

> I've attached the debug messages for both buswidth 4 and 8 and with and
> without your suggested change below. It still does not seem to work.

Grrr!  Time to get out The Big Stick (TM) and beat it into submission.
=20
> We have also recently found a schematic for the board and are suspicious
> that perhaps the address lines to the flash chips are wired wrong.

If it's wired wrong then it really gets ugly.  It might be fixable in
software if one understands how it's incorrectly wired.  Unfortunately I
wouldn't be able to spend much time on it if it's broken hardware -
you'd be on your own.

> I suspect
> this might explain why it sort of works with buswidth set to 4. I'm going=
 to
> pursue this for a bit unless you can suggest something else.

Let me know what you find out.

> Thanks,
> Carolyn
>=20
>=20
> -------------------------------------------------------------------------=
---
> ----------------
>=20
> This was with buswidth 8.
>=20
> sbc8240:Probing 0x00400000 at 0xff000000

Make sure that this is the correct size (0x00400000 =3D=3D 4Mib which is
likely correct for 4 chips of 2 bytes x 512 Ki) and the correct window
and address in the window - otherwise the ID addresses won't be correct.
Somehow I think that 0xff000000 should be something more like
0xffc00000.  Unfortunately I don't have the sbc8240 driver code to find
out what is really going on with the address printed.

> jedec_probe_chip numchips 0 device_type 2 buswidth 8 interleave 4

This looks good to me: no chips have been previously probed, and it is
looking for four x16 chips for a 64bit data bus.

> Search for id:(2020 ffff) interleave(4) type(2)
> Search for id:(2020 ffff) interleave(4) type(2)
> Search for id:(2020 ffff) interleave(4) type(2)

Two addresses, 0x00 and 0x01, are being read and we're not getting the
expected 0x0001 and 0x22DA or 0x225B.=20

> JEDEC: Found no sbc8240 Flash Bank #1 device at location zero
>=20
> This was with buswidth 8 and your suggested change to jedec_probe_chip.
>=20
> sbc8240:Probing 0x00400000 at 0xff000000
> jedec_probe_chip numchips 0 device_type 2 buswidth 8 interleave 4
> Search for id:(2020 ffff) interleave(4) type(2)
> Search for id:(2020 ffff) interleave(4) type(2)
> Search for id:(2020 ffff) interleave(4) type(2)
> JEDEC: Found no sbc8240 Flash Bank #1 device at location zero

No behavior change - there might be multiple problems.

> This was with buswidth 4.
>=20
> sbc8240:Probing 0x00400000 at 0xff000000
> jedec_probe_chip numchips 0 device_type 2 buswidth 4 interleave 2
> Search for id:(2020 2020) interleave(2) type(2)
> Search for id:(2020 2020) interleave(2) type(2)
> Search for id:(2020 2020) interleave(2) type(2)
> jedec_probe_chip numchips 0 device_type 1 buswidth 4 interleave 2
> Search for id:(20 69) interleave(2) type(1)
> Search for id:(20 69) interleave(2) type(1)
> Search for id:(20 69) interleave(2) type(1)
> jedec_probe_chip numchips 0 device_type 2 buswidth 4 interleave 4
> Search for id:(01 22da) interleave(4) type(2)
> MTD jedec_match(): Check fit 0x00000000 + 0x00100000 =3D 0x00100000

There's a bug here.  The fit checking should multiply by the
interleave.  This, however, isn't likely responsible for the problem.

--- jedec_probe.c	2003-06-02 17:17:28.000000000 -0600
+++ jedec_probe.fit.c	2003-06-04 17:44:54.000000000 -0600
@@ -1480,7 +1480,7 @@
 	DEBUG( MTD_DEBUG_LEVEL3,
 	       "MTD %s(): Check fit 0x%.8x + 0x%.8x =3D 0x%.8x\n",
 	       __func__, base, 1 << finfo->DevSize, base + (1 <<
finfo->DevSize) );
-	if ( base + ( 1 << finfo->DevSize ) > map->size ) {
+	if ( base + cfi->interleave * ( 1 << finfo->DevSize ) > map->size ) {
 		DEBUG( MTD_DEBUG_LEVEL3,
 		       "MTD %s(): 0x%.4x 0x%.4x %dKiB doesn't fit\n",
 		       __func__, finfo->mfr_id, finfo->dev_id,

> MTD jedec_match(): 5 check unlock addrs 0x0aaa 0x0555
> MTD jedec_match(): 0x0555 0x02aa did not match
> Search for id:(01 22da) interleave(4) type(2)
> MTD jedec_match(): Check fit 0x00000000 + 0x00100000 =3D 0x00100000
> MTD jedec_match(): 5 check unlock addrs 0xaaaa 0x5555
> MTD jedec_match(): 0x0555 0x02aa did not match
> Search for id:(2020 ffff) interleave(4) type(2)
> jedec_probe_chip numchips 0 device_type 1 buswidth 4 interleave 4
> Search for id:(20 20) interleave(4) type(1)
> Search for id:(20 20) interleave(4) type(1)
> Search for id:(20 20) interleave(4) type(1)
> JEDEC: Found no sbc8240 Flash Bank #1 device at location zero
>=20
> This was with buswidth 4 and your suggested change to jedec_probe_chip.
>=20
> sbc8240:Probing 0x00400000 at 0xff000000
> jedec_probe_chip numchips 0 device_type 2 buswidth 4 interleave 2
> Search for id:(2020 2020) interleave(2) type(2)
> Search for id:(2020 2020) interleave(2) type(2)
> Search for id:(2020 2020) interleave(2) type(2)
> jedec_probe_chip numchips 0 device_type 1 buswidth 4 interleave 2
> Search for id:(20 69) interleave(2) type(1)
> Search for id:(20 69) interleave(2) type(1)
> Search for id:(20 69) interleave(2) type(1)
> jedec_probe_chip numchips 0 device_type 2 buswidth 4 interleave 4
> Search for id:(2020 ffff) interleave(4) type(2)
> Search for id:(2020 ffff) interleave(4) type(2)
> Search for id:(2020 ffff) interleave(4) type(2)
> jedec_probe_chip numchips 0 device_type 1 buswidth 4 interleave 4
> Search for id:(20 20) interleave(4) type(1)
> Search for id:(20 20) interleave(4) type(1)
> Search for id:(20 20) interleave(4) type(1)
> JEDEC: Found no sbc8240 Flash Bank #1 device at location zero


Weird.  Is there a way I can look at the sbc8240 driver source?  What
have you found with the hardware wiring?  Maybe try changing the fit
checking section in jedec_match() so that it multiplies the device size
by the interleave number (It's possible this might help).

--=20
Thayne Harbaugh
Linux Networx

--=-KMCKU0QHGjoqF74Rkd1C
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+3oGlfsBPTKE6HMkRAgkeAJ0TZyiQUkLQMNsT3gvZ1HQ81QKi4wCdGO7H
D3xzrB7G73kmPR8Z7yu/35k=
=ROfm
-----END PGP SIGNATURE-----

--=-KMCKU0QHGjoqF74Rkd1C--
