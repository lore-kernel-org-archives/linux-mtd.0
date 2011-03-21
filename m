Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q1gW1-0006E6-RK
	for linux-mtd@lists.infradead.org; Mon, 21 Mar 2011 14:55:30 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2LEtQap028078
	for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2011 16:55:27 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: make the control character device non-seekable
Date: Mon, 21 Mar 2011 16:58:11 +0200
Message-Id: <1300719491-15157-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch makes the UBI control device (/dev/ubi_ctrl) non-seekable.
The seek operation does is not applicable to this file, so it is
cleaner to explicitly return error (which the added 'no_llseek()')
does than trying to change the position (which the removed
'default_llseek()' does).

This is an API break, but the only known user of this interface is
mtd-utils which does not need the seeking functionality. And any app
which relies on this is broken, but I'm not aware of such apps.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index af9fb0f..9a17032 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -1100,5 +1100,5 @@ const struct file_operations ubi_ctrl_cdev_operations = {
 	.owner          = THIS_MODULE,
 	.unlocked_ioctl = ctrl_cdev_ioctl,
 	.compat_ioctl   = ctrl_cdev_compat_ioctl,
-	.llseek		= noop_llseek,
+	.llseek		= no_llseek,
 };
-- 
1.7.2.3
