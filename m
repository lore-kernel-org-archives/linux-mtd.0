Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GJ9U-00006K-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 13:19:52 +0000
From: johan.adolfsson@axis.com
Message-ID: <025a01c29489$8e8b00e0$a3b270d5@homeip.net>
Reply-To: <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>, <andersen@codepoet.org>
Cc: <linux-mtd@lists.infradead.org>
References: <20021125111843.GA17562@codepoet.org>  <1319.1038224945@passion.cambridge.redhat.com>
Subject: Re: mkfs.jffs2.c rework 
Date: Mon, 25 Nov 2002 14:50:03 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0257_01C29491.F01D0E40"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0257_01C29491.F01D0E40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

> 
> Also, could we have an option to write cleanmarkers to the beginning of 
> each block?
> 
> --
> dwmw2

Here is a patch to add cleanmarkers and some minor bugfix:
Here is what I would use as a comment:
--
Added support for adding cleanmarkers to start of every eraseblock.
--no-cleanmarkers disables it.
--cleanmarker=SIZE changes the cleanmarker size.

Clean up hardcoded 16 to sizeof(ffbuf).
Added missing pad_block_if_less_than() in output_reg().
--
Please apply if it looks ok.
/Johan


------=_NextPart_000_0257_01C29491.F01D0E40
Content-Type: application/octet-stream;
	name="cleanmarker3.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cleanmarker3.patch"

Index: mkfs.jffs2.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/util/mkfs.jffs2.c,v=0A=
retrieving revision 1.28=0A=
diff -u -p -r1.28 mkfs.jffs2.c=0A=
--- mkfs.jffs2.c	8 Oct 2002 21:07:16 -0000	1.28=0A=
+++ mkfs.jffs2.c	9 Oct 2002 12:03:48 -0000=0A=
@@ -4,6 +4,7 @@=0A=
  * Copyright 2001, 2002 Red Hat, Inc.=0A=
  *           2001 David A. Schleef <ds@lineo.com>=0A=
  *           2001 Erik Andersen <andersen@codepoet.org>=0A=
+ *           2002 Axis Communications AB=0A=
  *=0A=
  * This program is free software; you can redistribute it and/or modify=0A=
  * it under the terms of the GNU General Public License as published by=0A=
@@ -30,6 +31,8 @@=0A=
  *=0A=
  * I also added a sample device table file.  See device_table.txt=0A=
  *  -Erik, Septermber 2001=0A=
+ *=0A=
+ * cleanmarkers added by Axis Communications AB=0A=
  */=0A=
 =0A=
 /* $Id: mkfs.jffs2.c,v 1.28 2002/10/08 21:07:16 sjhill Exp $ */=0A=
@@ -104,8 +107,12 @@ extern unsigned char jffs2_compress(unsi=0A=
 #define JFFS2_MAX_SYMLINK_LEN 254=0A=
 #endif=0A=
 =0A=
+static struct jffs2_unknown_node cleanmarker ; =0A=
+=0A=
 static int erase_block_size =3D 65536;=0A=
 static int pad_fs_size =3D 0;=0A=
+static int add_cleanmarkers =3D 1; /* turn of with --no-cleanmarkers */=0A=
+static int cleanmarker_size =3D sizeof(cleanmarker); /* Change with =
--cleanmarker */=0A=
 static int page_size =3D 4096;=0A=
 static int out_fd =3D 1;=0A=
 static int out_ofs =3D 0;=0A=
@@ -501,14 +508,20 @@ static void padblock(void)=0A=
 {=0A=
 	while (out_ofs % erase_block_size) {=0A=
 		full_write(out_fd, ffbuf, =0A=
-			min(16, erase_block_size - (out_ofs % erase_block_size)));=0A=
+			min(sizeof(ffbuf), erase_block_size - (out_ofs % erase_block_size)));=0A=
 	}=0A=
 }=0A=
 =0A=
-static inline void pad_block_if_less_than(int req)=0A=
+static void pad(int req)=0A=
 {=0A=
-	if ((out_ofs % erase_block_size) + req > erase_block_size) {=0A=
-		padblock();=0A=
+	while (req) {=0A=
+		if (req > sizeof(ffbuf)) {=0A=
+			full_write(out_fd, ffbuf, sizeof(ffbuf));=0A=
+			req -=3D sizeof(ffbuf);=0A=
+		} else {=0A=
+			full_write(out_fd, ffbuf, req);=0A=
+			req =3D 0;=0A=
+		}=0A=
 	}=0A=
 }=0A=
 =0A=
@@ -519,6 +532,27 @@ static inline void padword(void)=0A=
 	}=0A=
 }=0A=
 =0A=
