From: gary@mlbassoc.com (Gary Thomas)
Date: 17 Feb 2003 14:38:40 -0700
Subject: Change in RedBoot partition scanning
Message-ID: <1045517920.18487.822.camel@hermes.chez-thomas.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-0LmQoreEKDYSHpBDeMgx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

David,

What about my changes to the RedBoot partitioning code (see
attached patch)?  I'd like to see these go in, so the support
can be merged into the Linux/PPC trees.

Thanks.

-- 
------------------------------------------------------------
Gary Thomas                 |
MLB Associates              |  Consulting for the
+1 (970) 229-1963           |    Embedded world
http://www.mlbassoc.com/    |
email: <gary@mlbassoc.com>  |
gpg: http://www.chez-thomas.org/gary/gpg_key.asc
------------------------------------------------------------

--=-0LmQoreEKDYSHpBDeMgx
Content-Disposition: attachment; filename=diffs
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=diffs; charset=ISO-8859-1

? fs/jffs2/ecos/jffs2-200302041443.epk
Index: drivers/mtd/afs.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/afs.c,v
retrieving revision 1.8
diff -u -5 -p -r1.8 afs.c
--- drivers/mtd/afs.c	4 May 2002 08:49:09 -0000	1.8
+++ drivers/mtd/afs.c	17 Feb 2003 21:35:49 -0000
@@ -123,11 +123,13 @@ afs_read_iis(struct mtd_info *mtd, struc
 			ptr, ret);
=20
 	return ret;
 }
