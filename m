Received: from corvus.netpower.no ([212.33.135.184])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pobi-0000TJ-Dc
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 13:32:02 +0100
Received: from lair ([212.33.152.109])
	by corvus.netpower.no (8.12.9/8.12.8) with ESMTP id h7LCVQPO025562
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 14:31:26 +0200
From: =?iso-8859-1?Q?=D8yvind_Harboe?= <oyvind.harboe@zylin.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 21 Aug 2003 14:31:43 +0200
Message-ID: <002601c367e0$2da6b0a0$73dea8c0@lair>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0027_01C367F0.F12F80A0"
Subject: RFC - patch to reduce peak memory usage by disabling compression
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0027_01C367F0.F12F80A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Rationale:

Reduce RAM usage by removing compression/decompression altogether.

Even trivial compression schemes require a working buffer,
hence all compression schemes and not only the most memory
hungry are removed.

I've introduced a define JFFS2_COMPRESS which is 1 in os-linux.h,
and which eCos can make configurable via its CDL files.



=D8yvind

------=_NextPart_000_0027_01C367F0.F12F80A0
Content-Type: text/plain;
	name="lessmem.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lessmem.txt"

? lessmem.txt=0A=
Index: compr.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/fs/jffs2/compr.c,v=0A=
retrieving revision 1.26=0A=
diff -a -w -u -r1.26 compr.c=0A=
--- compr.c	12 Jan 2003 13:21:28 -0000	1.26=0A=
+++ compr.c	21 Aug 2003 12:26:50 -0000=0A=
@@ -28,6 +28,8 @@=0A=
 =0A=
 #include <linux/jffs2.h>=0A=
 =0A=
+#if defined(JFFS2_COMPRESS)=0A=
+=0A=
 int jffs2_zlib_compress(unsigned char *data_in, unsigned char =
*cpage_out, uint32_t *sourcelen, uint32_t *dstlen);=0A=
 void jffs2_zlib_decompress(unsigned char *data_in, unsigned char =
*cpage_out, uint32_t srclen, uint32_t destlen);=0A=
 int jffs2_rtime_compress(unsigned char *data_in, unsigned char =
*cpage_out, uint32_t *sourcelen, uint32_t *dstlen);=0A=
@@ -136,3 +138,5 @@=0A=
 	}=0A=
 	return 0;=0A=
 }=0A=
+=0A=
+#endif=0A=
Index: gc.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/fs/jffs2/gc.c,v=0A=
retrieving revision 1.103=0A=
diff -a -w -u -r1.103 gc.c=0A=
--- gc.c	22 May 2003 18:01:02 -0000	1.103=0A=
+++ gc.c	21 Aug 2003 12:26:51 -0000=0A=
@@ -1085,9 +1085,11 @@=0A=
 =0A=
 		writebuf =3D pg_ptr + (offset & (PAGE_CACHE_SIZE -1));=0A=
 =0A=
+#if defined(JFFS2_COMPRESS)=0A=
 		if (comprbuf) {=0A=
 			comprtype =3D jffs2_compress(writebuf, comprbuf, &datalen, =
&cdatalen);=0A=
 		}=0A=
