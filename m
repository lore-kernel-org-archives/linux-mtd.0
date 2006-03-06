Received: from [66.174.85.156] (helo=txslsmtp2.vzwmail.net)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGICc-0004l1-R7
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2006 11:05:06 -0500
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 6 Mar 2006 10:46:30 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGAEHLKDAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_02FC_01C6410B.3A1099D0"
Cc: 
Subject: cmdlinepart.c patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_02FC_01C6410B.3A1099D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

The cmdlinepart.c logic treats a partition offset that has been explicitly
specified as zero the same as an unspecified offset.  This causes the
partitioning logic to fail if your partition that starts at 0x0 is not the
first partition listed on the cmdline.

For example, if you have several partitions, and you want the third partition
to be an all-encompassing partition covering the whole device, then you
would give it offset 0x0.  The cmdlinepart.c logic treats this the same as
if you had not specified an offset, and instead tries to start the third
partition after the end of your second partition.  This is because the logic
uses zero as the "unspecified offset" value.  However, zero is not a good
choice for "unspecified offset" -- it is quite valid as a "specified" offset.

The attached patch defines the "unspecified offset" value as 0xffffffff and
makes the changes needed to support partitions that explicitly start at
offset 0x0, but are not necessarily listed first on the cmdline.

Chuck

------=_NextPart_000_02FC_01C6410B.3A1099D0
Content-Type: application/octet-stream;
	name="cmdlinepart.c.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cmdlinepart.c.patch"

--- cmdlinepart.c.ORIG	2006-03-05 19:34:43.000000000 -0500=0A=
+++ cmdlinepart.c	2006-03-06 10:17:15.063475104 -0500=0A=
@@ -40,6 +40,10 @@=0A=
 #define dbg(x)=0A=
 #endif=0A=
 =0A=
+/* indicates that the offset for a partition was not specified, so =
start at=0A=
+ * end of previous partition.=0A=
+ */=0A=
+#define OFFSET_UNSPECIFIED 0xffffffff=0A=
 =0A=
 /* special size referring to all the remaining space in a partition */=0A=
 #define SIZE_REMAINING 0xffffffff=0A=
@@ -75,7 +79,7 @@ static struct mtd_partition * newpart(ch=0A=
 {=0A=
 	struct mtd_partition *parts;=0A=
 	unsigned long size;=0A=
-	unsigned long offset =3D 0;=0A=
+	unsigned long offset =3D OFFSET_UNSPECIFIED;=0A=
 	char *name;=0A=
 	int name_len;=0A=
 	unsigned char *extra_mem;=0A=
@@ -314,7 +318,7 @@ static int parse_cmdline_partitions(stru=0A=
 		{=0A=
 			for(i =3D 0, offset =3D 0; i < part->num_parts; i++)=0A=
 			{=0A=
-				if (!part->parts[i].offset)=0A=
+				if (part->parts[i].offset =3D=3D OFFSET_UNSPECIFIED)=0A=
 				  part->parts[i].offset =3D offset;=0A=
 				else=0A=
 				  offset =3D part->parts[i].offset;=0A=

------=_NextPart_000_02FC_01C6410B.3A1099D0--
