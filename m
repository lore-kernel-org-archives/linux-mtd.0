Received: from [213.30.166.100] (helo=www.anfora.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184zLY-0004TF-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2002 08:57:33 +0100
Subject: Re: MPC8260ADS jffs2 question
From: Gagneraud Christian <cgagneraud@anfora.fr>
To: Junping Zhang <JZhang@erinc.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <F4608F665DF5D311B231009027B70F70012A92C3@MAIL>
References: <F4608F665DF5D311B231009027B70F70012A92C3@MAIL>
Content-Type: multipart/mixed; boundary="=-A20QSdf1W/ZbAVshVHta"
Date: 25 Oct 2002 10:30:19 +0200
Message-Id: <1035534650.3952.349.camel@christian.anfora>
Mime-Version: 1.0
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

--=-A20QSdf1W/ZbAVshVHta
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Le jeu 24/10/2002 =E0 21:38, Junping Zhang a =E9crit :
> Christain,
>=20
>    Sorry if this looks intruding.
>=20
>     I just started to work on jffs2 on MPC8260ADS board and saw your post=
ing
> back in April.
> How did you get the file systems specified on that 8M flash first? Throug=
h
> linux kernel? I tried
> to configure the kernel to recognize the flash with no luck, and MPC8260A=
DS
> doesn't appear
> to be in the pre-defined board in MTD section. Would you please shed some
> light on it? It's
> hard to find good help.

OK, i use kernel 2.4.4-20020321 from denx and linux-mtd (20020403),
h"re's my patches.
Sorry but i have not look at the code since a long time because i'm
working on hardware now (i've to make our own board), so i don't provide
you some explanation but you can ask me more question if you need.

1) apply "linux-2.4.4-2002-03-21-mpc8260ads-20020531.patch" to linux
code it give support for mpc8260ads to the kernel config
2) apply "mtd-20020403-edu-20020425.patch" to the mtd code. it give
support for mpc8260ads flash.
3) apply "linux-2.4.4-2002-03-21-mtd-20020403-edu-20020425.patch" to
linux code. I had to make it because mtd doesnt compile (bacward
compatibility), I don't knoww if this patch is th good way but it work
for me.
4) merge mtd code to linux code with the mtd script

compile linux (take a look at the config)


Hope this help.



>=20
>     Thanks a lot
>=20
> -   Junping


--=-A20QSdf1W/ZbAVshVHta
Content-Disposition: attachment; filename=mtd-20020403-edu-20020425.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=mtd-20020403-edu-20020425.patch; charset=ISO-8859-15

diff -Naur mtd-20020403/drivers/mtd/maps/Makefile linux-denx-2.4.4-20020321=
-edu/drivers/mtd/maps/Makefile
--- mtd-20020403/drivers/mtd/maps/Makefile	Wed Apr  3 15:33:54 2002
+++ linux-denx-2.4.4-20020321-edu/drivers/mtd/maps/Makefile	Fri Apr 12 15:3=
5:08 2002
@@ -39,5 +39,7 @@
 obj-$(CONFIG_MTD_PB1000)        +=3D pb1xxx-flash.o
 obj-$(CONFIG_MTD_PB1500)        +=3D pb1xxx-flash.o
 obj-$(CONFIG_MTD_AUTCPU12)      +=3D autcpu12-nvram.o
+# GANS: add support for EDU partitions
+obj-y				+=3D mpc8260ads-edu-flash.o
=20
 include $(TOPDIR)/Rules.make
