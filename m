Received: from dns.chez-thomas.org ([63.225.98.241] helo=hermes.chez-thomas.org)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g6gX-0007PK-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 17:16:37 +0000
From: Gary Thomas <gary@mlbassoc.com>
To: linux-mtd@lists.infradead.org
Date: 04 Feb 2003 10:16:03 -0700
Message-Id: <1044378963.20752.2065.camel@hermes.chez-thomas.org>
Mime-Version: 1.0
Subject: Small change in RedBoot partition scanning
Content-Type: multipart/mixed; boundary="=-JDUZNahz7YVZmjWlEJeC"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--=-JDUZNahz7YVZmjWlEJeC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've run across a platform where the current code that scans
the RedBoot FIS partitions gets confused.  This is because it
has to deduce the base address of the FLASH segment and in this
case, it gets it wrong.  My solution (attached patch) is to provide
enough additional information via the 'map_info' structure to
allow the scanning code to succeed.  This solution has minimal
impact as current users of the parse_redboot_partitions() function
will not need to change, and any future cases can easily be handled.

If this passes muster, I'd like to see this change made.

Of course, I'm open to any discussion about this, how to improve
it, etc.

Thanks.

-- 
------------------------------------------------------------
Gary Thomas                 |
MLB Associates              |  Consulting for the
+1 (970) 229-1963           |    Embedded world
http://www.mlbassoc.com/    |
email: <gary@mlbassoc.com>  |
gpg: http://www.chez-thomas.org/gary/gpg_key.asc
------------------------------------------------------------

--=-JDUZNahz7YVZmjWlEJeC
Content-Disposition: attachment; filename=diffs
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=diffs; charset=ISO-8859-1

Index: include/linux/mtd/map.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/gthomas/my_cvs/develop/linux/include/linux/mtd/map.h,v
retrieving revision 1.2
diff -u -5 -p -r1.2 map.h
--- include/linux/mtd/map.h	1 Feb 2003 16:16:31 -0000	1.2
+++ include/linux/mtd/map.h	4 Feb 2003 17:04:34 -0000
@@ -57,10 +57,13 @@ struct map_info {
 	   two longs, turn the second into a pointer. dwmw2 */
 	unsigned long map_priv_1;
 	unsigned long map_priv_2;
 	void *fldrv_priv;
 	struct mtd_chip_driver *fldrv;
+#ifdef CONFIG_MTD_REDBOOT_PARTS
+        void *fis_origin;
+#endif
 };
=20
=20
 struct mtd_chip_driver {
 	struct mtd_info *(*probe)(struct map_info *map);
Index: drivers/mtd/redboot.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/gthomas/my_cvs/develop/linux/drivers/mtd/redboot.c,v
retrieving revision 1.1.1.1
diff -u -5 -p -r1.1.1.1 redboot.c
--- drivers/mtd/redboot.c	19 Jun 2002 17:26:28 -0000	1.1.1.1
+++ drivers/mtd/redboot.c	4 Feb 2003 17:09:42 -0000
@@ -7,10 +7,11 @@
=20
 #include <linux/kernel.h>
 #include <linux/slab.h>
=20
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
=20
 struct fis_image_desc {
     unsigned char name[16];      // Null terminated name
     unsigned long flash_base;    // Address within FLASH of image
@@ -42,10 +43,11 @@ int parse_redboot_partitions(struct mtd_
 	struct fis_list *fl =3D NULL, *tmp_fl;
 	int ret, i;
 	size_t retlen;
 	char *names;
 	int namelen =3D 0;
+	struct map_info *map =3D (struct map_info *)master->priv;
=20
 	buf =3D kmalloc(PAGE_SIZE, GFP_KERNEL);
=20
 	if (!buf)
 		return -ENOMEM;
@@ -88,11 +90,15 @@ int parse_redboot_partitions(struct mtd_
 		if (!new_fl) {
 			ret =3D -ENOMEM;
 			goto out;
 		}
 		new_fl->img =3D &buf[i];
-		buf[i].flash_base &=3D master->size-1;
+                if (map->fis_origin) {
+                        buf[i].flash_base -=3D (unsigned long)map->fis_ori=
gin;
+                } else {
+                        buf[i].flash_base &=3D master->size-1;
+                }
=20
 		/* I'm sure the JFFS2 code has done me permanent damage.
 		 * I now think the following is _normal_
 		 */
 		prev =3D &fl;

--=-JDUZNahz7YVZmjWlEJeC--
