Received: from mail2.alphalink.com.au ([202.161.124.194])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1APV7j-0002ZH-TE
	for <linux-mtd@lists.infradead.org>; Thu, 27 Nov 2003 23:00:36 +0000
Received: from techmanager (d72-admin.wireless.alphalink.com.au
	[202.161.121.72] (may be forged))
	by mail2.alphalink.com.au (8.12.10/8.9.3) with SMTP id hARMwqHC020680
	for <linux-mtd@lists.infradead.org>; Fri, 28 Nov 2003 09:58:53 +1100
Message-ID: <043c01c3b539$9ecbde30$4879a1ca@techmanager>
From: "Denis Dowling" <dpd@alphalink.com.au>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Date: Fri, 28 Nov 2003 09:55:57 +1100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0439_01C3B595.D2294360"
Subject: nftl_format
Reply-To: Denis Dowling <dpd@alphalink.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0439_01C3B595.D2294360
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

Attached is a patch to get nftl_format compiling with the latest version of
mtd. I managed to get 2 of my DoC chips into a state where DFORMAT would not
want to reprogram them. The trigger for this seemed to be loading the
grub_firmware into them with doc_loadbios. Anyway with this patch I was able
to build nftl_format and reformat both of the chips.

Regards,
Denis.

------=_NextPart_000_0439_01C3B595.D2294360
Content-Type: application/octet-stream;
	name="mtd.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd.patch"

Index: mtd/include/linux/mtd/nftl.h=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/include/linux/mtd/nftl.h,v=0A=
retrieving revision 1.13=0A=
diff -u -b -B -w -p -r1.13 nftl.h=0A=
--- mtd/include/linux/mtd/nftl.h	23 May 2003 11:25:02 -0000	1.13=0A=
+++ mtd/include/linux/mtd/nftl.h	27 Nov 2003 22:46:29 -0000=0A=
@@ -8,7 +8,10 @@=0A=
 #define __MTD_NFTL_H__=0A=
 =0A=
 #include <linux/mtd/mtd.h>=0A=
+=0A=
+#ifdef __KERNEL__=0A=
 #include <linux/mtd/blktrans.h>=0A=
+#endif /* __KERNEL__ */=0A=
 =0A=
 /* Block Control Information */=0A=
 =0A=
Index: mtd/util/Makefile=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/util/Makefile,v=0A=
retrieving revision 1.34=0A=
diff -u -b -B -w -p -r1.34 Makefile=0A=
--- mtd/util/Makefile	20 Jun 2003 13:58:46 -0000	1.34=0A=
+++ mtd/util/Makefile	27 Nov 2003 22:46:29 -0000=0A=
@@ -10,7 +10,8 @@ CFLAGS +=3D -I../include -O2 -Wall -Wstric=0A=
 TARGETS =3D ftl_format erase eraseall  nanddump doc_loadbios \=0A=
 	mkfs.jffs ftl_check mkfs.jffs2 lock unlock \=0A=
 	einfo mtd_debug fcp nandwrite jffs2dump \=0A=
-	#jffs2reader nftldump nftl_format=0A=
+	nftl_format nftldump =0A=
+#	jffs2reader=0A=
 =0A=
 SYMLINKS =3D crc32.h crc32.c compr_rtime.c=0A=
 =0A=
Index: mtd/util/nftl_format.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/util/nftl_format.c,v=0A=
retrieving revision 1.19=0A=
diff -u -b -B -w -p -r1.19 nftl_format.c=0A=
--- mtd/util/nftl_format.c	1 May 2002 10:59:04 -0000	1.19=0A=
+++ mtd/util/nftl_format.c	27 Nov 2003 22:46:29 -0000=0A=
@@ -59,7 +59,8 @@=0A=
 #define le32_to_cpu(x) cpu_to_le32(x)=0A=
 #define le16_to_cpu(x) cpu_to_le16(x)=0A=
 =0A=
-extern ssize_t pread(), pwrite();=0A=
+ssize_t pread(int fd, void *buf, size_t count, off_t offset);=0A=
+ssize_t pwrite(int fd, const void *buf, size_t count, off_t offset);=0A=
 =0A=
 unsigned char BadUnitTable[MAX_ERASE_ZONES];=0A=
 unsigned char *readbuf;=0A=
@@ -330,7 +331,7 @@ int main(int argc, char **argv)=0A=
 			continue;=0A=
 		oob.start =3D (ezone * meminfo.erasesize) + 512;=0A=
 		if (ioctl(fd, MEMWRITEOOB, &oob))=0A=
-			printf("MEMWRITEOOB at %lx: %s\n", (unsigned long)oob.start, =
sys_errlist[errno]);=0A=
+			printf("MEMWRITEOOB at %lx: %s\n", (unsigned long)oob.start, =
strerror(errno));=0A=
 	}=0A=
 =0A=
 	exit(0);=0A=
Index: mtd/util/nftldump.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/util/nftldump.c,v=0A=
retrieving revision 1.14=0A=
diff -u -b -B -w -p -r1.14 nftldump.c=0A=
--- mtd/util/nftldump.c	16 Jul 2001 16:13:50 -0000	1.14=0A=
+++ mtd/util/nftldump.c	27 Nov 2003 22:46:29 -0000=0A=
@@ -37,7 +37,7 @@=0A=
 #include <linux/mtd/mtd.h>=0A=
 #include <linux/mtd/nftl.h>=0A=
 =0A=
-extern ssize_t pread();=0A=
+ssize_t pread(int fd, void *buf, size_t count, off_t offset);=0A=
 =0A=
 static struct NFTLMediaHeader MedHead[2];=0A=
 static mtd_info_t meminfo;=0A=
@@ -87,7 +87,7 @@ static unsigned short nextEUN(unsigned s=0A=
 	return UCItable[curEUN][0].a.ReplUnitNum;=0A=
 }=0A=
 =0A=
-static unsigned int find_media_headers()=0A=
+static unsigned int find_media_headers(void)=0A=
 {=0A=
 	int i;=0A=
 	static unsigned long ofs =3D 0;=0A=
@@ -135,7 +135,7 @@ static unsigned int find_media_headers()=0A=
 	return NumMedHeads;=0A=
 }=0A=
 =0A=
-static void dump_erase_units()=0A=
+static void dump_erase_units(void)=0A=
 {=0A=
 	int i, j;=0A=
 	unsigned long ofs;=0A=
@@ -150,7 +150,7 @@ static void dump_erase_units()=0A=
 			oob.start =3D ofs + (j * 512);=0A=
 			if (ioctl(fd, MEMREADOOB, &oob))=0A=
 				printf("MEMREADOOB at %lx: %s\n",=0A=
-				       (unsigned long) oob.start, sys_errlist[errno]);=0A=
+				       (unsigned long) oob.start, strerror(errno));=0A=
 			memcpy(&UCItable[i][j], &oobbuf.u, 8);=0A=
 		}=0A=
 		if (UCItable[i][1].b.EraseMark !=3D cpu_to_le16(0x3c69)) {=0A=
@@ -199,7 +199,7 @@ static void dump_erase_units()=0A=
 	}=0A=
 }=0A=
 =0A=
-static void dump_virtual_units()=0A=
+static void dump_virtual_units(void)=0A=
 {=0A=
 	int i, j;=0A=
 	char readbuf[512];=0A=

------=_NextPart_000_0439_01C3B595.D2294360--
