Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ohejl-0007ag-5x
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2010 08:26:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/7] UBIFS: fix assertion warning
Date: Sat,  7 Aug 2010 11:26:13 +0300
Message-Id: <1281169577-18664-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
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

This patch fixes the following false assertion warning:

UBIFS assert failed in data_nodes_cmp at 130 (pid 15107)

The assertion was wrong because it did not take into account that the
node can be an xentry.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/gc.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 29ce1b3..d060c62 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -178,7 +178,8 @@ int nondata_nodes_cmp(void *priv, struct list_head *a, struct list_head *b)
 	if (typeb == UBIFS_INO_KEY)
 		return 1;
 
-	ubifs_assert(typea == UBIFS_DENT_KEY && typeb == UBIFS_DENT_KEY);
+	ubifs_assert(typea == UBIFS_DENT_KEY || typea == UBIFS_XENT_KEY);
+	ubifs_assert(typeb == UBIFS_DENT_KEY || typeb == UBIFS_XENT_KEY);
 	inuma = key_inum(c, &sa->key);
 	inumb = key_inum(c, &sb->key);
 
-- 
1.7.1.1
