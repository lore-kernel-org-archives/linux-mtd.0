Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X39hX-0004mG-SJ
 for linux-mtd@lists.infradead.org; Fri, 04 Jul 2014 20:03:20 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] UBIFS: kernel-doc warning fix
Date: Fri,  4 Jul 2014 22:02:50 +0200
Message-Id: <1404504170-519-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
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

no grouped argument in drop_last_node.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/ubifs/recovery.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index c14adb2..e256296 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -596,7 +596,6 @@ static void drop_last_group(struct ubifs_scan_leb *sleb, int *offs)
  * drop_last_node - drop the last node.
  * @sleb: scanned LEB information
  * @offs: offset of dropped nodes is returned here
- * @grouped: non-zero if whole group of nodes have to be dropped
  *
  * This is a helper function for 'ubifs_recover_leb()' which drops the last
  * node of the scanned LEB.
-- 
1.9.1