=20
-int parse_afs_partitions(struct mtd_info *mtd, struct mtd_partition **ppar=
ts)
+int parse_afs_partitions(struct mtd_info *mtd,=20
+                         struct mtd_partition **pparts,
+                         void *origin)
 {
 	struct mtd_partition *parts;
 	u_int mask, off, idx, sz;
 	int ret =3D 0;
 	char *str;
Index: drivers/mtd/redboot.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/redboot.c,v
retrieving revision 1.6
diff -u -5 -p -r1.6 redboot.c
--- drivers/mtd/redboot.c	25 Oct 2001 09:16:06 -0000	1.6
+++ drivers/mtd/redboot.c	17 Feb 2003 21:35:49 -0000
@@ -32,11 +32,13 @@ static inline int redboot_checksum(struc
 {
 	/* RedBoot doesn't actually write the desc_cksum field yet AFAICT */
 	return 1;
 }
=20
-int parse_redboot_partitions(struct mtd_info *master, struct mtd_partition=
 **pparts)
+int parse_redboot_partitions(struct mtd_info *master,=20
+                             struct mtd_partition **pparts,
+                             void *fis_origin)
 {
 	int nrparts =3D 0;
 	struct fis_image_desc *buf;
 	struct mtd_partition *parts;
 	struct fis_list *fl =3D NULL, *tmp_fl;
@@ -88,11 +90,15 @@ int parse_redboot_partitions(struct mtd_
 		if (!new_fl) {
 			ret =3D -ENOMEM;
 			goto out;
 		}
 		new_fl->img =3D &buf[i];
-		buf[i].flash_base &=3D master->size-1;
+                if (fis_origin) {
+                        buf[i].flash_base -=3D (unsigned long)fis_origin;
+                } else {
+                        buf[i].flash_base &=3D master->size-1;
+                }
=20
 		/* I'm sure the JFFS2 code has done me permanent damage.
 		 * I now think the following is _normal_
 		 */
 		prev =3D &fl;
Index: drivers/mtd/maps/ceiva.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/ceiva.c,v
retrieving revision 1.2
diff -u -5 -p -r1.2 ceiva.c
--- drivers/mtd/maps/ceiva.c	14 Oct 2002 12:50:22 -0000	1.2
+++ drivers/mtd/maps/ceiva.c	17 Feb 2003 21:35:49 -0000
@@ -316,13 +316,10 @@ static int __init clps_setup_flash(void)
 	}
 #endif
 	return nr;
 }
=20
-extern int parse_redboot_partitions(struct mtd_info *master, struct mtd_pa=
rtition **pparts);
-extern int parse_cmdline_partitions(struct mtd_info *master, struct mtd_pa=
rtition **pparts, char *);
-
 static struct mtd_partition *parsed_parts;
=20
 static void __init clps_locate_partitions(struct mtd_info *mtd)
 {
 	const char *part_type =3D NULL;
@@ -337,11 +334,11 @@ static void __init clps_locate_partition
 			part_type =3D "command line";
 			break;
 		}
 #endif
 #ifdef CONFIG_MTD_REDBOOT_PARTS
-		nr_parts =3D parse_redboot_partitions(mtd, &parsed_parts);
+		nr_parts =3D parse_redboot_partitions(mtd, &parsed_parts, (void *)0);
 		if (nr_parts > 0) {
 			part_type =3D "RedBoot";
 			break;
 		}
 #endif
Index: drivers/mtd/maps/dc21285.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/dc21285.c,v
retrieving revision 1.9
diff -u -5 -p -r1.9 dc21285.c
--- drivers/mtd/maps/dc21285.c	14 Oct 2002 12:22:10 -0000	1.9
+++ drivers/mtd/maps/dc21285.c	17 Feb 2003 21:35:49 -0000
@@ -106,12 +106,10 @@ struct map_info dc21285_map =3D {
=20
=20
 /* Partition stuff */
 static struct mtd_partition *dc21285_parts;
 		     =20
-extern int parse_redboot_partitions(struct mtd_info *, struct mtd_partitio=
n **);
-
 int __init init_dc21285(void)
 {
 	/* Determine buswidth */
 	switch (*CSR_SA110_CNTL & (3<<14)) {
 		case SA110_CNTL_ROMWIDTH_8:=20
@@ -144,11 +142,11 @@ int __init init_dc21285(void)
 		mymtd->module =3D THIS_MODULE;
 		=09
 		/* partition fixup */
=20
 #ifdef CONFIG_MTD_REDBOOT_PARTS
-		nrparts =3D parse_redboot_partitions(mymtd, &dc21285_parts);
+		nrparts =3D parse_redboot_partitions(mymtd, &dc21285_parts, (void *)0);
 #endif
 		if (nrparts > 0) {
 			add_mtd_partitions(mymtd, dc21285_parts, nrparts);
 		} else if (nrparts =3D=3D 0) {
 			printk(KERN_NOTICE "RedBoot partition table failed\n");
Index: drivers/mtd/maps/edb7312.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/edb7312.c,v
retrieving revision 1.2
diff -u -5 -p -r1.2 edb7312.c
--- drivers/mtd/maps/edb7312.c	5 Sep 2002 05:11:24 -0000	1.2
+++ drivers/mtd/maps/edb7312.c	17 Feb 2003 21:35:49 -0000
@@ -116,16 +116,10 @@ static struct mtd_partition static_parti
     },
 };
=20
 #define NB_OF(x) (sizeof (x) / sizeof (x[0]))
=20
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-int parse_cmdline_partitions(struct mtd_info *master,=20
-			     struct mtd_partition **pparts,
-			     const char *mtd_id);
-#endif
-
 #endif
=20
 static int                   mtd_parts_nb =3D 0;
 static struct mtd_partition *mtd_parts    =3D 0;
=20
Index: drivers/mtd/maps/epxa10db-flash.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/epxa10db-flash.c,v
retrieving revision 1.4
diff -u -5 -p -r1.4 epxa10db-flash.c
--- drivers/mtd/maps/epxa10db-flash.c	22 Aug 2002 10:46:19 -0000	1.4
+++ drivers/mtd/maps/epxa10db-flash.c	17 Feb 2003 21:35:49 -0000
@@ -41,11 +41,10 @@
 static int nr_parts =3D 0;
 static struct mtd_partition *parts;
=20
 static struct mtd_info *mymtd;
=20
-extern int parse_redboot_partitions(struct mtd_info *, struct mtd_partitio=
n **);
 static int epxa_default_partitions(struct mtd_info *master, struct mtd_par=
tition **pparts);
=20
 static __u8 epxa_read8(struct map_info *map, unsigned long ofs)
 {
 	return __raw_readb(map->map_priv_1 + ofs);
@@ -134,19 +133,19 @@ static int __init epxa_mtd_init(void)
 			}
 		}
 	}
=20
 #ifdef CONFIG_MTD_REDBOOT_PARTS
-	nr_parts =3D parse_redboot_partitions(mymtd, &parts);
+	nr_parts =3D parse_redboot_partitions(mymtd, &parts, (void *)0);
=20
 	if (nr_parts > 0) {
 		add_mtd_partitions(mymtd, parts, nr_parts);
 		return 0;
 	}
 #endif
 #ifdef CONFIG_MTD_AFS_PARTS
-	nr_parts =3D parse_afs_partitions(mymtd, &parts);
+	nr_parts =3D parse_afs_partitions(mymtd, &parts, (void *)0);
=20
 	if (nr_parts > 0) {
 		add_mtd_partitions(mymtd, parts, nr_parts);
 		return 0;
 	}
Index: drivers/mtd/maps/impa7.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/impa7.c,v
retrieving revision 1.2
diff -u -5 -p -r1.2 impa7.c
--- drivers/mtd/maps/impa7.c	5 Sep 2002 05:11:24 -0000	1.2
+++ drivers/mtd/maps/impa7.c	17 Feb 2003 21:35:49 -0000
@@ -123,16 +123,10 @@ static struct mtd_partition static_parti
     },
 };
