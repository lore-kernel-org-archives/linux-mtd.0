Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLsQH-0003Yy-Qn
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 07:41:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4G7eTkJ011097
	for <linux-mtd@lists.infradead.org>; Mon, 16 May 2011 10:41:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/20] UBIFS: make 2 functions static
Date: Mon, 16 May 2011 10:44:26 +0300
Message-Id: <1305531879-19311-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
References: <1305531879-19311-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a minor change which makes 2 functions static because they
are not used outside the gc.c file: 'data_nodes_cmp()' and
'nondata_nodes_cmp()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 082d21b..d70937b 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -118,7 +118,7 @@ static int switch_gc_head(struct ubifs_info *c)
  * This function compares data nodes @a and @b. Returns %1 if @a has greater
  * inode or block number, and %-1 otherwise.
  */
-int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
+static int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 {
 	ino_t inuma, inumb;
 	struct ubifs_info *c = priv;
@@ -161,7 +161,8 @@ int data_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
  * first and sorted by length in descending order. Directory entry nodes go
  * after inode nodes and are sorted in ascending hash valuer order.
  */
-int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
+static int nondata_nodes_cmp(void *priv, struct list_head *a,
+			     struct list_head *b)
 {
 	ino_t inuma, inumb;
 	struct ubifs_info *c = priv;
-- 
1.7.2.3
