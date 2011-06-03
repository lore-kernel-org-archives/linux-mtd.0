Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004he-Q3
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:06 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqe013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:56 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/10] UBIFS: supress false error messages
Date: Fri,  3 Jun 2011 16:49:52 +0300
Message-Id: <1307109001-19761-2-git-send-email-dedekind1@gmail.com>
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

Commit ab51afe05273741f72383529ef488aa1ea598ec6 was a good clean-up, but
it introduced a regression - now UBIFS prints scary error messages during
recovery on all corrupted nodes, even though the corruptions are expected
(due to a power cut). This patch fixes the issue.

Additionally fix a typo in a commentary introduced by the same commit.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 731d9e2..95e2418 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -635,7 +635,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 		 * Scan quietly until there is an error from which we cannot
 		 * recover
 		 */
-		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, 0);
+		ret = ubifs_scan_a_node(c, buf, len, lnum, offs, 1);
 		if (ret == SCANNED_A_NODE) {
 			/* A valid node, and not a padding node */
 			struct ubifs_ch *ch = buf;
@@ -701,7 +701,7 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 	 * While we are in the middle of the same min. I/O unit keep dropping
 	 * nodes. So basically, what we want is to make sure that the last min.
 	 * I/O unit where we saw the corruption is dropped completely with all
-	 * the uncorrupted node which may possibly sit there.
+	 * the uncorrupted nodes which may possibly sit there.
 	 *
 	 * In other words, let's name the min. I/O unit where the corruption
 	 * starts B, and the previous min. I/O unit A. The below code tries to
-- 
1.7.2.3
