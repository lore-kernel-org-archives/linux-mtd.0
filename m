Received: from lunge.queued.net ([173.255.254.236])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RAxTr-0001Th-2k
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2011 05:23:53 +0000
Date: Mon, 3 Oct 2011 22:23:46 -0700
From: Andres Salomon <dilinger@queued.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: rename the redboot module to RedBoot
Message-ID: <20111003222346.5ac48654@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

parse_mtd_partitions takes a list of partition types; if the driver
isn't loaded, it attempts to load it, and then it grabs the partition
parser.  For redboot, the module name is "redboot.ko", while the parser
name is "RedBoot".  Since modprobe is case-sensitive, attempting to
modprobe "RedBoot" will never work.  I suspect the embedded systems that
make use of redboot just always manually loaded redboot prior to loading
their specific nand chip drivers (or statically compiled it in).

Alternatives include renaming the parser to "redboot", changing
parse_mtd_partitions to accept pairs of strings, or changing modprobe
to be case-insensitive.  Renaming the module seems like the easy,
obvious solution. :)

Signed-off-by: Andres Salomon <dilinger@queued.net>
---
 drivers/mtd/Makefile  |    2 +-
 drivers/mtd/RedBoot.c |  315 +++++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/mtd/redboot.c |  315 ---------------------------------------------=
----
 3 files changed, 316 insertions(+), 316 deletions(-)
 create mode 100644 drivers/mtd/RedBoot.c
 delete mode 100644 drivers/mtd/redboot.c

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 39664c4..2b6763c 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_MTD)		+=3D mtd.o
 mtd-y				:=3D mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o
 mtd-$(CONFIG_MTD_OF_PARTS)	+=3D ofpart.o
=20
-obj-$(CONFIG_MTD_REDBOOT_PARTS) +=3D redboot.o
+obj-$(CONFIG_MTD_REDBOOT_PARTS) +=3D RedBoot.o
 obj-$(CONFIG_MTD_CMDLINE_PARTS) +=3D cmdlinepart.o
 obj-$(CONFIG_MTD_AFS_PARTS)	+=3D afs.o
 obj-$(CONFIG_MTD_AR7_PARTS)	+=3D ar7part.o
