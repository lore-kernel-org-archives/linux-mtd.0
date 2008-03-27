Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JezVD-0004cB-MB
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 21:19:16 +0000
From: David Brownell <david-b@pacbell.net>
Date: Thu, 27 Mar 2008 14:18:47 -0700
MIME-Version: 1.0
Subject: Fwd: [PATCH 01/10] mtd: maps/physmap: fix oops in
	suspend/resume/shutdown ops
To: linux-mtd@lists.infradead.org
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_48A7HHcHiI7uD/D"
Message-Id: <200803271418.48181.david-b@pacbell.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_48A7HHcHiI7uD/D
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This fixes a regresssion in 2.6.25 ... presumably it's a better
fix than the hack I came up with.  I think this regression should
be fixed before 2.6.25-final freezes.


--Boundary-00=_48A7HHcHiI7uD/D
Content-Type: text/plain; charset="us-ascii";
	name="[PATCH 01/10] mtd: maps/physmap: fix oops in
	suspend/resume/shutdown ops"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*=

From: Anton Vorontsov <cbouatmailru@gmail.com>

- - - -
# reboot
...
[   42.351266] Flash device refused suspend due to active operation (state 0)
[   42.358195] Unable to handle kernel NULL pointer dereference at virtual address 00000078
[   42.360060] pgd = c7d9c000
[   42.362769] [00000078] *pgd=a7d8d031, *pte=00000000, *ppte=00000000
[   42.372902] Internal error: Oops: 17 [#1]
[   42.376911] Modules linked in:
[   42.379980] CPU: 0    Not tainted  (2.6.25-rc2-10642-ge8f2594-dirty #73)
[   42.380000] PC is at physmap_flash_shutdown+0x28/0x54
...
[   42.380000] Backtrace:
[   42.380000] [<c0130c1c>] (physmap_flash_shutdown+0x0/0x54) from [<c01207c0>] (platform_drv_shutdown+0x20/0x24)
[   42.380000]  r5:28121969 r4:c0229e08
[   42.380000] [<c01207a0>] (platform_drv_shutdown+0x0/0x24) from [<c011cd40>] (device_shutdown+0x60/0x88)
[   42.380000] [<c011cce0>] (device_shutdown+0x0/0x88) from [<c003e8a4>] (kernel_restart_prepare+0x2c/0x3c)
[   42.380000]  r4:00000000
[   42.380000] [<c003e878>] (kernel_restart_prepare+0x0/0x3c) from [<c003ea00>] (kernel_restart+0x14/0x48)
[   42.380000] [<c003e9ec>] (kernel_restart+0x0/0x48) from [<c003fdc0>] (sys_reboot+0xe8/0x1f8)
[   42.380000]  r4:01234567
[   42.380000] [<c003fcd8>] (sys_reboot+0x0/0x1f8) from [<c001aa00>] (ret_fast_syscall+0x0/0x2c)
[   42.380000]  r7:00000058 r6:00000004 r5:00000001 r4:00000000
[   42.380000] Code: 0a000009 e7953004 e1a00003 e1a0e00f (e593f078)
[   42.650051] ---[ end trace 6d6c26a0fc3141de ]---
Segmentation fault
INIT: no more processes left in this runlevel
- - - -

While looping for mtd[i]s, we should stop at the mtd[i] == NULL.

This patch also removes unnecessary "if (info)" checks:
suspend/resume/shutdown ops are executed only if probe() is succeeded,
so info is guaranteed to be !NULL.

Signed-off-by: Anton Vorontsov <cbouatmailru@gmail.com>
---
 drivers/mtd/maps/physmap.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index f00e04e..bc4649a 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -202,9 +202,8 @@ static int physmap_flash_suspend(struct platform_device *dev, pm_message_t state
 	int ret = 0;
 	int i;
 
-	if (info)
-		for (i = 0; i < MAX_RESOURCES; i++)
-			ret |= info->mtd[i]->suspend(info->mtd[i]);
+	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
+		ret |= info->mtd[i]->suspend(info->mtd[i]);
 
 	return ret;
 }
@@ -214,9 +213,9 @@ static int physmap_flash_resume(struct platform_device *dev)
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
 	int i;
 
-	if (info)
-		for (i = 0; i < MAX_RESOURCES; i++)
-			info->mtd[i]->resume(info->mtd[i]);
+	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
+		info->mtd[i]->resume(info->mtd[i]);
+
 	return 0;
 }
 
@@ -225,8 +224,8 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
 	int i;
 
-	for (i = 0; i < MAX_RESOURCES; i++)
-		if (info && info->mtd[i]->suspend(info->mtd[i]) == 0)
+	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
+		if (info->mtd[i]->suspend(info->mtd[i]) == 0)
 			info->mtd[i]->resume(info->mtd[i]);
 }
 #else
-- 
1.5.4.3

--Boundary-00=_48A7HHcHiI7uD/D--