=20
 #define NB_OF(x) (sizeof (x) / sizeof (x[0]))
=20
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-int parse_cmdline_partitions(struct mtd_info *master,=20
-			     struct mtd_partition **pparts,
-			     const char *mtd_id);
-#endif
-
 #endif
=20
 static int                   mtd_parts_nb =3D 0;
 static struct mtd_partition *mtd_parts    =3D 0;
=20
Index: drivers/mtd/maps/integrator-flash.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/integrator-flash.c,v
retrieving revision 1.7
diff -u -5 -p -r1.7 integrator-flash.c
--- drivers/mtd/maps/integrator-flash.c	1 Nov 2001 20:55:47 -0000	1.7
+++ drivers/mtd/maps/integrator-flash.c	17 Feb 2003 21:35:49 -0000
@@ -39,12 +39,10 @@
=20
 #include <asm/hardware.h>
 #include <asm/io.h>
 #include <asm/system.h>
=20
-extern int parse_afs_partitions(struct mtd_info *, struct mtd_partition **=
);
-
 // board specific stuff - sorry, it should be in arch/arm/mach-*.
 #ifdef CONFIG_ARCH_INTEGRATOR
=20
 #define FLASH_BASE	INTEGRATOR_FLASH_BASE
 #define FLASH_SIZE	INTEGRATOR_FLASH_SIZE