diff -Naur mtd-20020403/drivers/mtd/maps/mpc8260ads-edu-flash.c linux-denx-=
2.4.4-20020321-edu/drivers/mtd/maps/mpc8260ads-edu-flash.c
--- mtd-20020403/drivers/mtd/maps/mpc8260ads-edu-flash.c	Thu Jan  1 01:00:0=
0 1970
+++ linux-denx-2.4.4-20020321-edu/drivers/mtd/maps/mpc8260ads-edu-flash.c	T=
hu Apr 25 17:35:03 2002
@@ -0,0 +1,330 @@
+/*
+ * Handle mapping of the flash memory access routines=20
+ * on Motorola MPC8260ADS Board.
+ *
+ * based on tqm8xxl.c
+ *
+ * Copyright(C) 2001
+ * Christian Gagneraud. Anfora <cgagneraud@anfora.fr>
+ *
+ * This code is GPLed
+ *=20
+ */
+
+/*
+ * The MPC8260ADS can use flash DIMM by Smart Modular Technology:
+ * - SM73288XG4JHBG0 - 32 MBytes (4 banks of 4*2M*8).
+ * - SM73248XG2JHBG0 - 16 MBytes (2 banks of 4*2M*8).
+ * - SM73228XG1JHBG0 - 8 MBytes (1 bank of 4*2M*8) (default).
+ *=20
+ * Flash delay, size and type can be detect by flash presence detect bits
+ * in BCSR2[25-27,28-31] ( see UM p 4-67 and 4-68).
+ *=20
+ * The SM73228XG1JHBG0 uses 4 x SHARP LH29F016SCT (16 Mbit)
+ * for a total of 8 MB flash in one bank
+ *
+ * Thus we have to chose:
+ * - Support 32-bit buswidth =3D> CONFIG_MTD_CFI_B4
+ * - Support 4-chip flash interleave =3D> CONFIG_MTD_CFI_I4
+ */
+
+/*
+ * TODO:
+ * - Add support for 16 and 32 Mbytes
+ * - Add support for autodetection of flash DIMM type?
+ */
+
+#include <linux/config.h>
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <asm/io.h>
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/partitions.h>
+
+#undef	DEBUG
+
+#ifdef  DEBUG
+# define debugk(fmt,args...)	printk(fmt ,##args)
+#else
+# define debugk(fmt,args...)
+#endif
+
+
+#define FLASH_BANK_MAX 1
+
+/* trivial struct to describe partition information */
+struct mtd_part_def
+{
+	int nums;
+	unsigned char *type;
+	struct mtd_partition* mtd_part;
+};
+
+static struct mtd_info* mtd_banks[FLASH_BANK_MAX];
+static struct map_info* map_banks[FLASH_BANK_MAX];
+static struct mtd_part_def part_banks[FLASH_BANK_MAX];
+static unsigned long num_banks;
+static unsigned long start_scan_addr;
+
+static __u8 mpc8260ads_read8(struct map_info *map, unsigned long ofs)
+{
+	return *((__u8 *)(map->map_priv_1 + ofs));
+}
+
+static __u16 mpc8260ads_read16(struct map_info *map, unsigned long ofs)
+{
+	return *((__u16 *)(map->map_priv_1 + ofs));
+}
+
+static __u32 mpc8260ads_read32(struct map_info *map, unsigned long ofs)
+{
+	return *((__u32 *)(map->map_priv_1 + ofs));
+}
+
+static void mpc8260ads_copy_from(struct map_info *map,
+		       void *to, unsigned long from, ssize_t len)
+{
+	memcpy_fromio(to, (void *)(map->map_priv_1 + from), len);
+}
+
+static void mpc8260ads_write8(struct map_info *map, __u8 d, unsigned long =
adr)
+{
+	*((__u8 *)(map->map_priv_1 + adr)) =3D d;
+}
+
+static void mpc8260ads_write16(struct map_info *map, __u16 d, unsigned lon=
g adr)
+{
+	*((__u16 *)( map->map_priv_1 + adr)) =3D d;
+}
+
+static void mpc8260ads_write32(struct map_info *map, __u32 d, unsigned lon=
g adr)
+{
+	*((__u32 *)(map->map_priv_1 + adr)) =3D d;
+}
+
+static void mpc8260ads_copy_to(struct map_info *map,
+		     unsigned long to, const void *from, ssize_t len)
+{
+	memcpy_toio((void *)(map->map_priv_1 + to), from, len);
+}
+
+struct map_info mpc8260ads_map =3D {
+	name:		"MPC8260ADS",
+/*	size:		WINDOW_SIZE, */
+	buswidth:	4,
+	read8:		mpc8260ads_read8,
+	read16:		mpc8260ads_read16,
+	read32:		mpc8260ads_read32,
+	copy_from:	mpc8260ads_copy_from,
+	write8:		mpc8260ads_write8,
+	write16:	mpc8260ads_write16,
+	write32:	mpc8260ads_write32,
+	copy_to:	mpc8260ads_copy_to
+};
+
+/*
+ * The following defines the partition layout of MPC8260ADS boards.
+ *
+ * See include/linux/mtd/partitions.h for definition of the
+ * mtd_partition structure.
+ *
+ * The *_max_flash_size is the maximum possible mapped flash size
+ * which is not necessarily the actual flash size. It must correspond
+ * to the value specified in the mapping definition defined by the
+ * "struct map_desc *_io_desc" for the corresponding machine.
+ */
+
+#ifdef CONFIG_MTD_PARTITIONS
+/* Currently, MPC8260ADS has upto 32 MB flash */
+static unsigned long mpc8260ads_max_flash_size =3D 32 << 20;
+
+/* partition definition for first (and only) flash bank
+ * also ref. to "drivers/char/flash_config.c"=20
+ */
+static struct mtd_partition mpc8260ads_partitions[] =3D {
+    {
+	name:   "jffs2-root",			/* JFFS(2) filesystem	*/
+	offset: 0,
+	size:	7 << 20,
+    },
+    {
+	name:	"ppcboot",			/* PPCBoot Firmware	*/
+	offset:	7 << 20,
+	size:	256 << 10,			/* 256 kB		*/
+    },
+    {
+	name:	"environment",			/* PPCBoot Environment	*/
+	offset:	((7 << 20) + (256 << 10)),
+	size:	256 << 10,			/* 256 kB		*/
+    },
+    {
+    	name:	"spare",			/* Unused		*/
+	offset:	((7 << 20) + (512 << 10)),
+	size:	512 << 10,			/* 512 kB		*/
+    },
+};
+#endif	/* CONFIG_MTD_PARTITIONS */
+
+#define NB_OF(x)  (sizeof(x)/sizeof(x[0]))
+
+int __init init_ads(void)
+{
+	int idx =3D 0, ret =3D 0;
+	unsigned long flash_addr, flash_size, mtd_size =3D 0;
+	/* pointer to MPC8260ADS board info data */
+	bd_t *bd =3D (bd_t *)__res;
+
+	flash_addr =3D bd->bi_flashstart;
+	flash_size =3D bd->bi_flashsize;
+
+	printk("%s: bd->bi_flashstart=3D0x%8X, bd->bi_flashsize=3D%8X\n",
+			__FUNCTION__,bd->bi_flashstart,bd->bi_flashsize);
+=09
+	/* request maximum flash size address space */
+	start_scan_addr =3D (unsigned long)ioremap(flash_addr, flash_size);
+	if (!start_scan_addr) {
+		printk("%s: Failed to ioremap address: 0x%x\n",
+			__FUNCTION__, flash_addr);
+		return -EIO;
+	}
+
+	for(idx =3D 0 ; idx < FLASH_BANK_MAX ; idx++) {
+
+		printk("%s: mtd_size=3D0x%8X\n",__FUNCTION__,mtd_size);
+#if 0 /* mtd_size ??? XXX FIXME */
+		if (mtd_size >=3D flash_size)
+			break;
+#endif
+	=09
+		debugk ("%s: chip probing count %d\n", __FUNCTION__, idx);
+
+		map_banks[idx] =3D (struct map_info *)kmalloc(sizeof(struct map_info),
+							    GFP_KERNEL);
+		if (map_banks[idx] =3D=3D NULL)
+		{
+			ret =3D -ENOMEM;
+			goto error_mem;
+		}
+		memset((void *)map_banks[idx], 0, sizeof(struct map_info));
+		map_banks[idx]->name =3D (char *)kmalloc(16, GFP_KERNEL);
+		if (map_banks[idx]->name =3D=3D NULL)
+		{
+			ret =3D -ENOMEM;
+			goto error_mem;
+		}
+		memset((void *)map_banks[idx]->name, 0, 16);
+	=09
+		sprintf(map_banks[idx]->name, "MPC8260ADS Bank %d", idx);
+		map_banks[idx]->buswidth  =3D 4;
+		map_banks[idx]->size      =3D flash_size;
+		map_banks[idx]->read8     =3D mpc8260ads_read8;
+		map_banks[idx]->read16    =3D mpc8260ads_read16;
+		map_banks[idx]->read32    =3D mpc8260ads_read32;
+		map_banks[idx]->copy_from =3D mpc8260ads_copy_from;
+		map_banks[idx]->write8    =3D mpc8260ads_write8;
+		map_banks[idx]->write16   =3D mpc8260ads_write16;
+		map_banks[idx]->write32   =3D mpc8260ads_write32;
+		map_banks[idx]->copy_to   =3D mpc8260ads_copy_to;
+		map_banks[idx]->map_priv_1=3D=20
+			start_scan_addr + ((idx > 0) ?=20
+			(mtd_banks[idx-1] ? mtd_banks[idx-1]->size : 0) : 0);
+	=09
+		/* start to probe flash chips */
+		mtd_banks[idx] =3D do_map_probe("jedec_probe", map_banks[idx]);
+		if (mtd_banks[idx]) {
+			mtd_banks[idx]->module =3D THIS_MODULE;
+			mtd_size +=3D mtd_banks[idx]->size;
+			num_banks++;
+			debugk ("%s: bank%d, name:%s, size:%dbytes \n",
+				__FUNCTION__,
+				num_banks,=20
+				mtd_banks[idx]->name,
+				mtd_banks[idx]->size);
+		}
+	}
+
+	/* no supported flash chips found */
+	if (!num_banks) {
+		printk("MPC8260ADS: No supported flash chips found!\n");
+		ret =3D -ENXIO;
+		goto error_mem;
+	}
+
+#ifdef CONFIG_MTD_PARTITIONS
+	/*
+	 * Select static partition definitions
+	 */
+	part_banks[0].mtd_part =3D mpc8260ads_partitions;
+	part_banks[0].type =3D "static image";
+	part_banks[0].nums =3D NB_OF(mpc8260ads_partitions);
+
+	for(idx =3D 0; idx < num_banks ; idx++) {
+		if (part_banks[idx].nums =3D=3D 0) {
+		    printk (KERN_NOTICE
+			    "MPC8260ADS flash bank %d: no partition info available, "
+			    "registering whole device\n",
+				idx);
+		    add_mtd_device(mtd_banks[idx]);
+		} else {
+		    printk (KERN_NOTICE=20
+			    "MPC8260ADS flash bank %d: Using %s partition definition\n",
+				idx,
+				part_banks[idx].type);
+		    add_mtd_partitions (mtd_banks[idx],
+					part_banks[idx].mtd_part,=20
+					part_banks[idx].nums);
+		}
+	}
+#else
+	printk (KERN_NOTICE "MPC8260ADS flash: registering %d flash banks at once=
\n",
+		num_banks);
+
+	for(idx =3D 0 ; idx < num_banks ; idx++) {
+		add_mtd_device(mtd_banks[idx]);
+	}
+#endif
+	return 0;
+error_mem:
+	for(idx =3D 0 ; idx < FLASH_BANK_MAX ; idx++) {
+		if (map_banks[idx] !=3D NULL) {
+			if (map_banks[idx]->name !=3D NULL) {
+				kfree(map_banks[idx]->name);
+				map_banks[idx]->name =3D NULL;
+			}
+			kfree(map_banks[idx]);
+			map_banks[idx] =3D NULL;
+		}
+	}
+error:
+	iounmap((void *)start_scan_addr);
+	return ret;
+}
+
+static void __exit cleanup_ads(void)
+{
+	unsigned int idx =3D 0;
+	for(idx =3D 0 ; idx < num_banks ; idx++) {
+		/* destroy mtd_info previously allocated */
+		if (mtd_banks[idx]) {
+			del_mtd_partitions(mtd_banks[idx]);
+			map_destroy(mtd_banks[idx]);
+		}
+		/* release map_info not used anymore */
+		kfree(map_banks[idx]->name);
+		kfree(map_banks[idx]);
+	}
+	if (start_scan_addr) {
+		iounmap((void *)start_scan_addr);
+		start_scan_addr =3D 0;
+	}
+}
+
+module_init(init_ads);
+module_exit(cleanup_ads);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Christian Gagneraud <cgagneraud@anfora.fr>");
+MODULE_DESCRIPTION("MTD map driver for MPC8260ADS boards");
diff -Naur --exclude=3Dtest mtd-20020403/fs/jffs2/background.c linux-denx-2=
.4.4-20020321-edu/fs/jffs2/background.c
--- mtd-20020403/fs/jffs2/background.c	Wed Apr  3 15:33:54 2002
+++ linux-denx-2.4.4-20020321-edu/fs/jffs2/background.c	Thu Apr 25 17:40:29=
 2002
