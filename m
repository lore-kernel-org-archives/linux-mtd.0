Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACU5a-0007xZ-Oy
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 02:16:34 +0100
Date: Wed, 22 Oct 2003 18:15:28 -0700
From: Jun Sun <jsun@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20031022181528.T19834@mvista.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: multipart/mixed; boundary="5xSkJheCpeK0RUEJ"
Subject: [PATCH] remove unnecessary inclusion of <asm/setup.h>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


I don't see any purpose of including this file.  Furthermore
<asm/setup.h> does not even exist on MIPS and other arches.

Jun

--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="remove-bogus-asm-setup.h-inclusion.patch"

diff -Nru linux/drivers/mtd/cmdlinepart.c.orig linux/drivers/mtd/cmdlinepart.c
--- linux/drivers/mtd/cmdlinepart.c.orig	Mon Jul 21 08:14:02 2003
+++ linux/drivers/mtd/cmdlinepart.c	Wed Oct 22 15:43:03 2003
@@ -29,7 +29,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/compatmac.h>
-#include <asm/setup.h>
 #include <linux/bootmem.h>
 
 /* error message prefix */

--5xSkJheCpeK0RUEJ--
