Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aobGb-00053T-Ug
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 18:36:26 +0000
From: Denys Vlasenko <dvlasenk@redhat.com>
To: David Woodhouse <David.Woodhouse@intel.com>
Cc: Denys Vlasenko <dvlasenk@redhat.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/mtd/chips/cfi_cmdset_0020.c: Deinline do_write_buffer,
 save 5316 bytes
Date: Fri,  8 Apr 2016 20:35:43 +0200
Message-Id: <1460140543-12487-3-git-send-email-dvlasenk@redhat.com>
In-Reply-To: <1460140543-12487-1-git-send-email-dvlasenk@redhat.com>
References: <1460140543-12487-1-git-send-email-dvlasenk@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This function compiles to 2554 bytes of machine code.
In C, the function is almost 200 lines long.

It has only one callsite, but forced inlining that much code
makes gcc generate significantly worse code. Let gcc itself decide
what to do.

Signed-off-by: Denys Vlasenko <dvlasenk@redhat.com>
CC: David Woodhouse <David.Woodhouse@intel.com>
CC: Brian Norris <computersforpeace@gmail.com>
CC: Dan Carpenter <dan.carpenter@oracle.com>
CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
CC: linux-mtd@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 drivers/mtd/chips/cfi_cmdset_0020.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 9a1a6ff..70dd2b1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -416,7 +416,7 @@ static int cfi_staa_read (struct mtd_info *mtd, loff_t from, size_t len, size_t
 	return ret;
 }
 
-static inline int do_write_buffer(struct map_info *map, struct flchip *chip,
+static int do_write_buffer(struct map_info *map, struct flchip *chip,
 				  unsigned long adr, const u_char *buf, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-- 
2.1.0