@@ -37,6 +37,7 @@
=20
 #define __KERNEL_SYSCALLS__
=20
+#include <linux/types.h> /* GANS */
 #include <linux/kernel.h>
 #include <linux/unistd.h>
 #include <linux/jffs2.h>
diff -Naur mtd-20020403/include/linux/mtd/compatmac.h mtd-20020403-edu/incl=
ude/linux/mtd/compatmac.h=20
--- mtd-20020403/include/linux/mtd/compatmac.h	Wed Apr  3 15:33:54 2002
+++ linux-denx-2.4.4-20020321-edu/include/linux/mtd/compatmac.h	Fri Apr 26 =
17:07:32 2002
@@ -426,6 +426,7 @@
         ({ type __x =3D (x); type __y =3D (y); __x > __y ? __x: __y; })
 #endif
=20
+#ifndef _COMPLETION_H_ /* GANS  */
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,7)
 struct completion {
 	struct semaphore s;
@@ -435,12 +436,14 @@
 #define wait_for_completion(c) down(&(c)->s)
 #define init_completion(c) init_MUTEX_LOCKED(&(c)->s);
=20
-#endif
+#endif=20
=20
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,9)
 /* This came later */
 #define complete_and_exit(c, r) do { complete(c); do_exit(r); } while(0)
 #endif
