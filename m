Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMqW0-000212-3Y
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 04:41:21 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AF2BB80715
 for <linux-mtd@lists.infradead.org>; Wed,  5 Aug 2015 16:40:50 +1200 (NZST)
From: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To: linux-mtd@lists.infradead.org
Cc: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] JFFS2: Prevent CPU starvation during garbage collection.
Date: Wed,  5 Aug 2015 16:40:30 +1200
Message-Id: <1438749630-1656-1-git-send-email-mark.tomlinson@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The JFFS2 garbage collection checks every file on the system for correct
checksums and cleaning up anything that it needs to. It sleeps for 50ms
between each file, but within each file it remains busy.

As far as I can tell, there is no reason to not reschedule while checking a
file, by putting a cond_resched() inside jfffs2_build_inode_fragtree(). In
fact, jffs2_get_inode_nodes() will call cond_resched(), which is done
immediately before jffs2_build_inode_fragtree().

With this extra cond_resched() between reading file blocks, there is a
dramatic improvement in latency for any processes which are running during
this initial garbage collection phase.

Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 fs/jffs2/readinode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 28e0aab..78c526a 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -536,6 +536,7 @@ static int jffs2_build_inode_fragtree(struct jffs2_sb_info *c,
 				jffs2_free_tmp_dnode_info(this);
 			}
 			this = vers_next;
+			cond_resched();
 		}
 	}
 	return 0;
-- 
2.5.0
