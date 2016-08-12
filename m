Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYCUS-0004TW-Bj
 for linux-mtd@lists.infradead.org; Fri, 12 Aug 2016 13:27:13 +0000
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: [PATCH] UBIFS: fix assertion in layout_in_gaps()
Date: Fri, 12 Aug 2016 15:26:30 +0200
Message-Id: <1471008390-19227-1-git-send-email-vincent.stehle@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

An assertion in layout_in_gaps() verifies that the gap_lebs pointer is
below the maximum bound. When computing this maximum bound the idx_lebs
count is multiplied by sizeof(int), while C pointers arithmetic does take
into account the size of the pointed elements implicitly already. Remove
the multiplication to fix the assertion.

Fixes: 1e51764a3c2ac05a ("UBIFS: add new flash file system")
Signed-off-by: Vincent Stehlé <vincent.stehle@intel.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/tnc_commit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index b45345d..51157da 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -370,7 +370,7 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 
 	p = c->gap_lebs;
 	do {
-		ubifs_assert(p < c->gap_lebs + sizeof(int) * c->lst.idx_lebs);
+		ubifs_assert(p < c->gap_lebs + c->lst.idx_lebs);
 		written = layout_leb_in_gaps(c, p);
 		if (written < 0) {
 			err = written;
-- 
2.8.1