+
+#endif /* _COMPLETION_H_  GANS  */
=20
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,9) || \
     (LINUX_VERSION_CODE < KERNEL_VERSION(2,4,10) && !defined(__rh_config_h=
__))
diff -Naur mtd-20020403/lib/zlib_deflate/Makefile mtd-20020403-edu/lib/zlib=
_deflate/Makefile
--- mtd-20020403/lib/zlib_deflate/Makefile	Wed Apr 10 17:02:55 2002
+++ mtd-20020403-edu/lib/zlib_deflate/Makefile	Mon Apr 22 19:34:33 2002
@@ -8,10 +8,10 @@
=20
 O_TARGET    :=3D zlib_deflate.o
=20
-export-objs :=3D deflate_syms.o
+#GANS export-objs :=3D deflate_syms.o
=20
-obj-y :=3D deflate.o deftree.o deflate_syms.o
-obj-y :=3D $(O_TARGET)
+obj-y :=3D deflate.o deftree.o #GANS deflate_syms.o
+#GANS obj-y :=3D $(O_TARGET)
=20
 EXTRA_CFLAGS +=3D -I $(TOPDIR)/lib/zlib_deflate
=20
diff -Naur mtd-20020403/lib/zlib_inflate/Makefile mtd-20020403-edu/lib/zlib=
_inflate/Makefile
--- mtd-20020403/lib/zlib_inflate/Makefile	Wed Apr 10 17:03:50 2002
+++ mtd-20020403-edu/lib/zlib_inflate/Makefile	Mon Apr 22 19:34:33 2002
@@ -15,11 +15,11 @@
=20
 O_TARGET    :=3D zlib_inflate.o
=20
-export-objs :=3D inflate_syms.o
+#GANS export-objs :=3D inflate_syms.o
=20
 obj-y :=3D infblock.o infcodes.o inffast.o inflate.o \
-	 inftrees.o infutil.o inflate_syms.o
-obj-y :=3D $(O_TARGET)
+	 inftrees.o infutil.o #GANS inflate_syms.o
+#GANS obj-y :=3D $(O_TARGET)
=20
 EXTRA_CFLAGS +=3D -I $(TOPDIR)/lib/zlib_inflate
=20
diff -Naur mtd-20020403/patches/patchin.sh mtd-20020403-edu/patches/patchin=
.sh
--- mtd-20020403/patches/patchin.sh	Wed Apr  3 15:33:55 2002
+++ mtd-20020403-edu/patches/patchin.sh	Thu Apr 11 19:19:01 2002
@@ -6,11 +6,14 @@
 	exit 1
 fi
=20
+HERE=3D`pwd`
 cd `dirname $0`
 THISDIR=3D`pwd`
 TOPDIR=3D`dirname $THISDIR`
=20
 LINUXDIR=3D$1
+
+cd $HERE
 if [ ! -f $LINUXDIR/Makefile ]
 then
 	echo "Directory" $LINUXDIR "doesn't exist, or doesn't contain Linux sourc=
es"
@@ -30,6 +33,9 @@
 mkdir -p drivers/mtd/nand
 mkdir -p include/linux/mtd
 mkdir -p fs/jffs
