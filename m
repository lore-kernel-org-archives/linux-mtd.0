Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15zcUH-0006OQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Nov 2001 11:27:49 +0000
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id DAA20978
	for <linux-mtd@lists.infradead.org>; Fri, 2 Nov 2001 03:33:37 -0800 (PST)
Message-ID: <82B1591A280FD411B91200D0B75B484A015F5D23@sis-uk-msg01.altera.com>
From: Clive Davies <cdavies@altera.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: [PATCH]Add protection register read functionality
Date: Fri, 2 Nov 2001 03:37:31 -0800 
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C16392.C21C3C90"
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

------_=_NextPart_000_01C16392.C21C3C90
Content-Type: text/plain;
	charset="iso-8859-1"

This patch (against 2.4.13-ac4-rmk1) adds functionality to read the
protection register data contained in the vendor extended query table in
Intel flash devices. If its ok, could you apply it please.




------_=_NextPart_000_01C16392.C21C3C90
Content-Type: application/octet-stream;
	name="mtd_patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd_patch"

diff -purN linux_2.4.13/drivers/mtd/chips/cfi_cmdset_0001.c =
linux/drivers/mtd/chips/cfi_cmdset_0001.c=0A=
--- linux_2.4.13/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Oct  4 =
23:14:59 2001=0A=
+++ linux/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov  1 14:37:51 =
2001=0A=
@@ -31,6 +31,7 @@=0A=
 #include <linux/mtd/compatmac.h>=0A=
 =0A=
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, =
size_t *, u_char *);=0A=
+static int cfi_intelext_read_prot_reg (struct mtd_info *, loff_t, =
size_t, size_t *, u_char *);=0A=
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
+		extp->ProtRegAddr =3D cfi32_to_cpu(extp->ProtRegAddr);=0A=
 		=0A=
