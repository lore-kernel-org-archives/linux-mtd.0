From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 12 Feb 2003 11:48:08 -0700
Subject: amd76xrom request_mem_region()
Message-ID: <1045075688.12666.79.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-qBARlOCu7isVqMIpl+lI
Content-Type: multipart/mixed; boundary="=-wMvL/cXXNY1soVYq3cuN"


--=-wMvL/cXXNY1soVYq3cuN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

There is a place in amd76xrom.c where request_mem_region() should be
called.  Eric Biederman disabled it because it fights with BIOS reserved
regions.  Unfortunately the balancing release_mem_region() calls were
not disabled.

This patch disables the release_mem_region() calls and comments the code
so that it is obvious that the #if statements are grouped together (a
style issue when #if 0 code disabling).  I have discussed this patch
with Eric and he likes it - hopefully he applies it to CVS.

The big reason I'm sending this in is that it fixes "Trying to free
nonexistent resource XXXXXXXX-XXXXXXXX" errors as well as some system
lock-ups when the amd76xrom module is removed.

--=20
Thayne Harbaugh
Linux Networx

--=-wMvL/cXXNY1soVYq3cuN
Content-Disposition: attachment;
	filename=linux-2.4.21-pre4-mtd_amd76x_request_mem_region.patch
Content-Type: text/plain; name=linux-2.4.21-pre4-mtd_amd76x_request_mem_region.patch;
	charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

--- linux-2.4.21-pre4.mtd.orig/drivers/mtd/maps/amd76xrom.c	2003-02-03 14:3=
5:13.000000000 -0700
+++ linux-2.4.21-pre4.mtd/drivers/mtd/maps/amd76xrom.c	2003-02-12 10:30:33.=
000000000 -0700
@@ -112,8 +112,11 @@
 	int i;
 	u32 rom_size;
=20
 	window =3D &rom_window[0];
-#if 0
+
+	/* removed because it fights with BIOS reserved regions */
+#define REQUEST_MEM_REGION 0
+#if REQUEST_MEM_REGION
 	while(window->size) {
 		if (request_mem_region(window->start, window->size, "amd76xrom")) {
 			break;
@@ -124,7 +128,7 @@
 		printk(KERN_ERR "amd76xrom: cannot reserve rom window\n");
 		goto err_out_none;
 	}
-#endif
+#endif /* REQUEST_MEM_REGION */
=20
 	/* Enable the selected rom window */
 	pci_read_config_byte(pdev, 0x43, &byte);
@@ -177,7 +185,9 @@
 err_out_iounmap:
 	iounmap((void *)(info->window_addr));
 err_out_free_mmio_region:
+#if REQUEST_MEM_REGION
 	release_mem_region(window->start, window->size);
+#endif /* REQUEST_MEM_REGION */
 err_out_none:
 	return -ENODEV;
 }
@@ -199,8 +209,10 @@
 	/* Disable writes through the rom window */
 	pci_read_config_byte(pdev, 0x40, &byte);
 	pci_write_config_byte(pdev, 0x40, byte & ~1);
-=09
+
+#if REQUEST_MEM_REGION
 	release_mem_region(info->window_start, info->window_size);
+#endif /* REQUEST_MEM_REGION */
 }
=20
 static struct pci_device_id amd76xrom_pci_tbl[] __devinitdata =3D {

--=-wMvL/cXXNY1soVYq3cuN--

--=-qBARlOCu7isVqMIpl+lI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+SpbofsBPTKE6HMkRAnzWAJwO6UjQs/YbGeUXg6G7TNbjlbc/MwCdGNC5
e3t4Y1sN/BUSVd/2GXWUJRc=
=x1ZB
-----END PGP SIGNATURE-----

--=-qBARlOCu7isVqMIpl+lI--