+mkdir -p fs/jffs2
+mkdir -p lib/zlib_deflate
+mkdir -p lib/zlib_inflate
 ln -sf $TOPDIR/drivers/mtd/*.[ch] drivers/mtd
 ln -sf $TOPDIR/drivers/mtd/*akefile $TOPDIR/drivers/mtd/Rules.make $TOPDIR=
/drivers/mtd/Config.in drivers/mtd
 ln -sf $TOPDIR/drivers/mtd/chips/*.[ch] drivers/mtd/chips
@@ -42,8 +48,17 @@
 ln -sf $TOPDIR/drivers/mtd/nand/*akefile $TOPDIR/drivers/mtd/nand/Config.i=
n drivers/mtd/nand
 ln -sf $TOPDIR/fs/jffs/*.[ch] fs/jffs
 ln -sf $TOPDIR/fs/jffs/*akefile fs/jffs
-ln -sf $TOPDIR/include/linux/jffs.h include/linux
+ln -sf $TOPDIR/fs/jffs2/*.[ch] fs/jffs2
+ln -sf $TOPDIR/fs/jffs2/*akefile fs/jffs2
+ln -sf $TOPDIR/include/linux/jffs*.h include/linux
+ln -sf $TOPDIR/include/linux/jffs2*.h include/linux
 ln -sf $TOPDIR/include/linux/mtd/*.h include/linux/mtd
+ln -sf $TOPDIR/include/linux/z*.h include/linux
+ln -sf $TOPDIR/fs/jffs2/crc32.h include/linux
+ln -sf $TOPDIR/lib/zlib_deflate/*akefile lib/zlib_deflate
+ln -sf $TOPDIR/lib/zlib_deflate/*.[ch] lib/zlib_deflate
+ln -sf $TOPDIR/lib/zlib_inflate/*akefile lib/zlib_inflate
+ln -sf $TOPDIR/lib/zlib_inflate/*.[ch] lib/zlib_inflate
=20
 #
 #	kernel patches

--=-A20QSdf1W/ZbAVshVHta
Content-Disposition: attachment;
	filename=linux-2.4.4-2002-03-21-mtd-20020403-edu-20020425.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch;
	name=linux-2.4.4-2002-03-21-mtd-20020403-edu-20020425.patch;
	charset=ISO-8859-15

diff -Naur linux-2.4.4-2002-03-21/include/linux/compiler.h linux-denx-2.4.4=
-20020321-edu/include/linux/compiler.h
--- linux-2.4.4-2002-03-21/include/linux/compiler.h	Wed Nov 21 01:36:23 200=
1
+++ linux-denx-2.4.4-20020321-edu/include/linux/compiler.h	Thu Apr 25 19:06=
:10 2002
@@ -10,4 +10,9 @@
 #define __builtin_expect(x, expected_value) (x)
 #endif
=20
+/* GANS from kernel-2.4.18 include/linux/compiler.h */
+/* GANS for cvs mtd code: fs/jffs2/erase.c */
+#define likely(x)       __builtin_expect((x),1)
+#define unlikely(x)     __builtin_expect((x),0)
+
 #endif /* __LINUX_COMPILER_H */
diff -Naur linux-2.4.4-2002-03-21/include/linux/completion.h linux-denx-2.4=
.4-20020321-edu/include/linux/completion.h
--- linux-2.4.4-2002-03-21/include/linux/completion.h	Thu Jan  1 01:00:00 1=
970
+++ linux-denx-2.4.4-20020321-edu/include/linux/completion.h	Thu Apr 25 19:=
04:23 2002
@@ -0,0 +1,41 @@
+#ifndef _COMPLETION_H_
+#define _COMPLETION_H_
+
+/* GANS
+From: David Woodhouse <dwmw2@infradead.org>
+To: "regigao" <regigao@sinamail.com>
+Cc: linux-mtd@lists.infradead.org, Steve_Chen@kingston.com
+Subject: Re: JFFS compile error=20
+Date: Fri, 21 Dec 2001 08:55:01 +0000
+Sender: linux-mtd-admin@lists.infradead.org
+X-Mailer: exmh version 2.4 06/23/2000 with nmh-1.0.4
+
+regigao@sinamail.com said:
+> I know the completion.h is not included until kernel 2.4.8. How do I
+> resolve the question ?=20
+
+Make an empty file called include/linux/completion.h and make sure you've=20
+got the latest version from CVS of include/linux/mtd/compatmac.h, which=20
+should define it for you.
+
+--
+dwmw2
+*/
+/* GANS: from mtd cvs code: linux/mtd/compatmac.h */
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,7)
+struct completion {
+	        struct semaphore s;
+};
+
+#define complete(c) up(&(c)->s)
+#define wait_for_completion(c) down(&(c)->s)
+#define init_completion(c) init_MUTEX_LOCKED(&(c)->s);
+
+#endif
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,9)
+/* This came later */
+#define complete_and_exit(c, r) do { complete(c); do_exit(r); } while(0)
+#endif
+
+#endif /* _COMPLETION_H_ */
diff -Naur linux-2.4.4-2002-03-21/include/linux/fs.h linux-denx-2.4.4-20020=
321-edu/include/linux/fs.h
--- linux-2.4.4-2002-03-21/include/linux/fs.h	Mon Apr 30 01:15:31 2001
+++ linux-denx-2.4.4-20020321-edu/include/linux/fs.h	Thu Apr 25 19:12:28 20=
02
@@ -296,6 +296,7 @@
 #include <linux/ncp_fs_i.h>
 #include <linux/proc_fs_i.h>
 #include <linux/usbdev_fs_i.h>
