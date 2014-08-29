Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNJwc-0007ds-4U
 for linux-mtd@lists.infradead.org; Fri, 29 Aug 2014 11:02:14 +0000
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: denali: fix include guard and license block of denali.h
Date: Fri, 29 Aug 2014 20:00:51 +0900
Message-Id: <1409310051-25726-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.m@jp.panasonic.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It looks like this header file is a concatenation of two headers.
Anyway, the include guard should be renamed and placed at the correct
postion and the license block in the middle should be deleted.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

 drivers/mtd/nand/denali.h | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 9668174..145bf88 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -17,6 +17,9 @@
  *
  */
 
+#ifndef __DENALI_H__
+#define __DENALI_H__
+
 #include <linux/mtd/nand.h>
 
 #define DEVICE_RESET				0x0
@@ -400,28 +403,6 @@
 #define ONFI_BLOOM_TIME         1
 #define MODE5_WORKAROUND        0
 
-/* lld_nand.h */
-/*
- * NAND Flash Controller Device Driver
- * Copyright (c) 2009, Intel Corporation and its suppliers.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
- *
- */
-
-#ifndef _LLD_NAND_
-#define _LLD_NAND_
 
 #define MODE_00    0x00000000
 #define MODE_01    0x04000000
@@ -499,4 +480,4 @@ struct denali_nand_info {
 extern int denali_init(struct denali_nand_info *denali);
 extern void denali_remove(struct denali_nand_info *denali);
 
-#endif /*_LLD_NAND_*/
+#endif /* __DENALI_H__ */
-- 
1.9.1
