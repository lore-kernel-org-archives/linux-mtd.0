Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BwzOa-0001Bx-VK
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2004 04:32:44 -0400
From: Ian Campbell <icampbell@arcom.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="=-SDTmlxnXrYKNN3r63Apg"
Message-Id: <1092731553.9001.18.camel@icampbell-debian>
Mime-Version: 1.0
Date: Tue, 17 Aug 2004 09:32:33 +0100
Cc: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: MTD patches
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SDTmlxnXrYKNN3r63Apg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi David, 

I've had a couple of patches to MTD sitting in my 2.6 tree for a while
now and wonder if you would consider including them.

All of the patches are against 2.6.8.1, although they have been applying
unchanged for many versions now.

mtd-redboot-partition-fixes.patch

        This patch has two parts. 
        
        The first is to factor out the offset to look at for the RedBoot
        partition table into a variable. This has no impact on the code
        as is, but makes it easier and clearer for platforms that have
        the partition table at some other offset to wrap a #ifdef
        CONFIG_ARCH_ around the variable rather than introducing errors
        by cloning the whole master->read call.
        
        The second part looks for any partition name starting with
        "RedBoot" rather than looking for "RedBoot\0". On my platform
        RedBoot lives in a separate boot ROM, but the RedBoot config and
        partition table are in the main flash so we can find them.
        
mtd-add_full.patch
        
        This patch adds a new api call add_mtd_device_full() that allows
        a device to be added to a specific minor number (if it is
        available). I use this in my platform drivers to ensure that the
        SRAM device is always minor 14 and the BIOS device is always
        minor 15, even if the user changes the redboot partitioning
        scheme and changes the number of flash partitions.
        
        add_mtd_device now just calls _full with a minor of -1 to
        allocate any available device.
        
mtd-jedec-probe-parts
        
        This patch adds a few new part numbers to jedec_probe.c. They
        are AMD AM29F002T, Hyundai HY29F002T and Macronix MX29FOO2T.
        
Cheers,
Ian.

-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200

--=-SDTmlxnXrYKNN3r63Apg
Content-Disposition: attachment; filename=mtd-redboot-partition-fixes.patch
Content-Type: text/x-patch; name=mtd-redboot-partition-fixes.patch;
	charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

%patch
Index: linux-2.6-bk/drivers/mtd/redboot.c
===================================================================
--- linux-2.6-bk.orig/drivers/mtd/redboot.c	2004-07-19 09:35:43.000000000 +0100
+++ linux-2.6-bk/drivers/mtd/redboot.c	2004-07-19 10:27:23.169539161 +0100
@@ -49,6 +49,7 @@
 	char *nullname;
 	int namelen = 0;
 	int nulllen = 0;
+	unsigned long offset;
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	static char nullstring[] = "unallocated";
 #endif
@@ -59,7 +60,9 @@
 		return -ENOMEM;
 
 	/* Read the start of the last erase block */
