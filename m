Received: from red.fback.net ([80.53.236.154])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gc5mT-0007ul-MY
	for linux-mtd@lists.infradead.org; Mon, 23 Oct 2006 15:48:24 -0400
Received: from red (fback@localhost [127.0.0.1])
	by red.fback.net (8.13.8/8.13.8/Debian-2) with SMTP id k9NJm7V7032504
	for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2006 21:48:07 +0200
Date: Mon, 23 Oct 2006 21:48:07 +0200
From: =?iso-8859-2?Q?Bart=B3omiej?= Ochman <fback@home.fback.net>
To: linux-mtd@lists.infradead.org
Subject: Patch to support (some?) flash chips from Samsung.
Message-ID: <20061023194806.GA32351@red.fback.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

following patch brings back support to (some?) flash chips from Samsung.
This applies cleanly against linux-2.6.17, for 2.6.18 requires only
trivial change.

The bad news is, that mtd doesn't work for these chips. It was working
with 2.4.30, under 2.4.32 it doesn't anymore. I try to investigate why,
maybe that is because -Os switch with gcc-3.4.x. What's interesting,
programming single bytes (words?) seems to work perfectly, changes to
a filesystem on a flash are valid -- files have proper contents, there
are no problems with filesystem consistency, etc). I hope tomorrow I will
have JTAG cable to see what went wrong with programming with mtd util.

Regards,
BO

--- cfi_cmdset_0002.c	2006-10-23 21:14:11.618024794 +0200
+++ cfi_cmdset_0002.c.new	2006-10-23 21:01:22.970876922 +0200
@@ -49,6 +49,7 @@
 #define MANUFACTURER_SST	0x00BF
 #define SST49LF004B	        0x0060
 #define SST49LF008A		0x005a
+#define MANUFACTURER_SAMSUNG	0x00ec
 
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
@@ -253,7 +254,21 @@
 			return NULL;
 		}
 
-		if (extp->MajorVersion != '1' ||
+		if (cfi->mfr == MANUFACTURER_SAMSUNG) {
+		    printk(KERN_NOTICE "  Samsung flash chip detected, should "
+		           "be compatibile with Amd/Fujitsu.\n");
+		    /* according to the specs, version should always be 3.3 */
+		    if (extp->MajorVersion != '3' || 
+		        extp->MinorVersion != '3') {
+		            printk(KERN_ERR "  Unknown Samsung Extended Query "
+			           "version %c.%c.\n", extp->MajorVersion,
+			           extp->MinorVersion);
+			    kfree(extp);
+			    kfree(mtd);
+			    return NULL;
+	            }
+		} /* this added support to (some?) Samsung flashes */
+		else if (extp->MajorVersion != '1' ||
 		    (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {
 			printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "
 			       "version %c.%c.\n",  extp->MajorVersion,
