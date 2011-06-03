Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004hi-Qc
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:02 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqj013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:57 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/10] UBIFS: fix memory leak on error path
Date: Fri,  3 Jun 2011 16:49:57 +0300
Message-Id: <1307109001-19761-7-git-send-email-dedekind1@gmail.com>
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

UBIFS leaks memory on error path in 'ubifs_jnl_update()' in case of write
failure because it forgets to free the 'struct ubifs_dent_node *dent' object.
Although the object is small, the alignment can make it large - e.g., 2KiB
if the min. I/O unit is 2KiB.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: stable@kernel.org
---
 fs/ubifs/journal.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 34b1679..cef0460 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -669,6 +669,7 @@ out_free:
 
 out_release:
 	release_head(c, BASEHD);
+	kfree(dent);
 out_ro:
 	ubifs_ro_mode(c, err);
 	if (last_reference)
-- 
1.7.2.3