+#include <linux/jffs2_fs_i.h>
=20
 /*
  * Attribute flags.  These should be or-ed together to figure out what
@@ -461,6 +462,7 @@
 		struct proc_inode_info		proc_i;
 		struct socket			socket_i;
 		struct usbdev_inode_info        usbdev_i;
+		struct jffs2_inode_info		jffs2_i;
 		void				*generic_ip;
 	} u;
 };
@@ -637,6 +639,7 @@
 #include <linux/udf_fs_sb.h>
 #include <linux/ncp_fs_sb.h>
 #include <linux/usbdev_fs_sb.h>
+#include <linux/jffs2_fs_sb.h>
=20
 extern struct list_head super_blocks;
=20
@@ -689,6 +692,7 @@
 		struct udf_sb_info	udf_sb;
 		struct ncp_sb_info	ncpfs_sb;
 		struct usbdev_sb_info   usbdevfs_sb;
+		struct jffs2_sb_info    jffs2_sb;
 		void			*generic_sbp;
 	} u;
 	/*
diff -Naur linux-2.4.4-2002-03-21/init/main.c linux-denx-2.4.4-20020321-edu=
/init/main.c
--- linux-2.4.4-2002-03-21/init/main.c	Mon May 28 13:15:05 2001
+++ linux-denx-2.4.4-20020321-edu/init/main.c	Thu Apr 25 19:00:17 2002
@@ -264,6 +264,9 @@
 #ifdef CONFIG_NFTL
 	{ "nftla", 0x5d00 },
 #endif
+#ifdef CONFIG_MTD
+	{ "mtdblock1" , 0x1F01 } ,
+#endif
 	{ NULL, 0 }
 };
=20
diff -Naur linux-2.4.4-2002-03-21/lib/Makefile linux-denx-2.4.4-20020321-ed=
u/lib/Makefile
--- linux-2.4.4-2002-03-21/lib/Makefile	Mon Apr 30 01:15:32 2001
+++ linux-denx-2.4.4-20020321-edu/lib/Makefile	Thu Apr 11 19:20:19 2002
@@ -19,4 +19,8 @@
   obj-y +=3D dec_and_lock.o
 endif
=20
+#GANS: zlib pour fffs2
+obj-y +=3D zlib_deflate/zlib_deflate.o zlib_inflate/zlib_inflate.o
+subdir-y :=3D zlib_deflate zlib_inflate
+
 include $(TOPDIR)/Rules.make

--=-A20QSdf1W/ZbAVshVHta
Content-Disposition: attachment; filename=linux-2.4.4-2002-03-21-mpc8260ads-20020531.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; name=linux-2.4.4-2002-03-21-mpc8260ads-20020531.patch;
	charset=ISO-8859-15

diff -Naur linux-2.4.4-denx-20020321/arch/ppc/config.in linux-2.4.4-denx-20=
020321-edu-20020425/arch/ppc/config.in
--- linux-2.4.4-denx-20020321/arch/ppc/config.in	Mon May 27 17:17:05 2002
+++ linux-2.4.4-denx-20020321-edu-20020425/arch/ppc/config.in	Mon May 27 17=
:18:57 2002
@@ -44,10 +44,11 @@
=20
 dep_tristate 'Support for CU824' CONFIG_CU824 $CONFIG_8240
=20
-if [ "$CONFIG_8260" =3D "y" ]; then
+if [ "$CONFIG_8260" =3D "y" -a "$CONFIG_6xx" =3D "y" ]; then
   define_bool CONFIG_SERIAL_CONSOLE y
   bool 'Support for EST8260' CONFIG_EST8260
   bool 'Support for TQM8260' CONFIG_TQM8260
+  bool 'Support for Motorola MPC8260ADS' CONFIG_MPC8260ADS
   bool 'Support for PM826' CONFIG_PM826
   bool 'Support for IPHASE4539' CONFIG_IPHASE4539
   bool 'Support for CPU86' CONFIG_CPU86
diff -Naur linux-2.4.4-denx-20020321/include/asm-ppc/mpc8260.h linux-2.4.4-=
denx-20020321-edu-atm/include/asm-ppc/mpc8260.h
--- linux-2.4.4-denx-20020321/include/asm-ppc/mpc8260.h	Mon May 27 17:17:57=
 2002
+++ linux-2.4.4-denx-20020321-edu-atm/include/asm-ppc/mpc8260.h	Tue May 28 =
18:41:28 2002
@@ -33,6 +33,10 @@
 #include <asm/cpu86.h>
 #endif
=20
+#ifdef CONFIG_MPC8260ADS
+#include <asm/mpc8260ads.h>
+#endif
+
 /* I don't yet have the ISA or PCI stuff done....no 8260 with
  * such thing.....
  */
diff -Naur linux-2.4.4-denx-20020321/include/asm-ppc/mpc8260ads.h linux-2.4=
.4-denx-20020321-edu-atm/include/asm-ppc/mpc8260ads.h
--- linux-2.4.4-denx-20020321/include/asm-ppc/mpc8260ads.h	Thu Jan  1 01:00=
:00 1970
+++ linux-2.4.4-denx-20020321-edu-atm/include/asm-ppc/mpc8260ads.h	Tue May =
28 18:41:28 2002
@@ -0,0 +1,30 @@
+/*
+ * Board information for the Motorola MPC8260ADS.
+ */
+
+#ifndef __MPC8260ADS_H__
+#define __MPC8260ADS_H__
+
+/* MPC8260 Internel Memory Map */
+/* XXX PPCBOOT provide it in Board Information structure */
+#define IMAP_ADDR	((uint)0xf0000000)
+
+#include <asm/ppcboot.h>
+
+/* Board Control and Status Register */
+typedef struct bcsr
+{
+    unsigned int  bcsr0;=20
+    unsigned int  bcsr1;
+    unsigned int  bcsr2;
+    unsigned int  bcsr3;
+    unsigned int  bcsr4;
+    unsigned int  bcsr5;
+    unsigned int  bcsr6;
+    unsigned int  bcsr7;
+} bcsr_t;
+
+#define BCSR_ADDR       0x04500000
+#define BCSR_SIZE       0x00008000
+
+#endif /* __MPC8260ADS_H__ */

