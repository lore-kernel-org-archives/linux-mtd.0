Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004hj-Qi
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:03 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqk013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 07/10] UBIFS: fix clean znode counter corruption in error cases
Date: Fri,  3 Jun 2011 16:49:58 +0300
Message-Id: <1307109001-19761-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

UBIFS maintains per-filesystem and global clean znode counters
('c->clean_zn_cnt' and 'ubifs_clean_zn_cnt'). It is important to maintain
correct values there since the shrinker relies on 'ubifs_clean_zn_cnt'.

However, in case of failures during commit the counters were corrupted. E.g.,
if a failure happens in the middle of 'write_index()', then some nodes in the
commit list ('c->cnext') are marked as clean, and some are marked as dirty. And
the 'ubifs_destroy_tnc_subtree()' frees does not retrun correct count, and we
end up with non-zero 'c->clean_zn_cnt' when unmounting. This means that if we
have 2 file-sytem and one of them fails, and we unmount it,
'ubifs_clean_zn_cnt' stays incorrect and confuses the shrinker.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/tnc.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 8119b1f..91b4213 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2876,12 +2876,13 @@ static void tnc_destroy_cnext(struct ubifs_info *c)
  */
 void ubifs_tnc_close(struct ubifs_info *c)
 {
-	long clean_freed;
-
 	tnc_destroy_cnext(c);
 	if (c->zroot.znode) {
-		clean_freed = ubifs_destroy_tnc_subtree(c->zroot.znode);
-		atomic_long_sub(clean_freed, &ubifs_clean_zn_cnt);
+		long n;
+
+		ubifs_destroy_tnc_subtree(c->zroot.znode);
+		n = atomic_long_read(&c->clean_zn_cnt);
+		atomic_long_sub(n, &ubifs_clean_zn_cnt);
 	}
 	kfree(c->gap_lebs);
 	kfree(c->ilebs);
-- 
1.7.2.3
