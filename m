From: cgan@iders.ca (Christian Gan)
Date: Wed, 5 Mar 2003 13:21:02 -0600
Subject: [PATCH] NAND and mtdconcat
In-Reply-To: <200212111138.gBBBcYs16381@dagobert.svc.sysgo.de>
Message-ID: <NFBBLPGPLKFIKCCPLALEAENICFAA.cgan@iders.ca>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This is a multi-part message in MIME format.

------=_NextPart_000_0132_01C2E31A.116CC0F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello all,

Attached is a patch for mtdconcat.c that supports NAND functions for the
oob.  I've tested it on my own bench and it seems to work great on two 64MB
NANDs concatenated into one MTD.

Robert, since you were the original author of this file, can you verify it
for me?

Thanks!

------=_NextPart_000_0132_01C2E31A.116CC0F0
Content-Type: application/octet-stream;
	name="mtdconcat.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtdconcat.diff"

Index: mtdconcat.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
RCS file: /home/cvs/mtd/drivers/mtd/mtdconcat.c,v=0A=
retrieving revision 1.3=0A=
diff -u -r1.3 mtdconcat.c=0A=
--- mtdconcat.c	21 May 2002 21:04:25 -0000	1.3=0A=
+++ mtdconcat.c	5 Mar 2003 19:13:45 -0000=0A=
@@ -52,6 +52,8 @@=0A=
 			size_t *retlen, u_char *buf)=0A=
 {=0A=
 	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+    struct mtd_info *subdev =3D NULL;=0A=
+	size_t size, retsize;=0A=
 	int err =3D -EINVAL;=0A=
 	int i;=0A=
 =0A=
@@ -59,20 +61,21 @@=0A=
 =0A=
 	for(i =3D 0; i < concat->num_subdev; i++)=0A=
 	{=0A=
-		struct mtd_info *subdev =3D concat->subdev[i];=0A=
-		size_t size, retsize;=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
+        retsize =3D 0;=0A=
 =0A=
 		if (from >=3D subdev->size)=0A=
-		{=0A=
+		{   /* Not destined for this subdev */=0A=
 			size  =3D 0;=0A=
 			from -=3D subdev->size;=0A=
 		}=0A=
 		else=0A=
 		{=0A=
 			if (from + len > subdev->size)=0A=
-				size =3D subdev->size - from;=0A=
+				size =3D subdev->size - from; /* First part goes into this subdev */=0A=
 			else=0A=
-				size =3D len;=0A=
+				size =3D len; /* Entire transaction goes into this subdev */=0A=
 =0A=
 			err =3D subdev->read(subdev, from, size, &retsize, buf);=0A=
 =0A=
@@ -96,6 +99,8 @@=0A=
 			size_t *retlen, const u_char *buf)=0A=
 {=0A=
 	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;=0A=
+	size_t size, retsize;=0A=
 	int err =3D -EINVAL;=0A=
 	int i;=0A=
 =0A=
@@ -106,8 +111,9 @@=0A=
 =0A=
 	for(i =3D 0; i < concat->num_subdev; i++)=0A=
 	{=0A=
-		struct mtd_info *subdev =3D concat->subdev[i];=0A=
-		size_t size, retsize;=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
+        retsize =3D 0;=0A=
 =0A=
 		if (to >=3D subdev->size)=0A=
 		{=0A=
@@ -142,6 +148,226 @@=0A=
 	return err;=0A=
 }=0A=
 =0A=
+static int concat_read_ecc (struct mtd_info *mtd, loff_t from, size_t =
len,=0A=
+            size_t *retlen, u_char *buf, u_char *eccbuf, int oobsel)=0A=
+{=0A=
+	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;=0A=
+	size_t size, retsize;=0A=
+	int err =3D -EINVAL;=0A=
+	int i;=0A=
+=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	for(i =3D 0; i < concat->num_subdev; i++)=0A=
+	{=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
+        retsize =3D 0;=0A=
+=0A=
+		if (from >=3D subdev->size)=0A=
+		{   /* Not destined for this subdev */=0A=
+			size  =3D 0;=0A=
+			from -=3D subdev->size;=0A=
+		}=0A=
+		else=0A=
+		{=0A=
+			if (from + len > subdev->size)=0A=
+				size =3D subdev->size - from; /* First part goes into this subdev */=0A=
+			else=0A=
+				size =3D len; /* Entire transaction goes into this subdev */=0A=
+            =0A=
+            if (subdev->read_ecc)=0A=
+    			err =3D subdev->read_ecc(subdev, from, size, &retsize, buf, =
eccbuf, oobsel);=0A=
+            else=0A=
+                err =3D -EINVAL;=0A=
+=0A=
+			if(err)=0A=
+				break;=0A=
+=0A=
+			*retlen +=3D retsize;=0A=
+			len -=3D size;=0A=
+			if(len =3D=3D 0)=0A=
+				break;=0A=
+=0A=
+			err =3D -EINVAL;=0A=
+			buf +=3D size;=0A=
+            if (eccbuf)=0A=
+            {=0A=
+                eccbuf +=3D subdev->oobsize;=0A=
+                /* in nand.c at least, eccbufs are tagged with 2 =
(int)eccstatus',=0A=
+                   we must account for these */=0A=
+                eccbuf +=3D 2 * (sizeof(int)); =0A=
+            }=0A=
+			from =3D 0;=0A=
+		}=0A=
+	}=0A=
+	return err;=0A=
+}=0A=
+=0A=
+static int concat_write_ecc (struct mtd_info *mtd, loff_t to, size_t =
len,=0A=
+            size_t *retlen, const u_char *buf, u_char *eccbuf, int =
oobsel)=0A=
+{=0A=
+	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;=0A=
+	size_t size, retsize;=0A=
+	int err =3D -EINVAL;=0A=
+	int i;=0A=
+=0A=
+	if (!(mtd->flags & MTD_WRITEABLE))=0A=
+		return -EROFS;=0A=
+=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	for(i =3D 0; i < concat->num_subdev; i++)=0A=
+	{=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
+        retsize =3D 0;=0A=
+=0A=
+		if (to >=3D subdev->size)=0A=
+		{=0A=
+			size  =3D 0;=0A=
+			to -=3D subdev->size;=0A=
+		}=0A=
+		else=0A=
+		{=0A=
+			if (to + len > subdev->size)=0A=
+				size =3D subdev->size - to;=0A=
+			else=0A=
+				size =3D len;=0A=
+=0A=
+			if (!(subdev->flags & MTD_WRITEABLE))=0A=
+				err =3D -EROFS;=0A=
+			else if (subdev->write_ecc)=0A=
+				err =3D subdev->write_ecc(subdev, to, size, &retsize, buf, eccbuf, =
oobsel);=0A=
+            else=0A=
+                err =3D -EINVAL;=0A=
+=0A=
+			if(err)=0A=
+				break;=0A=
+=0A=
+			*retlen +=3D retsize;=0A=
+			len -=3D size;=0A=
+			if(len =3D=3D 0)=0A=
+				break;=0A=
+=0A=
+			err =3D -EINVAL;=0A=
+			buf +=3D size;=0A=
+            if (eccbuf)=0A=
+                eccbuf +=3D subdev->oobsize;=0A=
+			to =3D 0;=0A=
+		}=0A=
+	}=0A=
+	return err;=0A=
+}=0A=
+=0A=
+static int concat_read_oob (struct mtd_info *mtd, loff_t from, size_t =
len,=0A=
+            size_t *retlen, u_char *buf)=0A=
+{=0A=
+	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;=0A=
+	size_t size, retsize;=0A=
+	int err =3D -EINVAL;=0A=
+	int i;=0A=
+=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	for(i =3D 0; i < concat->num_subdev; i++)=0A=
+	{=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
+        retsize =3D 0;=0A=
+=0A=
+		if (from >=3D subdev->size)=0A=
+		{   /* Not destined for this subdev */=0A=
+			size  =3D 0;=0A=
+			from -=3D subdev->size;=0A=
+		}=0A=
+		else=0A=
+		{=0A=
+			if (from + len > subdev->size)=0A=
+				size =3D subdev->size - from; /* First part goes into this subdev */=0A=
+			else=0A=
+				size =3D len; /* Entire transaction goes into this subdev */=0A=
+            =0A=
+            if (subdev->read_oob)=0A=
+    			err =3D subdev->read_oob(subdev, from, size, &retsize, buf);=0A=
+            else=0A=
+                err =3D -EINVAL;=0A=
+=0A=
+			if(err)=0A=
+				break;=0A=
+=0A=
+			*retlen +=3D retsize;=0A=
+			len -=3D size;=0A=
+			if(len =3D=3D 0)=0A=
+				break;=0A=
+=0A=
+			err =3D -EINVAL;=0A=
+			buf +=3D size;=0A=
+			from =3D 0;=0A=
+		}=0A=
+	}=0A=
+	return err;=0A=
+}=0A=
+=0A=
+static int concat_write_oob (struct mtd_info *mtd, loff_t to, size_t =
len, =0A=
+            size_t *retlen, const u_char *buf)=0A=
+{=0A=
+	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;=0A=
+	size_t size, retsize;=0A=
+	int err =3D -EINVAL;=0A=
+	int i;=0A=
+=0A=
+	if (!(mtd->flags & MTD_WRITEABLE))=0A=
+		return -EROFS;=0A=
+=0A=
+	*retlen =3D 0;=0A=
+=0A=
+	for(i =3D 0; i < concat->num_subdev; i++)=0A=
+	{=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
+        retsize =3D 0;=0A=
+=0A=
+		if (to >=3D subdev->size)=0A=
+		{=0A=
+			size  =3D 0;=0A=
+			to -=3D subdev->size;=0A=
+		}=0A=
+		else=0A=
+		{=0A=
+			if (to + len > subdev->size)=0A=
+				size =3D subdev->size - to;=0A=
+			else=0A=
+				size =3D len;=0A=
+=0A=
+			if (!(subdev->flags & MTD_WRITEABLE))=0A=
+				err =3D -EROFS;=0A=
+			else if (subdev->write_oob)=0A=
+				err =3D subdev->write_oob(subdev, to, size, &retsize, buf);=0A=
+            else=0A=
+                err =3D -EINVAL;=0A=
+=0A=
+			if(err)=0A=
+				break;=0A=
+=0A=
+			*retlen +=3D retsize;=0A=
+			len -=3D size;=0A=
+			if(len =3D=3D 0)=0A=
+				break;=0A=
+=0A=
+			err =3D -EINVAL;=0A=
+			buf +=3D size;=0A=
+			to =3D 0;=0A=
+		}=0A=
+	}=0A=
+	return err;=0A=
+}=0A=
+=0A=
+=0A=
 static void concat_erase_callback (struct erase_info *instr)=0A=
 {=0A=
 	wake_up((wait_queue_head_t *)instr->priv);=0A=
@@ -316,6 +542,8 @@=0A=
 static int concat_lock (struct mtd_info *mtd, loff_t ofs, size_t len)=0A=
 {=0A=
 	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;=0A=
+	size_t size;=0A=
 	int i, err =3D -EINVAL;=0A=
 =0A=
 	if ((len + ofs) > mtd->size) =0A=
@@ -323,8 +551,8 @@=0A=
 =0A=
 	for(i =3D 0; i < concat->num_subdev; i++)=0A=
 	{=0A=
-		struct mtd_info *subdev =3D concat->subdev[i];=0A=
-		size_t size;=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
 =0A=
 		if (ofs >=3D subdev->size)=0A=
 		{=0A=
@@ -357,6 +585,8 @@=0A=
 static int concat_unlock (struct mtd_info *mtd, loff_t ofs, size_t len)=0A=
 {=0A=
 	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;=0A=
+	size_t size;=0A=
 	int i, err =3D 0;=0A=
 =0A=
 	if ((len + ofs) > mtd->size) =0A=
@@ -364,8 +594,8 @@=0A=
 =0A=
 	for(i =3D 0; i < concat->num_subdev; i++)=0A=
 	{=0A=
-		struct mtd_info *subdev =3D concat->subdev[i];=0A=
-		size_t size;=0A=
+		subdev =3D concat->subdev[i];=0A=
+		size =3D 0;=0A=
 =0A=
 		if (ofs >=3D subdev->size)=0A=
 		{=0A=
@@ -398,11 +628,12 @@=0A=
 static void concat_sync(struct mtd_info *mtd)=0A=
 {=0A=
 	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;    =0A=
 	int i;=0A=
 =0A=
 	for(i =3D 0; i < concat->num_subdev; i++)=0A=
 	{=0A=
-		struct mtd_info *subdev =3D concat->subdev[i];=0A=
+		subdev =3D concat->subdev[i];=0A=
 		subdev->sync(subdev);=0A=
 	}=0A=
 }=0A=
@@ -410,11 +641,12 @@=0A=
 static int concat_suspend(struct mtd_info *mtd)=0A=
 {=0A=
 	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+	struct mtd_info *subdev =3D NULL;    =0A=
 	int i, rc =3D 0;=0A=
 =0A=
 	for(i =3D 0; i < concat->num_subdev; i++)=0A=
 	{=0A=
-		struct mtd_info *subdev =3D concat->subdev[i];=0A=
+        subdev =3D concat->subdev[i];=0A=
 		if((rc =3D subdev->suspend(subdev)) < 0)=0A=
 			return rc;=0A=
 	}=0A=
@@ -424,11 +656,12 @@=0A=
 static void concat_resume(struct mtd_info *mtd)=0A=
 {=0A=
 	struct mtd_concat *concat =3D CONCAT(mtd);=0A=
+    struct mtd_info *subdev =3D NULL;    =0A=
 	int i;=0A=
 =0A=
 	for(i =3D 0; i < concat->num_subdev; i++)=0A=
 	{=0A=
-		struct mtd_info *subdev =3D concat->subdev[i];=0A=
+        subdev =3D concat->subdev[i];		=0A=
 		subdev->resume(subdev);=0A=
 	}=0A=
 }=0A=
@@ -526,9 +759,13 @@=0A=
 	 *       because they are messy to implement and they are not=0A=
 	 *       used to a great extent anyway.=0A=
 	 */=0A=
-	concat->mtd.erase   =3D concat_erase;=0A=
-	concat->mtd.read    =3D concat_read;=0A=
-	concat->mtd.write   =3D concat_write;=0A=
+	concat->mtd.erase     =3D concat_erase;=0A=
+	concat->mtd.read      =3D concat_read;    =0A=
+	concat->mtd.write     =3D concat_write;=0A=
+	concat->mtd.read_ecc  =3D concat_read_ecc;    =0A=
+	concat->mtd.write_ecc =3D concat_write_ecc;=0A=
+	concat->mtd.read_oob  =3D concat_read_oob;    =0A=
+	concat->mtd.write_oob =3D concat_write_oob;=0A=
 	concat->mtd.sync    =3D concat_sync;=0A=
 	concat->mtd.lock    =3D concat_lock;=0A=
 	concat->mtd.unlock  =3D concat_unlock;=0A=

------=_NextPart_000_0132_01C2E31A.116CC0F0--
