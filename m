Received: from szxga01-in.huawei.com ([119.145.14.64])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9vIy-0004xc-P3
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 11:01:27 +0000
From: Caizhiyong <caizhiyong@huawei.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: cmdlinepart: use cmdline partition parser lib
Date: Thu, 15 Aug 2013 11:00:27 +0000
Message-ID: <C3050A4DBA34F345975765E43127F10F1C0643A1@szxeml512-mbx.china.huawei.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Wanglin
 \(Albert\)" <albert.wanglin@huawei.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Cai Zhiyong <caizhiyong@huawei.com>

MTD cmdline partition use cmdline partition parser lib

reference: https://lkml.org/lkml/2013/8/6/550

Signed-off-by: Cai ZhiYong <caizhiyong@huawei.com>
---
 Documentation/block/cmdline-partition.txt |  93 +++++---
 block/cmdline-parser.c                    |   6 +-
 drivers/mtd/Kconfig                       |   1 +
 drivers/mtd/cmdlinepart.c                 | 360 ++++----------------------=
----
 4 files changed, 101 insertions(+), 359 deletions(-)

diff --git a/Documentation/block/cmdline-partition.txt b/Documentation/bloc=
k/cmdline-partition.txt
index 651863d..adc5f7a 100644
--- a/Documentation/block/cmdline-partition.txt
+++ b/Documentation/block/cmdline-partition.txt
@@ -1,40 +1,59 @@
 Embedded device command line partition
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-Read block device partition table from command line.
-The partition used for fixed block device (eMMC) embedded device.
-It is no MBR, save storage space. Bootloader can be easily accessed
-by absolute address of data on the block device.
-Users can easily change the partition.
-
-The format for the command line is just like mtdparts:
-
-blkdevparts=3D<blkdev-def>[;<blkdev-def>]
+Authors: Cai Zhiyong <caizhiyong@huawei.com>
+
+The format for the command line is as follows,
+it is used by MTD device (reference drivers/mtd/cmdlinepart.c) and
+block device (reference block/partitions/cmdline.c)
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+For MTD device:
+  mtdparts=3D<mtddef>[;<mtddef]
+  <mtddef>  :=3D <mtd-id>:<partdef>[,<partdef>]
+  <partdef> :=3D <size>[@<offset>][<name>][ro][lk]
+  <mtd-id>  :=3D unique name used in mapping driver/device (mtd->name)
+  <size>    :=3D standard linux memsize OR "-" to denote all remaining spa=
ce
+               size is automatically truncated at end of device
+               if specified or trucated size is 0 the part is skipped
+  <offset>  :=3D standard linux memsize
+               if omitted the part will immediately follow the previous pa=
rt
+               or 0 if the first part
+  <name>    :=3D '(' NAME ')'
+               NAME will appear in /proc/mtd
+
+  <size> and <offset> can be specified such that the parts are out of orde=
r
+  in physical memory and may even overlap.
+
+  The parts are assigned MTD numbers in the order they are specified in th=
e
+  command line regardless of their order in physical memory.
+
+  Examples:
+
+  1 NOR Flash, with 1 single writable partition:
+  edb7312-nor:-
+
+  1 NOR Flash with 2 partitions, 1 NAND with one
+  edb7312-nor:256k(ARMboot)ro,-(root);edb7312-nand:-(home)
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+For block device:
+  blkdevparts=3D<blkdev-def>[;<blkdev-def>]
   <blkdev-def> :=3D <blkdev-id>:<partdef>[,<partdef>]
-    <partdef> :=3D <size>[@<offset>](part-name)
-
-<blkdev-id>
-    block device disk name, embedded device used fixed block device,
-    it's disk name also fixed. such as: mmcblk0, mmcblk1, mmcblk0boot0.
-
-<size>
-    partition size, in bytes, such as: 512, 1m, 1G.
-
-<offset>
-    partition start address, in bytes.
-
-(part-name)
-    partition name, kernel send uevent with "PARTNAME". application can cr=
eate
-    a link to block device partition with the name "PARTNAME".
-    user space application can access partition by partition name.
-
-Example:
-    eMMC disk name is "mmcblk0" and "mmcblk0boot0"
-
-  bootargs:
+  <partdef> :=3D <size>[@<offset>][<name>]
+  <blkdev-id>
+       block device disk name, embedded device used fixed block device,
+       it's disk name also fixed. such as: mmcblk0, mmcblk1, mmcblk0boot0.
+  <size>    :=3D standard linux memsize OR "-" to denote all remaining spa=
ce
+               size is automatically truncated at end of device
+               if specified or trucated size is 0 the part is skipped
+  <offset>  :=3D standard linux memsize
+               if omitted the part will immediately follow the previous pa=
rt
+               or 0 if the first part
+  <name>    :=3D '(' NAME ')'
+        partition name, kernel send uevent with "PARTNAME". application co=
uld
+        create a link to block device partition with the name "PARTNAME".
+        user space application can access partition by partition name.
+
+  Example:
+
+    eMMC disk name is "mmcblk0" and "mmcblk0boot0", bootargs:
     'blkdevparts=3Dmmcblk0:1G(data0),1G(data1),-;mmcblk0boot0:1m(boot),-(k=
