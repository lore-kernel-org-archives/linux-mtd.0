Received: from [69.28.251.93] (helo=b32.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O0fSJ-0007Hq-0o
	for linux-mtd@lists.infradead.org; Sat, 10 Apr 2010 18:30:55 +0000
From: Kevin Cernekee <cernekee@gmail.com>
Date: Sat, 10 Apr 2010 11:18:58 -0700
To: <dwmw2@infradead.org>
Subject: [PATCHv2] MTD: Suppress warnings in inline_map_read()
Message-Id: <e970485f0e9f4c9e1cb6e594a45dd11308683197@localhost.localdomain>
References: <1270891582.4704.102.camel@macbook.infradead.org>
In-Reply-To: <1270891582.4704.102.camel@macbook.infradead.org>
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
 include/linux/mtd/map.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index b981b87..56a4592 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -386,6 +386,8 @@ static inline map_word inline_map_read(struct map_info *map, unsigned long ofs)
 #endif
 	else if (map_bankwidth_is_large(map))
 		memcpy_fromio(r.x, map->virt+ofs, map->bankwidth);
+	else
+		BUG();
 
 	return r;
 }
-- 
1.6.3.1
