Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KViPg-00052B-4q
	for linux-mtd@lists.infradead.org; Wed, 20 Aug 2008 07:47:28 +0000
Received: by wf-out-1314.google.com with SMTP id 28so321146wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 00:47:26 -0700 (PDT)
Message-ID: <48ABCC0B.40607@gmail.com>
Date: Wed, 20 Aug 2008 00:47:23 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [MTD] mtdchar.c: Fix regression in MEMGETREGIONINFO ioctl()
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Zev Weiss <zevweiss@gmail.com>

The MEMGETREGIONINFO ioctl() in mtdchar.c was clobbering user memory by
overwriting more than intended, due to the size of struct
mtd_erase_region_info changing in commit
0ecbc81adfcb9f15f86b05ff576b342ce81bbef8.

Fix uses a member-by-member copy into a local struct region_info_user,
which is then copy_to_user()'d (and matches the size correctly by being
of the same type as the pointer passed in the ioctl() call).

Signed-off-by: Zev Weiss <zevweiss@gmail.com>
Tested-by: Zev Weiss <zevweiss@gmail.com>
---
I had been having some problems with userspace memory corruption, and traced
them to a MEMGETREGIONINFO ioctl() on an MTD device.  I applied this patch and
it seems to fix the problem, though I am not an expert and there may be a more
correct way to go about doing this.  I'm also new at submitting patches, so
hopefully I haven't screwed up the patch-submission etiquette too
horrifically.

  drivers/mtd/mtdchar.c |   11 +++++++++--
  1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 13cc67a..0acb135 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -411,14 +411,21 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
  	case MEMGETREGIONINFO:
  	{
  		struct region_info_user ur;
+		struct mtd_erase_region_info *kr;

  		if (copy_from_user(&ur, argp, sizeof(struct region_info_user)))
  			return -EFAULT;

  		if (ur.regionindex >= mtd->numeraseregions)
  			return -EINVAL;
-		if (copy_to_user(argp, &(mtd->eraseregions[ur.regionindex]),
-				sizeof(struct mtd_erase_region_info)))
+
+		kr = &(mtd->eraseregions[ur.regionindex]);
+
+		ur.offset = kr->offset;
+		ur.erasesize = kr->erasesize;
+		ur.numblocks = kr->numblocks;
+
+		if (copy_to_user(argp, &ur, sizeof(struct region_info_user)))
  			return -EFAULT;
  		break;
  	}
