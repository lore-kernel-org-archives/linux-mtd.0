Received: from mail.innomedia.com.sg ([61.14.86.27] helo=innomedia.com.sg)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5zCB-0005XS-P9
	for linux-mtd@lists.infradead.org; Wed, 24 Mar 2004 03:36:48 +0000
Received: from PIII1200MHzM [61.14.86.2] by innomedia.com.sg [61.14.86.27]
	with SMTP (MDaemon.v3.0.2.R)
	for <linux-mtd@lists.infradead.org>; Wed, 24 Mar 2004 11:40:20 +0800
Message-ID: <002101c41154$a6339560$0b00a8c0@PIII1200MHzM>
From: "LOH Chee Tim" <cheetim_loh@innomedia.com.sg>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 24 Mar 2004 12:00:46 +0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0019_01C41197.A443D7E0"
Subject: Patch for RedBoot Partition Table Parsing
Reply-To: cheetim_loh@innomedia.com.sg
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0019_01C41197.A443D7E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

The attached patch, against mtd-snapshot-20040323, fixes RedBoot Partition
Table Parsing for unallocated flash space before the first image.

Also included are minor updates to:
1. include nullname only if it is used
2. add an option for selecting whether unallocated flash space is to be
included
3. follow eCos 2.0 by reading partition table from the whole of last erase
block instead of just the start
4. force read-only for RedBoot, RedBoot Config and FIS directory images

Please feel free to comment on the patch and its suitability for inclusion
into cvs.


Regards,
Chee Tim
Senior Engineer, Product Development
InnoMedia Pte Ltd
DID: +65 65869142
Tel: +65 68720828 ext 142
Fax: +65 68724006
http://www.innomedia.com

------=_NextPart_000_0019_01C41197.A443D7E0
Content-Type: application/octet-stream;
	name="mtd-snapshot-20040323.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd-snapshot-20040323.diff"

diff -ru mtd-snapshot-20040323-orig/drivers/mtd/Config.in =
mtd-snapshot-20040323/drivers/mtd/Config.in=0A=
--- mtd-snapshot-20040323-orig/drivers/mtd/Config.in	Sat May 24 06:00:06 =
2003=0A=
+++ mtd-snapshot-20040323/drivers/mtd/Config.in	Fri Mar 19 10:23:29 2004=0A=
@@ -14,6 +14,9 @@=0A=
    dep_tristate '  MTD partitioning support' CONFIG_MTD_PARTITIONS =
$CONFIG_MTD=0A=
    dep_tristate '  MTD concatenating support' CONFIG_MTD_CONCAT =
$CONFIG_MTD=0A=
    dep_tristate '  RedBoot partition table parsing' =
CONFIG_MTD_REDBOOT_PARTS $CONFIG_MTD_PARTITIONS=0A=
+   if [ "$CONFIG_MTD_REDBOOT_PARTS" =3D "y" ]; then=0A=
+      dep_bool '  Include unallocated flash space' =
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED $CONFIG_MTD_REDBOOT_PARTS=0A=
+   fi=0A=
    dep_tristate '  Command line partition table parsing' =
CONFIG_MTD_CMDLINE_PARTS $CONFIG_MTD_PARTITIONS=0A=
    if [ "$CONFIG_ARM" =3D "y" ]; then=0A=
       dep_tristate '  ARM Firmware Suite partition parsing' =
CONFIG_MTD_AFS_PARTS $CONFIG_MTD_PARTITIONS=0A=
diff -ru mtd-snapshot-20040323-orig/drivers/mtd/redboot.c =
mtd-snapshot-20040323/drivers/mtd/redboot.c=0A=
--- mtd-snapshot-20040323-orig/drivers/mtd/redboot.c	Thu Jun 26 06:00:07 =
2003=0A=
+++ mtd-snapshot-20040323/drivers/mtd/redboot.c	Thu Mar 18 16:29:00 2004=0A=
@@ -48,21 +48,24 @@=0A=
 	char *names;=0A=
 	char *nullname;=0A=
 	int namelen =3D 0;=0A=
+	int nulllen =3D 0;=0A=
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=0A=
 	static char nullstring[] =3D "unallocated";=0A=
+#endif=0A=
 =0A=
-	buf =3D kmalloc(PAGE_SIZE, GFP_KERNEL);=0A=
+	buf =3D kmalloc(master->erasesize, GFP_KERNEL);=0A=
 =0A=
 	if (!buf)=0A=
 		return -ENOMEM;=0A=
 =0A=
 	/* Read the start of the last erase block */=0A=
 	ret =3D master->read(master, master->size - master->erasesize,=0A=
-			   PAGE_SIZE, &retlen, (void *)buf);=0A=
+			   master->erasesize, &retlen, (void *)buf);=0A=
 =0A=
 	if (ret)=0A=
 		goto out;=0A=
 =0A=