@@ -233,11 +231,11 @@ static int __init armflash_cfi_init(void
 	if (!mtd)
 		return -ENXIO;
=20
 	mtd->module =3D THIS_MODULE;
=20
-	ret =3D parse_afs_partitions(mtd, &parts);
+	ret =3D parse_afs_partitions(mtd, &parts, (void *)0);
 	if (ret > 0) {
 		ret =3D add_mtd_partitions(mtd, parts, ret);
 		if (ret)
 			printk(KERN_ERR "mtd partition registration "
 				"failed: %d\n", ret);
Index: drivers/mtd/maps/iq80310.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/iq80310.c,v
retrieving revision 1.9
diff -u -5 -p -r1.9 iq80310.c
--- drivers/mtd/maps/iq80310.c	1 Jan 2002 22:45:02 -0000	1.9
+++ drivers/mtd/maps/iq80310.c	17 Feb 2003 21:35:49 -0000
@@ -105,12 +105,10 @@ static struct mtd_partition iq80310_part
 #define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
=20
 static struct mtd_info *mymtd;
 static struct mtd_partition *parsed_parts;
=20
-extern int parse_redboot_partitions(struct mtd_info *master, struct mtd_pa=
rtition **pparts);
-
 static int __init init_iq80310(void)
 {
 	struct mtd_partition *parts;
 	int nb_parts =3D 0;
 	int parsed_nr_parts =3D 0;
@@ -128,11 +126,11 @@ static int __init init_iq80310(void)
 	}
 	mymtd->module =3D THIS_MODULE;
=20
 #ifdef CONFIG_MTD_REDBOOT_PARTS
 	if (parsed_nr_parts =3D=3D 0) {
-		int ret =3D parse_redboot_partitions(mymtd, &parsed_parts);
+		int ret =3D parse_redboot_partitions(mymtd, &parsed_parts, (void *)0);
=20
 		if (ret > 0) {
 			part_type =3D "RedBoot";
 			parsed_nr_parts =3D ret;
 		}
Index: drivers/mtd/maps/ocelot.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/ocelot.c,v
retrieving revision 1.6
diff -u -5 -p -r1.6 ocelot.c
--- drivers/mtd/maps/ocelot.c	2 Oct 2001 15:05:14 -0000	1.6
+++ drivers/mtd/maps/ocelot.c	17 Feb 2003 21:35:49 -0000
@@ -18,12 +18,10 @@
 #define FLASH_BUSWIDTH 1
 #define NVRAM_WINDOW_ADDR 0x2c800000
 #define NVRAM_WINDOW_SIZE 0x00007FF0
 #define NVRAM_BUSWIDTH 1
=20
-extern int parse_redboot_partitions(struct mtd_info *master, struct mtd_pa=
rtition **pparts);
-
 static unsigned int cacheflush =3D 0;
=20
 static struct mtd_info *flash_mtd;
 static struct mtd_info *nvram_mtd;
=20
@@ -154,11 +152,11 @@ static int __init init_ocelot_maps(void)
 		goto fail3;
=20
 	add_mtd_device(nvram_mtd);
=20
 	flash_mtd->module =3D THIS_MODULE;
-	nr_parts =3D parse_redboot_partitions(flash_mtd, &parsed_parts);
+	nr_parts =3D parse_redboot_partitions(flash_mtd, &parsed_parts, (void *)0=
);
=20
 	if (nr_parts)
 		add_mtd_partitions(flash_mtd, parsed_parts, nr_parts);
 	else
 		add_mtd_device(flash_mtd);
Index: drivers/mtd/maps/sa1100-flash.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/sa1100-flash.c,v
retrieving revision 1.29
diff -u -5 -p -r1.29 sa1100-flash.c
--- drivers/mtd/maps/sa1100-flash.c	6 Sep 2002 14:36:19 -0000	1.29
+++ drivers/mtd/maps/sa1100-flash.c	17 Feb 2003 21:35:50 -0000
@@ -763,11 +763,10 @@ static struct mtd_partition yopy_partiti
 		offset:		0x00400000,
 	}
 };
 #endif
=20
-extern int parse_redboot_partitions(struct mtd_info *master, struct mtd_pa=
rtition **pparts);
 extern int parse_bootldr_partitions(struct mtd_info *master, struct mtd_pa=
rtition **pparts);
=20
 static struct mtd_partition *parsed_parts;
 static struct mtd_info *mymtd;
=20
@@ -962,11 +961,11 @@ int __init sa1100_mtd_init(void)
 	/*
 	 * Dynamic partition selection stuff (might override the static ones)
 	 */
 #ifdef CONFIG_MTD_REDBOOT_PARTS
 	if (parsed_nr_parts =3D=3D 0) {
-		int ret =3D parse_redboot_partitions(mymtd, &parsed_parts);
+		int ret =3D parse_redboot_partitions(mymtd, &parsed_parts, (void *)0);
=20
 		if (ret > 0) {
 			part_type =3D "RedBoot";
 			parsed_nr_parts =3D ret;
 		}
Index: drivers/mtd/maps/solutionengine.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/maps/solutionengine.c,v
retrieving revision 1.4
diff -u -5 -p -r1.4 solutionengine.c
--- drivers/mtd/maps/solutionengine.c	7 Nov 2001 01:20:59 -0000	1.4
+++ drivers/mtd/maps/solutionengine.c	17 Feb 2003 21:35:50 -0000
@@ -16,12 +16,10 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 #include <linux/config.h>
=20
=20
-extern int parse_redboot_partitions(struct mtd_info *master, struct mtd_pa=
rtition **pparts);
-
 __u32 soleng_read32(struct map_info *map, unsigned long ofs)
 {
 	return __raw_readl(map->map_priv_1 + ofs);
 }
=20
@@ -108,11 +106,11 @@ static int __init init_soleng_maps(void)
 		eprom_mtd->module =3D THIS_MODULE;
 		add_mtd_device(eprom_mtd);
 	}
=20
 #ifdef CONFIG_MTD_REDBOOT_PARTS
-	nr_parts =3D parse_redboot_partitions(flash_mtd, &parsed_parts);
+	nr_parts =3D parse_redboot_partitions(flash_mtd, &parsed_parts, (void *)0=
);
 	if (nr_parts > 0)
 		printk(KERN_NOTICE "Found RedBoot partition table.\n");
 	else if (nr_parts < 0)
 		printk(KERN_NOTICE "Error looking for RedBoot partitions.\n");
 #endif /* CONFIG_MTD_REDBOOT_PARTS */
Index: drivers/mtd/nand/edb7312.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/nand/edb7312.c,v
retrieving revision 1.3
diff -u -5 -p -r1.3 edb7312.c
--- drivers/mtd/nand/edb7312.c	6 Jun 2002 12:58:16 -0000	1.3
+++ drivers/mtd/nand/edb7312.c	17 Feb 2003 21:35:50 -0000
@@ -75,13 +75,10 @@ static struct mtd_partition partition_in
 		  offset: 0,
 		  size: 8*1024*1024 }
 };
 #define NUM_PARTITIONS 1
