Received: from mx1.acopia.com ([12.172.68.25])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bl9Mt-0005Hy-6b
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 12:46:00 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2004 12:45:40 -0400
Message-ID: <77A9CE908F115440B48104747E2534220D0930@email1.acopianet.com>
From: "Brad Goodman" <bgoodman@acopia.com>
To: <linux-mtd@lists.infradead.org>
Subject: 2.4.26 MTD Patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following patch prevents a kernel OOPS when a faulty MTD device
times-out,
due to a the cleanup in the error path being done twice.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D PATCH IS AS FOLLOWS =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--- orig/cfi_cmdset_0002.c      Thu Jul 15 12:31:42 2004
+++ cfi_cmdset_0002.c   Thu Jul 15 12:30:48 2004
@@ -6,6 +6,8 @@
  *
  * 2_by_8 routines added by Simon Munton
  *
+ * 7/15/2004 - Brad Goodman <bgoodman@acopia.com> Removed duplicate
cleanup from error path
+ *
  * This code is GPL
  *
  * $Id: cfi_cmdset_0002.c,v 1.62 2003/01/24 23:30:13 dwmw2 Exp $
@@ -549,11 +551,7 @@
                        }
                } else {
                        printk(KERN_WARNING "Waiting for write to
complete timed out in do_write_oneword.");       =20
-
-                       chip->state =3D FL_READY;
-                       wake_up(&chip->wq);
-                       cfi_spin_unlock(chip->mutex);
-                       DISABLE_VPP(map);
+
                        ret =3D -EIO;
                }
        }=20
 =20
--------------------------------------------------------
=20
DISCLAIMER:   The information contained in this e-mail is confidential =
and is intended solely for the review of the named addressee, and in =
conjunction with specific Acopia Networks business.  Any review, =
retransmission, dissemination or other use of, or taking of any action =
in reliance upon, this information by persons or entities other than the =
intended recipient is prohibited. If you are unable to treat this =
information accordingly, or are not the intended recipient, please =
notify us immediately by returning the e-mail to the originator. =20
