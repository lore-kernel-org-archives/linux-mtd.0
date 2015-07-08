Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCwS5-0000yt-1h
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 21:00:21 +0000
Received: by iecvh10 with SMTP id vh10so164347506iec.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 13:59:59 -0700 (PDT)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2:Fix error paths return value for the function
 read_unknown
Date: Wed,  8 Jul 2015 16:59:55 -0400
Message-Id: <1436389195-16522-1-git-send-email-xerofoify@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes the error paths in the function read_unknown that return
a value to correctly return -EIO rather then the kernel value for
successful function execution of zero to indicate to this function's
callers that a failure has occurred related to I/O and needs to be
handled by this function's caller.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 fs/jffs2/readinode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 28e0aab..63bf879 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -875,7 +875,7 @@ static inline int read_unknown(struct jffs2_sb_info *c, struct jffs2_raw_node_re
 			    je16_to_cpu(un->magic), je16_to_cpu(un->nodetype),
 			    je32_to_cpu(un->totlen), je32_to_cpu(un->hdr_crc));
 		jffs2_mark_node_obsolete(c, ref);
-		return 0;
+		return -EIO;
 	}
 
 	un->nodetype = cpu_to_je16(JFFS2_NODE_ACCURATE | je16_to_cpu(un->nodetype));
@@ -904,7 +904,7 @@ static inline int read_unknown(struct jffs2_sb_info *c, struct jffs2_raw_node_re
 		JFFS2_NOTICE("unknown RWCOMPAT_DELETE nodetype %#04X at %#08x\n",
 			     je16_to_cpu(un->nodetype), ref_offset(ref));
 		jffs2_mark_node_obsolete(c, ref);
-		return 0;
+		return -EIO;
 	}
 
 	return 0;
-- 
2.1.4
