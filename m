From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 12 Feb 2003 10:55:20 -0700
Subject: sharp memory leak
Message-ID: <1045072520.12666.53.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-BfBk0IYlxh+VQXz9KroV
Content-Type: multipart/mixed; boundary="=-MkYg1kQBstDip6sOz9Tf"


--=-MkYg1kQBstDip6sOz9Tf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've been sitting on some patches for a while and have not sent them
in.  I saw Jorn send in the patch for the missing cfi_cmdset_0020 and
decided that I need to get my submissions in befor Jorn sends all of
them in.

Here's just one - it's a memory leak in the sharp driver.  It's not huge
and will likely never leak, but it needs to be there to balance the
kmalloc().

I'll send in the other patches separately.
--=20
Thayne Harbaugh
Linux Networx

--=-MkYg1kQBstDip6sOz9Tf
Content-Disposition: attachment; filename=linux-2.4.20-pre4-mtd_sharp_mem_leak.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=linux-2.4.20-pre4-mtd_sharp_mem_leak.patch;
	charset=ISO-8859-1

--- linux-2.4.20-pre4.mtd.orig/drivers/mtd/chips/sharp.c	2003-02-03 14:35:1=
3.000000000 -0700
+++ linux-2.4.20-pre4.mtd/drivers/mtd/chips/sharp.c	2003-02-03 12:12:56.000=
000000 -0700
@@ -116,8 +116,10 @@
 		return NULL;
=20
 	sharp =3D kmalloc(sizeof(*sharp), GFP_KERNEL);
-	if(!sharp)
+	if(!sharp) {
+		kfree(mtd);
 		return NULL;
+	}
=20
 	memset(mtd, 0, sizeof(*mtd));
=20

--=-MkYg1kQBstDip6sOz9Tf--

--=-BfBk0IYlxh+VQXz9KroV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+SoqHfsBPTKE6HMkRAnryAJ9BbRzV+EPpB0pleqg2kv9ZN30k5ACfRjqt
l/iGVYo6iDs2orh1tGMZgHg=
=s3Iz
-----END PGP SIGNATURE-----

--=-BfBk0IYlxh+VQXz9KroV--
