Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBrNy-00075Q-Jl
	for linux-mtd@lists.infradead.org; Tue, 30 Jan 2007 06:42:51 -0500
Subject: [PATCH] [MTD] cmd001: remove ugly macros
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-px4MjfQomfYvmpM5nHRf"
Date: Tue, 30 Jan 2007 13:42:23 +0200
Message-Id: <1170157343.9477.80.camel@sauron>
Mime-Version: 1.0
Cc: Nicolas Pitre <nico@cam.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-px4MjfQomfYvmpM5nHRf
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

DQotLSANCkJlc3QgcmVnYXJkcywNCkFydGVtIEJpdHl1dHNraXkgKNCR0LjRgtGO0YbQutC40Lkg
0JDRgNGC0ZHQvCkNCg==


--=-px4MjfQomfYvmpM5nHRf
Content-Disposition: attachment; filename=cmd001-remove-ugly-macros.patch
Content-Type: application/mbox; name=cmd001-remove-ugly-macros.patch
Content-Transfer-Encoding: 7bit

>From adbf8ff3a658bf857b2f2025c19b43066319064c Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 30 Jan 2007 10:45:55 +0200
Subject: [PATCH] [MTD] cmd001: remove ugly macros

Remove ugly and weird MTD_PROGREGION_CTRLMODE_VALID() and
MTD_PROGREGION_CTRLMODE_INVALID() macros. There is only one
user of them and they are used locally just for printing.

Anyway, this patch is a preparation for removing mtd->ecctype
and mtd->eccsize, but these macros use them. Fix this.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    6 ++----
 include/linux/mtd/mtd.h             |   10 ----------
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index f69184a..303b713 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -546,13 +546,11 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
 			struct cfi_intelext_programming_regioninfo *prinfo;
 			prinfo = (struct cfi_intelext_programming_regioninfo *)&extp->extra[offs];
 			mtd->writesize = cfi->interleave << prinfo->ProgRegShift;
-			MTD_PROGREGION_CTRLMODE_VALID(mtd) = cfi->interleave * prinfo->ControlValid;
-			MTD_PROGREGION_CTRLMODE_INVALID(mtd) = cfi->interleave * prinfo->ControlInvalid;
 			mtd->flags &= ~MTD_BIT_WRITEABLE;
 			printk(KERN_DEBUG "%s: program region size/ctrl_valid/ctrl_inval = %d/%d/%d\n",
 			       map->name, mtd->writesize,
-			       MTD_PROGREGION_CTRLMODE_VALID(mtd),
-			       MTD_PROGREGION_CTRLMODE_INVALID(mtd));
+			       cfi->interleave * prinfo->ControlValid,
+			       cfi->interleave * prinfo->ControlInvalid);
 		}
 
 		/*
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index d644e57..afab253 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -120,16 +120,6 @@ struct mtd_info {
 	u_int32_t ecctype;
 	u_int32_t eccsize;
 
-	/*
-	 * Reuse some of the above unused fields in the case of NOR flash
-	 * with configurable programming regions to avoid modifying the
-	 * user visible structure layout/size.  Only valid when the
-	 * MTD_PROGRAM_REGIONS flag is set.
-	 * (Maybe we should have an union for those?)
-	 */
-#define MTD_PROGREGION_CTRLMODE_VALID(mtd)  (mtd)->oobsize
-#define MTD_PROGREGION_CTRLMODE_INVALID(mtd)  (mtd)->ecctype
-
 	// Kernel-only stuff starts here.
 	char *name;
 	int index;
-- 
1.4.4.2


--=-px4MjfQomfYvmpM5nHRf--