-	if (retlen !=3D PAGE_SIZE) {=0A=
+	if (retlen !=3D master->erasesize) {=0A=
 		ret =3D -EIO;=0A=
 		goto out;=0A=
 	}=0A=
@@ -80,7 +83,7 @@=0A=
 		goto out;=0A=
 	}=0A=
 =0A=
-	for (i =3D 0; i < PAGE_SIZE / sizeof(struct fis_image_desc); i++) {=0A=
+	for (i =3D 0; i < master->erasesize / sizeof(struct fis_image_desc); =
i++) {=0A=
 		struct fis_list *new_fl, **prev;=0A=
 =0A=
 		if (buf[i].name[0] =3D=3D 0xff)=0A=
@@ -112,48 +115,67 @@=0A=
 =0A=
 		nrparts++;=0A=
 	}=0A=
-	if (fl->img->flash_base)=0A=
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=0A=
+	if (fl->img->flash_base) {=0A=
 		nrparts++;=0A=
+		nulllen =3D sizeof(nullstring);=0A=
+	}=0A=
 =0A=
 	for (tmp_fl =3D fl; tmp_fl->next; tmp_fl =3D tmp_fl->next) {=0A=
-		if (tmp_fl->img->flash_base + tmp_fl->img->size + master->erasesize < =
tmp_fl->next->img->flash_base)=0A=
+		if (tmp_fl->img->flash_base + tmp_fl->img->size + master->erasesize =
<=3D tmp_fl->next->img->flash_base) {=0A=
 			nrparts++;=0A=
+			nulllen =3D sizeof(nullstring);=0A=
+		}=0A=
 	}=0A=
-	parts =3D kmalloc(sizeof(*parts)*nrparts + sizeof(nullstring) + =
namelen, GFP_KERNEL);=0A=
+#endif=0A=
+	parts =3D kmalloc(sizeof(*parts)*nrparts + nulllen + namelen, =
GFP_KERNEL);=0A=
 =0A=
 	if (!parts) {=0A=
 		ret =3D -ENOMEM;=0A=
 		goto out;=0A=
 	}=0A=
 =0A=
-	memset(parts, 0, sizeof(*parts)*nrparts + namelen);=0A=
+	memset(parts, 0, sizeof(*parts)*nrparts + nulllen + namelen);=0A=
 =0A=
-	/* FIXME: Include nullname only if it's used */=0A=
 	nullname =3D (char *)&parts[nrparts];=0A=
-	sprintf(nullname, nullstring);=0A=
-	names =3D nullname + sizeof(nullstring);=0A=
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=0A=
+	if (nulllen > 0) {=0A=
+		strcpy(nullname, nullstring);=0A=
+	}=0A=
+#endif=0A=
+	names =3D nullname + nulllen;=0A=
 =0A=
 	i=3D0;=0A=
 =0A=
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=0A=
 	if (fl->img->flash_base) {=0A=
	       parts[0].name =3D nullname;=0A=
	       parts[0].size =3D fl->img->flash_base;=0A=
	       parts[0].offset =3D 0;=0A=
+		i++;=0A=
 	}=0A=
+#endif=0A=
 	for ( ; i<nrparts; i++) {=0A=
 		parts[i].size =3D fl->img->size;=0A=
 		parts[i].offset =3D fl->img->flash_base;=0A=
 		parts[i].name =3D names;=0A=
 =0A=
 		strcpy(names, fl->img->name);=0A=
+		if (!memcmp(names, "RedBoot", 8) ||=0A=
+				!memcmp(names, "RedBoot config", 15) ||=0A=
+				!memcmp(names, "FIS directory", 14)) {=0A=
+			parts[i].mask_flags =3D MTD_WRITEABLE;=0A=
+		}=0A=
 		names +=3D strlen(names)+1;=0A=
 =0A=
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=0A=
 		if(fl->next && fl->img->flash_base + fl->img->size + =
master->erasesize <=3D fl->next->img->flash_base) {=0A=
 			i++;=0A=
 			parts[i].offset =3D parts[i-1].size + parts[i-1].offset;=0A=
 			parts[i].size =3D fl->next->img->flash_base - parts[i].offset;=0A=
 			parts[i].name =3D nullname;=0A=
 		}=0A=
+#endif=0A=
 		tmp_fl =3D fl;=0A=
 		fl =3D fl->next;=0A=
 		kfree(tmp_fl);=0A=

------=_NextPart_000_0019_01C41197.A443D7E0--
