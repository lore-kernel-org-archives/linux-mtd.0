Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPFkR-00013s-TW
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 05:21:25 -0500
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l28ALCel012236
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 12:21:19 +0200
Message-ID: <45EFE35C.70604@nokia.com>
Date: Thu, 08 Mar 2007 12:20:12 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] Correct partition failed erase address
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If an erase operation fails, the address at which the
failure occurred is returned by the driver.  The MTD
partition must adjust this address (by subtracting the
partition offset) before returning to the caller.
This was not happening, which caused JFFS2 to mark
the wrong block bad!

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/mtdpart.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 633def3..476fbb6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -200,6 +200,11 @@ static int part_erase (struct mtd_info *
 		return -EINVAL;
 	instr->addr += part->offset;
 	ret = part->master->erase(part->master, instr);
+	if (ret) {
+		if (instr->fail_addr != 0xffffffff)
+			instr->fail_addr -= part->offset;
+		instr->addr -= part->offset;
+	}
 	return ret;
 }
 
@@ -559,4 +564,3 @@ EXPORT_SYMBOL_GPL(deregister_mtd_parser)
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Nicolas Pitre <nico@cam.org>");
 MODULE_DESCRIPTION("Generic support for partitioning of MTD devices");
-
-- 
1.4.3
