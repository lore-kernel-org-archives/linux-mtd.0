Received: from adsl-110-19.38-151.net24.it ([151.38.19.110] helo=develer.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVFg9-0002RA-34
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 16:16:10 -0400
Message-ID: <40BCE3FD.4080500@develer.com>
Date: Tue, 01 Jun 2004 22:15:57 +0200
From: Bernardo Innocenti <bernie@develer.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: TRIVIAL: Fix linux/mtd/nftl.h for user-space inclusion
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Fix linux/mtd/nftl.h for user-space inclusion (required to build mtd-utils).

Please apply.

--- linux-2.6.6-uc0/include/linux/mtd/nftl.h	2004-05-10 04:33:13.000000000 +0200
+++ linux-2.6.6-uc0-develer/include/linux/mtd/nftl.h	2004-06-01 22:03:36.824225250 +0200
@@ -8,7 +8,6 @@
 #define __MTD_NFTL_H__
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/blktrans.h>
 
 /* Block Control Information */
 
@@ -76,6 +75,8 @@
 
 #ifdef __KERNEL__
 
+#include <linux/mtd/blktrans.h>
+
 /* these info are used in ReplUnitTable */
 #define BLOCK_NIL          0xffff /* last block of a chain */
 #define BLOCK_FREE         0xfffe /* free block */

-- 
  // Bernardo Innocenti - Develer S.r.l., R&D dept.
\X/  http://www.develer.com/
