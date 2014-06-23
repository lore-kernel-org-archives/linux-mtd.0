Received: from mailrelay007.isp.belgacom.be ([195.238.6.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz7Kj-0004JJ-6l
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 16:43:08 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] fs/ubifs/super.c: replace count*size kzalloc by kcalloc
Date: Mon, 23 Jun 2014 18:41:23 +0200
Message-Id: <1403541683-10898-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kcalloc manages count*sizeof overflow.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 3904c85..537b91d 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -796,8 +796,8 @@ static int alloc_wbufs(struct ubifs_info *c)
 {
 	int i, err;
 
-	c->jheads = kzalloc(c->jhead_cnt * sizeof(struct ubifs_jhead),
-			   GFP_KERNEL);
+	c->jheads = kcalloc(c->jhead_cnt, sizeof(struct ubifs_jhead),
+			    GFP_KERNEL);
 	if (!c->jheads)
 		return -ENOMEM;
 
-- 
1.8.4.5
