Received: from [212.209.10.221] (helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9RAU-0007Sg-81
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 16:33:02 +0100
Received: from exgate.se.axis.com (exgate.se.axis.com [10.0.5.55])
	h9EFVRFS023524
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 17:31:27 +0200
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 14 Oct 2003 17:31:26 +0200
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
From: =?iso-8859-1?Q?Magnus_M=E5rtensson?= <magnus.martensson@axis.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: word line disturbance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.
I had a discussion with flash manufacturer Atmel last week regarding a =
phenomenon that we had seen.=20
The phenomenon was called "word line disturbance" and it could occur if =
you tried to program only ones
to a location that already contained ones. The result could be that some =
bit on another address got tainted. Ex
writing 0xffff to address A could result in the content on address B =
changing from 0xffff to 0xfffe.

Anyway I thought of a software fix to this problem. Since it is =
unnecessary to write
ones to a place in flash where there already are only ones and since =
ones is the default bit state after an erase operation you
should simply skip that write. In our case this fix has also resulted in =
improvement in performance since we support firmware upgrades
over ftp and the firmware image is padded with 0xffff. The patch can be =
seen below (diff to 2.4.22 kernel).

Regards
/Magnus=20

Index: cfi_cmdset_0002.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: linux/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.1.1.4
diff -u -r1.1.1.4 cfi_cmdset_0002.c
--- cfi_cmdset_0002.c	17 Jun 2003 10:42:58 -0000	1.1.1.4
+++ cfi_cmdset_0002.c	14 Oct 2003 15:20:07 -0000
@@ -463,6 +463,12 @@
 	DECLARE_WAITQUEUE(wait, current);
 	int ret =3D 0;
=20
+	/* Dont't write ones to a location that already contain ones. */=09
+	if ((cfi_buswidth_is_1() && (datum =3D=3D 0xff)) ||=20
+	    (cfi_buswidth_is_2() && (datum =3D=3D 0xffff)) ||=20
+	    (cfi_buswidth_is_4() && (datum =3D=3D 0xffffffff)))=20
+		return ret;
+
  retry:
 	cfi_spin_lock(chip->mutex);
=20
Index: amd_flash.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: linux/drivers/mtd/chips/amd_flash.c,v
retrieving revision 1.1.1.5
diff -u -r1.1.1.5 amd_flash.c
--- amd_flash.c	17 Jun 2003 10:42:58 -0000	1.1.1.5
+++ amd_flash.c	14 Oct 2003 15:20:07 -0000
@@ -895,6 +895,12 @@
 	int ret =3D 0;
 	int times_left;
=20
+	/* Dont't write ones to a location that already contain ones. */
+	if (((map->buswidth =3D=3D 1) && (datum =3D=3D 0xff)) ||
+	    ((map->buswidth =3D=3D 2) && (datum =3D=3D 0xffff)) ||
+	    ((map->buswidth =3D=3D 4) && (datum =3D=3D 0xffffffff)))=20
+		return ret;
+
 retry:
 	spin_lock_bh(chip->mutex);
