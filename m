Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi2dk-0003op-Km
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 09:58:01 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 8/9] UBIFS: fix assertion warnings in comparison function
Date: Sun,  8 Aug 2010 12:57:31 +0300
Message-Id: <1281261452-9868-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
References: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When running the integrity test ('integck' from mtd-utils) on current
UBIFS on 2.6.35, I see that assertions in UBIFS 'list_sort()' comparison
functions trigger sometimes, e.g.:

UBIFS assert failed in data_nodes_cmp at 132 (pid 28311)

My investigation showed that this happens when 'list_sort()' calls the 'cmp()'
function with equivalent arguments. In this case, the 'struct list_head'
parameter, passed to 'cmp()' is bogus, and it does not belong to any element in
the original list.

And this issue seems to be introduced by commit:

commit 835cc0c8477fdbc59e0217891d6f11061b1ac4e2
Author: Don Mullis <don.mullis@gmail.com>
Date:   Fri Mar 5 13:43:15 2010 -0800

It is easy to work around the issue by doing:

if (a == b)
	return 0;

in UBIFS. It works, but 'lib_sort()' should nevertheless be fixed. Although it
is harmless to have this piece of code in UBIFS.

This patch adds that code to both UBIFS 'cmp()' functions:
'data_nodes_cmp()' and 'nondata_nodes_cmp()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 8dbe36f..84ab9aa 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -125,6 +125,9 @@ int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	struct ubifs_scan_node *sa, *sb;
 
 	cond_resched();
+	if (a == b)
+		return 0;
+
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
 
@@ -165,6 +168,9 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	struct ubifs_scan_node *sa, *sb;
 
 	cond_resched();
+	if (a == b)
+		return 0;
+
 	sa = list_entry(a, struct ubifs_scan_node, list);
 	sb = list_entry(b, struct ubifs_scan_node, list);
 
-- 
1.7.1.1
