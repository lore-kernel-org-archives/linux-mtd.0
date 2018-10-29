Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHGrF-0001y8-Oz
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 23:22:07 +0000
From: Colin King <colin.king@canonical.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ubifs: authentication: fix memory leak on error exit
 path
Date: Mon, 29 Oct 2018 23:21:46 +0000
Message-Id: <20181029232146.21262-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Currently a failure when calling ubifs_read_nnode results in a leak
of desc and buf because of a direct return. Fix this by exiting via
label 'out' that performs the necessary free'ing of the resources.

Fixes: a1dc58140f7e ("ubifs: authentication: Authenticate LPT")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ubifs/lpt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index d1d5e96350dd..c162459a1e02 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1688,7 +1688,7 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
 	if (!c->nroot) {
 		err = ubifs_read_nnode(c, NULL, 0);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	cnode = (struct ubifs_cnode *)c->nroot;
-- 
2.19.1
