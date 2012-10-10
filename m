Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLrPw-0003Tb-22
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 08:13:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 Brent Taylor <motobud@gmail.com>
Subject: [PATCH 2/2] UBIFS: fix mounting problems after power cuts
Date: Wed, 10 Oct 2012 11:13:35 +0300
Message-Id: <1349856815-22893-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1349856815-22893-1-git-send-email-dedekind1@gmail.com>
References: <1349856815-22893-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This is a bugfix for a problem with the following symptoms:

1. A power cut happens
2. After reboot, we try to mount UBIFS
3. Mount fails with "No space left on device" error message

UBIFS complains like this:

UBIFS error (pid 28225): grab_empty_leb: could not find an empty LEB

The root cause of this problem is that when we mount, not all LEBs are
categorized. Only those which were read are. However, the
'ubifs_find_free_leb_for_idx()' function assumes that all LEBs were
categorized and 'c->freeable_cnt' is valid, which is a false assumption.

This patch fixes the problem by teaching 'ubifs_find_free_leb_for_idx()'
to always fall back to LPT scanning if no freeable LEBs were found.

This problem was reported by few people in the past, but Brent Taylor
was able to reproduce it and send me a flash image which cannot be mounted,
which made it easy to hunt the bug. Kudos to Brent.

Reported-by: Brent Taylor <motobud@gmail.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 fs/ubifs/find.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 28ec13a..4b0b8b4 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -681,8 +681,9 @@ int ubifs_find_free_leb_for_idx(struct ubifs_info *c)
 	if (!lprops) {
 		lprops = ubifs_fast_find_freeable(c);
 		if (!lprops) {
-			ubifs_assert(c->freeable_cnt == 0);
-			if (c->lst.empty_lebs - c->lst.taken_empty_lebs > 0) {
+			if (c->in_a_category_cnt != c->main_lebs ||
+			    c->lst.empty_lebs - c->lst.taken_empty_lebs > 0) {
+				ubifs_assert(c->freeable_cnt == 0);
 				lprops = scan_for_leb_for_idx(c);
 				if (IS_ERR(lprops)) {
 					err = PTR_ERR(lprops);
-- 
1.7.7.6
