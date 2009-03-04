Message-Id: <200903042001.n24K1eFx028795@imap1.linux-foundation.org>
Subject: [patch 13/15] mtd: we don't need no misc devices
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 04 Mar 2009 12:01:40 -0800
Cc: akpm@linux-foundation.org, dbrownell@users.sourceforge.net,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Remove <linux/miscdevice.h> from various drivers which don't actually use
any of its contents.  There are still a number of these left in
arch-specific bits of the tree.

(Found by diffing results of "grep -rl" for linux/miscdevice.h and for
misc_register, examining the differences, and verifying removals with a
build test.)

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/devices/doc2000.c     |    1 -
 drivers/mtd/devices/doc2001.c     |    1 -
 drivers/mtd/devices/doc2001plus.c |    1 -
 drivers/mtd/devices/docecc.c      |    1 -
 drivers/mtd/inftlmount.c          |    1 -
 drivers/mtd/nftlcore.c            |    1 -
 6 files changed, 6 deletions(-)

diff -puN drivers/mtd/devices/doc2000.c~mtd-we-dont-need-no-misc-devices drivers/mtd/devices/doc2000.c
--- a/drivers/mtd/devices/doc2000.c~mtd-we-dont-need-no-misc-devices
+++ a/drivers/mtd/devices/doc2000.c
@@ -10,7 +10,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
diff -puN drivers/mtd/devices/doc2001.c~mtd-we-dont-need-no-misc-devices drivers/mtd/devices/doc2001.c
--- a/drivers/mtd/devices/doc2001.c~mtd-we-dont-need-no-misc-devices
+++ a/drivers/mtd/devices/doc2001.c
@@ -10,7 +10,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
diff -puN drivers/mtd/devices/doc2001plus.c~mtd-we-dont-need-no-misc-devices drivers/mtd/devices/doc2001plus.c
--- a/drivers/mtd/devices/doc2001plus.c~mtd-we-dont-need-no-misc-devices
+++ a/drivers/mtd/devices/doc2001plus.c
@@ -14,7 +14,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
diff -puN drivers/mtd/devices/docecc.c~mtd-we-dont-need-no-misc-devices drivers/mtd/devices/docecc.c
--- a/drivers/mtd/devices/docecc.c~mtd-we-dont-need-no-misc-devices
+++ a/drivers/mtd/devices/docecc.c
@@ -26,7 +26,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
diff -puN drivers/mtd/inftlmount.c~mtd-we-dont-need-no-misc-devices drivers/mtd/inftlmount.c
--- a/drivers/mtd/inftlmount.c~mtd-we-dont-need-no-misc-devices
+++ a/drivers/mtd/inftlmount.c
@@ -28,7 +28,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
diff -puN drivers/mtd/nftlcore.c~mtd-we-dont-need-no-misc-devices drivers/mtd/nftlcore.c
--- a/drivers/mtd/nftlcore.c~mtd-we-dont-need-no-misc-devices
+++ a/drivers/mtd/nftlcore.c
@@ -15,7 +15,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
_