+		=0A=
+		/* Read the protection register area from flash */=0A=
+		if(extp->NumProtectionFields){=0A=
+			cfi_send_gen_cmd(0x90, 0x55, base, map, cfi, cfi->device_type, =
NULL);=0A=
+			=
cfi->ProtRegData=3Dkmalloc((1<<extp->FactProtRegSize)+(1<<extp->UserProt=
RegSize),GFP_KERNEL);=0A=
+			if(!cfi->ProtRegData){=0A=
+				printk(KERN_ERR "Failed to allocate memory\n");=0A=
+				return 0;=0A=
+			}=0A=
+			for (i=3D0; =
i<((1<<extp->FactProtRegSize)+(1<<extp->UserProtRegSize));i++){=0A=
+				cfi->ProtRegData[i]=3D=0A=
+					map->read8(map,(base+(extp->ProtRegAddr*ofs_factor)+i));=0A=
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
+	mtd->read_prot_reg =3D cfi_intelext_read_prot_reg;=0A=
 	mtd->sync =3D cfi_intelext_sync;=0A=
 	mtd->lock =3D cfi_intelext_lock;=0A=
 	mtd->unlock =3D cfi_intelext_unlock;=0A=
@@ -432,6 +450,30 @@ static int cfi_intelext_read (struct mtd=0A=
 	}=0A=
 	return ret;=0A=
 }=0A=
+=0A=
+static int cfi_intelext_read_prot_reg (struct mtd_info *mtd, loff_t =
from, size_t len, size_t *retlen, u_char *buf)=0A=
+{=0A=
+	struct map_info *map =3D mtd->priv;=0A=
+	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
+	struct cfi_pri_intelext *extp=3Dcfi->cmdset_priv;=0A=
+	unsigned char* data=3Dcfi->ProtRegData+from;=0A=
+	int   count=3Dlen;=0A=
+	=0A=
+	while(count){=0A=
+		if(data>=3Dcfi->ProtRegData + =0A=
+		   (1<<extp->FactProtRegSize)+(1<<extp->UserProtRegSize)){=0A=
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
diff -purN linux_2.4.13/include/linux/mtd/mtd.h =
linux/include/linux/mtd/mtd.h=0A=
--- linux_2.4.13/include/linux/mtd/mtd.h	Tue Jun 12 18:30:27 2001=0A=
+++ linux/include/linux/mtd/mtd.h	Thu Nov  1 14:47:05 2001=0A=
@@ -180,6 +180,12 @@ struct mtd_info {=0A=
 	int (*read_oob) (struct mtd_info *mtd, loff_t from, size_t len, =
size_t *retlen, u_char *buf);=0A=
 	int (*write_oob) (struct mtd_info *mtd, loff_t to, size_t len, size_t =
*retlen, const u_char *buf);=0A=
 =0A=
+	/* =0A=
+	 * Method to access the protection register or OTP area, =0A=
+	 * present in some flash devices=0A=
+	 */=0A=
+	int (*read_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len, =
size_t *retlen, u_char *buf);=0A=
+=0A=
 	/* iovec-based read/write methods. We need these especially for NAND =
flash,=0A=
 	   with its limited number of write cycles per erase.=0A=
 	   NB: The 'count' parameter is the number of _vectors_, each of =0A=
--- linux_2.4.13/Documentation/Configure.help	Mon Oct 29 15:47:06 =
2001=0A=
+++ linux/Documentation/Configure.help	Wed Oct 31 10:10:53 2001=0A=
@@ -12261,6 +12273,12 @@ CONFIG_MTD_OCELOT=0A=
   NVRAM on the Momenco Ocelot board.  If you have one of these =
boards=0A=
   and would like access to either of these, say 'Y'.=0A=
 =0A=
+Flash chip mapping on epxa10db=0A=
+CONFIG_MTD_EPXA10DB=0A=
+  This enables support for the flash devices on the Altera =0A=
+  Excalibur XA10 Development Board. If you are building a kernel=0A=
+  for on of these boards then you should say 'Y' otherwise say 'N'.=0A=
+=0A=
 USB (Universal Serial Bus) support=0A=
 CONFIG_USB=0A=
   Universal Serial Bus (USB) is a specification for a serial bus=0A=
diff -purN linux_2.4.13/drivers/mtd/mtdpart.c =
linux/drivers/mtd/mtdpart.c=0A=
--- linux_2.4.13/drivers/mtd/mtdpart.c	Thu Oct  4 23:14:59 2001=0A=
+++ linux/drivers/mtd/mtdpart.c	Thu Nov  1 14:31:45 2001=0A=
@@ -195,6 +195,7 @@ int add_mtd_partitions(struct mtd_info *=0A=
 		slave->mtd.oobsize =3D master->oobsize;=0A=
 		slave->mtd.ecctype =3D master->ecctype;=0A=
 		slave->mtd.eccsize =3D master->eccsize;=0A=
+		slave->mtd.read_prot_reg =3D master->read_prot_reg;=0A=
 =0A=
 		slave->mtd.name =3D parts[i].name;=0A=
 		slave->mtd.bank_size =3D master->bank_size;=0A=
diff -purN linux_2.4.13/include/linux/mtd/cfi.h =
linux/include/linux/mtd/cfi.h=0A=
--- linux_2.4.13/include/linux/mtd/cfi.h	Thu Oct  4 23:13:18 2001=0A=
+++ linux/include/linux/mtd/cfi.h	Thu Nov  1 14:23:45 2001=0A=
@@ -206,6 +206,10 @@ struct cfi_pri_intelext {=0A=
   __u16 BlkStatusRegMask;=0A=
   __u8  VccOptimal;=0A=
   __u8  VppOptimal;=0A=
+  __u8  NumProtectionFields;=0A=
+  __u16 ProtRegAddr;=0A=
+  __u8  FactProtRegSize;=0A=
+  __u8  UserProtRegSize;=0A=
 } __attribute__((packed));=0A=
 =0A=
 struct cfi_pri_query {=0A=
@@ -248,6 +252,7 @@ struct cfi_private {=0A=
 	int numchips;=0A=
 	unsigned long chipshift; /* Because they're of the same type */=0A=
 	const char *im_name;	 /* inter_module name for cmdset_setup */=0A=
+	unsigned char *ProtRegData;  /* Protection register data bytes */=0A=
 	struct flchip chips[0];  /* per-chip data structure for each chip =
*/=0A=
 };=0A=
 =0A=

------_=_NextPart_000_01C16392.C21C3C90--
