Received: from mx01.hansenet.de ([213.191.73.25] helo=webmail.hansenet.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IUusU-0003An-Vz
	for linux-mtd@lists.infradead.org; Mon, 10 Sep 2007 21:49:26 -0400
Received: from [80.171.14.88] (80.171.14.88) by webmail.hansenet.de
	(7.3.118.12) (authenticated as mbx20228207@koeller-hh.org)
	id 46E1A14F0033FF4F for linux-mtd@lists.infradead.org;
	Tue, 11 Sep 2007 03:49:17 +0200
Received: from localhost.koeller.dyndns.org (localhost.koeller.dyndns.org
	[127.0.0.1])
	by mail.koeller.dyndns.org (Postfix) with ESMTP id 92E4E47A14
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Sep 2007 03:49:16 +0200 (CEST)
From: Thomas Koeller <thomas.koeller@baslerweb.com>
Date: Tue, 11 Sep 2007 02:38:04 +0200
Subject: [PATCH] excite_nandflash: Fixed compilation error
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200709110238.05079.thomas.koeller@baslerweb.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added a missing semicolon that caused a compilation error
if built as a module.

Signed-off-by: Thomas Koeller <thomas.koeller@baslerweb.com>
---
 drivers/mtd/nand/excite_nandflash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/excite_nandflash.c 
b/drivers/mtd/nand/excite_nandflash.c
index 7e9afc4..acc334f 100644
--- a/drivers/mtd/nand/excite_nandflash.c
+++ b/drivers/mtd/nand/excite_nandflash.c
@@ -245,4 +245,4 @@ module_exit(excite_nand_exit);
 MODULE_AUTHOR("Thomas Koeller <thomas.koeller@baslerweb.com>");
 MODULE_DESCRIPTION("Basler eXcite NAND-Flash driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION(EXCITE_NANDFLASH_VERSION)
+MODULE_VERSION(EXCITE_NANDFLASH_VERSION);
-- 
1.5.1.2
