Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15yaNO-0001oI-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2001 15:00:26 +0000
Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15yaWI-0006V1-00
	for linux-mtd@lists.infradead.org; Tue, 30 Oct 2001 15:09:38 +0000
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id HAA12595
	for <mtd@infradead.org>; Tue, 30 Oct 2001 07:06:06 -0800 (PST)
Message-ID: <82B1591A280FD411B91200D0B75B484A015F5D12@sis-uk-msg01.altera.com>
From: Clive Davies <cdavies@altera.com>
To: "'mtd@infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Patch: adding mtd support for new machine
Date: Tue, 30 Oct 2001 07:09:58 -0800
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C16154.F09C3240"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C16154.F09C3240
Content-Type: text/plain;
	charset="iso-8859-1"

I submitted a patch to Russell King to add mtd support for a new mchine type
to his arm linux source tree. He sent me here to discuss:

>- lack of $id$ in the new map driver
>- missing help entry for the new CONFIG_* symbol
>- concerns about overloading the read_oob

The first one I don't really understand, the second I can deal with myself.
For the third, I've used the oob interface to access the protection data in
Intel flash devices. This seemed to me to fit ok as its essentially data
that isn't in the main flash array. 

The patch (against 2.4.13-ac4-rmk1) is attached, any comments would be
gratefully received.

Please cc any replies to me.

TIA
Clive


------_=_NextPart_000_01C16154.F09C3240
Content-Type: application/octet-stream;
	name="mtd_patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd_patch"

diff -purN linux_2.4.13/drivers/mtd/chips/cfi_cmdset_0001.c =
linux/drivers/mtd/chips/cfi_cmdset_0001.c=0A=
--- linux_2.4.13/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Oct  4 =
23:14:59 2001=0A=
+++ linux/drivers/mtd/chips/cfi_cmdset_0001.c	Tue Oct 30 10:48:59 =
2001=0A=
@@ -31,6 +31,7 @@=0A=
 #include <linux/mtd/compatmac.h>=0A=
 =0A=
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, =
size_t *, u_char *);=0A=
+static int cfi_intelext_read_OTP (struct mtd_info *, loff_t, size_t, =
size_t *, u_char *);=0A=
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);=0A=
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, =
size_t, size_t *, const u_char *);=0A=
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct =
erase_info *);=0A=
@@ -151,7 +152,23 @@ struct mtd_info *cfi_cmdset_0001(struct =0A=
 		/* Do some byteswapping if necessary */=0A=
 		extp->FeatureSupport =3D cfi32_to_cpu(extp->FeatureSupport);=0A=
 		extp->BlkStatusRegMask =3D cfi32_to_cpu(extp->BlkStatusRegMask);=0A=
+		extp->OTPAddr =3D cfi32_to_cpu(extp->OTPAddr);=0A=
 		=0A=
+		=0A=
+		/* Read the OTP area from flash */=0A=
+		if(extp->NumProtectionFields){=0A=
+			cfi_send_gen_cmd(0x90, 0x55, base, map, cfi, cfi->device_type, =
NULL);=0A=
+			=
cfi->OTPData=3Dkmalloc((1<<extp->FactOTPSize)+(1<<extp->UserOTPSize),GFP=
_KERNEL);=0A=
+			if(!cfi->OTPData){=0A=
+				printk(KERN_ERR "Failed to allocate memory\n");=0A=
+				return 0;=0A=
+			}=0A=
+			for (i=3D0; =
i<((1<<extp->FactOTPSize)+(1<<extp->UserOTPSize));i++){=0A=
+				cfi->OTPData[i]=3D=0A=
+					map->read8(map,(base+(extp->OTPAddr*ofs_factor)+i));=0A=
+			}=0A=
+		}=0A=
+			=0A=
 #ifdef DEBUG_CFI_FEATURES=0A=
 		/* Tell the user about it in lots of lovely detail */=0A=
 		cfi_tell_features(extp);=0A=
@@ -247,6 +264,7 @@ static struct mtd_info *cfi_intelext_set=0A=
 		//printk(KERN_INFO "Using word write method\n" );=0A=
 		mtd->write =3D cfi_intelext_write_words;=0A=
 	}=0A=
+	mtd->read_oob =3D cfi_intelext_read_OTP;=0A=
 	mtd->sync =3D cfi_intelext_sync;=0A=
 	mtd->lock =3D cfi_intelext_lock;=0A=
 	mtd->unlock =3D cfi_intelext_unlock;=0A=
@@ -432,6 +450,30 @@ static int cfi_intelext_read (struct mtd=0A=
 	}=0A=
 	return ret;=0A=
 }=0A=
