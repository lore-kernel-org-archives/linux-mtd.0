Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xh5FX-0007U5-F5
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 23:23:28 +0000
Received: by mail-wg0-f41.google.com with SMTP id b13so193281wgh.0
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 16:23:04 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF chips
Date: Thu, 23 Oct 2014 01:23:01 +0200
Message-Id: <1414020181-8855-1-git-send-email-andrea.adami@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>,
 Andrea Adami <andrea.adami@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After '#echo mem > /sys/power/state' some devices can not be properly resumed
because apparently the MTD Partition Configuration Register has been reset
to default thus the rootfs cannot be mounted cleanly on resume.
An example of this can be found in the SA-1100 Developer's Manual at 9.5.3.3
where the second step of the Sleep Shutdown Sequence is described:
"An internal reset is applied to the SA-1100. All units are reset...".

As workaround we refresh the PCR value as done initially on chip setup.

This behavior and the fix are confirmed by our tests done on 2 different Zaurus
collie units with kernel 3.17.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index a7543ba..59e2355 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2590,6 +2590,8 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
 
 		/* Go to known state. Chip may have been power cycled */
 		if (chip->state == FL_PM_SUSPENDED) {
+			/* Refresh LH28F640BF Partition Config. Register */
+			fixup_LH28F640BF(mtd);
 			map_write(map, CMD(0xFF), cfi->chips[i].start);
 			chip->oldstate = chip->state = FL_READY;
 			wake_up(&chip->wq);
-- 
1.9.1