ernel)'
-
-  dmesg:
-    mmcblk0: p1(data0) p2(data1) p3()
-    mmcblk0boot0: p1(boot) p2(kernel)
-
diff --git a/block/cmdline-parser.c b/block/cmdline-parser.c
index 18fb435..7ad2bc2 100644
--- a/block/cmdline-parser.c
+++ b/block/cmdline-parser.c
@@ -4,8 +4,6 @@
  * Written by Cai Zhiyong <caizhiyong@huawei.com>
  *
  */
-#include <linux/buffer_head.h>
-#include <linux/module.h>
 #include <linux/cmdline-parser.h>
=20
 static int parse_subpart(struct cmdline_subpart **subpart, char *partdef)
@@ -158,6 +156,7 @@ void cmdline_parts_free(struct cmdline_parts **parts)
 		*parts =3D next_parts;
 	}
 }
+EXPORT_SYMBOL(cmdline_parts_free);
=20
 int cmdline_parts_parse(struct cmdline_parts **parts, const char *cmdline)
 {
@@ -205,6 +204,7 @@ fail:
 	cmdline_parts_free(parts);
 	goto done;
 }
+EXPORT_SYMBOL(cmdline_parts_parse);
=20
 struct cmdline_parts *cmdline_parts_find(struct cmdline_parts *parts,
 					 const char *bdev)
@@ -213,6 +213,7 @@ struct cmdline_parts *cmdline_parts_find(struct cmdline=
_parts *parts,
 		parts =3D parts->next_parts;
 	return parts;
 }
+EXPORT_SYMBOL(cmdline_parts_find);
=20
 /*
  *  add_part()
@@ -247,3 +248,4 @@ void cmdline_parts_set(struct cmdline_parts *parts, sec=
tor_t disk_size,
 			break;
 	}
 }
+EXPORT_SYMBOL(cmdline_parts_set);
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 5fab4e6e..6f7f9ca 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -75,6 +75,7 @@ endif # MTD_REDBOOT_PARTS
=20
 config MTD_CMDLINE_PARTS
 	tristate "Command line partition table parsing"
+	select CMDLINE_PARSER
 	depends on MTD
 	---help---
 	  Allow generic configuration of the MTD partition tables via the kernel
diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 721caeb..240b4ac 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -18,34 +18,8 @@
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  =
USA
  *
- * The format for the command line is as follows:
+ * Verbose please reference "Documentation/block/cmdline-partition.txt"
  *
- * mtdparts=3D<mtddef>[;<mtddef]
- * <mtddef>  :=3D <mtd-id>:<partdef>[,<partdef>]
- * <partdef> :=3D <size>[@<offset>][<name>][ro][lk]
- * <mtd-id>  :=3D unique name used in mapping driver/device (mtd->name)
- * <size>    :=3D standard linux memsize OR "-" to denote all remaining sp=
ace
- *              size is automatically truncated at end of device
- *              if specified or trucated size is 0 the part is skipped
- * <offset>  :=3D standard linux memsize
- *              if omitted the part will immediately follow the previous p=
art
- *              or 0 if the first part
- * <name>    :=3D '(' NAME ')'
- *              NAME will appear in /proc/mtd
- *
- * <size> and <offset> can be specified such that the parts are out of ord=
er
- * in physical memory and may even overlap.
- *
- * The parts are assigned MTD numbers in the order they are specified in t=
he
- * command line regardless of their order in physical memory.
- *
- * Examples:
- *
- * 1 NOR Flash, with 1 single writable partition:
- * edb7312-nor:-
- *
- * 1 NOR Flash with 2 partitions, 1 NAND with one
- * edb7312-nor:256k(ARMboot)ro,-(root);edb7312-nand:-(home)
  */
