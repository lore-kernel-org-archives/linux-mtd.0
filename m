Received: from fmfdns02.fm.intel.com ([132.233.247.11] helo=thalia.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Z9lL-0006WZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2001 12:32:03 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by thalia.fm.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.41 2001/07/09 21:06:22 root Exp $) with SMTP id LAA24244
	for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2001 11:37:56 GMT
Message-ID: <31223C0C0949D211AC3F00A0C9840935047CF069@hasmsx40.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: MTD for Linux <linux-mtd@lists.infradead.org>,
        JFFS mailing list <jffs-dev@axis.com>
Subject: RE: Erase Sector Size 
Date: Tue, 21 Aug 2001 14:37:45 +0300
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C12A35.B219C0B0"
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

------_=_NextPart_000_01C12A35.B219C0B0
Content-Type: text/plain;
	charset="iso-8859-1"


Hi all,

I have a design question for the code I'm attaching 
that adds support for the old Intel's TE28F*B Fast Boot Block series.
The patch is to cvs from Aug, 19. Note that it modifies
the maps/dc21285.c code and Config.in, to which my question below is
related.

As opposed to Intel's 28F*J Strata Flash series the 
old Fast Boot Block series is not CFI compliant.
I couldn't even coerce it to work as a jedec.

The Lart (devices/lart.c) uses a chip from this series, but the data bus has

a totally crazy mapping.
So I wrote a module for this series somewhat based on the chips/amd_flash.c
code.
Since I have it mapped via dc21285 I modified maps/dc21285.c to probe using
my module
instead of using cfi_probe. (I also had to modify the write16, since the
code there uses,
IMO,  a wrong addr. mask).

I see two problems (not counting the possible bug in dc21285_write*() code)
with what I did:

1. The dc21285.c use of cfi compliant chips is hardcoded (there should maybe
be a
	way to try and probe all registered modules for the first one that
reports success,
	or something like that) or should I use CONFIG_ and #ifdef
2. A minor one - the use of a certain chipset for mapping doesn't
necessarily mean that the
	address and data lanes are always the same. In addition is there
some framework in plan 
      that captures the mapping/interleaving and bus width issues separated
for the specific chip support?

Should I maybe write a device specific modules without the maps/chips
separation, since it seems only
to complicate things?

BTW: For some reason for Intel's 28F* chips the most important is the letter
that follows the
      size code, so the 28F128J means that it belongs to a Strata Flash line
which is CFI comliant,
 	while 28F128B belongs to the Fast Boot Block Flash line, which is
really a pre-CFI,
	and the CFI code wont work.

A totally unrelated issue: 
 I need to edit the redboot partition table from linux.
 How should I reread it? Removing and loading the modules, doesn't seem like
a nice solution,
 especially since the root fs is on flash.
 Should I try and add ioctl to the mtdchar/block code, so it would work like
when you use fdisk?

Kreso

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tue, August 21, 2001 9:33 AM
To: Ashok M Padmanaban
Cc: MTD for Linux; JFFS mailing list
Subject: Re: Erase Sector Size 



ashokmp@sasken.com said:
>  Iam using intels 28F128 Strata flash, According to its data sheet its
> erase sector size is 128KB. But with 2.4.2 kernel + rmk2 (patch,diff)
> + mtd patch , the erase sector size is 256KB.

It's not configurable. You probably have two 16-bit devices arranged in a 
pair to give a 32-bit data path - which doubles the effective erase size 
because it doesn't make sense to erase one half at a time.

We just need to fix JFFS2 so it isn't so greedy.

--
dwmw2



To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
the body of a message to majordomo@axis.com


------_=_NextPart_000_01C12A35.B219C0B0
Content-Type: application/octet-stream;
	name="mtd-cvs-2001-08-19-intel_bb.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mtd-cvs-2001-08-19-intel_bb.patch"

diff -urN mtd-cvs-2001-08-19/drivers/mtd/chips/Config.in =
mtd/drivers/mtd/chips/Config.in=0A=
--- mtd-cvs-2001-08-19/drivers/mtd/chips/Config.in	Sun Aug 19 08:28:51 =
2001=0A=
+++ mtd/drivers/mtd/chips/Config.in	Sun Aug 19 18:47:32 2001=0A=
@@ -32,6 +32,7 @@=0A=
 dep_tristate '    CFI support for Intel/Sharp Basic/Extended Commands' =
CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_CFI=0A=
 dep_tristate '    CFI support for AMD/Fujitsu Standard Commands' =
CONFIG_MTD_CFI_AMDSTD $CONFIG_MTD_CFI=0A=
 dep_tristate '  AMD compatible flash chip support (non-CFI)' =
CONFIG_MTD_AMDSTD $CONFIG_MTD=0A=
+dep_tristate '  Intel Fast Boot Block chip support (non-CFI)' =
CONFIG_MTD_INTELBB $CONFIG_MTD=0A=
 dep_tristate '  pre-CFI Sharp chip support' CONFIG_MTD_SHARP =
$CONFIG_MTD=0A=
 dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM =
$CONFIG_MTD=0A=
 dep_tristate '  Support for ROM chips in bus mapping' CONFIG_MTD_ROM =
$CONFIG_MTD=0A=
diff -urN mtd-cvs-2001-08-19/drivers/mtd/chips/Makefile =
mtd/drivers/mtd/chips/Makefile=0A=
--- mtd-cvs-2001-08-19/drivers/mtd/chips/Makefile	Sun Aug 19 08:28:51 =
2001=0A=
+++ mtd/drivers/mtd/chips/Makefile	Sun Aug 19 18:47:06 2001=0A=
@@ -15,6 +15,7 @@=0A=
 # the CFI command set drivers are linked before cfi_probe.o=0A=
 =0A=
 obj-$(CONFIG_MTD)		+=3D chipreg.o=0A=
+obj-$(CONFIG_MTD_INTELBB)	+=3D intel_bb.o =0A=
 obj-$(CONFIG_MTD_AMDSTD)	+=3D amd_flash.o =0A=
 obj-$(CONFIG_MTD_CFI)		+=3D cfi_probe.o cfi_jedec.o=0A=
 obj-$(CONFIG_MTD_CFI_AMDSTD)	+=3D cfi_cmdset_0002.o=0A=