--=-A20QSdf1W/ZbAVshVHta
Content-Disposition: attachment; filename=.config
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=.config; charset=ISO-8859-15

#
# Automatically generated by make menuconfig: don't edit
#
# CONFIG_UID16 is not set
# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=3Dy

#
# Loadable module support
#
# CONFIG_MODULES is not set

#
# Platform support
#
CONFIG_PPC=3Dy
CONFIG_6xx=3Dy
# CONFIG_8240 is not set
# CONFIG_4xx is not set
# CONFIG_POWER3 is not set
# CONFIG_POWER4 is not set
# CONFIG_8xx is not set
CONFIG_8260=3Dy
# CONFIG_CU824 is not set
CONFIG_SERIAL_CONSOLE=3Dy
# CONFIG_EST8260 is not set
# CONFIG_TQM8260 is not set
CONFIG_MPC8260ADS=3Dy
# CONFIG_PM826 is not set
# CONFIG_IPHASE4539 is not set
# CONFIG_CPU86 is not set
CONFIG_PPC601_SYNC_FIX=3Dy
# CONFIG_ALL_PPC is not set
# CONFIG_SMP is not set
CONFIG_MACH_SPECIFIC=3Dy
# CONFIG_SASH is not set

#
# General setup
#
# CONFIG_HIGHMEM is not set
# CONFIG_ISA is not set
# CONFIG_EISA is not set
# CONFIG_SBUS is not set
# CONFIG_MCA is not set
# CONFIG_PCI is not set
CONFIG_NET=3Dy
CONFIG_SYSCTL=3Dy
CONFIG_SYSVIPC=3Dy
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_KCORE_ELF=3Dy
CONFIG_BINFMT_ELF=3Dy
CONFIG_KERNEL_ELF=3Dy
CONFIG_BINFMT_MISC=3Dy
# CONFIG_HOTPLUG is not set
# CONFIG_PCMCIA is not set

#
# Parallel port support
#
# CONFIG_PARPORT is not set
# CONFIG_PPC_RTC is not set

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=3Dy
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=3Dy
# CONFIG_MTD_CONCAT is not set
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLOCK=3Dy
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
CONFIG_MTD_CFI_NOSWAP=3Dy
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=3Dy
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
CONFIG_MTD_CFI_B4=3Dy
# CONFIG_MTD_CFI_B8 is not set
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_I4=3Dy
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_CFI_INTELEXT=3Dy
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
CONFIG_MTD_ROM=3Dy
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=3Dy
CONFIG_MTD_PHYSMAP_START=3Dff800000
CONFIG_MTD_PHYSMAP_LEN=3D800000
CONFIG_MTD_PHYSMAP_BUSWIDTH=3D4
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_MBX860 is not set
# CONFIG_MTD_DBOX2 is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# Plug and Play configuration
#
# CONFIG_PNP is not set
# CONFIG_ISAPNP is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_XD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_BLK_DEV_LOOP=3Dy
CONFIG_BLK_DEV_NBD=3Dy
CONFIG_BLK_DEV_RAM=3Dy
CONFIG_BLK_DEV_RAM_SIZE=3D4096
# CONFIG_BLK_DEV_INITRD is not set

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set
# CONFIG_BLK_DEV_MD is not set
# CONFIG_MD_LINEAR is not set
# CONFIG_MD_RAID0 is not set
# CONFIG_MD_RAID1 is not set
# CONFIG_MD_RAID5 is not set
# CONFIG_BLK_DEV_LVM is not set

#
# Networking options
#
CONFIG_PACKET=3Dy
# CONFIG_PACKET_MMAP is not set
CONFIG_NETLINK=3Dy
CONFIG_RTNETLINK=3Dy
# CONFIG_NETLINK_DEV is not set
CONFIG_NETFILTER=3Dy
# CONFIG_NETFILTER_DEBUG is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=3Dy
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=3Dy
CONFIG_IP_PNP_BOOTP=3Dy
CONFIG_IP_PNP_RARP=3Dy
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_INET_ECN is not set
CONFIG_SYN_COOKIES=3Dy

#
#   IP: Netfilter Configuration
#
# CONFIG_IP_NF_CONNTRACK is not set
# CONFIG_IP_NF_QUEUE is not set
# CONFIG_IP_NF_IPTABLES is not set
# CONFIG_IP_NF_COMPAT_IPCHAINS is not set
# CONFIG_IP_NF_COMPAT_IPFWADM is not set
# CONFIG_IPV6 is not set
# CONFIG_KHTTPD is not set
CONFIG_ATM=3Dy
CONFIG_ATM_CLIP=3Dy
# CONFIG_ATM_CLIP_NO_ICMP is not set
# CONFIG_ATM_LANE is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_LLC is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# ATA/IDE/MFM/RLL support
#
# CONFIG_IDE is not set
# CONFIG_BLK_DEV_IDE_MODES is not set
# CONFIG_BLK_DEV_HD is not set

#
# SCSI support
#
# CONFIG_SCSI is not set

#
# Network device support
#
CONFIG_NETDEVICES=3Dy

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_ETHERTAP is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=3Dy
# CONFIG_MACE is not set
# CONFIG_BMAC is not set
# CONFIG_GMAC is not set
# CONFIG_NCR885E is not set
# CONFIG_OAKNET is not set
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
# CONFIG_AT1700 is not set
# CONFIG_DEPCA is not set
# CONFIG_NET_ISA is not set
# CONFIG_NET_PCI is not set
# CONFIG_NET_POCKET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_SK98LIN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set
# CONFIG_RCPCI is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# ATM drivers
#
# CONFIG_ATM_TCP is not set

