Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14gUW0-00026r-00
	for mtd-list@infradead.org; Fri, 23 Mar 2001 16:34:16 +0000
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14gUVz-00026l-00
	for mtd@infradead.org; Fri, 23 Mar 2001 16:34:15 +0000
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Fri, 23 Mar 2001 16:34:13 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Fri, 23 Mar 2001 16:34:12 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: eraseinfo ioctl patch
Date: Fri, 23 Mar 2001 16:34:11 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E3108AFFB@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Here are couple of new ioctl that export the erase bloack size to
userspace as well as small program that uses those ioctl to read and
display them on stdout.

K.D.

diff -urN --exclude *.o mtd/include/linux/mtd/mtd.h
mtd-20010320/include/linux/mtd/mtd.h
--- mtd/include/linux/mtd/mtd.h	Sat Mar 17 23:00:09 2001
+++ mtd-20010320/include/linux/mtd/mtd.h	Fri Mar 23 16:15:58 2001
@@ -77,17 +77,27 @@
         u_int32_t eccsize;
 };
=20
+struct region_info_user {
+	u_int32_t offset;			/* At which this region
starts, from the beginning of the MTD */
+	u_int32_t erasesize;		/* For this region */
+	u_int32_t numblocks;		/* Number of blocks of erasesize
in this region */
+	u_int32_t regionindex;
+};
+
 #define MEMGETINFO              _IOR('M', 1, struct mtd_info_user)
 #define MEMERASE                _IOW('M', 2, struct erase_info_user)
 #define MEMWRITEOOB             _IOWR('M', 3, struct mtd_oob_buf)
 #define MEMREADOOB              _IOWR('M', 4, struct mtd_oob_buf)
 #define MEMLOCK                 _IOW('M', 5, struct erase_info_user)
 #define MEMUNLOCK               _IOW('M', 6, struct erase_info_user)
+#define MEMGETREGIONCOUNT	_IOW('M', 7, int)
+#define MEMGETREGIONINFO	_IOW('M', 8, struct region_info_user)
=20
 #ifndef __KERNEL__
=20
 typedef struct mtd_info_user mtd_info_t;
 typedef struct erase_info_user erase_info_t;
+typedef struct region_info_user region_info_t;
=20
 	/* User-space ioctl definitions */
=20
diff -urN --exclude *.o mtd/kernel/mtdchar.c
mtd-20010320/kernel/mtdchar.c
--- mtd/kernel/mtdchar.c	Thu Feb  1 23:00:03 2001
+++ mtd-20010320/kernel/mtdchar.c	Fri Mar 23 16:01:25 2001
@@ -293,6 +293,26 @@
 	}
 =09
 	switch (cmd) {
+	case MEMGETREGIONCOUNT :
+		if(copy_to_user((int *) arg, &(mtd->numeraseregions),
sizeof(int)))
+			return -EFAULT;
+		break;
+	case MEMGETREGIONINFO :
+	{
+		struct mtd_erase_region_info * kr;
+		struct region_info_user * ur;
+		kr =3D (struct mtd_erase_region_info *) arg;
+		ur =3D (struct region_info_user *) arg;
+
+		if( ur->regionindex >=3D mtd->numeraseregions)
+			return -EFAULT;
+		=09
+		if(copy_to_user( (struct mtd_erase_region_info *) arg,=20
+				&(mtd->eraseregions[ur->regionindex]),
+				sizeof(struct mtd_erase_region_info)))
+			return -EFAULT;
+		break;
+	}
 	case MEMGETINFO:
 		if (copy_to_user((struct mtd_info *)arg, mtd,
 				 sizeof(struct mtd_info_user)))
diff -urN --exclude *.o mtd/util/Makefile mtd-20010320/util/Makefile
--- mtd/util/Makefile	Thu Mar 15 23:00:07 2001
+++ mtd-20010320/util/Makefile	Fri Mar 23 16:12:03 2001
@@ -1,6 +1,6 @@
-CFLAGS=3D-I../include -O2 -Wall
+CFLAGS+=3D-I../include -O2 -Wall
=20
-TARGETS =3D ftl_format erase eraseall nftldump nanddump doc_loadbios
nftl_format mkfs.jffs ftl_check nandtest nandwrite mkfs.jffs2 lock
unlock
+TARGETS =3D ftl_format erase eraseall nftldump nanddump doc_loadbios
nftl_format mkfs.jffs ftl_check nandtest nandwrite mkfs.jffs2 lock
unlock einfo
=20
 SYMLINKS =3D crc32.h crc32.c compr_rtime.c compr_rubin.c compr.c
pushpull.c pushpull.h histo_mips.h compr_rubin.h
=20
diff -urN --exclude *.o mtd/util/einfo.c mtd-20010320/util/einfo.c
--- mtd/util/einfo.c	Thu Jan  1 00:00:00 1970
+++ mtd-20010320/util/einfo.c	Fri Mar 23 16:24:29 2001
@@ -0,0 +1,50 @@
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <fcntl.h>
+#include <time.h>
+#include <sys/ioctl.h>
+#include <sys/mount.h>
+
+#include <linux/mtd/mtd.h>
+
+int main(int argc,char *argv[])
+{
+   int regcount;
+   int Fd;
+
+   if (1 >=3D argc)
+   {
+      fprintf(stderr,"You must specify a device\n");
+      return 16;
+   }
+  =20
+   // Open and size the device
+   if ((Fd =3D open(argv[1],O_RDWR)) < 0)
+   {
+      fprintf(stderr,"File open error\n");
+      return 8;
+   }
+
+   if (ioctl(Fd,MEMGETREGIONCOUNT,&regcount) =3D=3D 0)
+   {
+	  int i;
+      region_info_t reginfo;
+	  printf("Device %s has %d erase regions\n", argv[1], regcount);
+	  for(i =3D 0; i < regcount; i++)
+	  {
+		  reginfo.regionindex =3D i;
+		  if(ioctl(Fd, MEMGETREGIONINFO, &reginfo) =3D=3D 0)
+		  {
+			  printf("Region %d is at %x with size %x and
has %x blocks\n",
+					  i, reginfo.offset,
reginfo.erasesize, reginfo.numblocks);
+		  }
+		  else
+		  {
+			  printf("Strange can not read region %d from a
%d region device\n",
+					  i, regcount);
+		  }
+	  }
+   }
+   return 0;
+}


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
