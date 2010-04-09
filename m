Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O0NR7-0006Pd-2k
	for linux-mtd@lists.infradead.org; Fri, 09 Apr 2010 23:16:29 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Fri, 9 Apr 2010 15:45:38 -0700
To: <dwmw2@infradead.org>
Subject: [PATCH] MTD: Suppress warnings in inline_map_read()
Message-Id: <fb80b9139bec21ac8bd4ddcec0abeb9c1ad39ad5@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With gcc 4.4.3 -O2 on MIPS32:

drivers/mtd/chips/cfi_util.c: In function 'cfi_qry_present':
include/linux/mtd/map.h:390: warning: 'r' may be used uninitialized in this function
include/linux/mtd/map.h:375: note: 'r' was declared here
include/linux/mtd/map.h:390: warning: 'r' may be used uninitialized in this function
include/linux/mtd/map.h:375: note: 'r' was declared here

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 include/linux/mtd/map.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index b981b87..74f0277 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -372,7 +372,7 @@ static inline map_word map_word_ff(struct map_info *map)
 
 static inline map_word inline_map_read(struct map_info *map, unsigned long ofs)
 {
-	map_word r;
+	map_word r = { { 0 } };
 
 	if (map_bankwidth_is_1(map))
 		r.x[0] = __raw_readb(map->virt + ofs);
-- 
1.6.3.1
