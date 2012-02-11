Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rw4fX-0002AM-VX
 for linux-mtd@lists.infradead.org; Sat, 11 Feb 2012 04:34:40 +0000
Received: by pbcun1 with SMTP id un1so2071742pbc.36
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2012 20:34:38 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] libmtd: fix mtd_write() issues for large data-only writes
Date: Fri, 10 Feb 2012 20:35:05 -0800
Message-Id: <1328934905-27007-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ioctl(MEMWRITE) is implemented with memdup_user(), and so it allocates
kernel memory in contiguous regions. This limits its usefulness for large
amounts of data, since contiguous kernel memory can become scarce. I have
experienced "out of memory" problems with ubiformat, for instance, which
writes in eraseblock-sized regions:

  ...
  ubiformat: flashing eraseblock 12 -- 72 % complete
  ubiformat: page allocation failure.
  order:8, mode:0xd0
  Call Trace:
  [<8043fa7c>] dump_stack+0x8/0x34
  [<8008c940>] __alloc_pages_nodemask+0x408/0x618
  [<800bd748>] cache_alloc_refill+0x400/0x730
  [<800bdbbc>] __kmalloc+0x144/0x154
  [<8009cae4>] memdup_user+0x24/0x94
  [<802d04e4>] mtd_ioctl+0xba8/0xbd0
  [<802d0544>] mtd_unlocked_ioctl+0x38/0x5c
  [<800d43c0>] do_vfs_ioctl+0xa4/0x6e4
  [<800d4a44>] sys_ioctl+0x44/0xa0
  [<8000f95c>] stack_done+0x20/0x40
  ...
  libmtd: error!: MEMWRITE ioctl failed for eraseblock 12 (mtd0)
          error 12 (Cannot allocate memory)
  ubiformat: error!: cannot write eraseblock 12
             error 12 (Cannot allocate memory)

This error can be mitigated for now by only using ioctl(MEMWRITE) when we
need to write OOB data, since we can only do this in small transactions
anyway. Then, data-only transactions (like those originating from
ubiformat) can be carried out with write() calls.

This issue can also be solved within the kernel ioctl(), but either way,
this patch is still useful, since write() is more straightforward (and
efficient?) than ioctl() for data-only writes.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd.c |   28 ++++++++++++++--------------
 1 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index fb4586c..c4836df 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1147,21 +1147,21 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
 	/* Calculate seek address */
 	seek = (off_t)eb * mtd->eb_size + offs;
 
-	ops.start = seek;
-	ops.len = len;
-	ops.ooblen = ooblen;
-	ops.usr_data = (uint64_t)(unsigned long)data;
-	ops.usr_oob = (uint64_t)(unsigned long)oob;
-	ops.mode = mode;
-
-	ret = ioctl(fd, MEMWRITE, &ops);
-	if (ret == 0)
-		return 0;
-	else if (errno != ENOTTY && errno != EOPNOTSUPP)
-		return mtd_ioctl_error(mtd, eb, "MEMWRITE");
-
-	/* Fall back to old methods if necessary */
 	if (oob) {
+		ops.start = seek;
+		ops.len = len;
+		ops.ooblen = ooblen;
+		ops.usr_data = (uint64_t)(unsigned long)data;
+		ops.usr_oob = (uint64_t)(unsigned long)oob;
+		ops.mode = mode;
+
+		ret = ioctl(fd, MEMWRITE, &ops);
+		if (ret == 0)
+			return 0;
+		else if (errno != ENOTTY && errno != EOPNOTSUPP)
+			return mtd_ioctl_error(mtd, eb, "MEMWRITE");
+
+		/* Fall back to old OOB ioctl() if necessary */
 		if (mode == MTD_OPS_AUTO_OOB)
 			if (legacy_auto_oob_layout(mtd, fd, ooblen, oob))
 				return -1;
-- 
1.7.5.4