diff -urN mtd-cvs-2001-08-19/drivers/mtd/chips/intel_bb.c =
mtd/drivers/mtd/chips/intel_bb.c=0A=
--- mtd-cvs-2001-08-19/drivers/mtd/chips/intel_bb.c	Thu Jan  1 02:00:00 =
1970=0A=
+++ mtd/drivers/mtd/chips/intel_bb.c	Sun Aug 19 18:42:47 2001=0A=
@@ -0,0 +1,1201 @@=0A=
+/*=0A=
+ * MTD map driver for the old Intel Advanced BootBlock TE28F*B3 =
pre-CFI series=0A=
+ *=0A=
+ * Author: Alex Kremer <alex.kremer@intel.com>=0A=
+ *=0A=
+ * Code based on Jonas Holmberg's AMD code=0A=
+ *=0A=
+ * $Id$=0A=
+ *=0A=
+ * Copyright (c) 2001 Intel Co.=0A=
+ *=0A=
+ * This file is under GPL.=0A=
+ *=0A=
+ */=0A=
+=0A=
+#include <linux/module.h>=0A=
+#include <linux/types.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/sched.h>=0A=
+#include <linux/errno.h>=0A=
+#include <linux/slab.h>=0A=
+#include <linux/delay.h>=0A=
+#include <linux/interrupt.h>=0A=
+#include <linux/mtd/map.h>=0A=
+#include <linux/mtd/mtd.h>=0A=
+#include <linux/mtd/flashchip.h>=0A=
+=0A=
+/* There's no limit. It exists only to avoid realloc. */=0A=
+#define MAX_BB_CHIPS 4=0A=
+=0A=
+/* flash addressing type */=0A=
+#define DEVICE_ADDRTYPE_x8	 (8 / 8)=0A=
+#define DEVICE_ADDRTYPE_x16	(16 / 8)=0A=
+#define DEVICE_ADDRTYPE_x32	(32 / 8)=0A=
+=0A=
+/* Addresses */=0A=
+#define ADDR_DEVICE_MFR		0x0000=0A=
+#define ADDR_DEVICE_ID		0x0001=0A=
+=0A=
+#define ADDR_DEVICE_GEN_CMD	0x0000  /* for general commands,=0A=
+					   any addr would do,=0A=
+					   for erase, erase-confirm=0A=
+					   use any addr within the block */=0A=
+=0A=
+=0A=
+/* Commands */=0A=
+#define CMD_READ_ARRAY		0xFF /* to any address */=0A=
+#define CMD_PROGRAM_SETUP	0x40 /* followed by addr/data */=0A=
+#define CMD_ERASE_SETUP		0x20 /* to the address within the block */=0A=
+#define CMD_RESUME		0xD0=0A=
+#define CMD_ERASE_CONFIRM	0xD0 /* to the address within the block =
*/=0A=
+#define CMD_SUSPEND		0xB0 /* suspends both program and erase ops */=0A=
+#define CMD_READ_STATUS		0x70 /* automatically after program or erase =
*/=0A=
+#define CMD_CLEAR_STATUS	0x50 =0A=
+#define CMD_READ_ID		0x90 =0A=
+=0A=
+/* status register bits */=0A=
+#define SR_READY		(1<<7)  /* write state machine status: 1-ready =
0-busy */=0A=
+#define SR_ERASE_SUSPENDED	(1<<6)	/* erase was suspended, can resume =
*/=0A=
+#define SR_ERASE_FAILED   	(1<<5)	/* erase op failed */=0A=
+#define SR_PROGRAM_FAILED	(1<<4)	/* program has failed */=0A=
+#define SR_VPP			(1<<3)	/* Vpp state  */=0A=
+#define SR_PROGRAM_SUSPENDED	(1<<2)	/* program was suspended, can =
resume */=0A=
+#define SR_BLOCK_LOCKED		(1<<1)	/* program/erase on locked block =
attempted */=0A=
+#define SR_RESERVED		(1<<0)	/* bah! */=0A=
+=0A=
+=0A=
+=0A=
+=0A=
+/* all the in the advanced boot block series */=0A=
+#define MFR_INTEL	0x0089=0A=
+=0A=
+#define TE28F004B3_TOP		0x00D4=0A=
+#define TE28F004B3_BOTTOM	0x00D5=0A=
+=0A=
+#define TE28F400B3_TOP		0x8894=0A=
+#define TE28F400B3_BOTTOM	0x8895=0A=
+=0A=
+#define TE28F008B3_TOP		0x00D2=0A=
+#define TE28F008B3_BOTTOM	0x00D3=0A=
+=0A=
+#define TE28F016B3_TOP		0x00D0=0A=
+#define TE28F016B3_BOTTOM	0x00D1=0A=
+=0A=
+#define TE28F160B3_TOP		0x8890=0A=
+#define TE28F160B3_BOTTOM	0x8891=0A=
+=0A=
+#define TE28F320B3_TOP		0x8896=0A=
+#define TE28F320B3_BOTTOM	0x8897=0A=
+=0A=
+#define TE28F640B3_TOP		0x8898=0A=
+#define TE28F640B3_BOTTOM	0x8899=0A=
+=0A=
+=0A=
+struct bb_flash_chip_info {=0A=
+      const __u16 mfr_id;=0A=
+      const __u16 dev_id;=0A=
+      const int  device_addrtype;=0A=
+      const char *name;=0A=
+      const u_long size; /* in bytes */=0A=
+=0A=
+#define MAX_ERASEREGIONS 4     =0A=
+      const int numeraseregions;=0A=
+      const struct mtd_erase_region_info regions[MAX_ERASEREGIONS];=0A=
+};=0A=
+=0A=
+=0A=
+=0A=
+struct bb_flash_private {=0A=
+=0A=
+      int interleave;=0A=
+      unsigned long chipshift;=0A=
+      int device_addrtype;=0A=
+      =0A=
+      int numchips;=0A=
+      struct flchip chips[0];=0A=
+};=0A=
+=0A=
+=0A=
+static int bb_flash_read(struct mtd_info *, loff_t, size_t, size_t =
*,=0A=
+			 u_char *);=0A=
+static int bb_flash_write(struct mtd_info *, loff_t, size_t, size_t =
*,=0A=
+			  const u_char *);=0A=
+static int bb_flash_erase(struct mtd_info *, struct erase_info *);=0A=
+static void bb_flash_sync(struct mtd_info *);=0A=
+static int bb_flash_suspend(struct mtd_info *);=0A=
+static void bb_flash_resume(struct mtd_info *);=0A=
+static void bb_flash_destroy(struct mtd_info *);=0A=
+static struct mtd_info *bb_flash_probe(struct map_info *map);=0A=
+=0A=
+=0A=
+static struct mtd_chip_driver bb_flash_chipdrv =3D {=0A=
+      probe: bb_flash_probe,=0A=
+      destroy: bb_flash_destroy,=0A=
+      name: "intel_bb_flash",=0A=
+      module: THIS_MODULE=0A=
+};=0A=
+=0A=
+static const char im_name[] =3D "bb_flash";=0A=
+=0A=
+static inline void dump_bits(__u32 w, int bn) {=0A=
+      int i;=0A=
+      for (i=3D0; i<bn; i++)=0A=
+	    printk(" %02d=3D%d ", i, ((w>>i)&1));=0A=
+      printk("\n");=0A=
+}=0A=
+=0A=
+=0A=
+static inline __u32 wide_read(struct map_info *map, __u32 addr)=0A=
+{=0A=
+      if (map->buswidth =3D=3D 1) {=0A=
+	    return map->read8(map, addr);=0A=
+      } else if (map->buswidth =3D=3D 2) {=0A=
+	    return map->read16(map, addr);=0A=
+      } else if (map->buswidth =3D=3D 4) {=0A=
+	    return map->read32(map, addr);=0A=
+      }=0A=
+=0A=
+      return 0;=0A=
+}=0A=
+=0A=
+static inline void wide_write(struct map_info *map, __u32 val, __u32 =
addr)=0A=
+{=0A=
+      if (map->buswidth =3D=3D 1) {=0A=
+	    map->write8(map, val, addr);=0A=
+      } else if (map->buswidth =3D=3D 2) {=0A=
+	    map->write16(map, val, addr);=0A=
+      } else if (map->buswidth =3D=3D 4) {=0A=
+	    map->write32(map, val, addr);=0A=
+      }=0A=
+}=0A=
+=0A=
+static inline __u32 make_cmd(struct map_info *map, __u32 cmd)=0A=
+{=0A=
+      const struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      if ((private->interleave =3D=3D 2) &&=0A=
+	  (private->device_addrtype =3D=3D DEVICE_ADDRTYPE_x16)) {=0A=
+	    cmd |=3D (cmd << 16);=0A=
+      }=0A=
+=0A=
+      return cmd;=0A=
+}=0A=
+=0A=
+#if 0=0A=
+static inline void send_unlock(struct map_info *map, unsigned long =
base)=0A=
+{=0A=
+      wide_write(map, (CMD_UNLOCK_DATA_1 << 16) | =
CMD_UNLOCK_DATA_1,=0A=
+		 base + (map->buswidth * ADDR_UNLOCK_1));=0A=
+      wide_write(map, (CMD_UNLOCK_DATA_2 << 16) | =
CMD_UNLOCK_DATA_2,=0A=
+		 base + (map->buswidth * ADDR_UNLOCK_2));=0A=
+}=0A=
+#endif=0A=
+=0A=
+static inline void send_cmd(struct map_info *map, unsigned long base, =
__u32 cmd)=0A=
+{=0A=
+      //send_unlock(map, base);=0A=
+      wide_write(map, make_cmd(map, cmd), base);=0A=
+}=0A=
+=0A=
+static inline void send_cmd_to_addr(struct map_info *map, unsigned =
long base,=0A=
+				    __u32 cmd, unsigned long addr)=0A=
+{=0A=
+      //send_unlock(map, base);=0A=
+      wide_write(map, make_cmd(map, cmd), base + addr);=0A=
+}=0A=
+=0A=
+static inline int check_SR(struct map_info *map, unsigned long base, =
__u32 bits)=0A=
+{=0A=
+      return (wide_read(map, base) & bits);=0A=
+}=0A=
+=0A=
+static inline int flash_is_busy(struct map_info *map, unsigned long =
base,=0A=
+				int interleave)=0A=
+{=0A=
+      return !check_SR(map, base, SR_READY);=0A=
+}=0A=
+=0A=
+=0A=
+/*=0A=
+ * Reads JEDEC manufacturer ID and device ID and returns the index of =
the first=0A=
+ * matching table =3D table entry (-1 if not found or alias for =
already found chip).=0A=
+ */ =0A=
+static int probe_new_chip(struct mtd_info *mtd, __u32 base,=0A=
+			  struct flchip *chips,=0A=
+			  struct bb_flash_private *private,=0A=
+			  struct bb_flash_chip_info *table)=0A=
+{=0A=
+      __u32 mfr_id;=0A=
+      __u32 dev_id;=0A=
+      struct map_info *map =3D mtd->priv;=0A=
+      struct bb_flash_private temp;=0A=
+      int i;=0A=
+=0A=
+      printk("probing a new chip at 0x%ux\n", base);=0A=
+      =0A=
+      temp.interleave =3D 2;=0A=
+      map->fldrv_priv =3D &temp;=0A=
+=0A=
+      /* Enter autoselect mode. */=0A=
+      send_cmd(map, base, CMD_CLEAR_STATUS);=0A=
+      send_cmd(map, base, CMD_READ_ID);=0A=
+=0A=
+      printk("after command\n");=0A=
+      =0A=
+      mfr_id =3D wide_read(map, base + (map->buswidth * =
ADDR_DEVICE_MFR));=0A=
+      dev_id =3D wide_read(map, base + (map->buswidth * =
ADDR_DEVICE_ID));=0A=
+=0A=
+      if ((map->buswidth =3D=3D 4) && ((mfr_id >> 16) =3D=3D (mfr_id & =
0xffff)) &&=0A=
+	  ((dev_id >> 16) =3D=3D (dev_id & 0xffff))) {=0A=
+	    mfr_id &=3D 0xffff;=0A=
+	    dev_id &=3D 0xffff;=0A=
+      } else {=0A=
+	    temp.interleave =3D 1;=0A=
+      }=0A=
+=0A=
+      printk("after determining interleave\n");=0A=
+=0A=
+      =0A=
+      for (i =3D 0; table[i].name; i++) {=0A=
+	    printk("testing chips: is it [%d] %s?\n", i, table[i].name);=0A=
+	    if ((mfr_id =3D=3D table[i].mfr_id) &&=0A=
+		(dev_id =3D=3D table[i].dev_id)) {=0A=
+		  if (private->numchips) {=0A=
+#if 0=0A=
+			int j;=0A=
+=0A=
+				/* Is this an alias for an already found chip?=0A=
+				 * In that case that chip should be in=0A=
+				 * autoselect mode now.=0A=
+				 */=0A=
+=0A=
+			for (j =3D 0; j < private->numchips; j++) {=0A=
+			      __u32 mfr_id_other;=0A=
+			      __u32 dev_id_other;=0A=
+=0A=
+			      mfr_id_other =3D=0A=
+				    wide_read(map, private->chips[j].start +=0A=
+					      (map->buswidth *=0A=
+					       ADDR_DEVICE_MFR=0A=
+					       ));=0A=
+			      dev_id_other =3D=0A=
+				    wide_read(map, private->chips[j].start +=0A=
+					      (map->buswidth *=0A=
+					       ADDR_DEVICE_ID));=0A=
+			      if (temp.interleave =3D=3D 2) {=0A=
+				    mfr_id_other &=3D 0xffff;=0A=
+				    dev_id_other &=3D 0xffff;=0A=
+			      }=0A=
+			      if ((mfr_id_other =3D=3D mfr_id) &&=0A=
+				  (dev_id_other =3D=3D dev_id)) {=0A=
+=0A=
+				    /* Exit autoselect mode. */=0A=
+				    send_cmd(map, base,=0A=
+					     CMD_READ_ARRAY);=0A=
+=0A=
+				    return -1;=0A=
+			      }=0A=
+			}=0A=
+#endif=0A=
+			=0A=
+			if (private->numchips =3D=3D MAX_BB_CHIPS) {=0A=
+			      printk(KERN_WARNING=0A=
+				     "%s: Too many flash chips "=0A=
+				     "detected. Increase "=0A=
+				     "MAX_BB_CHIPS from %d.\n",=0A=
+				     map->name, MAX_BB_CHIPS);=0A=
+=0A=
+			      return -1;=0A=
+			}=0A=
+=0A=
+			chips[private->numchips].start =3D base;=0A=
+			chips[private->numchips].state =3D FL_READY;=0A=
+			chips[private->numchips].mutex =3D =
&chips[private->numchips]._spinlock;=0A=
+			private->numchips++;=0A=
+		  }=0A=
+=0A=
+		  printk("%s: Found %d x %ldMiB %s at 0x%x -- %d chips found so =
far\n",=0A=
+			 map->name,=0A=
+			 temp.interleave, (table[i].size)/(1024*1024),=0A=
+			 table[i].name, base,=0A=
+			 private->numchips);=0A=
+=0A=
+		  mtd->size +=3D table[i].size * temp.interleave;=0A=
+		  mtd->numeraseregions +=3D table[i].numeraseregions;=0A=
+=0A=
+		  printk("that's it\n");=0A=
+		  =0A=
+		  break;=0A=
+	    }=0A=
+      }=0A=
+=0A=
+      printk("finished scanning for chip type\n");=0A=
+      =0A=
+      /* Exit autoselect mode. */=0A=
+      send_cmd(map, base, CMD_READ_ARRAY);=0A=
+=0A=
+      if (!(table[i].name)) {=0A=
+	    printk(KERN_DEBUG "%s: unknown flash device at 0x%x, "=0A=
+		   "mfr id 0x%x, dev id 0x%x\n", map->name,=0A=
+		   base, mfr_id, dev_id);=0A=
+	    map->fldrv_priv =3D NULL;=0A=
+=0A=
+	    return -1;=0A=
+      }=0A=
+=0A=
+      printk("ok my job is finished\n");=0A=
+      =0A=
+      private->device_addrtype =3D table[i].device_addrtype;=0A=
+      private->interleave =3D temp.interleave;=0A=
+=0A=
+      return i;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static struct mtd_info *bb_flash_probe(struct map_info *map)=0A=
+{=0A=
+      /* Keep this table on the stack so that it gets deallocated =
after the=0A=
+       * probe is done.=0A=
+	 */=0A=
+=0A=
+=0A=
+      struct bb_flash_chip_info table[] =3D {=0A=
+	    /* need to fill in the others */=0A=
+	    =0A=
+	    =0A=
+#define expandID(id) mfr_id: MFR_INTEL, dev_id: id, name: "Intel " =
#id=0A=
+#define expandADDRTYPE(t) device_addrtype: DEVICE_ADDRTYPE_ ## t=0A=
+	    =0A=
+	    =0A=
+	    { expandID(TE28F320B3_TOP),=0A=
+	      expandADDRTYPE(x16),=0A=
+	      size: 0x0400000, /* 4MB in bytes */=0A=
+	      numeraseregions: 2,=0A=
+	      regions: {=0A=
+		    [0] =3D { offset: 0x000000, erasesize: 0x10000, numblocks: 63 =
},=0A=
+		    [1] =3D { offset: 0x1F8000, erasesize: 0x02000, numblocks:  8 =
},=0A=
+	      }=0A=
+	    },=0A=
+	    =0A=
+	    { expandID(TE28F320B3_BOTTOM),=0A=
+	      expandADDRTYPE(x16),=0A=
+	      size: 0x0400000, /* 4MB in bytes */=0A=
+	      numeraseregions: 2,=0A=
+	      regions: {=0A=
+		    [0] =3D { offset: 0x000000, erasesize: 0x02000, numblocks:  8 =
},=0A=
+		    [1] =3D { offset: 0x008000, erasesize: 0x10000, numblocks: 63 =
},=0A=
+	      }=0A=
+	    },=0A=
+	    =0A=
+	    { 0 },=0A=
+      };	    =0A=
+      =0A=
+      struct mtd_info *mtd;=0A=
+=0A=
+      struct bb_flash_private temp;=0A=
+      struct bb_flash_private *private;=0A=
+      =0A=
+      u_long size;=0A=
+      unsigned long base;=0A=
+      int i, table_pos[MAX_BB_CHIPS];=0A=
+      struct flchip chips[MAX_BB_CHIPS];=0A=
+      int reg_idx;=0A=
+      int offset;=0A=
+=0A=
+      printk("Probing flash\n");=0A=
+      =0A=
+      mtd =3D (struct mtd_info*)kmalloc(sizeof(*mtd), GFP_KERNEL);=0A=
+      if (!mtd) {=0A=
+	    printk(KERN_WARNING=0A=
+		   "%s: kmalloc failed for info structure\n", map->name);=0A=
+	    return NULL;=0A=
+      }=0A=
+      memset(mtd, 0, sizeof(*mtd));=0A=
+      mtd->priv =3D map;=0A=
+=0A=
+      memset(&temp, 0, sizeof(temp));=0A=
+      printk("%s: Probing for BB compatible flash...\n", =
map->name);=0A=
+=0A=
+      if ((table_pos[0] =3D probe_new_chip(mtd, 0, NULL, &temp, =
table))=0A=
+	  =3D=3D -1) {=0A=
+	    printk(KERN_WARNING=0A=
+	     "%s: Found no BB compatible device at location zero\n",=0A=
+	     map->name);=0A=
+	    kfree(mtd);=0A=
+	    =0A=
+	    return NULL;=0A=
+      }=0A=
+=0A=
+      printk("one chip found at base 0\n");=0A=
+      =0A=
+      chips[0].start =3D 0;=0A=
+      chips[0].state =3D FL_READY;=0A=
+      chips[0].mutex =3D &chips[0]._spinlock;=0A=
+      temp.numchips =3D 1;=0A=
+=0A=
+      =0A=
+      for (size =3D mtd->size; size > 1; size >>=3D 1) {=0A=
+	    temp.chipshift++;=0A=
+      }=0A=
+      switch (temp.interleave) {=0A=
+	 case 2:=0A=
+	       temp.chipshift +=3D 1;=0A=
+	       break;=0A=
+	 case 4:=0A=
+	       temp.chipshift +=3D 2;=0A=
+	       break;=0A=
+      }=0A=
+=0A=
+=0A=
+      printk("before scanning the rest of the ROM space for =
chips\n");=0A=
+      /* Find out if there are any more chips in the map. */=0A=
+      for (base =3D (1 << temp.chipshift);=0A=
+	   base < map->size;=0A=
+	   base +=3D (1 << temp.chipshift)) {=0A=
+	    int numchips =3D temp.numchips;=0A=
+	    printk("scanning at %lux, numchip so far is %d\n", base, =
numchips);=0A=
+	    table_pos[numchips] =3D probe_new_chip(mtd, base, chips, &temp, =
table);=0A=
+      }=0A=
+=0A=
+=0A=
+      printk("finished scanning\n");=0A=
+      mtd->eraseregions =3D kmalloc(sizeof(struct =
mtd_erase_region_info) *=0A=
+				  mtd->numeraseregions, GFP_KERNEL);=0A=
+      if (!mtd->eraseregions) { =0A=
+	    printk(KERN_WARNING "%s: Failed to allocate "=0A=
+		   "memory for MTD erase region info\n", map->name);=0A=
+	    kfree(mtd);=0A=
+	    map->fldrv_priv =3D NULL;=0A=
+	    return 0;=0A=
+      }=0A=
+=0A=
+      printk("updating erase regions for chips mtd->numeraseregions =
=3D %d\n", mtd->numeraseregions);=0A=
+      =0A=
+      reg_idx =3D 0;=0A=
+      offset =3D 0;=0A=
+      for (i =3D 0; i < temp.numchips; i++) {=0A=
+	    int dev_size;=0A=
+	    int j;=0A=
+=0A=
+	    printk("dealing with chip number %d, offset =3D %d\n", i, =
offset);=0A=
+	    =0A=
+	    dev_size =3D 0;=0A=
+	    for (j =3D 0; j < table[table_pos[i]].numeraseregions; j++) {=0A=
+		  printk("reg_idx =3D %d, dealing with eraseregion %d of chip %d\n", =
reg_idx, j, i);=0A=
+		  =0A=
+		  mtd->eraseregions[reg_idx].offset =3D offset +=0A=
+			(table[table_pos[i]].regions[j].offset *=0A=
+			 temp.interleave);=0A=
+		  mtd->eraseregions[reg_idx].erasesize =3D=0A=
+			table[table_pos[i]].regions[j].erasesize *=0A=
+			temp.interleave;=0A=
+		  mtd->eraseregions[reg_idx].numblocks =3D=0A=
+			table[table_pos[i]].regions[j].numblocks;=0A=
+		  if (mtd->erasesize <=0A=
+		      mtd->eraseregions[reg_idx].erasesize) {=0A=
+			mtd->erasesize =3D=0A=
+			      mtd->eraseregions[reg_idx].erasesize;=0A=
+		  }=0A=
+		  dev_size +=3D mtd->eraseregions[reg_idx].erasesize *=0A=
+			mtd->eraseregions[reg_idx].numblocks;=0A=
+		  reg_idx++;=0A=
+	    }=0A=
+	    offset +=3D dev_size;=0A=
+      }=0A=
+=0A=
+      printk("finished with eraseregion bits\n");=0A=
+      =0A=
+      mtd->type =3D MTD_NORFLASH;=0A=
+      mtd->flags =3D MTD_CAP_NORFLASH;=0A=
+      mtd->name =3D map->name;=0A=
+      mtd->erase =3D bb_flash_erase;	=0A=
+      mtd->read =3D bb_flash_read;	=0A=
+      mtd->write =3D bb_flash_write;	=0A=
+      mtd->sync =3D bb_flash_sync;	=0A=
+      mtd->suspend =3D bb_flash_suspend;	=0A=
+      mtd->resume =3D bb_flash_resume;	=0A=
+=0A=
+      private =3D kmalloc(sizeof(*private) + (sizeof(struct flchip) * =
temp.numchips), GFP_KERNEL);=0A=
+      if (!private) {=0A=
+	    printk(KERN_WARNING=0A=
+		   "%s: kmalloc failed for private structure\n", map->name);=0A=
+	    kfree(mtd->eraseregions);=0A=
+	    kfree(mtd);=0A=
+	    map->fldrv_priv =3D NULL;=0A=
+	    return NULL;=0A=
+      }=0A=
+      memcpy(private, &temp, sizeof(temp));=0A=
+      memcpy(private->chips, chips, sizeof(struct flchip) * =
private->numchips);=0A=
+=0A=
+      for (i =3D 0; i < private->numchips; i++) {=0A=
+	    init_waitqueue_head(&private->chips[i].wq);=0A=
+	    spin_lock_init(&private->chips[i]._spinlock);=0A=
+      }=0A=
+=0A=
+      map->fldrv_priv =3D private;=0A=
+=0A=
+      map->fldrv =3D &bb_flash_chipdrv;=0A=
+=0A=
+      MOD_INC_USE_COUNT;=0A=
+=0A=
+      printk("FLASH: found %d chips, interleave =3D %d,"=0A=
+	     "chipshift =3D %lu, device_addrtype =3D %u\n, =
erasesize=3D%d",=0A=
+	     private->numchips, private->interleave,=0A=
+	     private->chipshift, private->device_addrtype*8, =
mtd->erasesize);=0A=
+	     =0A=
+=0A=
+      return mtd;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static inline int read_one_chip(struct map_info *map, struct flchip =
*chip,=0A=
+				loff_t adr, size_t len, u_char *buf)=0A=
+{=0A=
+      DECLARE_WAITQUEUE(wait, current);=0A=
+      unsigned long timeo =3D jiffies + HZ;=0A=
+=0A=
+      send_cmd(map, chip->start, CMD_READ_ARRAY);=0A=
+      =0A=
+ retry:=0A=
+      spin_lock_bh(chip->mutex);=0A=
+=0A=
+      if (chip->state !=3D FL_READY){=0A=
+	    printk(KERN_INFO "%s: waiting for chip to read, state =3D =
%d\n",=0A=
+		   map->name, chip->state);=0A=
+	    set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+	    add_wait_queue(&chip->wq, &wait);=0A=
+                =0A=
+	    spin_unlock_bh(chip->mutex);=0A=
+=0A=
+	    schedule();=0A=
+	    remove_wait_queue(&chip->wq, &wait);=0A=
+=0A=
+	    if(signal_pending(current)) {=0A=
+		  return -EINTR;=0A=
+	    }=0A=
+=0A=
+	    timeo =3D jiffies + HZ;=0A=
+=0A=
+	    goto retry;=0A=
+      }	=0A=
+=0A=
+      adr +=3D chip->start;=0A=
+=0A=
+      chip->state =3D FL_READY;=0A=
+=0A=
+      map->copy_from(map, buf, adr, len);=0A=
+=0A=
+      wake_up(&chip->wq);=0A=
+      spin_unlock_bh(chip->mutex);=0A=
+=0A=
+      return 0;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static int bb_flash_read(struct mtd_info *mtd, loff_t from, size_t =
len,=0A=
+			 size_t *retlen, u_char *buf)=0A=
+{=0A=
+      struct map_info *map =3D mtd->priv;=0A=
+      struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      unsigned long ofs;=0A=
+      int chipnum;=0A=
+      int ret =3D 0;=0A=
+=0A=
+      if ((from + len) > mtd->size) {=0A=
+	    printk(KERN_WARNING "%s: read request past end of device "=0A=
+		   "(0x%lx)\n", map->name, (unsigned long)from + len);=0A=
+=0A=
+	    return -EINVAL;=0A=
+      }=0A=
+=0A=
+      /* Offset within the first chip that the first read should =
start. */=0A=
+      chipnum =3D (from >> private->chipshift);=0A=
+      ofs =3D from - (chipnum <<  private->chipshift);=0A=
+=0A=
+      *retlen =3D 0;=0A=
+=0A=
+      while (len) {=0A=
+	    unsigned long this_len;=0A=
+=0A=
+	    if (chipnum >=3D private->numchips) {=0A=
+		  break;=0A=
+	    }=0A=
+=0A=
+	    if ((len + ofs - 1) >> private->chipshift) {=0A=
+		  this_len =3D (1 << private->chipshift) - ofs;=0A=
+	    } else {=0A=
+		  this_len =3D len;=0A=
+	    }=0A=
+=0A=
+	    ret =3D read_one_chip(map, &private->chips[chipnum], ofs,=0A=
+				this_len, buf);=0A=
+	    if (ret) {=0A=
+		  break;=0A=
+	    }=0A=
+=0A=
+	    *retlen +=3D this_len;=0A=
+	    len -=3D this_len;=0A=
+	    buf +=3D this_len;=0A=
+=0A=
+	    ofs =3D 0;=0A=
+	    chipnum++;=0A=
+      }=0A=
+=0A=
+      return ret;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static int write_one_word(struct map_info *map, struct flchip =
*chip,=0A=
+			  unsigned long adr, __u32 datum)=0A=
+{=0A=
+      unsigned long timeo =3D jiffies + HZ;=0A=
+      struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      DECLARE_WAITQUEUE(wait, current);=0A=
+      int ret =3D 0;=0A=
+      int times_left;=0A=
+=0A=
+#if 0      =0A=
+      if (((adr + chip->start ) % 1024) < 4)=0A=
+	    printk("attempt to write 0x%x at 0x%lx\n", datum, adr + =
chip->start);=0A=
+      return 0;=0A=
+#endif      =0A=
+      =0A=
+ retry:=0A=
+      spin_lock_bh(chip->mutex);=0A=
+=0A=
+      if (chip->state !=3D FL_READY){=0A=
+	    printk("%s: waiting for chip to write, state =3D %d\n",=0A=
+		   map->name, chip->state);=0A=
+	    set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+	    add_wait_queue(&chip->wq, &wait);=0A=
+                =0A=
+	    spin_unlock_bh(chip->mutex);=0A=
+=0A=
+	    schedule();=0A=
+	    remove_wait_queue(&chip->wq, &wait);=0A=
+	    printk(KERN_INFO "%s: woke up to write\n", map->name);=0A=
+	    if(signal_pending(current))=0A=
+		  return -EINTR;=0A=
+=0A=
+	    timeo =3D jiffies + HZ;=0A=
+=0A=
+	    goto retry;=0A=
+      }	=0A=
+=0A=
+      chip->state =3D FL_WRITING;=0A=
+=0A=
+      adr +=3D chip->start;=0A=
+      ENABLE_VPP(map);=0A=
+      send_cmd(map, chip->start, CMD_PROGRAM_SETUP);=0A=
+      wide_write(map, datum, adr);=0A=
+=0A=
+      times_left =3D 500000;=0A=
+      while (times_left-- && flash_is_busy(map, chip->start,=0A=
+					   private->interleave)) {=0A=
+	    if (current->need_resched) {=0A=
+		  spin_unlock_bh(chip->mutex);=0A=
+		  schedule();=0A=
+		  spin_lock_bh(chip->mutex);=0A=
+	    }=0A=
+      }=0A=
+      =0A=
+      DISABLE_VPP(map);=0A=
+      =0A=
+      if (!times_left) {=0A=
+	    printk(KERN_WARNING "%s: write to 0x%lx timed out!\n",=0A=
+		   map->name, adr);=0A=
+	    ret =3D -EIO;=0A=
+      } else {=0A=
+#if 0	    =0A=
+	    __u32 verify;=0A=
+=0A=
+	    send_cmd(map, chip->start, CMD_READ_ARRAY);=0A=
+	    if ((verify =3D wide_read(map, adr)) !=3D datum) {=0A=
+		  printk(KERN_WARNING "%s: write to 0x%lx failed. "=0A=
+			 "datum =3D %x, verify =3D %x\n",=0A=
+			 map->name, adr, datum, verify);=0A=
+		  ret =3D -EIO;=0A=
+	    } else {=0A=
+		  printk("wrote %d at 0x%lx: success\n", datum, adr);=0A=
+	    }=0A=
+#endif	    =0A=
+      }=0A=
+=0A=
+=0A=
+      chip->state =3D FL_READY;=0A=
+      wake_up(&chip->wq);=0A=
+      spin_unlock_bh(chip->mutex);=0A=
+=0A=
+      return ret;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static int bb_flash_write(struct mtd_info *mtd, loff_t to , size_t =
len,=0A=
+			  size_t *retlen, const u_char *buf)=0A=
+{=0A=
+      struct map_info *map =3D mtd->priv;=0A=
+      struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      int ret =3D 0;=0A=
+      int chipnum;=0A=
+      unsigned long ofs;=0A=
+      unsigned long chipstart;=0A=
+=0A=
+      *retlen =3D 0;=0A=
+      if (!len) {=0A=
+	    return 0;=0A=
+      }=0A=
+=0A=
+      chipnum =3D to >> private->chipshift;=0A=
+      ofs =3D to  - (chipnum << private->chipshift);=0A=
+      chipstart =3D private->chips[chipnum].start;=0A=
+=0A=
+      /* If it's not bus-aligned, do the first byte write. */=0A=
+      if (ofs & (map->buswidth - 1)) {=0A=
+	    unsigned long bus_ofs =3D ofs & ~(map->buswidth - 1);=0A=
+	    int i =3D ofs - bus_ofs;=0A=
+	    int n =3D 0;=0A=
+	    u_char tmp_buf[4];=0A=
+	    __u32 datum;=0A=
+=0A=
+	    map->copy_from(map, tmp_buf,=0A=
+			   bus_ofs + private->chips[chipnum].start,=0A=
+			   map->buswidth);=0A=
+	    while (len && i < map->buswidth)=0A=
+		  tmp_buf[i++] =3D buf[n++], len--;=0A=
+=0A=
+	    if (map->buswidth =3D=3D 2) {=0A=
+		  datum =3D *(__u16*)tmp_buf;=0A=
+	    } else if (map->buswidth =3D=3D 4) {=0A=
+		  datum =3D *(__u32*)tmp_buf;=0A=
+	    } else {=0A=
+		  return -EINVAL;  /* should never happen, but be safe */=0A=
+	    }=0A=
+=0A=
+	    ret =3D write_one_word(map, &private->chips[chipnum], bus_ofs,=0A=
+				 datum);=0A=
+	    if (ret) {=0A=
+		  return ret;=0A=
+	    }=0A=
+		=0A=
+	    ofs +=3D n;=0A=
+	    buf +=3D n;=0A=
+	    (*retlen) +=3D n;=0A=
+=0A=
+	    if (ofs >> private->chipshift) {=0A=
+		  chipnum++;=0A=
+		  ofs =3D 0;=0A=
+		  if (chipnum =3D=3D private->numchips) {=0A=
+			return 0;=0A=
+		  }=0A=
+	    }=0A=
+      }=0A=
+	=0A=
+      /* We are now aligned, write as much as possible. */=0A=
+      while(len >=3D map->buswidth) {=0A=
+	    __u32 datum;=0A=
+=0A=
+	    if (map->buswidth =3D=3D 1) {=0A=
+		  datum =3D *(__u8*)buf;=0A=
+	    } else if (map->buswidth =3D=3D 2) {=0A=
+		  datum =3D *(__u16*)buf;=0A=
+	    } else if (map->buswidth =3D=3D 4) {=0A=
+		  datum =3D *(__u32*)buf;=0A=
+	    } else {=0A=
+		  return -EINVAL;=0A=
+	    }=0A=
+=0A=
+	    ret =3D write_one_word(map, &private->chips[chipnum], ofs, =
datum);=0A=
+=0A=
+	    if (ret) {=0A=
+		  return ret;=0A=
+	    }=0A=
+=0A=
+	    ofs +=3D map->buswidth;=0A=
+	    buf +=3D map->buswidth;=0A=
+	    (*retlen) +=3D map->buswidth;=0A=
+	    len -=3D map->buswidth;=0A=
+=0A=
+	    if (ofs >> private->chipshift) {=0A=
+		  chipnum++;=0A=
+		  ofs =3D 0;=0A=
+		  if (chipnum =3D=3D private->numchips) {=0A=
+			return 0;=0A=
+		  }=0A=
+		  chipstart =3D private->chips[chipnum].start;=0A=
+	    }=0A=
+      }=0A=
+=0A=
+      if (len & (map->buswidth - 1)) {=0A=
+	    int i =3D 0, n =3D 0;=0A=
+	    u_char tmp_buf[2];=0A=
+	    __u32 datum;=0A=
+=0A=
+	    map->copy_from(map, tmp_buf,=0A=
+			   ofs + private->chips[chipnum].start,=0A=
+			   map->buswidth);=0A=
+	    while (len--) {=0A=
+		  tmp_buf[i++] =3D buf[n++];=0A=
+	    }=0A=
+=0A=
+	    if (map->buswidth =3D=3D 2) {=0A=
+		  datum =3D *(__u16*)tmp_buf;=0A=
+	    } else if (map->buswidth =3D=3D 4) {=0A=
+		  datum =3D *(__u32*)tmp_buf;=0A=
+	    } else {=0A=
+		  return -EINVAL;  /* should never happen, but be safe */=0A=
+	    }=0A=
+=0A=
+	    ret =3D write_one_word(map, &private->chips[chipnum], ofs, =
datum);=0A=
+=0A=
+	    if (ret) {=0A=
+		  return ret;=0A=
+	    }=0A=
+		=0A=
+	    (*retlen) +=3D n;=0A=
+      }=0A=
+=0A=
+      return 0;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static inline int erase_one_block(struct map_info *map, struct flchip =
*chip,=0A=
+				  unsigned long adr, u_long size)=0A=
+{=0A=
+      unsigned long timeo =3D jiffies + HZ;=0A=
+      struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      DECLARE_WAITQUEUE(wait, current);=0A=
+=0A=
+      //printk("attempt to erase block at 0x%lx (size =3D %ld)\n", adr =
+ chip->start, size);=0A=
+      //return 0;=0A=
+      =0A=
+ retry:=0A=
+      spin_lock_bh(chip->mutex);=0A=
+=0A=
+      if (chip->state !=3D FL_READY){=0A=
+	    set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+	    add_wait_queue(&chip->wq, &wait);=0A=
+                =0A=
+	    spin_unlock_bh(chip->mutex);=0A=
+=0A=
+	    schedule();=0A=
+	    remove_wait_queue(&chip->wq, &wait);=0A=
+=0A=
+	    if (signal_pending(current)) {=0A=
+		  return -EINTR;=0A=
+	    }=0A=
+=0A=
+	    timeo =3D jiffies + HZ;=0A=
+=0A=
+	    goto retry;=0A=
+      }	=0A=
+=0A=
+      chip->state =3D FL_ERASING;=0A=
+=0A=
+      adr +=3D chip->start;=0A=
+      ENABLE_VPP(map);=0A=
+      send_cmd(map, chip->start, CMD_ERASE_SETUP);=0A=
+      send_cmd_to_addr(map, chip->start, CMD_ERASE_CONFIRM, adr);=0A=
+	=0A=
+      timeo =3D jiffies + (HZ * 5);=0A=
+=0A=
+      spin_unlock_bh(chip->mutex);=0A=
+      schedule_timeout(HZ);=0A=
+      spin_lock_bh(chip->mutex);=0A=
+	=0A=
+      while (flash_is_busy(map, chip->start, private->interleave)) =
{=0A=
+=0A=
+	    if (chip->state !=3D FL_ERASING) {=0A=
+		  /* Someone's suspended the erase. Sleep */=0A=
+		  set_current_state(TASK_UNINTERRUPTIBLE);=0A=
+		  add_wait_queue(&chip->wq, &wait);=0A=
+			=0A=
+		  spin_unlock_bh(chip->mutex);=0A=
+		  printk(KERN_INFO "%s: erase suspended. Sleeping\n",=0A=
+			 map->name);=0A=
+		  schedule();=0A=
+		  remove_wait_queue(&chip->wq, &wait);=0A=
+			=0A=
+		  if (signal_pending(current)) {=0A=
+			return -EINTR;=0A=
+		  }=0A=
+			=0A=
+		  timeo =3D jiffies + (HZ*2); /* FIXME */=0A=
+		  spin_lock_bh(chip->mutex);=0A=
+		  continue;=0A=
+	    }=0A=
+=0A=
+	    /* OK Still waiting */=0A=
+	    if (time_after(jiffies, timeo)) {=0A=
+		  chip->state =3D FL_READY;=0A=
+		  spin_unlock_bh(chip->mutex);=0A=
+		  printk(KERN_WARNING "%s: waiting for erase to complete "=0A=
+			 "timed out.\n", map->name);=0A=
+		  DISABLE_VPP(map);=0A=
+=0A=
+		  return -EIO;=0A=
+	    }=0A=
+		=0A=
+	    /* Latency issues. Drop the lock, wait a while and retry */=0A=
+	    spin_unlock_bh(chip->mutex);=0A=
+=0A=
+	    if (current->need_resched)=0A=
+		  schedule();=0A=
+	    else=0A=
+		  udelay(1);=0A=
+		=0A=
+	    spin_lock_bh(chip->mutex);=0A=
+      }=0A=
+=0A=
+      DISABLE_VPP(map);=0A=
+=0A=
+      send_cmd(map, chip->start, CMD_READ_ARRAY);=0A=
+      =0A=
+      /* Verify every single word */=0A=
+      {=0A=
+	    int address;=0A=
+	    int error =3D 0;=0A=
+	    __u16 verify;=0A=
+=0A=
+	    for (address =3D adr; address < (adr + size); address++) {=0A=
+		  if ((verify =3D map->read16(map, address)) !=3D 0xFFFF) {=0A=
+			error =3D 1;=0A=
+			break;=0A=
+		  }=0A=
+	    }=0A=
+	    if (error) {=0A=
+		  chip->state =3D FL_READY;=0A=
+		  spin_unlock_bh(chip->mutex);=0A=
+		  printk(KERN_WARNING=0A=
+			 "%s: verify error at 0x%x, size %ld.\n",=0A=
+			 map->name, address, size);=0A=
+		  DISABLE_VPP(map);=0A=
+=0A=
+		  return -EIO;=0A=
+	    } else {=0A=
+		  //printk("erased block at 0x%lx\n", adr);=0A=
+	    }=0A=
+      }=0A=
+	=0A=
+      chip->state =3D FL_READY;=0A=
+      wake_up(&chip->wq);=0A=
+      spin_unlock_bh(chip->mutex);=0A=
+=0A=
+      return 0;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static int bb_flash_erase(struct mtd_info *mtd, struct erase_info =
*instr)=0A=
+{=0A=
+      struct map_info *map =3D mtd->priv;=0A=
+      struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      unsigned long adr, len;=0A=
+      int chipnum;=0A=
+      int ret =3D 0;=0A=
+      int i;=0A=
+      int first;=0A=
+      struct mtd_erase_region_info *regions =3D mtd->eraseregions;=0A=
+=0A=
+      if (instr->addr > mtd->size) {=0A=
+	    return -EINVAL;=0A=
+      }=0A=
+=0A=
+      if ((instr->len + instr->addr) > mtd->size) {=0A=
+	    return -EINVAL;=0A=
+      }=0A=
+=0A=
+      /* Check that both start and end of the requested erase are=0A=
+       * aligned with the erasesize at the appropriate addresses.=0A=
+       */=0A=
+=0A=
+      i =3D 0;=0A=
+=0A=
+      /* Skip all erase regions which are ended before the start of=0A=
+	 the requested erase. Actually, to save on the calculations,=0A=
+	 we skip to the first erase region which starts after the=0A=
+	 start of the requested erase, and then go back one.=0A=
+      */=0A=
+=0A=
+      while ((i < mtd->numeraseregions) &&=0A=
+	     (instr->addr >=3D regions[i].offset)) {=0A=
+	    i++;=0A=
+      }=0A=
+      i--;=0A=
+=0A=
+      /* OK, now i is pointing at the erase region in which this=0A=
+       * erase request starts. Check the start of the requested=0A=
+       * erase range is aligned with the erase size which is in=0A=
+       * effect here.=0A=
+       */=0A=
+=0A=
+      if (instr->addr & (regions[i].erasesize-1)) {=0A=
+	    return -EINVAL;=0A=
+      }=0A=
+=0A=
+      /* Remember the erase region we start on. */=0A=
+=0A=
+      first =3D i;=0A=
+=0A=
+      /* Next, check that the end of the requested erase is aligned=0A=
+       * with the erase region at that address.=0A=
+       */=0A=
+=0A=
+      while ((i < mtd->numeraseregions) && =0A=
+	     ((instr->addr + instr->len) >=3D regions[i].offset)) {=0A=
+	    i++;=0A=
+      }=0A=
+=0A=
+      /* As before, drop back one to point at the region in which=0A=
+       * the address actually falls.=0A=
+       */=0A=
+=0A=
+      i--;=0A=
+=0A=
+      if ((instr->addr + instr->len) & (regions[i].erasesize-1)) {=0A=
+	    return -EINVAL;=0A=
+      }=0A=
+=0A=
+      chipnum =3D instr->addr >> private->chipshift;=0A=
+      adr =3D instr->addr - (chipnum << private->chipshift);=0A=
+      len =3D instr->len;=0A=
+=0A=
+      i =3D first;=0A=
+=0A=
+      while (len) {=0A=
+	    ret =3D erase_one_block(map, &private->chips[chipnum], adr,=0A=
+				  regions[i].erasesize);=0A=
+=0A=
+	    if (ret) {=0A=
+		  return ret;=0A=
+	    }=0A=
+=0A=
+	    adr +=3D regions[i].erasesize;=0A=
+	    len -=3D regions[i].erasesize;=0A=
+=0A=
+	    if ((adr % (1 << private->chipshift)) =3D=3D=0A=
+		((regions[i].offset + (regions[i].erasesize *=0A=
+				       regions[i].numblocks))=0A=
+		 % (1 << private->chipshift))) {=0A=
+		  i++;=0A=
+	    }=0A=
+=0A=
+	    if (adr >> private->chipshift) {=0A=
+		  adr =3D 0;=0A=
+		  chipnum++;=0A=
+		  if (chipnum >=3D private->numchips) {=0A=
+			break;=0A=
+		  }=0A=
+	    }=0A=
+      }=0A=
+		=0A=
+      instr->state =3D MTD_ERASE_DONE;=0A=
+      if (instr->callback) {=0A=
+	    instr->callback(instr);=0A=
+      }=0A=
+	=0A=
+      return 0;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static void bb_flash_sync(struct mtd_info *mtd)=0A=
+{=0A=
+      struct map_info *map =3D mtd->priv;=0A=
+      struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      int i;=0A=
+      struct flchip *chip;=0A=
+      int ret =3D 0;=0A=
+      DECLARE_WAITQUEUE(wait, current);=0A=
+=0A=
+      for (i =3D 0; !ret && (i < private->numchips); i++) {=0A=
+	    chip =3D &private->chips[i];=0A=
+=0A=
+       retry:=0A=
+	    spin_lock_bh(chip->mutex);=0A=
+=0A=
+	    switch(chip->state) {=0A=
+	       case FL_READY:=0A=
+	       case FL_STATUS:=0A=
+	       case FL_CFI_QUERY:=0A=
+	       case FL_JEDEC_QUERY:=0A=
+		     chip->oldstate =3D chip->state;=0A=
+		     chip->state =3D FL_SYNCING;=0A=
+		     /* No need to wake_up() on this state change - =0A=
+		      * as the whole point is that nobody can do anything=0A=
+		      * with the chip now anyway.=0A=
+		      */=0A=
+	       case FL_SYNCING:=0A=
+		     spin_unlock_bh(chip->mutex);=0A=
+		     break;=0A=
+=0A=
+	       default:=0A=
+		     /* Not an idle state */=0A=
+		     add_wait_queue(&chip->wq, &wait);=0A=
+			=0A=
+		     spin_unlock_bh(chip->mutex);=0A=
+=0A=
+		     schedule();=0A=
+=0A=
+		     remove_wait_queue(&chip->wq, &wait);=0A=
+			=0A=
+		     goto retry;=0A=
+	    }=0A=
+      }=0A=
+=0A=
+      /* Unlock the chips again */=0A=
+      for (i--; i >=3D 0; i--) {=0A=
+	    chip =3D &private->chips[i];=0A=
+=0A=
+	    spin_lock_bh(chip->mutex);=0A=
+		=0A=
+	    if (chip->state =3D=3D FL_SYNCING) {=0A=
+		  chip->state =3D chip->oldstate;=0A=
+		  wake_up(&chip->wq);=0A=
+	    }=0A=
+	    spin_unlock_bh(chip->mutex);=0A=
+      }=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static int bb_flash_suspend(struct mtd_info *mtd)=0A=
+{=0A=
+      printk("bb_flash_suspend(): not implemented!\n");=0A=
+      return -EINVAL;=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static void bb_flash_resume(struct mtd_info *mtd)=0A=
+{=0A=
+      printk("bb_flash_resume(): not implemented!\n");=0A=
+}=0A=
+=0A=
+=0A=
+=0A=
+static void bb_flash_destroy(struct mtd_info *mtd)=0A=
+{=0A=
+      struct map_info *map =3D mtd->priv;=0A=
+      struct bb_flash_private *private =3D map->fldrv_priv;=0A=
+      kfree(private);=0A=
+}=0A=
+=0A=
+int __init bb_flash_init(void)=0A=
+{=0A=
+      register_mtd_chip_driver(&bb_flash_chipdrv);=0A=
+      return 0;=0A=
+}=0A=
+=0A=
+void __exit bb_flash_exit(void)=0A=
+{=0A=
+      unregister_mtd_chip_driver(&bb_flash_chipdrv);=0A=
+}=0A=
+=0A=
+module_init(bb_flash_init);=0A=
+module_exit(bb_flash_exit);=0A=
diff -urN mtd-cvs-2001-08-19/drivers/mtd/maps/Config.in mtd/drivers/mtd/=
maps/Config.in=0A=
--- mtd-cvs-2001-08-19/drivers/mtd/maps/Config.in	Sun Aug 19 08:28:51 =
2001=0A=
+++ mtd/drivers/mtd/maps/Config.in	Sun Aug 19 18:55:23 2001=0A=
@@ -41,7 +41,7 @@=0A=
   dep_tristate '  CFI Flash device mapped on ARM Integrator/P720T' =
CONFIG_MTD_ARM_INTEGRATOR $CONFIG_MTD_CFI $CONFIG_ARM=0A=
   dep_tristate '  Cirrus CDB89712 evaluation board mappings' =
CONFIG_MTD_CDB89712 $CONFIG_MTD_CFI $CONFIG_ARCH_CDB89712=0A=
   dep_tristate '  CFI Flash device mapped on StrongARM SA11x0' =
CONFIG_MTD_SA1100 $CONFIG_MTD_CFI $CONFIG_ARCH_SA1100 =
$CONFIG_MTD_PARTITIONS=0A=
-  dep_tristate '  CFI Flash device mapped on DC21285 Footbridge' =
CONFIG_MTD_DC21285 $CONFIG_MTD_CFI $CONFIG_ARCH_FOOTBRIDGE =
$CONFIG_MTD_PARTITIONS=0A=
+  dep_tristate '  CFI Flash device mapped on DC21285 Footbridge' =
CONFIG_MTD_DC21285 $CONFIG_MTD_INTELBB $CONFIG_ARCH_FOOTBRIDGE =
$CONFIG_MTD_PARTITIONS=0A=
   dep_tristate '  CFI Flash device mapped on the XScale IQ80310 board' =
CONFIG_MTD_IQ80310 $CONFIG_MTD_CFI $CONFIG_XSCALE_IQ80310=0A=
 fi=0A=
 endmenu=0A=
diff -urN mtd-cvs-2001-08-19/drivers/mtd/maps/dc21285.c =
mtd/drivers/mtd/maps/dc21285.c=0A=
--- mtd-cvs-2001-08-19/drivers/mtd/maps/dc21285.c	Sat Jul 14 03:59:17 =
2001=0A=
+++ mtd/drivers/mtd/maps/dc21285.c	Sun Aug 19 18:41:12 2001=0A=
@@ -52,7 +52,10 @@=0A=
 void dc21285_write16(struct map_info *map, __u16 d, unsigned long =
adr)=0A=
 {=0A=
 	*CSR_ROMWRITEREG =3D adr;=0A=
-	adr &=3D ~1;=0A=
+	/*Original:=0A=
+	  adr &=3D ~1;=0A=
+	*/=0A=
+	adr &=3D ~3;=0A=
 	*(__u16*)(map->map_priv_1 + adr) =3D d;=0A=
 }=0A=
 =0A=
@@ -137,7 +140,7 @@=0A=
 		return -EIO;=0A=
 	}=0A=
 =0A=
-	mymtd =3D do_map_probe("cfi_probe", &dc21285_map);=0A=
+	mymtd =3D do_map_probe("intel_bb_flash", &dc21285_map);=0A=
 	if (mymtd) {=0A=
 		int nrparts;=0A=
 =0A=

------_=_NextPart_000_01C12A35.B219C0B0--
