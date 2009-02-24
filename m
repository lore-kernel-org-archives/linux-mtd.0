Received: from smtp127.sbc.mail.sp1.yahoo.com ([69.147.65.186])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lc8Jy-00050P-Ed
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 01:12:37 +0000
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch/RESEND 2.6.29-rc3] MTD: we don't need no misc devices
Content-Disposition: inline
From: David Brownell <david-b@pacbell.net>
Date: Tue, 24 Feb 2009 15:11:57 -0800
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200902241511.57445.david-b@pacbell.net>
Cc: lkml <linux-kernel@vger.kernel.org>
Reply-To: dbrownell@users.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

Remove <linux/miscdevice.h> from various drivers which don't
actually use any of its contents.  There are still a number
of these left in arch-specific bits of the tree.

(Found by diffing results of "grep -rl" for linux/miscdevice.h
and for misc_register, examining the differences, and verifying
removals with a build test.)

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
Random stuff that needs to be emptied from my patch queue.  :)

 drivers/mtd/devices/doc2000.c     |    1 -
 drivers/mtd/devices/doc2001.c     |    1 -
 drivers/mtd/devices/doc2001plus.c |    1 -
 drivers/mtd/devices/docecc.c      |    1 -
 drivers/mtd/inftlmount.c          |    1 -
 drivers/mtd/nftlcore.c            |    1 -
 6 files changed, 6 deletions(-)

--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -10,7 +10,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -10,7 +10,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -14,7 +14,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
--- a/drivers/mtd/devices/docecc.c
+++ b/drivers/mtd/devices/docecc.c
@@ -26,7 +26,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -28,7 +28,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -15,7 +15,6 @@
 #include <asm/errno.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
-#include <linux/miscdevice.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