+static inline void pad_block_if_less_than(int req)=0A=
+{=0A=
+	if (add_cleanmarkers) {=0A=
+		if ((out_ofs % erase_block_size) =3D=3D 0) {=0A=
+			full_write(out_fd, &cleanmarker, sizeof(cleanmarker));=0A=
+			pad(cleanmarker_size - sizeof(cleanmarker));=0A=
+			padword();=0A=
+		}=0A=
+	}=0A=
+	if ((out_ofs % erase_block_size) + req > erase_block_size) {=0A=
+		padblock();=0A=
+	}=0A=
+	if (add_cleanmarkers) {=0A=
+		if ((out_ofs % erase_block_size) =3D=3D 0) {=0A=
+			full_write(out_fd, &cleanmarker, sizeof(cleanmarker));=0A=
+			pad(cleanmarker_size - sizeof(cleanmarker));=0A=
+			padword();=0A=
+		}=0A=
+	}=0A=
+}=0A=
+=0A=
 static void write_dirent(uint32_t pino, uint32_t ver, uint32_t ino, =
uint32_t mctime,=0A=
 	uint32_t type, unsigned char *name)=0A=
 {=0A=
@@ -632,6 +666,8 @@ static void output_reg(int fd, uint32_t =0A=
 		ri.dsize =3D cpu_to_target32(0);=0A=
 		ri.node_crc =3D cpu_to_target32(crc32(0, &ri, sizeof(ri) - 8));=0A=
 =0A=
+		pad_block_if_less_than(sizeof(ri));=0A=
+=0A=
 		full_write(out_fd, &ri, sizeof(ri));=0A=
 		padword();=0A=
 	}=0A=
@@ -1105,6 +1141,8 @@ static struct option long_options[] =3D {=0A=
 	{"output", 1, NULL, 'o'},=0A=
 	{"help", 0, NULL, 'h'},=0A=
 	{"version", 0, NULL, 'v'},=0A=
+	{"no-cleanmarkers", 0, NULL, 'n'},=0A=
+	{"cleanmarker", 1, NULL, 'c'},=0A=
 	{"big-endian", 0, NULL, 'b'},=0A=
 	{"little-endian", 0, NULL, 'l'},=0A=
 	{"squash", 0, NULL, 'q'},=0A=
@@ -1122,6 +1160,8 @@ static char *helptext =3D=0A=
 	"  -p, --pad[=3DSIZE]       Pad output to SIZE bytes with 0xFF. If =
SIZE is\n"=0A=
 	"                         not specified, the output is padded to the =
end of\n"=0A=
 	"                         the final erase block\n"=0A=
+	"  -n, --no-cleanmarkers  Don't add a cleanmarker to every =
eraseblock\n"=0A=
+	"  -c, --cleanmarker=3DSIZE Size of cleanmarker (default 12)\n"=0A=
 	"  -r, -d, --root=3DDIR     Build filesystem from directory DIR =
(default: cwd)\n"=0A=
 	"  -s, --pagesize=3DSIZE    Use page size (max data node size) SIZE =
(default: 4KiB)\n"=0A=
 	"  -e, --eraseblock=3DSIZE  Use erase block size SIZE (default: =
64KiB)\n"=0A=
@@ -1151,7 +1191,7 @@ int main(int argc, char **argv)=0A=
 		exit(1);=0A=
 	}=0A=
 =0A=
-	while ((opt =3D getopt_long(argc, argv, "D:p::d:r:s:e:o:blqfh?v", =0A=
+	while ((opt =3D getopt_long(argc, argv, "D:p::c:d:r:s:e:o:nblqfh?v", =0A=
 			long_options, &c)) >=3D 0) {=0A=
 		switch (opt) {=0A=
 		case 'D':=0A=
@@ -1167,7 +1207,16 @@ int main(int argc, char **argv)=0A=
 			else=0A=
 				pad_fs_size =3D -1;=0A=
 			break;=0A=
-=0A=
+		case 'n':=0A=
+			add_cleanmarkers =3D 0;=0A=
+			break;=0A=
+		case 'c':=0A=
+			cleanmarker_size =3D strtol(optarg, NULL, 0);=0A=
+			if (cleanmarker_size < sizeof(cleanmarker)) {=0A=
+				error_msg_and_die("cleanmarker size must be >=3D 12");=0A=
+			}=0A=
+			break;=0A=
+			=0A=
 		case 'r':=0A=
 		case 'd':				/* for compatibility with mkfs.jffs, genext2fs, etc... */=0A=
 			if (rootdir !=3D default_rootdir) {=0A=
@@ -1239,12 +1288,32 @@ int main(int argc, char **argv)=0A=
 		}=0A=
 	}=0A=
 =0A=
+	if (cleanmarker_size >=3D erase_block_size) {=0A=
+		error_msg_and_die("cleanmarker size must be < eraseblock size");=0A=
+	}=0A=
+	cleanmarker.magic =3D cpu_to_target16(JFFS2_MAGIC_BITMASK);=0A=
+	cleanmarker.nodetype =3D cpu_to_target16(JFFS2_NODETYPE_CLEANMARKER);=0A=
+	cleanmarker.totlen =3D   cpu_to_target32(cleanmarker_size);=0A=
+	cleanmarker.hdr_crc =3D cpu_to_target32(crc32(0, &cleanmarker, =
sizeof(struct jffs2_unknown_node)-4));=0A=
+=0A=
 	go(rootdir, devtable);=0A=
 	if (pad_fs_size =3D=3D -1) {=0A=
 		padblock();=0A=
 	} else {=0A=
-		while (out_ofs < pad_fs_size) {=0A=
-			full_write(out_fd, ffbuf, min(16, pad_fs_size - out_ofs));=0A=
+=0A=
+=0A=
+		if (pad_fs_size && add_cleanmarkers){=0A=
+			padblock();=0A=
+			while (out_ofs < pad_fs_size) {=0A=
+				full_write(out_fd, &cleanmarker, sizeof(cleanmarker));=0A=
+				pad(cleanmarker_size - sizeof(cleanmarker));=0A=
+				padblock();=0A=
+			}=0A=
+		} else {=0A=
+			while (out_ofs < pad_fs_size) {=0A=
+				full_write(out_fd, ffbuf, min(sizeof(ffbuf), pad_fs_size - =
out_ofs));=0A=
+			}=0A=
+=0A=
 		}=0A=
 	}=0A=
 =0A=

------=_NextPart_000_0257_01C29491.F01D0E40--
