Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dimcd-0004T1-Lj
 for linux-mtd@lists.infradead.org; Fri, 18 Aug 2017 19:07:57 +0000
Subject: [PATCH 2/3] jffs2: Improve a size determination in jffs2_scan_medium()
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <ec91fdb9-9107-f1a3-3530-b3272ca51da7@users.sourceforge.net>
Message-ID: <1e4c5674-fb48-ab5f-fa9b-4e9b30dde6bc@users.sourceforge.net>
Date: Fri, 18 Aug 2017 21:07:32 +0200
MIME-Version: 1.0
In-Reply-To: <ec91fdb9-9107-f1a3-3530-b3272ca51da7@users.sourceforge.net>
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
Date: Fri, 18 Aug 2017 20:22:15 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/jffs2/scan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 90431dd613b8..d7696151b47d 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -132,5 +132,5 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	}
 
 	if (jffs2_sum_active()) {
-		s = kzalloc(sizeof(struct jffs2_summary), GFP_KERNEL);
+		s = kzalloc(sizeof(*s), GFP_KERNEL);
 		if (!s) {
-- 
2.14.0
