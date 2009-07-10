Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MPFE4-0000Dd-Mb
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 12:29:23 +0000
Subject: Re: gluebi problems on 2.6.28 backport
From: Artem Bityutskiy <dedekind@infradead.org>
To: Holger Brunck <holger.brunck@keymile.com>
In-Reply-To: <1247152762.10521.71.camel@pc005093.de.keymile.net>
References: <1247152762.10521.71.camel@pc005093.de.keymile.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Jul 2009 15:27:01 +0300
Message-Id: <1247228821.20721.368.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2009-07-09 at 17:19 +0200, Holger Brunck wrote:
> Hi all, 
> we are working on a powerpc (ppc 8xx) based system and we use ubi/ubifs
> on a NOR flash device. Our kernel version is 2.6.28.
> 
> I have tried to integrate the newest UBI patches from the backport for
> 2.6.28 from:  
> http://git.infradead.org/users/dedekind/ubifs-v2.6.28.git

Note, I've just back-ported and pushed all latest updates to the
back-port trees.

> Unfortunately the second patch did not compile standalone for that, both
> patches can cause the problem. 

Yeah, for mainline this problem does not exist, though.

> Unable to handle kernel paging request for data at address 0x00000000
> Faulting instruction address: 0xc0197cec
> Oops: Kernel access of bad area, sig: 11 [#1]
> PREEMPT MGSUVD
> Modules linked in:
> NIP: c0197cec LR: c019e154 CTR: c019e084
> REGS: c38f3e60 TRAP: 0300   Not tainted  (2.6.28-b001-dev-3.1.3)
> MSR: 00009032 <EE,ME,IR,DR>  CR: 33555899  XER: c0000000
> DAR: 00000000, DSISR: c0000000
> TASK = c3846800[126] 'mtdblockd' THREAD: c38f2000
> GPR00: c019e154 c38f3f10 c3846800 00000000 00000001 c3a83800 0000a880
> 00000200 
> GPR08: 00000000 00015700 00000000 0001ff80 0000a880 04110900 03e7ab00
> 00000000 
> GPR16: 03e6fa28 03e747f0 00000000 00000000 00000000 c00409b8 c02c5ff0
> c38f3f78 
> GPR24: 00000200 c3a83800 c3954d90 00000001 c3a83800 c3954d90 00000200
> 00000200 
> NIP [c0197cec] ubi_leb_read+0x18/0x138
> LR [c019e154] gluebi_read+0xd0/0x120
> Call Trace:
> [c38f3f10] [00001032] 0x1032 (unreliable)
> [c38f3f30] [c019e154] gluebi_read+0xd0/0x120
> [c38f3f70] [c01869cc] mtdblock_readsect+0xdc/0x120
> [c38f3fb0] [c0185d2c] mtd_blktrans_thread+0x198/0x2a4
> [c38f3fe0] [c0040a04] kthread+0x4c/0x88
> [c38f3ff0] [c000d530] kernel_thread+0x4c/0x68
> Instruction dump:
> 3860ffe2 80010014 83e1000c 7c0803a6 38210010 4e800020 7c0802a6 9421ffe0 
> 7ccc3378 bf810010 90010024 7cbc2b78 <83e30000> 7cea3b78 83bf0170
> 7d094378 

The problem is that the mtd_blkdevs module does not open MTD devices
before working with them. Gluebi changes revealed this problem. Below
is the patch which should fix the issue. Please, try and let me know
if it helps.

======================================================================

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] mtd: blkdevs: do not for get to get MTD devices

Nowadays MTD devices have to be "get" before they can be
used. This has to be done with 'put_mtd_device()'. The
'blktrans_open()' function did not do this and instead
used 'try_module_get()'. Fixe this.

Since 'put_mtd_device()' already gets the module, extra
'try_module_get()' is not needed.

This fixes oops when one tries to use mtdbloc on tope of
gluebi.

Reported-by: Holger Brunck <holger.brunck@keymile.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtd_blkdevs.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 1409f01..2f55242 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -139,7 +139,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	struct mtd_blktrans_ops *tr = dev->tr;
 	int ret = -ENODEV;
 
-	if (!try_module_get(dev->mtd->owner))
+	if (!get_mtd_device(NULL, dev->mtd->index))
 		goto out;
 
 	if (!try_module_get(tr->owner))
@@ -153,7 +153,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	ret = 0;
 	if (tr->open && (ret = tr->open(dev))) {
 		dev->mtd->usecount--;
-		module_put(dev->mtd->owner);
+		put_mtd_device(dev->mtd);
 	out_tr:
 		module_put(tr->owner);
 	}
@@ -172,7 +172,7 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 
 	if (!ret) {
 		dev->mtd->usecount--;
-		module_put(dev->mtd->owner);
+		put_mtd_device(dev->mtd);
 		module_put(tr->owner);
 	}
 
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