+#endif=0A=
 		if (comprtype) {=0A=
 			writebuf =3D comprbuf;=0A=
 		} else {=0A=
Index: os-linux.h=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/fs/jffs2/os-linux.h,v=0A=
retrieving revision 1.28=0A=
diff -a -w -u -r1.28 os-linux.h=0A=
--- os-linux.h	2 Jul 2003 10:46:00 -0000	1.28=0A=
+++ os-linux.h	21 Aug 2003 12:26:51 -0000=0A=
@@ -189,6 +189,12 @@=0A=
 /* super.c */=0A=
 =0A=
 =0A=
+// by disabling compression, some working memory can be saved.=0A=
+// for embedded systems(e.g. eCos) even 50k ram is substantial=0A=
+// note that all forms of compression is disabled, since even=0A=
+// simple run-length encoding allocates working space.=0A=
+#define JFFS2_COMPRESS 1=0A=
+=0A=
 #endif /* __JFFS2_OS_LINUX_H__ */=0A=
 =0A=
 =0A=
Index: read.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/fs/jffs2/read.c,v=0A=
retrieving revision 1.33=0A=
diff -a -w -u -r1.33 read.c=0A=
--- read.c	17 Jul 2003 08:44:12 -0000	1.33=0A=
+++ read.c	21 Aug 2003 12:26:51 -0000=0A=
@@ -93,6 +93,7 @@=0A=
 		}=0A=
 	}=0A=
 	if (ri->compr !=3D JFFS2_COMPR_NONE) {=0A=
+#if defined(JFFS2_COMPRESS)=0A=
 		if (len < je32_to_cpu(ri->dsize)) {=0A=
 			decomprbuf =3D kmalloc(je32_to_cpu(ri->dsize), GFP_KERNEL);=0A=
 			if (!decomprbuf) {=0A=
@@ -102,6 +103,10 @@=0A=
 		} else {=0A=
 			decomprbuf =3D buf;=0A=
 		}=0A=
+#else=0A=
+		ret =3D -EINVAL;=0A=
+		goto out_readbuf;=0A=
+#endif=0A=
 	} else {=0A=
 		decomprbuf =3D readbuf;=0A=
 	}=0A=
@@ -124,6 +129,8 @@=0A=
 		goto out_decomprbuf;=0A=
 	}=0A=
 	D2(printk(KERN_DEBUG "Data CRC matches calculated CRC %08x\n", crc));=0A=
+=0A=
+#if defined(JFFS2_COMPRESS)=0A=
 	if (ri->compr !=3D JFFS2_COMPR_NONE) {=0A=
 		D2(printk(KERN_DEBUG "Decompress %d bytes from %p to %d bytes at =
%p\n",=0A=
 			  je32_to_cpu(ri->csize), readbuf, je32_to_cpu(ri->dsize), =
decomprbuf)); =0A=
@@ -133,7 +140,7 @@=0A=
 			goto out_decomprbuf;=0A=
 		}=0A=
 	}=0A=
-=0A=
+#endif=0A=
 	if (len < je32_to_cpu(ri->dsize)) {=0A=
 		memcpy(buf, decomprbuf+ofs, len);=0A=
 	}=0A=
Index: write.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/fs/jffs2/write.c,v=0A=
retrieving revision 1.65=0A=
diff -a -w -u -r1.65 write.c=0A=
--- write.c	21 Jan 2003 18:11:29 -0000	1.65=0A=
+++ write.c	21 Aug 2003 12:26:51 -0000=0A=
@@ -300,6 +300,7 @@=0A=
 		datalen =3D writelen;=0A=
 		cdatalen =3D min_t(uint32_t, alloclen - sizeof(*ri), writelen);=0A=
 =0A=
+#if defined(JFFS2_COMPRESS)=0A=
 		comprbuf =3D kmalloc(cdatalen, GFP_KERNEL);=0A=
 		if (comprbuf) {=0A=
 			comprtype =3D jffs2_compress(buf, comprbuf, &datalen, &cdatalen);=0A=
@@ -308,9 +309,12 @@=0A=
 			/* Either compression failed, or the allocation of comprbuf failed */=0A=
 			if (comprbuf)=0A=
 				kfree(comprbuf);=0A=
+#endif=0A=
 			comprbuf =3D buf;=0A=
 			datalen =3D cdatalen;=0A=
+#if defined(CYGPKG_FS_JFFS2_COMPRESS)=0A=
 		}=0A=
+#endif=0A=
 		/* Now comprbuf points to the data to be written, be it compressed or =
not.=0A=
 		   comprtype holds the compression type, and comprtype =3D=3D =
JFFS2_COMPR_NONE means=0A=
 		   that the comprbuf doesn't need to be kfree()d. =0A=

------=_NextPart_000_0027_01C367F0.F12F80A0--