=20
-extern int parse_cmdline_partitions(struct mtd_info *master,=20
-				    struct mtd_partition **pparts,
-				    const char *mtd_id);
 #endif
=20
=20
 /*=20
  *	hardware specific access to control-lines
Index: include/linux/mtd/partitions.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/include/linux/mtd/partitions.h,v
retrieving revision 1.8
diff -u -5 -p -r1.8 partitions.h
--- include/linux/mtd/partitions.h	8 Mar 2002 16:34:36 -0000	1.8
+++ include/linux/mtd/partitions.h	17 Feb 2003 21:35:50 -0000
@@ -50,7 +50,22 @@ struct mtd_partition {
=20
=20
 int add_mtd_partitions(struct mtd_info *, struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
=20
+/*
+ * Functions dealing with the various ways of partitioning the space
+ */
+extern int parse_redboot_partitions(struct mtd_info *master,=20
+                                    struct mtd_partition **pparts,
+                                    void *fis_origin);
+
+extern int parse_afs_partitions(struct mtd_info *,=20
+                                struct mtd_partition **,
+                                void *origin);
+
+extern int parse_cmdline_partitions(struct mtd_info *master,=20
+                                    struct mtd_partition **pparts,
+                                    const char *mtd_id);
+
 #endif
=20

--=-0LmQoreEKDYSHpBDeMgx--