=20
 #include <linux/kernel.h>
@@ -54,249 +28,43 @@
 #include <linux/mtd/partitions.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/cmdline-parser.h>
=20
-/* error message prefix */
-#define ERRP "mtd: "
-
-/* debug macro */
-#if 0
-#define dbg(x) do { printk("DEBUG-CMDLINE-PART: "); printk x; } while(0)
-#else
-#define dbg(x)
-#endif
-
-
-/* special size referring to all the remaining space in a partition */
-#define SIZE_REMAINING ULLONG_MAX
-#define OFFSET_CONTINUOUS ULLONG_MAX
-
-struct cmdline_mtd_partition {
-	struct cmdline_mtd_partition *next;
-	char *mtd_id;
-	int num_parts;
-	struct mtd_partition *parts;
-};
-
-/* mtdpart_setup() parses into here */
-static struct cmdline_mtd_partition *partitions;
-
-/* the command line passed to mtdpart_setup() */
 static char *mtdparts;
-static char *cmdline;
-static int cmdline_parsed;
+static struct cmdline_parts *mtd_cmdline_parts;
=20
-/*
- * Parse one partition definition for an MTD. Since there can be many
- * comma separated partition definitions, this function calls itself
- * recursively until no more partition definitions are found. Nice side
- * effect: the memory to keep the mtd_partition structs and the names
- * is allocated upon the last definition being found. At that point the
- * syntax has been verified ok.
- */
-static struct mtd_partition * newpart(char *s,
-				      char **retptr,
-				      int *num_parts,
-				      int this_part,
-				      unsigned char **extra_mem_ptr,
-				      int extra_mem_size)
+static int add_part(int slot, struct cmdline_subpart *subpart, void *param=
)
 {
-	struct mtd_partition *parts;
-	unsigned long long size, offset =3D OFFSET_CONTINUOUS;
-	char *name;
-	int name_len;
-	unsigned char *extra_mem;
-	char delim;
-	unsigned int mask_flags;
-
-	/* fetch the partition size */
-	if (*s =3D=3D '-') {
-		/* assign all remaining space to this partition */
-		size =3D SIZE_REMAINING;
-		s++;
-	} else {
-		size =3D memparse(s, &s);
-		if (size < PAGE_SIZE) {
-			printk(KERN_ERR ERRP "partition size too small (%llx)\n",
-			       size);
-			return ERR_PTR(-EINVAL);
-		}
-	}
-
-	/* fetch partition name and flags */
-	mask_flags =3D 0; /* this is going to be a regular partition */
-	delim =3D 0;
-
-	/* check for offset */
-	if (*s =3D=3D '@') {
-		s++;
-		offset =3D memparse(s, &s);
-	}
-
-	/* now look for name */
-	if (*s =3D=3D '(')
-		delim =3D ')';
-
-	if (delim) {
-		char *p;
+	struct mtd_partition *mtdpart =3D &((struct mtd_partition *)param)[slot];
=20
-		name =3D ++s;
-		p =3D strchr(name, delim);
-		if (!p) {
-			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
-			return ERR_PTR(-EINVAL);
-		}
-		name_len =3D p - name;
-		s =3D p + 1;
-	} else {
-		name =3D NULL;
-		name_len =3D 13; /* Partition_000 */
-	}
-
-	/* record name length for memory allocation later */
-	extra_mem_size +=3D name_len + 1;
+	mtdpart->offset =3D subpart->from;
+	mtdpart->size =3D subpart->size;
+	mtdpart->name =3D subpart->name;
+	mtdpart->mask_flags =3D 0;
=20
-	/* test for options */
-	if (strncmp(s, "ro", 2) =3D=3D 0) {
-		mask_flags |=3D MTD_WRITEABLE;
-		s +=3D 2;
-	}
+	if (subpart->flags & PF_RDONLY)
+		mtdpart->mask_flags |=3D MTD_WRITEABLE;
=20
 	/* if lk is found do NOT unlock the MTD partition*/
-	if (strncmp(s, "lk", 2) =3D=3D 0) {
-		mask_flags |=3D MTD_POWERUP_LOCK;
-		s +=3D 2;
-	}
-
-	/* test if more partitions are following */
-	if (*s =3D=3D ',') {
-		if (size =3D=3D SIZE_REMAINING) {
-			printk(KERN_ERR ERRP "no partitions allowed after a fill-up partition\n=
");
-			return ERR_PTR(-EINVAL);
-		}
-		/* more partitions follow, parse them */
-		parts =3D newpart(s + 1, &s, num_parts, this_part + 1,
-				&extra_mem, extra_mem_size);
-		if (IS_ERR(parts))
-			return parts;
-	} else {
-		/* this is the last partition: allocate space for all */
-		int alloc_size;
-
-		*num_parts =3D this_part + 1;
-		alloc_size =3D *num_parts * sizeof(struct mtd_partition) +
-			     extra_mem_size;
-
-		parts =3D kzalloc(alloc_size, GFP_KERNEL);
-		if (!parts)
-			return ERR_PTR(-ENOMEM);
-		extra_mem =3D (unsigned char *)(parts + *num_parts);
-	}
-
-	/* enter this partition (offset will be calculated later if it is zero at=
 this point) */
-	parts[this_part].size =3D size;
-	parts[this_part].offset =3D offset;
-	parts[this_part].mask_flags =3D mask_flags;
-	if (name)
-		strlcpy(extra_mem, name, name_len + 1);
-	else
-		sprintf(extra_mem, "Partition_%03d", this_part);
-	parts[this_part].name =3D extra_mem;
-	extra_mem +=3D name_len + 1;
+	if (subpart->flags & PF_POWERUP_LOCK)
+		mtdpart->mask_flags |=3D MTD_POWERUP_LOCK;
=20
-	dbg(("partition %d: name <%s>, offset %llx, size %llx, mask flags %x\n",
-	     this_part, parts[this_part].name, parts[this_part].offset,
-	     parts[this_part].size, parts[this_part].mask_flags));
-
-	/* return (updated) pointer to extra_mem memory */
-	if (extra_mem_ptr)
-		*extra_mem_ptr =3D extra_mem;
-
-	/* return (updated) pointer command line string */
-	*retptr =3D s;
-
-	/* return partition table */
-	return parts;
+	return 0;
 }
=20
 /*
- * Parse the command line.
+ * This is the handler for our kernel parameter, called from
+ * main.c::checksetup(). Note that we can not yet kmalloc() anything,
+ * so we only save the commandline for later processing.
+ *
+ * This function needs to be visible for bootloaders.
  */
-static int mtdpart_setup_real(char *s)
+static int __init mtdpart_setup(char *s)
 {
-	cmdline_parsed =3D 1;
-
-	for( ; s !=3D NULL; )
-	{
-		struct cmdline_mtd_partition *this_mtd;
-		struct mtd_partition *parts;
-		int mtd_id_len, num_parts;
-		char *p, *mtd_id;
-
-		mtd_id =3D s;
-
-		/* fetch <mtd-id> */
-		p =3D strchr(s, ':');
-		if (!p) {
-			printk(KERN_ERR ERRP "no mtd-id\n");
-			return -EINVAL;
-		}
-		mtd_id_len =3D p - mtd_id;
-
-		dbg(("parsing <%s>\n", p+1));
-
-		/*
-		 * parse one mtd. have it reserve memory for the
-		 * struct cmdline_mtd_partition and the mtd-id string.
-		 */
-		parts =3D newpart(p + 1,		/* cmdline */
-				&s,		/* out: updated cmdline ptr */
-				&num_parts,	/* out: number of parts */
-				0,		/* first partition */
-				(unsigned char**)&this_mtd, /* out: extra mem */
-				mtd_id_len + 1 + sizeof(*this_mtd) +
-				sizeof(void*)-1 /*alignment*/);
-		if (IS_ERR(parts)) {
-			/*
-			 * An error occurred. We're either:
-			 * a) out of memory, or
-			 * b) in the middle of the partition spec
-			 * Either way, this mtd is hosed and we're
-			 * unlikely to succeed in parsing any more
-			 */
-			 return PTR_ERR(parts);
-		 }
-
-		/* align this_mtd */
-		this_mtd =3D (struct cmdline_mtd_partition *)
-				ALIGN((unsigned long)this_mtd, sizeof(void *));
-		/* enter results */
-		this_mtd->parts =3D parts;
-		this_mtd->num_parts =3D num_parts;
-		this_mtd->mtd_id =3D (char*)(this_mtd + 1);
-		strlcpy(this_mtd->mtd_id, mtd_id, mtd_id_len + 1);
-
-		/* link into chain */
-		this_mtd->next =3D partitions;
-		partitions =3D this_mtd;
-
-		dbg(("mtdid=3D<%s> num_parts=3D<%d>\n",
-		     this_mtd->mtd_id, this_mtd->num_parts));
-
-
-		/* EOS - we're done */
-		if (*s =3D=3D 0)
-			break;
-
-		/* does another spec follow? */
-		if (*s !=3D ';') {
-			printk(KERN_ERR ERRP "bad character after partition (%c)\n", *s);
-			return -EINVAL;
-		}
-		s++;
-	}
-
-	return 0;
+	mtdparts =3D s;
+	return 1;
 }
+__setup("mtdparts=3D", mtdpart_setup);
=20
 /*
  * Main function to be called from the MTD mapping driver/device to
@@ -309,82 +77,36 @@ static int parse_cmdline_partitions(struct mtd_info *m=
aster,
 				    struct mtd_partition **pparts,
 				    struct mtd_part_parser_data *data)
 {
-	unsigned long long offset;
-	int i, err;
-	struct cmdline_mtd_partition *part;
-	const char *mtd_id =3D master->name;
+	struct cmdline_parts *parts;
=20
-	/* parse command line */
-	if (!cmdline_parsed) {
-		err =3D mtdpart_setup_real(cmdline);
-		if (err)
-			return err;
-	}
+	if (mtdparts) {
+		if (mtd_cmdline_parts)
+			cmdline_parts_free(&mtd_cmdline_parts);
+
+		if (cmdline_parts_parse(&mtd_cmdline_parts, mtdparts)) {
+			mtdparts =3D NULL;
+			return -EINVAL;
+		}
=20
-	/*
-	 * Search for the partition definition matching master->name.
-	 * If master->name is not set, stop at first partition definition.
-	 */
-	for (part =3D partitions; part; part =3D part->next) {
-		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
-			break;
+		mtdparts =3D NULL;
 	}
=20
-	if (!part)
+	if (!mtd_cmdline_parts)
 		return 0;
=20
-	for (i =3D 0, offset =3D 0; i < part->num_parts; i++) {
-		if (part->parts[i].offset =3D=3D OFFSET_CONTINUOUS)
-			part->parts[i].offset =3D offset;
-		else
-			offset =3D part->parts[i].offset;
-
-		if (part->parts[i].size =3D=3D SIZE_REMAINING)
-			part->parts[i].size =3D master->size - offset;
-
-		if (offset + part->parts[i].size > master->size) {
-			printk(KERN_WARNING ERRP
-			       "%s: partitioning exceeds flash size, truncating\n",
-			       part->mtd_id);
-			part->parts[i].size =3D master->size - offset;
-		}
-		offset +=3D part->parts[i].size;
-
-		if (part->parts[i].size =3D=3D 0) {
-			printk(KERN_WARNING ERRP
-			       "%s: skipping zero sized partition\n",
-			       part->mtd_id);
-			part->num_parts--;
-			memmove(&part->parts[i], &part->parts[i + 1],
-				sizeof(*part->parts) * (part->num_parts - i));
-			i--;
-		}
-	}
+	parts =3D cmdline_parts_find(mtd_cmdline_parts, master->name);
+	if (!parts)
+		return 0;
=20
-	*pparts =3D kmemdup(part->parts, sizeof(*part->parts) * part->num_parts,
-			  GFP_KERNEL);
+	*pparts =3D kzalloc(sizeof(**pparts) * parts->nr_subparts, GFP_KERNEL);
 	if (!*pparts)
 		return -ENOMEM;
=20
-	return part->num_parts;
-}
+	cmdline_parts_set(parts, master->size, 0, add_part, (void *)*pparts);
=20
-
-/*
- * This is the handler for our kernel parameter, called from
- * main.c::checksetup(). Note that we can not yet kmalloc() anything,
- * so we only save the commandline for later processing.
- *
- * This function needs to be visible for bootloaders.
- */
-static int __init mtdpart_setup(char *s)
-{
-	cmdline =3D s;
-	return 1;
+	return parts->nr_subparts;
 }
=20
-__setup("mtdparts=3D", mtdpart_setup);
-
 static struct mtd_part_parser cmdline_parser =3D {
 	.owner =3D THIS_MODULE,
 	.parse_fn =3D parse_cmdline_partitions,
@@ -393,8 +115,6 @@ static struct mtd_part_parser cmdline_parser =3D {
=20
 static int __init cmdline_parser_init(void)
 {
-	if (mtdparts)
-		mtdpart_setup(mtdparts);
 	return register_mtd_parser(&cmdline_parser);
 }
=20
--=20
1.8.1.5
