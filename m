Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kUkE-00031L-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 20:14:18 +0100
Received: from henrik.marasystems.com (henrik.marasystems.com [192.168.1.53])
	by filer.marasystems.com (8.11.6/8.11.6) with ESMTP id g7TJEHh08092
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 21:14:17 +0200
From: Henrik Nordstrom <hno@marasystems.com>
To: linux-mtd@lists.infradead.org
Subject: [patch] mkfs.jffs2
Date: Thu, 29 Aug 2002 21:14:16 +0200
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_SFDM3SSO331WA9LAR0YF"
Message-Id: <200208292114.16531.hno@marasystems.com>
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

--------------Boundary-00=_SFDM3SSO331WA9LAR0YF
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 8bit

Noticed mkfs.jffs2 does not build in CVS due to the change in jffs2 byte 
orderered types.

Attached is a patch to allow mkfs.jffs2 to build again. It is merely an 
search-replace of the existing code to match the new types. Have not tried if 
it does what it should as I do not (yet) have a system where I can use JFFS2.

Regards
Henrik

--------------Boundary-00=_SFDM3SSO331WA9LAR0YF
Content-Type: text/x-diff;
  charset="us-ascii";
  name="mkfs.jffs2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="mkfs.jffs2.patch"

Index: util/mkfs.jffs2.c
===================================================================
RCS file: /home/cvs/mtd/util/mkfs.jffs2.c,v
retrieving revision 1.26
diff -u -r1.26 mkfs.jffs2.c
--- util/mkfs.jffs2.c	3 Jul 2002 22:20:13 -0000	1.26
+++ util/mkfs.jffs2.c	29 Aug 2002 18:54:50 -0000
@@ -142,9 +142,9 @@
 		(((uint32_t)(x) & (uint32_t)0xff000000UL) >> 24) ))
 
 #define cpu_to_target16(x) \
-	((host_endian==target_endian)?(x):(swab16(x)))
+	((jint16_t){(host_endian==target_endian)?(x):(swab16(x))})
 #define cpu_to_target32(x) \
-	((host_endian==target_endian)?(x):(swab32(x)))
+	((jint32_t){(host_endian==target_endian)?(x):(swab32(x))})
 
 
 
@@ -568,8 +568,8 @@
 
 	ri.ino = cpu_to_target32(ino);
 	ri.mode = cpu_to_target32(statbuf->st_mode);
-	ri.uid = cpu_to_target32(statbuf->st_uid);
-	ri.gid = cpu_to_target32(statbuf->st_gid);
+	ri.uid = cpu_to_target16(statbuf->st_uid);
+	ri.gid = cpu_to_target16(statbuf->st_gid);
 	ri.atime = cpu_to_target32(statbuf->st_atime);
 	ri.ctime = cpu_to_target32(statbuf->st_ctime);
 	ri.mtime = cpu_to_target32(statbuf->st_mtime);
@@ -621,7 +621,7 @@
 			offset += dsize;
 		}
 	}
-	if (!ri.version) {
+	if (!je32_to_cpu(ri.version)) {
 		/* Was empty file */
 		version++;
 		ri.version = cpu_to_target32(version);
@@ -646,7 +646,7 @@
 
 	/* FIXME:  I am using illicit insider knowledge of kernel 
 	 * major/minor representation...  */
-	unsigned short kdev;
+	jint16_t kdev;
 
 	kdev = cpu_to_target16((major(statbuf->st_rdev) << 8) +
 		minor(statbuf->st_rdev));
@@ -661,8 +661,8 @@
 
 	ri.ino = cpu_to_target32(ino);
 	ri.mode = cpu_to_target32(statbuf->st_mode);
-	ri.uid = cpu_to_target32(statbuf->st_uid);
-	ri.gid = cpu_to_target32(statbuf->st_gid);
+	ri.uid = cpu_to_target16(statbuf->st_uid);
+	ri.gid = cpu_to_target16(statbuf->st_gid);
 	ri.atime = cpu_to_target32(statbuf->st_atime);
 	ri.ctime = cpu_to_target32(statbuf->st_ctime);
 	ri.mtime = cpu_to_target32(statbuf->st_mtime);
@@ -695,8 +695,8 @@
 
 	ri.ino = cpu_to_target32(ino);
 	ri.mode = cpu_to_target32(statbuf->st_mode);
-	ri.uid = cpu_to_target32(statbuf->st_uid);
-	ri.gid = cpu_to_target32(statbuf->st_gid);
+	ri.uid = cpu_to_target16(statbuf->st_uid);
+	ri.gid = cpu_to_target16(statbuf->st_gid);
 	ri.atime = cpu_to_target32(statbuf->st_atime);
 	ri.ctime = cpu_to_target32(statbuf->st_ctime);
 	ri.mtime = cpu_to_target32(statbuf->st_mtime);
@@ -729,8 +729,8 @@
 
 	ri.ino = cpu_to_target32(ino);
 	ri.mode = cpu_to_target32(statbuf->st_mode);
-	ri.uid = cpu_to_target32(statbuf->st_uid);
-	ri.gid = cpu_to_target32(statbuf->st_gid);
+	ri.uid = cpu_to_target16(statbuf->st_uid);
+	ri.gid = cpu_to_target16(statbuf->st_gid);
 	ri.atime = cpu_to_target32(statbuf->st_atime);
 	ri.ctime = cpu_to_target32(statbuf->st_ctime);
 	ri.mtime = cpu_to_target32(statbuf->st_mtime);

--------------Boundary-00=_SFDM3SSO331WA9LAR0YF--
