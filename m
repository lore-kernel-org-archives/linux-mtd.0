Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Atuc-000822-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 14:17:38 +0000
Received: from [192.168.1.53] (helo=MONSTROSITY)
	by osdsun1.nrl.navy.mil with smtp (Exim 3.32 #1 (Debian))
	id 16AtyJ-0006Aq-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 09:21:27 -0500
Message-ID: <004b01c17c06$bb0d8d00$3501a8c0@MONSTROSITY>
From: "Dan Brown" <brown@osdsun1.nrl.navy.mil>
To: <linux-mtd@lists.infradead.org>
References: <004301c17771$1a4c1c90$d082fa84@superfortress>  <15578.1007199143@redhat.com>
Subject: [PATCH] jffs2 on DOC 
Date: Mon, 3 Dec 2001 09:28:09 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I have jffs2 working on DOC in a preliminary fashion.  The included patch
incorporates the following changes (if people object to inline patches, I
apologize -- let me know and I'll use attachments instead):
 - Modify doc2k driver to allow reads/writes that cross 512-byte boundaries
(btw, thanks for the reply, David :)
 - Modify doc2k driver to optionally use a 'fake' partitioning scheme in
which the device is arbitrarily broken into two subdevices.  This is
controlled by kernel config options, and can be disabled.
 - Modify mtdpart.c to pass the read_ecc(), write_ecc(), read_oob(), and
write_oob() functions to the master device.
 - Modify eraseall.c to add a -oob option which writes 0xFF to every oob
location on a device after erasing it.  I found myself getting into a state
where the M-systems tools (dformat) refused to work with my device anymore,
even refusing to do a complete reformat.  Using eraseall with the -oob
option seems to fix this, and convince dformat we have a 'truly' virgin
device.

I now have a bootable DOC Millenium 8M, with a roughly 1M bootable nftl
partition, and the rest as a raw jffs2 partition.  I use the following
procedure:
 - make sure the M-systems firmware is loaded on the device (using dformat,
for instance).  grub would work, but not on the Millenium, yet (as I
understand it.)
 - in linux, load the DOC modules which have been compiled to split the
device into a 1M boot partition and a remainder.
 - nftl_format /dev/mtd0 0xa000
 - eraseall /dev/mtd1
 - cp jffs2.img /dev/mtd1
 - modprobe nftl
 - fdisk /dev/nftla
 - make a filesystem on /dev/nftla1 (I used msdos, and syslinux to make it
boot the kernel, but there are many methods.)
 - mount -t msdos /dev/nftla1 /flashboot
 - stick the kernel image in /flashboot
 - modprobe jffs2
 - modprobe mtdblock
 - mount -t jffs2 /dev/mtdblock1 /flash
 - enjoy

The linux image I put in the boot partition has the mtd stuff compiled in,
rather than as modules, and uses /dev/mtdblock1 as its root partition
(jffs2).  Everything works great.

A few caveats:
 - Not tested on DOC2k yet, only on Millenium. (Shouldn't matter).
 - Doesn't do ECC properly.  In fact, I suppressed the warning message in
doc2000.c about non-block-aligned writes, because it was popping up
continuously.  Given what David said about jffs2 with NAND devices, I think
the thing to do is fix this from the jffs2 end, not the doc2k end.
 - Boot partition size is currently chosen at kernel compile time, rather
than runtime.  This is not ideal.

Comments appreciated.

    -Dan Brown


------------------------------------------ patch
follows ---------------------------------------------
diff -u -r mtd-20011126/drivers/mtd/devices/Config.in
mtd/drivers/mtd/devices/Config.in
--- mtd-20011126/drivers/mtd/devices/Config.in Sun Sep 23 18:00:03 2001
+++ mtd/drivers/mtd/devices/Config.in Mon Dec  3 08:28:27 2001
@@ -27,6 +27,11 @@
 comment 'Disk-On-Chip Device Drivers'
    dep_tristate '  M-Systems Disk-On-Chip 1000' CONFIG_MTD_DOC1000
$CONFIG_MTD
    dep_tristate '  M-Systems Disk-On-Chip 2000 and Millennium'
CONFIG_MTD_DOC2000 $CONFIG_MTD
+   dep_mbool '    Fake partition support for DOC2000'
CONFIG_MTD_DOC2K_FAKEPART $CONFIG_MTD_DOC2000 $CONFIG_MTD_PARTITIONS
+   if [ "$CONFIG_MTD_DOC2K_FAKEPART" = "y" ]; then
+      hex '      Size of first partition' CONFIG_MTD_DOC2K_PARTLEN 0x10a000
+      bool '      Create full (unpartitioned) device also'
CONFIG_MTD_DOC2K_FULLDEV
+   fi
    dep_tristate '  M-Systems Disk-On-Chip Millennium-only alternative
driver (see help)' CONFIG_MTD_DOC2001 $CONFIG_MTD
    if [ "$CONFIG_MTD_DOC2001" = "y" -o "$CONFIG_MTD_DOC2000" = "y" ]; then
       define_bool CONFIG_MTD_DOCPROBE y
diff -u -r mtd-20011126/drivers/mtd/devices/doc2000.c
mtd/drivers/mtd/devices/doc2000.c
--- mtd-20011126/drivers/mtd/devices/doc2000.c Tue Oct  2 18:00:19 2001
+++ mtd/drivers/mtd/devices/doc2000.c Mon Dec  3 08:37:56 2001
@@ -24,6 +24,9 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ids.h>
 #include <linux/mtd/doc2000.h>
+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+#include <linux/mtd/partitions.h>
+#endif

 #define DOC_SUPPORT_2000
 #define DOC_SUPPORT_MILLENNIUM
@@ -503,6 +506,24 @@
  return retval;
 }

+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+static struct mtd_partition doc_partitions[] =
+{
+ {
+  name: "boot",
+  offset: 0,
+  size: CONFIG_MTD_DOC2K_PARTLEN,
+  mask_flags: 0
+ },
+ {
+  name: "data",
+  offset: MTDPART_OFS_NXTBLK,
+  size: MTDPART_SIZ_FULL,
+  mask_flags: 0
+ }
+};
+#endif
+
 static const char im_name[] = "DoC2k_init";

 /* This routine is made available to other mtd code via
@@ -580,7 +601,11 @@
  /* Ident all the chips present. */
  DoC_ScanChips(this);

+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+ if (!this->totlen || (CONFIG_MTD_DOC2K_PARTLEN >= this->totlen)) {
+#else
  if (!this->totlen) {
+#endif
   kfree(mtd);
   iounmap((void *) this->virtadr);
  } else {
@@ -588,7 +613,12 @@
   doc2klist = mtd;
   mtd->size = this->totlen;
   mtd->erasesize = this->erasesize;
+#if (!defined(CONFIG_MTD_DOC2K_FAKEPART) ||
defined(CONFIG_MTD_DOC2K_FULLDEV))
   add_mtd_device(mtd);
+#endif
+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+  add_mtd_partitions(mtd, doc_partitions, 2);
+#endif
   return;
  }
 }
@@ -609,6 +639,7 @@
  unsigned char syndrome[6];
  volatile char dummy;
  int i, len256 = 0, ret=0;
+ size_t left = len;

  docptr = this->virtadr;

@@ -618,122 +649,131 @@

  down(&this->lock);

- /* Don't allow a single read to cross a 512-byte block boundary */
- if (from + len > ((from | 0x1ff) + 1))
-  len = ((from | 0x1ff) + 1) - from;
-
- /* The ECC will not be calculated correctly if less than 512 is read */
- if (len != 0x200 && eccbuf)
-  printk(KERN_WARNING
-         "ECC needs a full sector read (adr: %lx size %lx)\n",
-         (long) from, (long) len);
+ *retlen = 0;
+ while (left) {
+  len = left;
+
+  /* Don't allow a single read to cross a 512-byte block boundary */
+  if (from + len > ((from | 0x1ff) + 1))
+   len = ((from | 0x1ff) + 1) - from;

- /* printk("DoC_Read (adr: %lx size %lx)\n", (long) from, (long) len); */
+  /* The ECC will not be calculated correctly if less than 512 is read */
+  if (len != 0x200 && eccbuf)
+   printk(KERN_WARNING
+          "ECC needs a full sector read (adr: %lx size %lx)\n",
+          (long) from, (long) len);

+  /* printk("DoC_Read (adr: %lx size %lx)\n", (long) from, (long) len); */

- /* Find the chip which is to be used and select it */
- mychip = &this->chips[from >> (this->chipshift)];

- if (this->curfloor != mychip->floor) {
-  DoC_SelectFloor(this, mychip->floor);
-  DoC_SelectChip(this, mychip->chip);
- } else if (this->curchip != mychip->chip) {
-  DoC_SelectChip(this, mychip->chip);
- }
+  /* Find the chip which is to be used and select it */
+  mychip = &this->chips[from >> (this->chipshift)];

- this->curfloor = mychip->floor;
- this->curchip = mychip->chip;
+  if (this->curfloor != mychip->floor) {
+   DoC_SelectFloor(this, mychip->floor);
+   DoC_SelectChip(this, mychip->chip);
+  } else if (this->curchip != mychip->chip) {
+   DoC_SelectChip(this, mychip->chip);
+  }

- DoC_Command(this,
-      (!this->page256
-       && (from & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
-      CDSN_CTRL_WP);
- DoC_Address(this, ADDR_COLUMN_PAGE, from, CDSN_CTRL_WP,
-      CDSN_CTRL_ECC_IO);
-
- if (eccbuf) {
-  /* Prime the ECC engine */
-  WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-  WriteDOC(DOC_ECC_EN, docptr, ECCConf);
- } else {
-  /* disable the ECC engine */
-  WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-  WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
- }
+  this->curfloor = mychip->floor;
+  this->curchip = mychip->chip;

- /* treat crossing 256-byte sector for 2M x 8bits devices */
- if (this->page256 && from + len > (from | 0xff) + 1) {
-  len256 = (from | 0xff) + 1 - from;
-  DoC_ReadBuf(this, buf, len256);
+  DoC_Command(this,
+       (!this->page256
+        && (from & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
+       CDSN_CTRL_WP);
+  DoC_Address(this, ADDR_COLUMN_PAGE, from, CDSN_CTRL_WP,
+       CDSN_CTRL_ECC_IO);

-  DoC_Command(this, NAND_CMD_READ0, CDSN_CTRL_WP);
-  DoC_Address(this, ADDR_COLUMN_PAGE, from + len256,
-       CDSN_CTRL_WP, CDSN_CTRL_ECC_IO);
- }
+  if (eccbuf) {
+   /* Prime the ECC engine */
+   WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+   WriteDOC(DOC_ECC_EN, docptr, ECCConf);
+  } else {
+   /* disable the ECC engine */
+   WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+   WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
+  }

- DoC_ReadBuf(this, &buf[len256], len - len256);
+  /* treat crossing 256-byte sector for 2M x 8bits devices */
+  if (this->page256 && from + len > (from | 0xff) + 1) {
+   len256 = (from | 0xff) + 1 - from;
+   DoC_ReadBuf(this, buf, len256);
+
+   DoC_Command(this, NAND_CMD_READ0, CDSN_CTRL_WP);
+   DoC_Address(this, ADDR_COLUMN_PAGE, from + len256,
+        CDSN_CTRL_WP, CDSN_CTRL_ECC_IO);
+  }

- /* Let the caller know we completed it */
- *retlen = len;
+  DoC_ReadBuf(this, &buf[len256], len - len256);

- if (eccbuf) {
-  /* Read the ECC data through the DiskOnChip ECC logic */
-  /* Note: this will work even with 2M x 8bit devices as   */
-  /*       they have 8 bytes of OOB per 256 page. mf.      */
-  DoC_ReadBuf(this, eccbuf, 6);
-
-  /* Flush the pipeline */
-  if (DoC_is_Millennium(this)) {
-   dummy = ReadDOC(docptr, ECCConf);
-   dummy = ReadDOC(docptr, ECCConf);
-   i = ReadDOC(docptr, ECCConf);
-  } else {
-   dummy = ReadDOC(docptr, 2k_ECCStatus);
-   dummy = ReadDOC(docptr, 2k_ECCStatus);
-   i = ReadDOC(docptr, 2k_ECCStatus);
-  }
+  /* Let the caller know we completed it */
+  *retlen += len;
+
+  if (eccbuf) {
+   /* Read the ECC data through the DiskOnChip ECC logic */
+   /* Note: this will work even with 2M x 8bit devices as   */
+   /*       they have 8 bytes of OOB per 256 page. mf.      */
+   DoC_ReadBuf(this, eccbuf, 6);
+
+   /* Flush the pipeline */
+   if (DoC_is_Millennium(this)) {
+    dummy = ReadDOC(docptr, ECCConf);
+    dummy = ReadDOC(docptr, ECCConf);
+    i = ReadDOC(docptr, ECCConf);
+   } else {
+    dummy = ReadDOC(docptr, 2k_ECCStatus);
+    dummy = ReadDOC(docptr, 2k_ECCStatus);
+    i = ReadDOC(docptr, 2k_ECCStatus);
+   }

-  /* Check the ECC Status */
-  if (i & 0x80) {
-   int nb_errors;
-   /* There was an ECC error */
+   /* Check the ECC Status */
+   if (i & 0x80) {
+    int nb_errors;
+    /* There was an ECC error */
 #ifdef ECC_DEBUG
-   printk(KERN_ERR "DiskOnChip ECC Error: Read at %lx\n", (long)from);
+    printk(KERN_ERR "DiskOnChip ECC Error: Read at %lx\n", (long)from);
 #endif
-   /* Read the ECC syndrom through the DiskOnChip ECC logic.
-      These syndrome will be all ZERO when there is no error */
-   for (i = 0; i < 6; i++) {
-    syndrome[i] =
-        ReadDOC(docptr, ECCSyndrome0 + i);
-   }
-                        nb_errors = doc_decode_ecc(buf, syndrome);
+    /* Read the ECC syndrom through the DiskOnChip ECC logic.
+       These syndrome will be all ZERO when there is no error */
+    for (i = 0; i < 6; i++) {
+     syndrome[i] =
+         ReadDOC(docptr, ECCSyndrome0 + i);
+    }
+                         nb_errors = doc_decode_ecc(buf, syndrome);

 #ifdef ECC_DEBUG
-   printk(KERN_ERR "Errors corrected: %x\n", nb_errors);
+    printk(KERN_ERR "Errors corrected: %x\n", nb_errors);
 #endif
-                        if (nb_errors < 0) {
-    /* We return error, but have actually done the read. Not that
-       this can be told to user-space, via sys_read(), but at least
-       MTD-aware stuff can know about it by checking *retlen */
-    ret = -EIO;
-                        }
-  }
+                         if (nb_errors < 0) {
+     /* We return error, but have actually done the read. Not that
+        this can be told to user-space, via sys_read(), but at least
+        MTD-aware stuff can know about it by checking *retlen */
+     ret = -EIO;
+                         }
+   }

 #ifdef PSYCHO_DEBUG
-  printk(KERN_DEBUG "ECC DATA at %lxB: %2.2X %2.2X %2.2X %2.2X %2.2X
%2.2X\n",
-        (long)from, eccbuf[0], eccbuf[1], eccbuf[2],
-        eccbuf[3], eccbuf[4], eccbuf[5]);
+   printk(KERN_DEBUG "ECC DATA at %lxB: %2.2X %2.2X %2.2X %2.2X %2.2X
%2.2X\n",
+         (long)from, eccbuf[0], eccbuf[1], eccbuf[2],
+         eccbuf[3], eccbuf[4], eccbuf[5]);
 #endif

-  /* disable the ECC engine */
-  WriteDOC(DOC_ECC_DIS, docptr , ECCConf);
- }
+   /* disable the ECC engine */
+   WriteDOC(DOC_ECC_DIS, docptr , ECCConf);
+  }

- /* according to 11.4.1, we need to wait for the busy line
-         * drop if we read to the end of the page.  */
- if(0 == ((from + *retlen) & 0x1ff))
- {
-     DoC_WaitReady(this);
+  /* according to 11.4.1, we need to wait for the busy line
+          * drop if we read to the end of the page.  */
+  if(0 == ((from + len) & 0x1ff))
+  {
+      DoC_WaitReady(this);
+  }
+
+  from += len;
+  left -= len;
+  buf += len;
  }

  up(&this->lock);
@@ -758,6 +798,7 @@
  volatile char dummy;
  int len256 = 0;
  struct Nand *mychip;
+ size_t left = len;

  docptr = this->virtadr;

@@ -767,55 +808,114 @@

  down(&this->lock);

- /* Don't allow a single write to cross a 512-byte block boundary */
- if (to + len > ((to | 0x1ff) + 1))
-  len = ((to | 0x1ff) + 1) - to;
-
- /* The ECC will not be calculated correctly if less than 512 is written */
- if (len != 0x200 && eccbuf)
-  printk(KERN_WARNING
-         "ECC needs a full sector write (adr: %lx size %lx)\n",
-         (long) to, (long) len);
+ *retlen = 0;
+ while (left) {
+  len = left;
+
+  /* Don't allow a single write to cross a 512-byte block boundary */
+  if (to + len > ((to | 0x1ff) + 1))
+   len = ((to | 0x1ff) + 1) - to;
+
+  /* The ECC will not be calculated correctly if less than 512 is written
*/
+/* DBB-
+  if (len != 0x200 && eccbuf)
+   printk(KERN_WARNING
+          "ECC needs a full sector write (adr: %lx size %lx)\n",
+          (long) to, (long) len);
+   -DBB */

- /* printk("DoC_Write (adr: %lx size %lx)\n", (long) to, (long) len); */
+  /* printk("DoC_Write (adr: %lx size %lx)\n", (long) to, (long) len); */

- /* Find the chip which is to be used and select it */
- mychip = &this->chips[to >> (this->chipshift)];
+  /* Find the chip which is to be used and select it */
+  mychip = &this->chips[to >> (this->chipshift)];

- if (this->curfloor != mychip->floor) {
-  DoC_SelectFloor(this, mychip->floor);
-  DoC_SelectChip(this, mychip->chip);
- } else if (this->curchip != mychip->chip) {
-  DoC_SelectChip(this, mychip->chip);
- }
+  if (this->curfloor != mychip->floor) {
+   DoC_SelectFloor(this, mychip->floor);
+   DoC_SelectChip(this, mychip->chip);
+  } else if (this->curchip != mychip->chip) {
+   DoC_SelectChip(this, mychip->chip);
+  }

- this->curfloor = mychip->floor;
- this->curchip = mychip->chip;
+  this->curfloor = mychip->floor;
+  this->curchip = mychip->chip;

- /* Set device to main plane of flash */
- DoC_Command(this, NAND_CMD_RESET, CDSN_CTRL_WP);
- DoC_Command(this,
-      (!this->page256
-       && (to & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
-      CDSN_CTRL_WP);
+  /* Set device to main plane of flash */
+  DoC_Command(this, NAND_CMD_RESET, CDSN_CTRL_WP);
+  DoC_Command(this,
+       (!this->page256
+        && (to & 0x100)) ? NAND_CMD_READ1 : NAND_CMD_READ0,
+       CDSN_CTRL_WP);

- DoC_Command(this, NAND_CMD_SEQIN, 0);
- DoC_Address(this, ADDR_COLUMN_PAGE, to, 0, CDSN_CTRL_ECC_IO);
+  DoC_Command(this, NAND_CMD_SEQIN, 0);
+  DoC_Address(this, ADDR_COLUMN_PAGE, to, 0, CDSN_CTRL_ECC_IO);

- if (eccbuf) {
-  /* Prime the ECC engine */
-  WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-  WriteDOC(DOC_ECC_EN | DOC_ECC_RW, docptr, ECCConf);
- } else {
-  /* disable the ECC engine */
-  WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
-  WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
- }
+  if (eccbuf) {
+   /* Prime the ECC engine */
+   WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+   WriteDOC(DOC_ECC_EN | DOC_ECC_RW, docptr, ECCConf);
+  } else {
+   /* disable the ECC engine */
+   WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
+   WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
+  }

- /* treat crossing 256-byte sector for 2M x 8bits devices */
- if (this->page256 && to + len > (to | 0xff) + 1) {
-  len256 = (to | 0xff) + 1 - to;
-  DoC_WriteBuf(this, buf, len256);
+  /* treat crossing 256-byte sector for 2M x 8bits devices */
+  if (this->page256 && to + len > (to | 0xff) + 1) {
+   len256 = (to | 0xff) + 1 - to;
+   DoC_WriteBuf(this, buf, len256);
+
+   DoC_Command(this, NAND_CMD_PAGEPROG, 0);
+
+   DoC_Command(this, NAND_CMD_STATUS, CDSN_CTRL_WP);
+   /* There's an implicit DoC_WaitReady() in DoC_Command */
+
+   dummy = ReadDOC(docptr, CDSNSlowIO);
+   DoC_Delay(this, 2);
+
+   if (ReadDOC_(docptr, this->ioreg) & 1) {
+    printk(KERN_ERR "Error programming flash\n");
+    /* Error in programming */
+    *retlen = 0;
+    up(&this->lock);
+    return -EIO;
+   }
+
+   DoC_Command(this, NAND_CMD_SEQIN, 0);
+   DoC_Address(this, ADDR_COLUMN_PAGE, to + len256, 0,
+        CDSN_CTRL_ECC_IO);
+  }
+
+  DoC_WriteBuf(this, &buf[len256], len - len256);
+
+  if (eccbuf) {
+   WriteDOC(CDSN_CTRL_ECC_IO | CDSN_CTRL_CE, docptr,
+     CDSNControl);
+
+   if (DoC_is_Millennium(this)) {
+    WriteDOC(0, docptr, NOP);
+    WriteDOC(0, docptr, NOP);
+    WriteDOC(0, docptr, NOP);
+   } else {
+    WriteDOC_(0, docptr, this->ioreg);
+    WriteDOC_(0, docptr, this->ioreg);
+    WriteDOC_(0, docptr, this->ioreg);
+   }
+
+   /* Read the ECC data through the DiskOnChip ECC logic */
+   for (di = 0; di < 6; di++) {
+    eccbuf[di] = ReadDOC(docptr, ECCSyndrome0 + di);
+   }
+
+   /* Reset the ECC engine */
+   WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
+
+#ifdef PSYCHO_DEBUG
+   printk
+       ("OOB data at %lx is %2.2X %2.2X %2.2X %2.2X %2.2X %2.2X\n",
+        (long) to, eccbuf[0], eccbuf[1], eccbuf[2], eccbuf[3],
+        eccbuf[4], eccbuf[5]);
+#endif
+  }

   DoC_Command(this, NAND_CMD_PAGEPROG, 0);

@@ -833,78 +933,33 @@
    return -EIO;
   }

-  DoC_Command(this, NAND_CMD_SEQIN, 0);
-  DoC_Address(this, ADDR_COLUMN_PAGE, to + len256, 0,
-       CDSN_CTRL_ECC_IO);
- }
-
- DoC_WriteBuf(this, &buf[len256], len - len256);
-
- if (eccbuf) {
-  WriteDOC(CDSN_CTRL_ECC_IO | CDSN_CTRL_CE, docptr,
-    CDSNControl);
-
-  if (DoC_is_Millennium(this)) {
-   WriteDOC(0, docptr, NOP);
-   WriteDOC(0, docptr, NOP);
-   WriteDOC(0, docptr, NOP);
-  } else {
-   WriteDOC_(0, docptr, this->ioreg);
-   WriteDOC_(0, docptr, this->ioreg);
-   WriteDOC_(0, docptr, this->ioreg);
-  }
-
-  /* Read the ECC data through the DiskOnChip ECC logic */
-  for (di = 0; di < 6; di++) {
-   eccbuf[di] = ReadDOC(docptr, ECCSyndrome0 + di);
-  }
-
-  /* Reset the ECC engine */
-  WriteDOC(DOC_ECC_DIS, docptr, ECCConf);
-
-#ifdef PSYCHO_DEBUG
-  printk
-      ("OOB data at %lx is %2.2X %2.2X %2.2X %2.2X %2.2X %2.2X\n",
-       (long) to, eccbuf[0], eccbuf[1], eccbuf[2], eccbuf[3],
-       eccbuf[4], eccbuf[5]);
-#endif
- }
-
- DoC_Command(this, NAND_CMD_PAGEPROG, 0);
-
- DoC_Command(this, NAND_CMD_STATUS, CDSN_CTRL_WP);
- /* There's an implicit DoC_WaitReady() in DoC_Command */
-
- dummy = ReadDOC(docptr, CDSNSlowIO);
- DoC_Delay(this, 2);
-
- if (ReadDOC_(docptr, this->ioreg) & 1) {
-  printk(KERN_ERR "Error programming flash\n");
-  /* Error in programming */
-  *retlen = 0;
-  up(&this->lock);
-  return -EIO;
- }
-
- /* Let the caller know we completed it */
- *retlen = len;
+  /* Let the caller know we completed it */
+  *retlen += len;

- if (eccbuf) {
-  unsigned char x[8];
-  size_t dummy;
-  int ret;
-
-  /* Write the ECC data to flash */
-  for (di=0; di<6; di++)
-   x[di] = eccbuf[di];
+  if (eccbuf) {
+   unsigned char x[8];
+   size_t dummy;
+   int ret;
+
+   /* Write the ECC data to flash */
+   for (di=0; di<6; di++)
+    x[di] = eccbuf[di];

-  x[6]=0x55;
-  x[7]=0x55;
+   x[6]=0x55;
+   x[7]=0x55;

-  ret = doc_write_oob_nolock(mtd, to, 8, &dummy, x);
-  up(&this->lock);
-  return ret;
+   ret = doc_write_oob_nolock(mtd, to, 8, &dummy, x);
+   if (ret) {
+    up(&this->lock);
+    return ret;
+   }
+  }
+
+  to += len;
+  left -= len;
+  buf += len;
  }
+
  up(&this->lock);
  return 0;
 }
@@ -1156,7 +1211,12 @@
   this = (struct DiskOnChip *) mtd->priv;
   doc2klist = this->nextdoc;

+#ifdef CONFIG_MTD_DOC2K_FAKEPART
+  del_mtd_partitions(mtd);
+#endif
+#if (!defined(CONFIG_MTD_DOC2K_FAKEPART) ||
defined(CONFIG_MTD_DOC2K_FULLDEV))
   del_mtd_device(mtd);
+#endif

   iounmap((void *) this->virtadr);
   kfree(this->chips);
diff -u -r mtd-20011126/drivers/mtd/mtdpart.c mtd/drivers/mtd/mtdpart.c
--- mtd-20011126/drivers/mtd/mtdpart.c Wed Nov  7 18:00:21 2001
+++ mtd/drivers/mtd/mtdpart.c Mon Dec  3 08:39:50 2001
@@ -86,6 +86,58 @@
      from + part->offset, retlen);
 }

+static int part_read_oob (struct mtd_info *mtd, loff_t from, size_t len,
+   size_t *retlen, u_char *buf)
+{
+ struct mtd_part *part = PART(mtd);
+ if (from >= mtd->size)
+  len = 0;
+ else if (from + len > mtd->size)
+  len = mtd->size - from;
+ return part->master->read_oob (part->master, from + part->offset,
+     len, retlen, buf);
+}
+
+static int part_write_oob (struct mtd_info *mtd, loff_t to, size_t len,
+   size_t *retlen, const u_char *buf)
+{
+ struct mtd_part *part = PART(mtd);
+ if (!(mtd->flags & MTD_WRITEABLE))
+  return -EROFS;
+ if (to >= mtd->size)
+  len = 0;
+ else if (to + len > mtd->size)
+  len = mtd->size - to;
+ return part->master->write_oob (part->master, to + part->offset,
+     len, retlen, buf);
+}
+
+static int part_read_ecc (struct mtd_info *mtd, loff_t from, size_t len,
+   size_t *retlen, u_char *buf, u_char *eccbuf)
+{
+ struct mtd_part *part = PART(mtd);
+ if (from >= mtd->size)
+  len = 0;
+ else if (from + len > mtd->size)
+  len = mtd->size - from;
+ return part->master->read_ecc (part->master, from + part->offset,
+     len, retlen, buf, eccbuf);
+}
+
+static int part_write_ecc (struct mtd_info *mtd, loff_t to, size_t len,
+   size_t *retlen, const u_char *buf, u_char *eccbuf)
+{
+ struct mtd_part *part = PART(mtd);
+ if (!(mtd->flags & MTD_WRITEABLE))
+  return -EROFS;
+ if (to >= mtd->size)
+  len = 0;
+ else if (to + len > mtd->size)
+  len = mtd->size - to;
+ return part->master->write_ecc (part->master, to + part->offset,
+     len, retlen, buf, eccbuf);
+}
+
 static int part_erase (struct mtd_info *mtd, struct erase_info *instr)
 {
  struct mtd_part *part = PART(mtd);
@@ -209,6 +261,14 @@
     slave->mtd.suspend = part_suspend;
     slave->mtd.resume = part_resume;
   }
+  if (master->read_oob)
+   slave->mtd.read_oob = part_read_oob;
+  if (master->write_oob)
+   slave->mtd.write_oob = part_write_oob;
+  if (master->read_ecc)
+   slave->mtd.read_ecc = part_read_ecc;
+  if (master->write_ecc)
+   slave->mtd.write_ecc = part_write_ecc;

   if (master->writev)
    slave->mtd.writev = part_writev;
diff -u -r mtd-20011126/util/eraseall.c mtd/util/eraseall.c
--- mtd-20011126/util/eraseall.c Fri Apr 27 18:00:06 2001
+++ mtd/util/eraseall.c Mon Dec  3 08:43:04 2001
@@ -37,6 +37,8 @@
 static const char *exe_name;
 static const char *mtd_device;
 static int quiet; /* true -- don't output progress */
+static int do_oob;
+#define OOBVAL 0xff

 static void process_options( int argc, char *argv[] );
 static void display_help();
@@ -47,6 +49,8 @@
     mtd_info_t meminfo;
     int fd;
     erase_info_t erase;
+    struct mtd_oob_buf oob;
+    unsigned char *oobbuf;

     process_options( argc, argv );

@@ -85,6 +89,35 @@
        printf( "\rErased %ld Kibyte @ %lx -- 100%% complete.       \n",
         meminfo.size/1024, 0L );
    }
+
+   if (!do_oob) return 0;
+
+   if (!(oobbuf = (unsigned char *) malloc(meminfo.oobsize))) {
+       fprintf( stderr, "%s: unable to malloc oob buffer\n", exe_name);
+       exit( 1 );
+   }
+   oob.length = meminfo.oobsize;
+   oob.ptr = oobbuf;
+   memset(oobbuf, OOBVAL, meminfo.oobsize);
+
+   for (oob.start = 0; oob.start < meminfo.size;
+        oob.start += meminfo.oobblock) {
+       if( !quiet ) {
+    printf( "\rSetting %d bytes of oob @ %lx to %02X -- %2ld %% complete.",
+            meminfo.oobsize, oob.start, OOBVAL,
+     oob.start*100/meminfo.size );
+       }
+       fflush( stdout );
+
+       if(ioctl( fd, MEMWRITEOOB, &oob) != 0)
+       {
+        fprintf( stderr, "\n%s: %s: OOB write failure: %s\n", exe_name,
+   mtd_device, strerror( errno) );
+       }
+   }
+   if( !quiet ) {
+       printf( "\nDone.\n" );
+   }

    return 0;
 }
@@ -98,13 +131,13 @@

     for(;;) {
         int option_index = 0;
-        static const char* short_options="q";
+        static const char* short_options="oq";
         static const struct option long_options[] = {
             {"help", no_argument, 0, 0},
             {"version", no_argument, 0, 0},
      {"quiet", no_argument, 0, 'q'},
      {"silent", no_argument, 0, 'q'},
-
+     {"oob", no_argument, 0, 'o'},
             {0, 0, 0, 0},
         };

@@ -128,6 +161,9 @@
  case 'q' :
      quiet=1;
      break;
+ case 'o' :
+     do_oob=1;
+     break;
         case '?' :
             error=1;
             break;
@@ -152,10 +188,11 @@
             "Erases all of the specified MTD device.\n"
             "\n"
             "  -q, --quiet    don't display progress messages\n"
+     "  -o, --oob      set all oob data to %02X\n"
      "      --silent   same as --quiet\n"
             "      --help     display this help and exit\n"
             "      --version  output version information and exit\n"
-            , exe_name);
+            , exe_name, OOBVAL);
     exit( 0 );
 }
