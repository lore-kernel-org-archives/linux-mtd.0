Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kitV-00015P-3z
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 12:25:21 +0100
From: Ian Campbell <icampbell@arcom.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <1060253567.25209.56.camel@passion.cambridge.redhat.com>
References: <5.2.1.1.2.20030807101847.00bfc310@pop3.iqc-services.com>
	 <1060253567.25209.56.camel@passion.cambridge.redhat.com>
Message-Id: <1060255130.13706.65.camel@linuxdev.icampbell.arcom.cc>
Mime-Version: 1.0
Date: 07 Aug 2003 12:18:50 +0100
Content-Type: multipart/mixed; boundary="=-TVX54+zAmcdEsKgQfwsZ"
Subject: Re: I have a NOR and NAND flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-TVX54+zAmcdEsKgQfwsZ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> You just have to be aware
> that they'll get assigned numbers in the order they get registered,
> that's all.

A long while ago I submitted a patch which added a function
add_mtd_device_full which allowed you to request a specific minor
number. We use it to ensure SRAM is always minor 15, no matter how many
partitions are in the main flash array, which can make things easier on
the support guys, for documentation purposes etc.

I've attached it again since it may be of interest, since your map
driver could then register the flash at a specific device. I can see how
a add_mtd_partition_full which allowed you to specify a starting minor
number would be useful too, but I haven't needed it myself.

Ian.

-- 
Ian Campbell, Senior Design Engineer

Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200


________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs Email
Security System. For more information on a proactive email security
service working around the clock, around the globe, visit
http://www.messagelabs.com
________________________________________________________________________
--=-TVX54+zAmcdEsKgQfwsZ
Content-Disposition: attachment; filename=mtd-add_full.patch
Content-Type: text/plain; name=mtd-add_full.patch; charset=iso-8859-15
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


--=-TVX54+zAmcdEsKgQfwsZ--