#
# Amateur Radio support
#
# CONFIG_HAMRADIO is not set

#
# IrDA (infrared) support
#
# CONFIG_IRDA is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Old CD-ROM drivers (not SCSI, not IDE)
#
# CONFIG_CD_NO_IDESCSI is not set

#
# Console drivers
#
# CONFIG_VGA_CONSOLE is not set

#
# Frame-buffer support
#
# CONFIG_FB is not set

#
# Input core support
#
# CONFIG_INPUT is not set

#
# Macintosh device drivers
#

#
# Character devices
#
# CONFIG_VT is not set
# CONFIG_SERIAL is not set
# CONFIG_SERIAL_EXTENDED is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=3Dy
CONFIG_UNIX98_PTY_COUNT=3D256

#
# I2C support
#
CONFIG_I2C=3Dy
# CONFIG_I2C_ALGOBIT is not set
# CONFIG_I2C_ALGOPCF is not set
# CONFIG_I2C_ELEKTOR is not set
CONFIG_I2C_ALGO8260=3Dy
# CONFIG_I2C_PM826 is not set
# CONFIG_I2C_CPU86 is not set
CONFIG_I2C_CHARDEV=3Dy

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_MOUSE is not set

#
# Joysticks
#
# CONFIG_JOYSTICK is not set
# CONFIG_QIC02_TAPE is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_INTEL_RNG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set
# CONFIG_PCF8563_RTC is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_FLASH is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_REISERFS_CHECK is not set
# CONFIG_ADFS_FS is not set
# CONFIG_ADFS_FS_RW is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=3Dy
CONFIG_JFFS2_FS_DEBUG=3D0
# CONFIG_CRAMFS is not set
# CONFIG_TMPFS is not set
# CONFIG_RAMFS is not set
# CONFIG_ISO9660_FS is not set
# CONFIG_JOLIET is not set
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS_RW is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=3Dy
# CONFIG_DEVFS_FS is not set
# CONFIG_DEVFS_MOUNT is not set
# CONFIG_DEVFS_DEBUG is not set
CONFIG_DEVPTS_FS=3Dy
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX4FS_RW is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=3Dy
# CONFIG_SYSV_FS is not set
# CONFIG_SYSV_FS_WRITE is not set
# CONFIG_UDF_FS is not set
# CONFIG_UDF_RW is not set
# CONFIG_UFS_FS is not set
# CONFIG_UFS_FS_WRITE is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=3Dy
# CONFIG_NFS_V3 is not set
CONFIG_ROOT_NFS=3Dy
# CONFIG_NFSD is not set
# CONFIG_NFSD_V3 is not set
CONFIG_SUNRPC=3Dy
CONFIG_LOCKD=3Dy
# CONFIG_SMB_FS is not set
# CONFIG_NCP_FS is not set
# CONFIG_NCPFS_PACKET_SIGNING is not set
# CONFIG_NCPFS_IOCTL_LOCKING is not set
# CONFIG_NCPFS_STRONG is not set
# CONFIG_NCPFS_NFS_NS is not set
# CONFIG_NCPFS_OS2_NS is not set
# CONFIG_NCPFS_SMALLDOS is not set
# CONFIG_NCPFS_NLS is not set
# CONFIG_NCPFS_EXTRAS is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=3Dy
# CONFIG_ACORN_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
# CONFIG_AMIGA_PARTITION is not set
# CONFIG_ATARI_PARTITION is not set
# CONFIG_MAC_PARTITION is not set
# CONFIG_MSDOS_PARTITION is not set
# CONFIG_SGI_PARTITION is not set
# CONFIG_ULTRIX_PARTITION is not set
# CONFIG_SUN_PARTITION is not set
# CONFIG_SMB_NLS is not set
# CONFIG_NLS is not set

#
# Sound
#
# CONFIG_SOUND is not set

#
# MPC8260 CPM Options
#

#
# MPC8260 Communication Options
#
# CONFIG_SCC_ENET is not set
# CONFIG_SCC1_ENET is not set
# CONFIG_SCC2_ENET is not set
# CONFIG_SCC3_ENET is not set
CONFIG_FCC_ENET=3Dy
# CONFIG_FCC1_ENET is not set
CONFIG_FCC2_ENET=3Dy
# CONFIG_FCC3_ENET is not set
# CONFIG_USE_MDIO is not set
# CONFIG_FCC_AMD79C873 is not set
# CONFIG_FCC_LXT970 is not set
# CONFIG_FCC_LXT971 is not set
# CONFIG_FCC_QS6612 is not set
# CONFIG_DCACHE_DISABLE is not set

#
# MPC8260sar ATM CPM Options
#
# CONFIG_ESAR_SUPPORT is not set

#
# MPC8260 with DSP5685X Options
#
CONFIG_DSP5685X=3Dy
CONFIG_DSP5685X_HI_BASE=3D0x04608000
# CONFIG_DSP5685X_HI_DEV is not set
CONFIG_DSP5685X_HI_TEST=3Dy

#
# USB support
#
# CONFIG_USB is not set

#
# Kernel hacking
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_KGDB is not set
# CONFIG_XMON is not set
CONFIG_BDI_SWITCH=3Dy

--=-A20QSdf1W/ZbAVshVHta--