-	ret = master->read(master, master->size - master->erasesize,
+	offset = master->size - master->erasesize;
+
+	ret = master->read(master, offset,
 			   master->erasesize, &retlen, (void *)buf);
 
 	if (ret)
@@ -72,7 +75,7 @@
 
 	/* RedBoot image could appear in any of the first three slots */
 	for (i = 0; i < 3; i++) {
-		if (!memcmp(buf[i].name, "RedBoot", 8))
+		if (!memcmp(buf[i].name, "RedBoot", 7))
 			break;
 	}
 	if (i == 3) {

--=-SDTmlxnXrYKNN3r63Apg
Content-Disposition: attachment; filename=mtd-add_full.patch
Content-Type: text/x-patch; name=mtd-add_full.patch; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

%patch
Index: q/drivers/mtd/mtdcore.c
===================================================================
--- q.orig/drivers/mtd/mtdcore.c	Tue Aug  5 16:46:21 2003
+++ q/drivers/mtd/mtdcore.c	Tue Aug  5 16:46:38 2003
@@ -36,30 +36,39 @@
 static LIST_HEAD(mtd_notifiers);
 
 /**
- *	add_mtd_device - register an MTD device
+ *	add_mtd_device_full - register an MTD device at a particular minor number
  *	@mtd: pointer to new MTD device info structure
+ *	@minor: requested minor number. -1 to for the first free.
  *
- *	Add a device to the list of MTD devices present in the system, and
- *	notify each currently active MTD 'user' of its arrival. Returns
- *	zero on success or 1 on failure, which currently will only happen
- *	if the number of present devices exceeds MAX_MTD_DEVICES (i.e. 16)
+ *	Add a device to the list of MTD devices present in the system,
+ *	and notifies each currently active MTD 'user' of its
+ *	arrival. Returns zero on success or 1 on failure, which
+ *	currently only occurs if the requested minor number has
+ *	already been allocated or if minor exceeds MAX_MTD_DEVICES
+ *	(i.e. 16)
  */
-
-int add_mtd_device(struct mtd_info *mtd)
+int add_mtd_device_full(struct mtd_info *mtd, int minor)
 {
-	int i;
-
 	down(&mtd_table_mutex);
 
-	for (i=0; i < MAX_MTD_DEVICES; i++)
-		if (!mtd_table[i]) {
+	if ( minor == -1 ) {
+		for (minor = 0; minor < MAX_MTD_DEVICES; minor++)
+			if (!mtd_table[minor])
+				break;
+	}
+
+	if ( minor >= MAX_MTD_DEVICES || minor < 0 || mtd_table[minor] ) {
+		up(&mtd_table_mutex);
+		return 1;
+	}
+
 			struct list_head *this;
 
-			mtd_table[i] = mtd;
-			mtd->index = i;
+	mtd_table[minor] = mtd;
+	mtd->index = minor;
 			mtd->usecount = 0;
 
-			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
+	DEBUG(0, "mtd: Giving out device %d to %s\n",minor, mtd->name);
 			/* No need to get a refcount on the module containing
 			   the notifier, since we hold the mtd_table_mutex */
 			list_for_each(this, &mtd_notifiers) {
@@ -76,8 +85,18 @@
 			return 0;
 		}
 	
-	up(&mtd_table_mutex);
-	return 1;
+/**
+ *	add_mtd_device - register an MTD device
+ *	@mtd: pointer to new MTD device info structure
+ *
+ *	Add a device to the list of MTD devices present in the system, and
+ *	notify each currently active MTD 'user' of its arrival. Returns
+ *	zero on success or 1 on failure, which currently will only happen
+ *	if the number of present devices exceeds MAX_MTD_DEVICES (i.e. 16)
+ */
+int add_mtd_device(struct mtd_info *mtd)
+{
+	return add_mtd_device_full(mtd, -1);
 }
 
 /**
@@ -288,6 +307,7 @@
 
 
 EXPORT_SYMBOL(add_mtd_device);
+EXPORT_SYMBOL(add_mtd_device_full);
 EXPORT_SYMBOL(del_mtd_device);
 EXPORT_SYMBOL(get_mtd_device);
 EXPORT_SYMBOL(put_mtd_device);
Index: q/include/linux/mtd/mtd.h
===================================================================
--- q.orig/include/linux/mtd/mtd.h	Tue Aug  5 16:46:22 2003
+++ q/include/linux/mtd/mtd.h	Tue Aug  5 16:46:38 2003
@@ -238,6 +238,7 @@
 	/* Kernel-side ioctl definitions */
 
 extern int add_mtd_device(struct mtd_info *mtd);
+extern int add_mtd_device_full(struct mtd_info *mtd, int minor);
 extern int del_mtd_device (struct mtd_info *mtd);
 
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);

%diffstat
 drivers/mtd/mtdcore.c   |   52 +++++++++++++++++++++++++++++++++---------------
 include/linux/mtd/mtd.h |    1 
 2 files changed, 37 insertions(+), 16 deletions(-)


--=-SDTmlxnXrYKNN3r63Apg
Content-Disposition: attachment; filename=mtd-jedec-probe-parts
Content-Type: text/plain; name=mtd-jedec-probe-parts; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

%description
Add support for a couple of BIOS ROM devices.

%patch
Index: linux-2.6-bk/drivers/mtd/chips/jedec_probe.c
===================================================================
--- linux-2.6-bk.orig/drivers/mtd/chips/jedec_probe.c	2004-08-10 17:49:44.000000000 +0100
+++ linux-2.6-bk/drivers/mtd/chips/jedec_probe.c	2004-08-17 09:28:05.001562971 +0100
@@ -36,7 +36,8 @@
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_TOSHIBA	0x0098
 #define MANUFACTURER_WINBOND	0x00da
-
+#define MANUFACTURER_HYUNDAI	0x00AD
+#define MANUFACTURER_MACRONIX	0x00C2
 
 /* AMD */
 #define AM29DL800BB	0x22C8
@@ -56,6 +57,7 @@
 #define AM29F040	0x00A4
 #define AM29LV040B	0x004F
 #define AM29F032B	0x0041
+#define AM29F002T	0x00B0
 
 /* Atmel */
 #define AT49BV512	0x0003
@@ -154,6 +156,11 @@
 /* Winbond */
 #define W49V002A	0x00b0
 
+/* Hyundai */
+#define HY29F002T	0x00B0
+
+/* Macronix */
+#define MX29F002T	0x00B0
 
 /*
  * Unlock address sets for AMD command sets.
@@ -1570,7 +1577,40 @@
 			ERASEINFO(0x02000, 2),
 			ERASEINFO(0x04000, 1),
 		}
-	} 
+	}, {
+		mfr_id: MANUFACTURER_AMD,
+		dev_id: AM29F002T,
+		name: "AMD AM29F002T",
+		DevSize: SIZE_256KiB,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x10000,3),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1)
+		}
+	}, {
+		mfr_id: MANUFACTURER_HYUNDAI,
+		dev_id: HY29F002T,
+		name: "Hyundai HY29F002T",
+		DevSize: SIZE_256KiB,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x10000,3),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1)
+		}
+	}, {
+		mfr_id: MANUFACTURER_MACRONIX,
+		dev_id: MX29F002T,
+		name: "Macronix MX29F002T",
+		DevSize: SIZE_256KiB,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x10000,3),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1)
+		}
+	}
 };
 
 

--=-SDTmlxnXrYKNN3r63Apg--
