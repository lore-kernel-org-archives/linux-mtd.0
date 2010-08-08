Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi2dj-0003gV-Al
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 09:58:00 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2 7/9] UBIFS: do not write rubbish into truncation scanning
	node
Date: Sun,  8 Aug 2010 12:57:30 +0300
Message-Id: <1281261452-9868-8-git-send-email-dedekind1@gmail.com>
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

In the scanning code, in 'ubifs_add_snod()', we write rubbish into
'snod->key', because we assume that on-flash truncation nodes have a key, but
they do not. If the other parts of UBIFS then mistakenly try to look-up
the truncation node key (they should not do this, but may do because of a bug),
we can succeed and corrupt TNC. It looks like we did have such a situation in
'sort_nodes()' in gc.c.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/scan.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 96c5253..a0a305c 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -212,7 +212,6 @@ int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	case UBIFS_DENT_NODE:
 	case UBIFS_XENT_NODE:
 	case UBIFS_DATA_NODE:
-	case UBIFS_TRUN_NODE:
 		/*
 		 * The key is in the same place in all keyed
 		 * nodes.
-- 
1.7.1.1
