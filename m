Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190djX-0001dN-S6
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:36:37 +0100
Received: from ash.lnxi.com ([207.88.130.242])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 190PZD-0005aB-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 18:28:59 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Stefan Roese <stefan.roese@esd-electronics.com>
In-Reply-To: <EFEAIMDCOOOHIEPHDNFJAEECFEAA.stefan.roese@esd-electronics.com>
References: <EFEAIMDCOOOHIEPHDNFJAEECFEAA.stefan.roese@esd-electronics.com>
Message-Id: <1049217336.25948.101.camel@tubarao>
Mime-Version: 1.0
Date: 01 Apr 2003 10:15:36 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-7peW7cbrELP+BCnr6ZIC"
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Wacky JEDEC probes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7peW7cbrELP+BCnr6ZIC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-04-01 at 07:18, Stefan Roese wrote:
> Hi!
>=20
> I am trying to use "jedec_probe.c" on our ppc based board to support two
> different flash types (AMD AM29VL160xT and SSTI SST39LF160). Both are use=
d
> in 16bit mode. Since the SST flash is not really CFI compliant, I have to
> use jedec_probe, right?

BTW, it looks like you can simplify switch statement in your patch if
cfi->device_type is a good way to represent the byte width of a device.=20
Then again, the intention of cfi->device_type might be intended to be an
opaque symbol only and using it as a byte width value might be an abuse.

@@ -1171,9 +1229,25 @@
               "MTD %s(): check ID's in every block: %dx%d\n",
               __func__, blk_size, blocks );
=20
+       /*
+        * Don't check for ID in every block on SST devices.
+        */
+       if (cfi->mfr =3D=3D MANUFACTURER_SST)
+               blocks =3D 1;
+
        for ( blk =3D 0; blk < blocks; blk++ ) {
                mfr =3D cfi_read( map, blk * blk_size );
-               id  =3D cfi_read( map, blk * blk_size + 1 );
+               switch (cfi->device_type) {
+               case CFI_DEVICETYPE_X8:
+                       id  =3D cfi_read( map, blk * blk_size + 1 );
+                       break;
+               case CFI_DEVICETYPE_X16:
+                       id  =3D cfi_read( map, blk * blk_size + 2 );
+                       break;
+               case CFI_DEVICETYPE_X32:
+                       id  =3D cfi_read( map, blk * blk_size + 4 );
+                       break;
+               }
=20
                if ( cfi->mfr !=3D mfr || cfi->id !=3D id ) {
                        DEBUG( MTD_DEBUG_LEVEL3,


Could be changed to

@@ -1171,9 +1229,15 @@
               "MTD %s(): check ID's in every block: %dx%d\n",
               __func__, blk_size, blocks );
=20
+       /*
+        * Don't check for ID in every block on SST devices.
+        */
+       if (cfi->mfr =3D=3D MANUFACTURER_SST)
+               blocks =3D 1;
+
        for ( blk =3D 0; blk < blocks; blk++ ) {
                mfr =3D cfi_read( map, blk * blk_size );
-               id  =3D cfi_read( map, blk * blk_size + 1 );
+               id  =3D cfi_read( map, blk * blk_size + cfi->device_type
);

                if ( cfi->mfr !=3D mfr || cfi->id !=3D id ) {
                        DEBUG( MTD_DEBUG_LEVEL3,


--=20
Thayne Harbaugh
Linux Networx

--=-7peW7cbrELP+BCnr6ZIC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+ick3fsBPTKE6HMkRAg00AJwIvI6N6iMJt+kSCPFIL0uoKLDMCgCfYvq7
m1gzjtITrwJJrnOQQbsvAYs=
=Vk3o
-----END PGP SIGNATURE-----

--=-7peW7cbrELP+BCnr6ZIC--
