From: icampbell@arcom.com (Ian Campbell)
Date: 12 Feb 2003 13:31:06 +0000
Subject: PATCH: add an mtd device at a particular minor number
Message-ID: <1045056666.31625.44.camel@linuxdev.icampbell.arcom.cc>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-BgIlVM/kP+dbhVmQMtO1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I sent this last week but it appears to have gone unnoticed. I've
attached an up to date patch. 

Cheers,
Ian.

>From last time:-

This patch adds a function add_mtd_device_full which works the same as
add_mtd_device except it allows you to request a particular minor number
for the new device.

I wanted this because on our boards we have Flash, SRAM and BIOS all
accessible via MTD, unfortunately the minor number of the SRAM and BIOS
devices can change depending on how many partitions exist in the main
Flash, and the BIOS minor number can additionally change depending on if
the board has SRAM fitted or not etc. I would much prefer to be able to
say that SRAM would always be mtd14 and BIOS would be mtd15.

It is also possible (and I have done this :-( ) that when booting from a
HDD or CDROM you modprobe the BIOS mapping module before the Flash
mapping module and happily overwrite the BIOS (on mtd0) thinking it is
the boot partition on the flash (which is normally mtd0).

What are the chances of this being rolled into the main MTD
distribution?

Ian.

-- 
Ian Campbell
Design Engineer

Arcom Control Systems Ltd,			Direct: +44 (0)1223 403465
Clifton Road,					Phone:  +44 (0)1223 411 200
Cambridge CB1 7EA				E-Mail: icampbell at arcom.com
United Kingdom					Web:    http://www.arcom.com




________________________________________________________________________
This email has been scanned for all viruses by the MessageLabs SkyScan
service. For more information on a proactive anti-virus service working
around the clock, around the globe, visit http://www.messagelabs.com
________________________________________________________________________
--=-BgIlVM/kP+dbhVmQMtO1
Content-Disposition: attachment; filename=add_mtd_full.patch
Content-Type: text/plain; name=add_mtd_full.patch; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Index: drivers/mtd/mtdcore.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdcore.c,v
retrieving revision 1.34
diff -u -b -B -w -p -u -r1.34 mtdcore.c
--- drivers/mtd/mtdcore.c	24 Jan 2003 23:32:25 -0000	1.34
+++ drivers/mtd/mtdcore.c	12 Feb 2003 13:25:10 -0000
@@ -29,29 +29,37 @@ static struct mtd_info *mtd_table[MAX_MT
 static struct mtd_notifier *mtd_notifiers = NULL;
 
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
+	struct mtd_notifier *not=mtd_notifiers;
 
 	down(&mtd_table_mutex);
 
-	for (i=0; i< MAX_MTD_DEVICES; i++)
-		if (!mtd_table[i])
-		{
-			struct mtd_notifier *not=mtd_notifiers;
+	if ( minor == -1 ) {
+		for (minor = 0; minor < MAX_MTD_DEVICES; minor++)
+			if (!mtd_table[minor])
+				break;
+	}
 
-			mtd_table[i] = mtd;
-			mtd->index = i;
-			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
+	if ( minor >= MAX_MTD_DEVICES || minor < 0 || mtd_table[minor] ) {
+		up(&mtd_table_mutex);
+		return 1;
+	}
+
+	mtd_table[minor] = mtd;
+	mtd->index = minor;
+	DEBUG(0, "mtd: Giving out device %d to %s\n",minor, mtd->name);
 			while (not)
 			{
 				(*(not->add))(mtd);
@@ -62,8 +70,18 @@ int add_mtd_device(struct mtd_info *mtd)
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
@@ -264,6 +282,7 @@ int default_mtd_readv(struct mtd_info *m
 
 
 EXPORT_SYMBOL(add_mtd_device);
+EXPORT_SYMBOL(add_mtd_device_full);
 EXPORT_SYMBOL(del_mtd_device);
 EXPORT_SYMBOL(__get_mtd_device);
 EXPORT_SYMBOL(register_mtd_user);
Index: include/linux/mtd/mtd.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/mtd.h,v
retrieving revision 1.38
diff -u -b -B -w -p -u -r1.38 mtd.h
--- include/linux/mtd/mtd.h	12 Jan 2003 16:30:19 -0000	1.38
+++ include/linux/mtd/mtd.h	12 Feb 2003 13:25:10 -0000
@@ -224,6 +224,7 @@ struct mtd_info {
 	/* Kernel-side ioctl definitions */
 
 extern int add_mtd_device(struct mtd_info *mtd);
+extern int add_mtd_device_full(struct mtd_info *mtd, int minor);
 extern int del_mtd_device (struct mtd_info *mtd);
 
 extern struct mtd_info *__get_mtd_device(struct mtd_info *mtd, int num);

--=-BgIlVM/kP+dbhVmQMtO1--
