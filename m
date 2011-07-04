Received: from mga03.intel.com ([143.182.124.21])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qdd6e-0001OH-FF
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2011 06:58:09 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mkfs.ubifs: fix a gcc warning
Date: Mon,  4 Jul 2011 09:59:05 +0300
Message-Id: <1309762745-20175-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1309762745-20175-1-git-send-email-dedekind1@gmail.com>
References: <1309762745-20175-1-git-send-email-dedekind1@gmail.com>
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

This patch "fixes" the following gcc warning:

mkfs.ubifs/mkfs.ubifs.c: In function ‘main’:
mkfs.ubifs/ubifs.h:420:2: warning: ‘child_cnt’ may be used uninitialized in this function [-Wuninitialized]
mkfs.ubifs/mkfs.ubifs.c:1735:6: note: ‘child_cnt’ was declared here

by initializing the ‘child_cnt’ to zero.

Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
---
 mkfs.ubifs/mkfs.ubifs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 79cc71d..dcdb722 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -1732,7 +1732,7 @@ static int write_index(void)
 	struct idx_entry **idx_ptr, **p;
 	struct ubifs_idx_node *idx;
 	struct ubifs_branch *br;
-	int child_cnt, j, level, blnum, boffs, blen, blast_len, err;
+	int child_cnt = 0, j, level, blnum, boffs, blen, blast_len, err;
 
 	dbg_msg(1, "leaf node count: %zd", idx_cnt);
 
-- 
1.7.5.4
