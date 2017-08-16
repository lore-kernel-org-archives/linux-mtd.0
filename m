Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhyN3-0003z0-W2
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 13:28:31 +0000
Subject: [PATCH 1/2] UBIFS: Delete an error message for a failed memory
 allocation in dbg_check_orphans()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <bd8107ce-fc62-db39-8134-59dca314da7c@users.sourceforge.net>
Message-ID: <a387b1b9-471c-71b5-88f6-c448857f403b@users.sourceforge.net>
Date: Wed, 16 Aug 2017 15:27:54 +0200
MIME-Version: 1.0
In-Reply-To: <bd8107ce-fc62-db39-8134-59dca314da7c@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 10:18:59 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/ubifs/orphan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index caf2d123e9ee..f5b01f9f9985 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -924,10 +924,8 @@ static int dbg_check_orphans(struct ubifs_info *c)
 	ci.leaf_cnt = 0;
 	ci.root = RB_ROOT;
 	ci.node = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
-	if (!ci.node) {
-		ubifs_err(c, "out of memory");
+	if (!ci.node)
 		return -ENOMEM;
-	}
 
 	err = dbg_scan_orphans(c, &ci);
 	if (err)
-- 
2.14.0
