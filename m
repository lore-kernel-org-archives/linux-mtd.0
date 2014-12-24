Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3kng-0003pO-Ab
 for linux-mtd@lists.infradead.org; Wed, 24 Dec 2014 12:12:25 +0000
Message-ID: <549AAD57.8020307@huawei.com>
Date: Wed, 24 Dec 2014 20:11:03 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: ubi_check_volume() hung on a single core system
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When I was running mtd-utils/tests/ubi-tests/io_basic.c on a
single core system, watchdog reset the OS and printed:

ERR:The task of feeding senior watchdog overtimes, system will reset!

io_basic.c tests the UBI_IOCVOLUP feature of UBI driver. UBI
will perform ubi_check_volume() after updating operation is
finished. The used ebs will be scanned for a static volume in
this function.

If I run schedule() in the loop of eraseblock scanning, the
*reset* not happen and the system works in right condition.

diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index dbda77e..f4f478c 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -74,6 +74,9 @@ int ubi_check_volume(struct ubi_device *ubi, int vol_id)
        for (i = 0; i < vol->used_ebs; i++) {
                int size;

+               set_current_state(TASK_UNINTERRUPTIBLE);
+               schedule_timeout(HZ/10);
+
                if (i == vol->used_ebs - 1)
                        size = vol->last_eb_bytes;
                else



I think this error can't be re-created on a multi-core system.
It can only happen on a single core system. This directly
schedule I modified would hurt the performance of volume check.

Does anyone interested in this issue?


Thanks,
Hu
