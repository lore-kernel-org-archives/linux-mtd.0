Received: from rcsinet15.oracle.com ([148.87.113.117])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdHeu-0007se-RH
 for linux-mtd@lists.infradead.org; Sat, 09 Jun 2012 09:08:37 +0000
Date: Sat, 9 Jun 2012 12:08:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] UBIFS: change | to & in assertion
Message-ID: <20120609090823.GA877@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The asserts here never check anything because it uses '|' instead of
'&'.  Now if the flags are not set it prints a warning a a stack trace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I have not tested this and it really does need to
be tested.

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 2559d17..28ec13a 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -939,8 +939,8 @@ static int find_dirtiest_idx_leb(struct ubifs_info *c)
 	}
 	dbg_find("LEB %d, dirty %d and free %d flags %#x", lp->lnum, lp->dirty,
 		 lp->free, lp->flags);
-	ubifs_assert(lp->flags | LPROPS_TAKEN);
-	ubifs_assert(lp->flags | LPROPS_INDEX);
+	ubifs_assert(lp->flags & LPROPS_TAKEN);
+	ubifs_assert(lp->flags & LPROPS_INDEX);
 	return lnum;
 }
 