diff --git a/drivers/mtd/RedBoot.c b/drivers/mtd/RedBoot.c
new file mode 100644
index 0000000..7a87d07
--- /dev/null
+++ b/drivers/mtd/RedBoot.c
@@ -0,0 +1,315 @@
+/*
+ * Parse RedBoot-style Flash Image System (FIS) tables and
+ * produce a Linux partition array to match.
+ *
+ * Copyright =C2=A9 2001      Red Hat UK Limited
+ * Copyright =C2=A9 2001-2010 David Woodhouse <dwmw2@infradead.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  =
USA
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/vmalloc.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+
+struct fis_image_desc {
+    unsigned char name[16];      // Null terminated name
+    uint32_t	  flash_base;    // Address within FLASH of image
+    uint32_t	  mem_base;      // Address in memory where it executes
+    uint32_t	  size;          // Length of image
+    uint32_t	  entry_point;   // Execution entry point
+    uint32_t	  data_length;   // Length of actual data
+    unsigned char _pad[256-(16+7*sizeof(uint32_t))];
+    uint32_t	  desc_cksum;    // Checksum over image descriptor
+    uint32_t	  file_cksum;    // Checksum over image data
+};
+
+struct fis_list {
+	struct fis_image_desc *img;
+	struct fis_list *next;
+};
+
+static int directory =3D CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK;
+module_param(directory, int, 0);
+
+static inline int redboot_checksum(struct fis_image_desc *img)
+{
+	/* RedBoot doesn't actually write the desc_cksum field yet AFAICT */
+	return 1;
+}
+
+static int parse_redboot_partitions(struct mtd_info *master,
+                             struct mtd_partition **pparts,
+                             unsigned long fis_origin)
+{
+	int nrparts =3D 0;
+	struct fis_image_desc *buf;
+	struct mtd_partition *parts;
+	struct fis_list *fl =3D NULL, *tmp_fl;
+	int ret, i;
+	size_t retlen;
+	char *names;
+	char *nullname;
+	int namelen =3D 0;
+	int nulllen =3D 0;
+	int numslots;
+	unsigned long offset;
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
+	static char nullstring[] =3D "unallocated";
+#endif
+
+	if ( directory < 0 ) {
+		offset =3D master->size + directory * master->erasesize;
+		while (master->block_isbad &&=20
+		       master->block_isbad(master, offset)) {
+			if (!offset) {
+			nogood:
+				printk(KERN_NOTICE "Failed to find a non-bad block to check for RedBoo=
t partition table\n");
+				return -EIO;
+			}
+			offset -=3D master->erasesize;
+		}
+	} else {
+		offset =3D directory * master->erasesize;
+		while (master->block_isbad &&=20
+		       master->block_isbad(master, offset)) {
+			offset +=3D master->erasesize;
+			if (offset =3D=3D master->size)
+				goto nogood;
+		}
+	}
+	buf =3D vmalloc(master->erasesize);
+
+	if (!buf)
+		return -ENOMEM;
+
+	printk(KERN_NOTICE "Searching for RedBoot partition table in %s at offset=
 0x%lx\n",
+	       master->name, offset);
+
+	ret =3D master->read(master, offset,
+			   master->erasesize, &retlen, (void *)buf);
+
+	if (ret)
+		goto out;
+
+	if (retlen !=3D master->erasesize) {
+		ret =3D -EIO;
+		goto out;
+	}
+
+	numslots =3D (master->erasesize / sizeof(struct fis_image_desc));
+	for (i =3D 0; i < numslots; i++) {
+		if (!memcmp(buf[i].name, "FIS directory", 14)) {
+			/* This is apparently the FIS directory entry for the
+			 * FIS directory itself.  The FIS directory size is
+			 * one erase block; if the buf[i].size field is
+			 * swab32(erasesize) then we know we are looking at
+			 * a byte swapped FIS directory - swap all the entries!
+			 * (NOTE: this is 'size' not 'data_length'; size is
+			 * the full size of the entry.)
+			 */
+
+			/* RedBoot can combine the FIS directory and
+			   config partitions into a single eraseblock;
+			   we assume wrong-endian if either the swapped
+			   'size' matches the eraseblock size precisely,
+			   or if the swapped size actually fits in an
+			   eraseblock while the unswapped size doesn't. */
+			if (swab32(buf[i].size) =3D=3D master->erasesize ||
+			    (buf[i].size > master->erasesize
+			     && swab32(buf[i].size) < master->erasesize)) {
+				int j;
+				/* Update numslots based on actual FIS directory size */
+				numslots =3D swab32(buf[i].size) / sizeof (struct fis_image_desc);
+				for (j =3D 0; j < numslots; ++j) {
+
+					/* A single 0xff denotes a deleted entry.
+					 * Two of them in a row is the end of the table.
+					 */
+					if (buf[j].name[0] =3D=3D 0xff) {
+				  		if (buf[j].name[1] =3D=3D 0xff) {
+							break;
+						} else {
+							continue;
+						}
+					}
+
+					/* The unsigned long fields were written with the
+					 * wrong byte sex, name and pad have no byte sex.
+					 */
+					swab32s(&buf[j].flash_base);
+					swab32s(&buf[j].mem_base);
+					swab32s(&buf[j].size);
+					swab32s(&buf[j].entry_point);
+					swab32s(&buf[j].data_length);
+					swab32s(&buf[j].desc_cksum);
+					swab32s(&buf[j].file_cksum);
+				}
+			} else if (buf[i].size < master->erasesize) {
+				/* Update numslots based on actual FIS directory size */
+				numslots =3D buf[i].size / sizeof(struct fis_image_desc);
+			}
+			break;
+		}
+	}
+	if (i =3D=3D numslots) {
+		/* Didn't find it */
+		printk(KERN_NOTICE "No RedBoot partition table detected in %s\n",
+		       master->name);
+		ret =3D 0;
+		goto out;
+	}
+
+	for (i =3D 0; i < numslots; i++) {
+		struct fis_list *new_fl, **prev;
+
+		if (buf[i].name[0] =3D=3D 0xff) {
+			if (buf[i].name[1] =3D=3D 0xff) {
+				break;
+			} else {
+				continue;
+			}
+		}
+		if (!redboot_checksum(&buf[i]))
+			break;
+
+		new_fl =3D kmalloc(sizeof(struct fis_list), GFP_KERNEL);
+		namelen +=3D strlen(buf[i].name)+1;
+		if (!new_fl) {
+			ret =3D -ENOMEM;
+			goto out;
+		}
+		new_fl->img =3D &buf[i];
+                if (fis_origin) {
+                        buf[i].flash_base -=3D fis_origin;
+                } else {
+                        buf[i].flash_base &=3D master->size-1;
+                }
+
+		/* I'm sure the JFFS2 code has done me permanent damage.
+		 * I now think the following is _normal_
+		 */
+		prev =3D &fl;
+		while(*prev && (*prev)->img->flash_base < new_fl->img->flash_base)
+			prev =3D &(*prev)->next;
+		new_fl->next =3D *prev;
+		*prev =3D new_fl;
+
+		nrparts++;
+	}
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
+	if (fl->img->flash_base) {
+		nrparts++;
+		nulllen =3D sizeof(nullstring);
+	}
+
+	for (tmp_fl =3D fl; tmp_fl->next; tmp_fl =3D tmp_fl->next) {
+		if (tmp_fl->img->flash_base + tmp_fl->img->size + master->erasesize <=3D=
 tmp_fl->next->img->flash_base) {
+			nrparts++;
+			nulllen =3D sizeof(nullstring);
+		}
+	}
+#endif
+	parts =3D kzalloc(sizeof(*parts)*nrparts + nulllen + namelen, GFP_KERNEL);
+
+	if (!parts) {
+		ret =3D -ENOMEM;
+		goto out;
+	}
+
+	nullname =3D (char *)&parts[nrparts];
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
+	if (nulllen > 0) {
+		strcpy(nullname, nullstring);
+	}
+#endif
+	names =3D nullname + nulllen;
+
+	i=3D0;
+
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
+	if (fl->img->flash_base) {
+	       parts[0].name =3D nullname;
+	       parts[0].size =3D fl->img->flash_base;
+	       parts[0].offset =3D 0;
+		i++;
+	}
+#endif
+	for ( ; i<nrparts; i++) {
+		parts[i].size =3D fl->img->size;
+		parts[i].offset =3D fl->img->flash_base;
+		parts[i].name =3D names;
+
+		strcpy(names, fl->img->name);
+#ifdef CONFIG_MTD_REDBOOT_PARTS_READONLY
+		if (!memcmp(names, "RedBoot", 8) ||
+				!memcmp(names, "RedBoot config", 15) ||
+				!memcmp(names, "FIS directory", 14)) {
+			parts[i].mask_flags =3D MTD_WRITEABLE;
+		}
+#endif
+		names +=3D strlen(names)+1;
+
+#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
+		if(fl->next && fl->img->flash_base + fl->img->size + master->erasesize <=
=3D fl->next->img->flash_base) {
+			i++;
+			parts[i].offset =3D parts[i-1].size + parts[i-1].offset;
+			parts[i].size =3D fl->next->img->flash_base - parts[i].offset;
+			parts[i].name =3D nullname;
+		}
+#endif
+		tmp_fl =3D fl;
+		fl =3D fl->next;
+		kfree(tmp_fl);
+	}
+	ret =3D nrparts;
+	*pparts =3D parts;
+ out:
+	while (fl) {
+		struct fis_list *old =3D fl;
+		fl =3D fl->next;
+		kfree(old);
+	}
+	vfree(buf);
+	return ret;
+}
+
+static struct mtd_part_parser redboot_parser =3D {
+	.owner =3D THIS_MODULE,
+	.parse_fn =3D parse_redboot_partitions,
+	.name =3D "RedBoot",
+};
+
+static int __init redboot_parser_init(void)
+{
+	return register_mtd_parser(&redboot_parser);
+}
+
+static void __exit redboot_parser_exit(void)
+{
+	deregister_mtd_parser(&redboot_parser);
+}
+
+module_init(redboot_parser_init);
+module_exit(redboot_parser_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
+MODULE_DESCRIPTION("Parsing code for RedBoot Flash Image System (FIS) tabl=
es");
diff --git a/drivers/mtd/redboot.c b/drivers/mtd/redboot.c
deleted file mode 100644
index 7a87d07..0000000
--- a/drivers/mtd/redboot.c
+++ /dev/null
@@ -1,315 +0,0 @@
-/*
- * Parse RedBoot-style Flash Image System (FIS) tables and
- * produce a Linux partition array to match.
- *
- * Copyright =C2=A9 2001      Red Hat UK Limited
- * Copyright =C2=A9 2001-2010 David Woodhouse <dwmw2@infradead.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  =
USA
- *
- */
-
-#include <linux/kernel.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/vmalloc.h>
-
-#include <linux/mtd/mtd.h>
-#include <linux/mtd/partitions.h>
-
-struct fis_image_desc {
-    unsigned char name[16];      // Null terminated name
-    uint32_t	  flash_base;    // Address within FLASH of image
-    uint32_t	  mem_base;      // Address in memory where it executes
-    uint32_t	  size;          // Length of image
-    uint32_t	  entry_point;   // Execution entry point
-    uint32_t	  data_length;   // Length of actual data
-    unsigned char _pad[256-(16+7*sizeof(uint32_t))];
-    uint32_t	  desc_cksum;    // Checksum over image descriptor
-    uint32_t	  file_cksum;    // Checksum over image data
-};
-
-struct fis_list {
-	struct fis_image_desc *img;
-	struct fis_list *next;
-};
-
-static int directory =3D CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK;
-module_param(directory, int, 0);
-
-static inline int redboot_checksum(struct fis_image_desc *img)
-{
-	/* RedBoot doesn't actually write the desc_cksum field yet AFAICT */
-	return 1;
-}
-
-static int parse_redboot_partitions(struct mtd_info *master,
-                             struct mtd_partition **pparts,
-                             unsigned long fis_origin)
-{
-	int nrparts =3D 0;
-	struct fis_image_desc *buf;
-	struct mtd_partition *parts;
-	struct fis_list *fl =3D NULL, *tmp_fl;
-	int ret, i;
-	size_t retlen;
-	char *names;
-	char *nullname;
-	int namelen =3D 0;
-	int nulllen =3D 0;
-	int numslots;
-	unsigned long offset;
-#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
-	static char nullstring[] =3D "unallocated";
-#endif
-
-	if ( directory < 0 ) {
-		offset =3D master->size + directory * master->erasesize;
-		while (master->block_isbad &&=20
-		       master->block_isbad(master, offset)) {
-			if (!offset) {
-			nogood:
-				printk(KERN_NOTICE "Failed to find a non-bad block to check for RedBoo=
t partition table\n");
-				return -EIO;
-			}
-			offset -=3D master->erasesize;
-		}
-	} else {
-		offset =3D directory * master->erasesize;
-		while (master->block_isbad &&=20
-		       master->block_isbad(master, offset)) {
-			offset +=3D master->erasesize;
-			if (offset =3D=3D master->size)
-				goto nogood;
-		}
-	}
-	buf =3D vmalloc(master->erasesize);
-
-	if (!buf)
-		return -ENOMEM;
-
-	printk(KERN_NOTICE "Searching for RedBoot partition table in %s at offset=
 0x%lx\n",
-	       master->name, offset);
-
-	ret =3D master->read(master, offset,
-			   master->erasesize, &retlen, (void *)buf);
-
-	if (ret)
-		goto out;
-
-	if (retlen !=3D master->erasesize) {
-		ret =3D -EIO;
-		goto out;
-	}
-
-	numslots =3D (master->erasesize / sizeof(struct fis_image_desc));
-	for (i =3D 0; i < numslots; i++) {
-		if (!memcmp(buf[i].name, "FIS directory", 14)) {
-			/* This is apparently the FIS directory entry for the
-			 * FIS directory itself.  The FIS directory size is
-			 * one erase block; if the buf[i].size field is
-			 * swab32(erasesize) then we know we are looking at
-			 * a byte swapped FIS directory - swap all the entries!
-			 * (NOTE: this is 'size' not 'data_length'; size is
-			 * the full size of the entry.)
-			 */
-
-			/* RedBoot can combine the FIS directory and
-			   config partitions into a single eraseblock;
-			   we assume wrong-endian if either the swapped
-			   'size' matches the eraseblock size precisely,
-			   or if the swapped size actually fits in an
-			   eraseblock while the unswapped size doesn't. */
-			if (swab32(buf[i].size) =3D=3D master->erasesize ||
-			    (buf[i].size > master->erasesize
-			     && swab32(buf[i].size) < master->erasesize)) {
-				int j;
-				/* Update numslots based on actual FIS directory size */
-				numslots =3D swab32(buf[i].size) / sizeof (struct fis_image_desc);
-				for (j =3D 0; j < numslots; ++j) {
-
-					/* A single 0xff denotes a deleted entry.
-					 * Two of them in a row is the end of the table.
-					 */
-					if (buf[j].name[0] =3D=3D 0xff) {
-				  		if (buf[j].name[1] =3D=3D 0xff) {
-							break;
-						} else {
-							continue;
-						}
-					}
-
-					/* The unsigned long fields were written with the
-					 * wrong byte sex, name and pad have no byte sex.
-					 */
-					swab32s(&buf[j].flash_base);
-					swab32s(&buf[j].mem_base);
-					swab32s(&buf[j].size);
-					swab32s(&buf[j].entry_point);
-					swab32s(&buf[j].data_length);
-					swab32s(&buf[j].desc_cksum);
-					swab32s(&buf[j].file_cksum);
-				}
-			} else if (buf[i].size < master->erasesize) {
-				/* Update numslots based on actual FIS directory size */
-				numslots =3D buf[i].size / sizeof(struct fis_image_desc);
-			}
-			break;
-		}
-	}
-	if (i =3D=3D numslots) {
-		/* Didn't find it */
-		printk(KERN_NOTICE "No RedBoot partition table detected in %s\n",
-		       master->name);
-		ret =3D 0;
-		goto out;
-	}
-
-	for (i =3D 0; i < numslots; i++) {
-		struct fis_list *new_fl, **prev;
-
-		if (buf[i].name[0] =3D=3D 0xff) {
-			if (buf[i].name[1] =3D=3D 0xff) {
-				break;
-			} else {
-				continue;
-			}
-		}
-		if (!redboot_checksum(&buf[i]))
-			break;
-
-		new_fl =3D kmalloc(sizeof(struct fis_list), GFP_KERNEL);
-		namelen +=3D strlen(buf[i].name)+1;
-		if (!new_fl) {
-			ret =3D -ENOMEM;
-			goto out;
-		}
-		new_fl->img =3D &buf[i];
-                if (fis_origin) {
-                        buf[i].flash_base -=3D fis_origin;
-                } else {
-                        buf[i].flash_base &=3D master->size-1;
-                }
-
-		/* I'm sure the JFFS2 code has done me permanent damage.
-		 * I now think the following is _normal_
-		 */
-		prev =3D &fl;
-		while(*prev && (*prev)->img->flash_base < new_fl->img->flash_base)
-			prev =3D &(*prev)->next;
-		new_fl->next =3D *prev;
-		*prev =3D new_fl;
-
-		nrparts++;
-	}
-#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
-	if (fl->img->flash_base) {
-		nrparts++;
-		nulllen =3D sizeof(nullstring);
-	}
-
-	for (tmp_fl =3D fl; tmp_fl->next; tmp_fl =3D tmp_fl->next) {
-		if (tmp_fl->img->flash_base + tmp_fl->img->size + master->erasesize <=3D=
 tmp_fl->next->img->flash_base) {
-			nrparts++;
-			nulllen =3D sizeof(nullstring);
-		}
-	}
-#endif
-	parts =3D kzalloc(sizeof(*parts)*nrparts + nulllen + namelen, GFP_KERNEL);
-
-	if (!parts) {
-		ret =3D -ENOMEM;
-		goto out;
-	}
-
-	nullname =3D (char *)&parts[nrparts];
-#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
-	if (nulllen > 0) {
-		strcpy(nullname, nullstring);
-	}
-#endif
-	names =3D nullname + nulllen;
-
-	i=3D0;
-
-#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
-	if (fl->img->flash_base) {
-	       parts[0].name =3D nullname;
-	       parts[0].size =3D fl->img->flash_base;
-	       parts[0].offset =3D 0;
-		i++;
-	}
-#endif
-	for ( ; i<nrparts; i++) {
-		parts[i].size =3D fl->img->size;
-		parts[i].offset =3D fl->img->flash_base;
-		parts[i].name =3D names;
-
-		strcpy(names, fl->img->name);
-#ifdef CONFIG_MTD_REDBOOT_PARTS_READONLY
-		if (!memcmp(names, "RedBoot", 8) ||
-				!memcmp(names, "RedBoot config", 15) ||
-				!memcmp(names, "FIS directory", 14)) {
-			parts[i].mask_flags =3D MTD_WRITEABLE;
-		}
-#endif
-		names +=3D strlen(names)+1;
-
-#ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
-		if(fl->next && fl->img->flash_base + fl->img->size + master->erasesize <=
=3D fl->next->img->flash_base) {
-			i++;
-			parts[i].offset =3D parts[i-1].size + parts[i-1].offset;
-			parts[i].size =3D fl->next->img->flash_base - parts[i].offset;
-			parts[i].name =3D nullname;
-		}
-#endif
-		tmp_fl =3D fl;
-		fl =3D fl->next;
-		kfree(tmp_fl);
-	}
-	ret =3D nrparts;
-	*pparts =3D parts;
- out:
-	while (fl) {
-		struct fis_list *old =3D fl;
-		fl =3D fl->next;
-		kfree(old);
-	}
-	vfree(buf);
-	return ret;
-}
-
-static struct mtd_part_parser redboot_parser =3D {
-	.owner =3D THIS_MODULE,
-	.parse_fn =3D parse_redboot_partitions,
-	.name =3D "RedBoot",
-};
-
-static int __init redboot_parser_init(void)
-{
-	return register_mtd_parser(&redboot_parser);
-}
-
-static void __exit redboot_parser_exit(void)
-{
-	deregister_mtd_parser(&redboot_parser);
-}
-
-module_init(redboot_parser_init);
-module_exit(redboot_parser_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
-MODULE_DESCRIPTION("Parsing code for RedBoot Flash Image System (FIS) tabl=
es");
--=20
1.7.2.5
