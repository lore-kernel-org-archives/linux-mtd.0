Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19CmX5-0003pI-CC
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 21:25:55 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Michael Moedt <xemc@yahoo.com>
In-Reply-To: <20030505194227.60661.qmail@web13905.mail.yahoo.com>
References: <20030505194227.60661.qmail@web13905.mail.yahoo.com>
Message-Id: <1052166363.1172.11427.camel@tubarao>
Mime-Version: 1.0
Date: 05 May 2003 14:26:03 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-8C4YC4E97WncDQcHRGp7"
cc: linux-mtd@lists.infradead.org
Subject: Re: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8C4YC4E97WncDQcHRGp7
Content-Type: multipart/mixed; boundary="=-WdvGdG817spP08BuoxmO"


--=-WdvGdG817spP08BuoxmO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-05 at 13:42, Michael Moedt wrote:
> > > I'm getting the error message "Wacky! Unable to
> > > decode failure status".  See below:
> >=20
> > My guess is that you are using
> > divers/mtd/chips/cfi_cmdset_0002.c with a
> > revision earlier than 1.68 - please update to that
> > version.  If you
> > still have problems then send another email and I'll
> > look a bit closer.
>=20
> Thanks for the quick response!  I'm also looking at
> the  sheet.
> I am using 1.68. (last modified 04/21, by thayne.  =3D])

Good.

> As far as we can tell, it looks like the erase
> operation completes correctly, and we start reading
> the flash again, getting the erased value of 0xffff.
> (It is in 16-bit wide mode)

Correct - all prior "MTD do_erase_oneblock(): Check" messages indicate
that dq6 is toggling.

> The 'ones' variable that it compares the read values
> to is only an 8-bit 0xff.  I traced this back a
> little,  (the CMD macro in include/linux/mtd/cfi.h and
> the function right above it) and it keeps it as 8-bit
> even if it knows that it's x16.

The status should only be a single byte because the erase or write
(depending on the operation) is being sent to a single chip (not using
interlaced chips).  The final test value should be two bytes because you
are using the x16 mode.

> Should it be masking off only the lowest byte?

Nope - not for the final data verification.

Try the attached patch.

> __________________________________
> Do you Yahoo!?
> The New Yahoo! Search - Faster. Easier. Bingo.
> http://search.yahoo.com
--=20
Thayne Harbaugh
Linux Networx

--=-WdvGdG817spP08BuoxmO
Content-Disposition: attachment; filename=mtd_x16_erase.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=mtd_x16_erase.patch; charset=ISO-8859-1

diff -u -r1.68 cfi_cmdset_0002.c
--- drivers/mtd/chips/cfi_cmdset_0002.c	21 Apr 2003 23:26:25 -0000	1.68
+++ drivers/mtd/chips/cfi_cmdset_0002.c	5 May 2003 20:21:53 -0000
@@ -925,7 +931,16 @@
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
 	       __func__, oldstatus, status );
=20
-	ones =3D CMD( (__u8)~0 );
+	switch(CFIDEV_BUSWIDTH) {
+	case(CFIDEV_BUSWIDTH_1): ones =3D  (__u8)~0; break;
+	case(CFIDEV_BUSWIDTH_2): ones =3D (__u16)~0; break;
+	case(CFIDEV_BUSWIDTH_3): ones =3D (__u32)~0; break;
+	case(CFIDEV_BUSWIDTH_4): ones =3D (__u64)~0; break;
+	default:
+	        printk(KERN_WARNING "Unsupported buswidth\n");
+		goto erase_failed;
+	}
+	ones =3D CMD( ones );
 =09
 	if ( oldstatus =3D=3D ones && status =3D=3D ones ) {
 		/* success - do nothing */
@@ -1095,8 +1111,17 @@
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
 	       __func__, oldstatus, status );
=20
-	ones =3D CMD( (__u8)~0 );
-
+	switch(CFIDEV_BUSWIDTH) {
+	case(CFIDEV_BUSWIDTH_1): ones =3D  (__u8)~0; break;
+	case(CFIDEV_BUSWIDTH_2): ones =3D (__u16)~0; break;
+	case(CFIDEV_BUSWIDTH_3): ones =3D (__u32)~0; break;
+	case(CFIDEV_BUSWIDTH_4): ones =3D (__u64)~0; break;
+	default:
+	        printk(KERN_WARNING "Unsupported buswidth\n");
+		goto erase_failed;
+	}
+	ones =3D CMD( ones );
+=09
 	if ( oldstatus =3D=3D ones && status =3D=3D ones ) {
 		/* success - do nothing */
 		goto erase_done;

--=-WdvGdG817spP08BuoxmO--

--=-8C4YC4E97WncDQcHRGp7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+tsjbfsBPTKE6HMkRAhPSAJ4834MsgjtlNRCLr6PUK2f/sV/mMgCeIWiE
l65Y+hKhmi55KwUqngWEltc=
=pDkz
-----END PGP SIGNATURE-----

--=-8C4YC4E97WncDQcHRGp7--
