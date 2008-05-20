Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JyUlI-0007ve-Gn
	for linux-mtd@lists.infradead.org; Tue, 20 May 2008 16:32:28 +0000
Subject: NAND: S3C2410: Remove changelog and tidy header
Message-Id: <20080520163227.176557005@fluff.org.uk>
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Content-Disposition: inline;
	filename=simtec/simtec-drivers-mtd-s3c2410-cleanheader.patch
Date: Tue, 20 May 2008 17:32:27 +0100
Cc: Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The changelog on the driver is superflous given this
is being kept under revision control. Remove the other
cruft in the header and update the copyright and the
supported device list.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

Index: linux-2.6.26-rc3-quilt1/drivers/mtd/nand/s3c2410.c
===================================================================
--- linux-2.6.26-rc3-quilt1.orig/drivers/mtd/nand/s3c2410.c	2008-05-20 17:17:10.000000000 +0100
+++ linux-2.6.26-rc3-quilt1/drivers/mtd/nand/s3c2410.c	2008-05-20 17:17:48.000000000 +0100
@@ -1,26 +1,10 @@
 /* linux/drivers/mtd/nand/s3c2410.c
  *
- * Copyright (c) 2004,2005 Simtec Electronics
- *	http://www.simtec.co.uk/products/SWLINUX/
+ * Copyright (c) 2004,2005,2008 Simtec Electronics
+ *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
  *
- * Samsung S3C2410/S3C240 NAND driver
- *
- * Changelog:
- *	21-Sep-2004  BJD  Initial version
- *	23-Sep-2004  BJD  Multiple device support
- *	28-Sep-2004  BJD  Fixed ECC placement for Hardware mode
- *	12-Oct-2004  BJD  Fixed errors in use of platform data
- *	18-Feb-2005  BJD  Fix sparse errors
- *	14-Mar-2005  BJD  Applied tglx's code reduction patch
- *	02-May-2005  BJD  Fixed s3c2440 support
- *	02-May-2005  BJD  Reduced hwcontrol decode
- *	20-Jun-2005  BJD  Updated s3c2440 support, fixed timing bug
- *	08-Jul-2005  BJD  Fix OOPS when no platform data supplied
- *	20-Oct-2005  BJD  Fix timing calculation bug
- *	14-Jan-2006  BJD  Allow clock to be stopped when idle
- *
- * $Id: s3c2410.c,v 1.23 2006/04/01 18:06:29 bjd Exp $
+ * Samsung S3C2410/S3C2440/S3C2412 NAND driver
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
