Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh4fR-0005oV-Kt
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 07:33:13 -0500
Received: from atlantis.8hz.com (localhost [127.0.0.1])
	by atlantis.8hz.com (Postfix) with ESMTP id 536DCBAC3
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Nov 2005 13:33:02 +0100 (CET)
Received: (from sean@localhost)
	by atlantis.8hz.com (8.13.1/8.13.1/Submit) id jATCX2A9080135
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 13:33:02 +0100 (CET)
	(envelope-from sean@mess.org)
Date: Tue, 29 Nov 2005 13:33:02 +0100
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051129123301.GA79821@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [PATCH] major assigned for rfd ftl
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lanana has assigned major 256 to the RFD FTL. This is the first 2.6 only
major, since it is >255. See:

http://www.lanana.org/docs/device-list/devices-2.6+.txt

Would it be possible to push this to Linus for inclusion inc 2.6.15? It
would be nice if the major doesn't change after 2.6.15 is released.

Signed-off-by: Sean Young <sean@mess.org>
--
diff -u -r1.5 -r1.6
--- a/drivers/mtd/rfd_ftl.c	7 Nov 2005 11:14:21 -0000	1.5
+++ b/drivers/mtd/rfd_ftl.c	29 Nov 2005 11:47:57 -0000	1.6
@@ -3,7 +3,7 @@
  *
  * Copyright (C) 2005  Sean Young <sean@mess.org>
  *
- * $Id: rfd_ftl.c,v 1.5 2005/11/07 11:14:21 gleixner Exp $
+ * $Id: rfd_ftl.c,v 1.6 2005/11/29 11:47:57 sean Exp $
  *
  * This type of flash translation layer (FTL) is used by the Embedded BIOS
  * by General Software. It is known as the Resident Flash Disk (RFD), see:
@@ -29,11 +29,9 @@
 
 #define PREFIX "rfd_ftl: "
 
-/* Major device # for FTL device */
-
-/* A request for this major has been sent to device@lanana.org */
+/* This major has been assigned by device@lanana.org */
 #ifndef RFD_FTL_MAJOR
-#define RFD_FTL_MAJOR		95
+#define RFD_FTL_MAJOR		256
 #endif
 
 /* Maximum number of partitions in an FTL region */
