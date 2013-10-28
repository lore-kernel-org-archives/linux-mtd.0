Received: from relay1.mentorg.com ([192.94.38.131])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VapNy-0001Xl-MQ
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 16:09:47 +0000
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtdchar: return expected errors on mmap() call
Date: Mon, 28 Oct 2013 18:08:15 +0200
Message-ID: <1382976495-1250-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According both to POSIX.1-2008 and Linux Programmer's Manual mmap()
syscall shouldn't return undocumented ENOSYS, this change replaces
the errno with more appropriate ENODEV and EACCESS.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
---
 drivers/mtd/mtdchar.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 684bfa3..a4c026e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1099,7 +1099,7 @@ static unsigned long mtdchar_get_unmapped_area(struct file *file,
 		return (unsigned long) -EINVAL;
 
 	ret = mtd_get_unmapped_area(mtd, len, offset, flags);
-	return ret == -EOPNOTSUPP ? -ENOSYS : ret;
+	return ret == -EOPNOTSUPP ? -ENODEV : ret;
 }
 #endif
 
@@ -1124,9 +1124,9 @@ static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
 #endif
 		return vm_iomap_memory(vma, map->phys, map->size);
 	}
-	return -ENOSYS;
+	return -ENODEV;
 #else
-	return vma->vm_flags & VM_SHARED ? 0 : -ENOSYS;
+	return vma->vm_flags & VM_SHARED ? 0 : -EACCES;
 #endif
 }
 
-- 
1.7.10.4
