Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CNX9F-0004XT-HG
	for linux-mtd@lists.infradead.org; Fri, 29 Oct 2004 09:50:34 -0400
From: Ian Campbell <icampbell@arcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1099057831.24918.1684.camel@icampbell-debian>
Mime-Version: 1.0
Date: Fri, 29 Oct 2004 14:50:31 +0100
Content-Transfer-Encoding: 7bit
Subject: [PATCH 1/2] fix detection of redboot fis partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think I sent this via our regular mail-server (that adds legal rubbish
to the bottom of mails) the first time so it won't get through to the
list. Apologies if it comes through twice.

Hi all,

The redboot partitioning code currently searches for a FIS table entry
named "RedBoot" (including the trailing \0) in one of the first three
entries to try and verify that the sector it is looking at really is a
FIS partition table.

Firstly it fails when RedBoot is stored in some other Flash chip such as
a boot PROM, in this case there is no "RedBoot" entry in the partition
table. However there will always be a "FIS directory" entry in any valid
FIS directory.
        
Secondly it can fail since the RedBoot entry is not always in the first
3 slots -- this can happen for example on an x86 based platform where
the processor expects the boot device to be at the top of memory rather
than the bottom and so RedBoot is at the end of the flash device.
Equally when using "FIS directory" as the entry to search for it very
likely is not in the first three since the directory is typically at the
end of the flash.

The patch (against BK) below sorts these out. Is it OK to commit to MTD
CVS and then send to Linus?

Ian.

%patch
Index: 2.6-bk/drivers/mtd/redboot.c
===================================================================
--- 2.6-bk.orig/drivers/mtd/redboot.c	2004-09-15 11:00:22.000000000 +0100
+++ 2.6-bk/drivers/mtd/redboot.c	2004-10-29 14:21:33.018453911 +0100
@@ -50,6 +50,7 @@
 	char *nullname;
 	int namelen = 0;
 	int nulllen = 0;
+	int numslots;
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	static char nullstring[] = "unallocated";
 #endif
@@ -71,12 +72,16 @@
 		goto out;
 	}
 
-	/* RedBoot image could appear in any of the first three slots */
-	for (i = 0; i < 3; i++) {
-		if (!memcmp(buf[i].name, "RedBoot", 8))
+	numslots = (master->erasesize / sizeof(struct fis_image_desc));
+	for (i = 0; i < numslots; i++) {
+		if (buf[i].name[0] == 0xff) {
+			i = numslots;
+			break;
+		}
+		if (!memcmp(buf[i].name, "FIS directory", 14))
 			break;
 	}
-	if (i == 3) {
+	if (i == numslots) {
 		/* Didn't find it */
 		printk(KERN_NOTICE "No RedBoot partition table detected in %s\n",
 		       master->name);
@@ -84,7 +89,7 @@
 		goto out;
 	}
 
-	for (i = 0; i < master->erasesize / sizeof(struct fis_image_desc); i++) {
+	for (i = 0; i < numslots; i++) {
 		struct fis_list *new_fl, **prev;
 
 		if (buf[i].name[0] == 0xff)



-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200
-- 
Ian Campbell, Senior Design Engineer
                                        Web: http://www.arcom.com
Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200