+=0A=
+static int cfi_intelext_read_OTP (struct mtd_info *mtd, loff_t from, =
size_t len, size_t *retlen, u_char *buf)=0A=
+{=0A=
+	struct map_info *map =3D mtd->priv;=0A=
+	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
+	struct cfi_pri_intelext *extp=3Dcfi->cmdset_priv;=0A=
+	unsigned char* data=3Dcfi->OTPData+from;=0A=
+	int   count=3Dlen;=0A=
+	=0A=
+	while(count){=0A=
+		if(data>=3Dcfi->OTPData + =0A=
+		   (1<<extp->FactOTPSize)+(1<<extp->UserOTPSize)){=0A=
+		   return len-count;=0A=
+		}=0A=
+		*buf=3D*data;=0A=
+		buf++;		=0A=
+		data++;=0A=
+		count--;	     =0A=
+	}=0A=
+	return len-count;=0A=
+}=0A=
+	=0A=
+	=0A=
+=0A=
 =0A=
 static int do_write_oneword(struct map_info *map, struct flchip *chip, =
unsigned long adr, __u32 datum)=0A=
 {=0A=
diff -purN linux_2.4.13/drivers/mtd/maps/Config.in =
linux/drivers/mtd/maps/Config.in=0A=
--- linux_2.4.13/drivers/mtd/maps/Config.in	Mon Oct 29 15:47:07 2001=0A=
+++ linux/drivers/mtd/maps/Config.in	Wed Oct 24 10:17:47 2001=0A=
@@ -57,6 +57,7 @@ if [ "$CONFIG_ARM" =3D "y" ]; then=0A=
    dep_tristate '  CFI Flash device mapped on StrongARM SA11x0' =
CONFIG_MTD_SA1100 $CONFIG_MTD_CFI $CONFIG_ARCH_SA1100 =
$CONFIG_MTD_PARTITIONS=0A=
    dep_tristate '  CFI Flash device mapped on DC21285 Footbridge' =
CONFIG_MTD_DC21285 $CONFIG_MTD_CFI $CONFIG_ARCH_FOOTBRIDGE =
$CONFIG_MTD_PARTITIONS=0A=
    dep_tristate '  CFI Flash device mapped on the XScale IQ80310 =
board' CONFIG_MTD_IQ80310 $CONFIG_MTD_CFI $CONFIG_ARCH_IQ80310=0A=
+   dep_tristate '  CFI Flash device mapped on Epxa10db' =
CONFIG_MTD_EPXA10DB $CONFIG_MTD_CFI  $CONFIG_MTD_PARTITIONS =0A=
 fi=0A=
 =0A=
 # This needs CFI or JEDEC, depending on the cards found.=0A=
diff -purN linux_2.4.13/drivers/mtd/maps/Makefile =
linux/drivers/mtd/maps/Makefile=0A=
--- linux_2.4.13/drivers/mtd/maps/Makefile	Mon Oct 29 15:47:07 2001=0A=
+++ linux/drivers/mtd/maps/Makefile	Wed Oct 24 10:17:47 2001=0A=
@@ -31,6 +31,7 @@ obj-$(CONFIG_MTD_SUN_UFLASH)    +=3D sun_u=0A=
 obj-$(CONFIG_MTD_VMAX)		+=3D vmax301.o=0A=
 obj-$(CONFIG_MTD_DBOX2)		+=3D dbox2-flash.o=0A=
 obj-$(CONFIG_MTD_OCELOT)	+=3D ocelot.o=0A=
+obj-$(CONFIG_MTD_EPXA10DB)	+=3D epxa10db-flash.o=0A=
 obj-$(CONFIG_MTD_SOLUTIONENGINE)+=3D solutionengine.o=0A=
 obj-$(CONFIG_MTD_PCI)		+=3D pci.o=0A=
 =0A=
diff -purN linux_2.4.13/drivers/mtd/maps/epxa10db-flash.c =
linux/drivers/mtd/maps/epxa10db-flash.c=0A=
--- linux_2.4.13/drivers/mtd/maps/epxa10db-flash.c	Thu Jan  1 01:00:00 =
1970=0A=
+++ linux/drivers/mtd/maps/epxa10db-flash.c	Tue Oct 30 11:04:39 2001=0A=
@@ -0,0 +1,216 @@=0A=
+/*=0A=
+ * Flash memory access on EPXA based devices=0A=
+ *=0A=
+ * (C) 2000 Nicolas Pitre <nico@cam.org>=0A=
+ *  Copyright (C) 2001 Altera Corporation=0A=
+ *=0A=
+ * This program is free software; you can redistribute it and/or =
modify=0A=
+ * it under the terms of the GNU General Public License as published =
by=0A=
+ * the Free Software Foundation; either version 2 of the License, =
or=0A=
+ * (at your option) any later version.=0A=
+ *=0A=
+ * This program is distributed in the hope that it will be useful,=0A=
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
+ * GNU General Public License for more details.=0A=
+ *=0A=
+ * You should have received a copy of the GNU General Public =
License=0A=
+ * along with this program; if not, write to the Free Software=0A=
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  =
02111-1307  USA=0A=
+ */=0A=
+=0A=
+#include <linux/config.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/types.h>=0A=
+#include <linux/kernel.h>=0A=
+=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/map.h>=0A=
+#include <linux/mtd/partitions.h>=0A=
+=0A=
+#include <asm/hardware.h>=0A=
+=0A=
+=0A=
+MODULE_AUTHOR("Clive Davies");=0A=
+MODULE_DESCRIPTION("Altera epxa10db mtd flash map");=0A=
+MODULE_LICENSE("GPL");=0A=
+=0A=
+static __u8 epxa10db_read8(struct map_info *map, unsigned long ofs)=0A=
+{=0A=
+	return *(__u8 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + ofs));=0A=
+}=0A=
+=0A=
+static __u16 epxa10db_read16(struct map_info *map, unsigned long =
ofs)=0A=
+{=0A=
+	return *(__u16 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + ofs));=0A=
+}=0A=
+=0A=
+static __u32 epxa10db_read32(struct map_info *map, unsigned long =
ofs)=0A=
+{=0A=
+	return *(__u32 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + ofs));=0A=
+}=0A=
+=0A=
+static void epxa10db_copy_from(struct map_info *map, void *to, =
unsigned long from, ssize_t len)=0A=
+{=0A=
+	memcpy(to, (void *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + from)), =
len);=0A=
+}=0A=
+=0A=
+static void epxa10db_write8(struct map_info *map, __u8 d, unsigned =
long adr)=0A=
+{=0A=
+	*(__u8 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + adr)) =3D d;=0A=
+}=0A=
+=0A=
+static void epxa10db_write16(struct map_info *map, __u16 d, unsigned =
long adr)=0A=
+{=0A=
+	*(__u16 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + adr)) =3D d;=0A=
+}=0A=
+=0A=
+static void epxa10db_write32(struct map_info *map, __u32 d, unsigned =
long adr)=0A=
+{=0A=
+	*(__u32 *)(FLASH_VADDR(EXC_EBI_BLOCK0_BASE + adr)) =3D d;=0A=
+}=0A=
+=0A=
+static void epxa10db_copy_to(struct map_info *map, unsigned long to, =
const void *from, ssize_t len)=0A=
+{=0A=
+	memcpy((void *)FLASH_VADDR(EXC_EBI_BLOCK0_BASE + to), from, len);=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static struct map_info epxa10db_map =3D {=0A=
+	name:		"EPXA10DB flash",=0A=
+	read8:		epxa10db_read8,=0A=
+	read16:		epxa10db_read16,=0A=
+	read32:		epxa10db_read32,=0A=
+	copy_from:	epxa10db_copy_from,=0A=
+	write8:		epxa10db_write8,=0A=
+	write16:	epxa10db_write16,=0A=
+	write32:	epxa10db_write32,=0A=
+	copy_to:	epxa10db_copy_to=0A=
+};=0A=
+=0A=
+=0A=
+=0A=
+=0A=
+=0A=
+int fixup_epxa10db_partitions(struct mtd_info *master, struct =
mtd_partition **pparts);=0A=
+=0A=
+static struct mtd_partition *parsed_parts;=0A=
+static struct mtd_info *mymtd;=0A=
+=0A=
+int __init epxa10db_mtd_init(void)=0A=
+{=0A=
+	struct mtd_partition *parts;=0A=
+	int nb_parts =3D 0;=0A=
+	int parsed_nr_parts =3D 0;=0A=
+	char *part_type;=0A=
+	int i;=0A=
+	const char* master_name=3D"master";=0A=
+	=0A=
+	epxa10db_map.buswidth =3D  2;=0A=
+	epxa10db_map.size =3D 0x01000000;=0A=
+	printk(KERN_NOTICE "EPXA10DB flash: probing %d-bit flash bus\n", =
epxa10db_map.buswidth*8);=0A=
+	mymtd =3D do_map_probe("cfi_probe", &epxa10db_map);=0A=
+	if (!mymtd)=0A=
+		return -ENXIO;=0A=
+	mymtd->module =3D THIS_MODULE;=0A=
+=0A=
+=0A=
+=0A=
+	/*=0A=
+	 * Dynamic partition selection stuff (might override the static =
ones)=0A=
+	 */=0A=
+	if (parsed_nr_parts =3D=3D 0) {=0A=
+		int ret =3D fixup_epxa10db_partitions(mymtd, &parsed_parts);=0A=
+		if (ret > 0) {=0A=
+			part_type =3D "Compaq bootldr";=0A=
+			parsed_nr_parts =3D ret;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	if (parsed_nr_parts > 0) {=0A=
+		parts =3D parsed_parts;=0A=
+		nb_parts =3D parsed_nr_parts;=0A=
+	}=0A=
+=0A=
+	if (nb_parts =3D=3D 0) {=0A=
+		printk(KERN_NOTICE "EPXA10DB flash: no partition info available, =
registering whole flash at once\n");=0A=
+		add_mtd_device(mymtd);=0A=
+	} else {=0A=
+		printk(KERN_NOTICE "Using %s partition definition\n", part_type);=0A=
+		add_mtd_partitions(mymtd, parts, nb_parts);=0A=
+	}=0A=
+	=0A=
+        /* unlock the flash device */=0A=
+=0A=
+	for (i=3D0; i<mymtd->numeraseregions;i++){=0A=
+		int j;=0A=
+		for(j=3D0;j<mymtd->eraseregions[i].numblocks;j++){=0A=
+			mymtd->unlock(mymtd,mymtd->eraseregions[i].offset + j * =
mymtd->eraseregions[i].erasesize,4);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* =0A=
+	 * Register mymtd as an mtd device so that we can read the =0A=
+	 * protection data =0A=
+	 */=0A=
+	mymtd->name=3Dmaster_name;=0A=
+	add_mtd_device(mymtd);=0A=
+=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static void __exit epxa10db_mtd_cleanup(void)=0A=
+{=0A=
+	if (mymtd) {=0A=
+		del_mtd_partitions(mymtd);=0A=
+		map_destroy(mymtd);=0A=
+		if (parsed_parts)=0A=
+			kfree(parsed_parts);=0A=
+	}=0A=
+}=0A=
+=0A=
+=0A=
+/* =0A=
+ * This will do for now, once we decide which bootldr we're finally =
=0A=
+ * going to use then we'll remove this function and do it properly=0A=
+ *=0A=
+ * Partions are currently (as offsets from base of flash):=0A=
+ * 0x00000000 - 0x003FFFFF - bootloader (!)=0A=
+ * 0x00400000 - 0x00FFFFFF - Flashdisk=0A=
+ */=0A=
+=0A=
+int fixup_epxa10db_partitions(struct mtd_info *master, struct =
mtd_partition **pparts)=0A=
+{=0A=
+	struct mtd_partition *parts;=0A=
+	int ret, i;=0A=
+	int npartitions =3D 0;=0A=
+	char *names; =0A=
+	const char *name =3D "jffs";=0A=
+=0A=
+	printk("Fixing up epxa10db partitions\n");=0A=
+	npartitions=3D1;=0A=
+	parts =3D kmalloc(npartitions*sizeof(*parts)+strlen(name), =
GFP_KERNEL);=0A=
+	if (!parts) {=0A=
+		ret =3D -ENOMEM;=0A=
+		goto out;=0A=
+	}=0A=
+	i=3D0;=0A=
+	names =3D (char *)&parts[npartitions];	=0A=
+	parts[i].name =3D names;=0A=
+	names +=3D strlen(name) + 1;=0A=
+	strcpy(parts[i].name, name);=0A=
+=0A=
+	parts[i].size =3D 0x00C00000;=0A=
+	parts[i].offset =3D 0x00400000;=0A=
+	parts[i].mask_flags =3D 0;=0A=
+		=0A=
+=0A=
+ out:=0A=
+	*pparts =3D parts;=0A=
+	return npartitions;=0A=
+}=0A=
+=0A=
+module_init(epxa10db_mtd_init);=0A=
+module_exit(epxa10db_mtd_cleanup);=0A=
diff -purN linux_2.4.13/drivers/mtd/mtdpart.c =
linux/drivers/mtd/mtdpart.c=0A=
--- linux_2.4.13/drivers/mtd/mtdpart.c	Thu Oct  4 23:14:59 2001=0A=
+++ linux/drivers/mtd/mtdpart.c	Wed Oct 24 10:17:47 2001=0A=
@@ -195,6 +195,7 @@ int add_mtd_partitions(struct mtd_info *=0A=
 		slave->mtd.oobsize =3D master->oobsize;=0A=
 		slave->mtd.ecctype =3D master->ecctype;=0A=
 		slave->mtd.eccsize =3D master->eccsize;=0A=
+		slave->mtd.read_oob =3D master->read_oob;=0A=
 =0A=
 		slave->mtd.name =3D parts[i].name;=0A=
 		slave->mtd.bank_size =3D master->bank_size;=0A=

------_=_NextPart_000_01C16154.F09C3240--
