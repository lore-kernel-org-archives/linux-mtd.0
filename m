Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PnY0w-0005K0-UU
	for linux-mtd@lists.infradead.org; Thu, 10 Feb 2011 15:01:00 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 1/2] UBIFS: fix no_more_nodes() to align to max_write_size
Date: Thu, 10 Feb 2011 16:01:45 +0100
Message-Id: <1297350106-16383-2-git-send-email-agust@denx.de>
In-Reply-To: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
Cc: "Signed-off-by: Artem Bityutskiy" <Artem.Bityutskiy@nokia.com>,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes failed recovery from following type of corruptions
on NOR flash:

UBIFS DBG (pid 1394): ubifs_scan_a_node: scanning unknown node
UBIFS DBG (pid 1394): no_more_nodes: unexpected bad common header at 42:182336
UBIFS DBG (pid 1394): ubifs_recover_leb: look at LEB 42:182336 (79680 bytes left)
UBIFS DBG (pid 1394): ubifs_scan_a_node: scanning unknown node
UBIFS error (pid 1394): ubifs_check_node: bad node type 51
UBIFS error (pid 1394): ubifs_check_node: bad node at LEB 42:182336
        magic          0x6101831
        crc            0x3c0cb370
        node_type      51 (unknown node)
        group_type     51 (unknown)
        sqnum          111611
        len            21105
node type 51 was not recognized
...
UBIFS DBG (pid 1394): no_more_nodes: unexpected bad common header at 42:182336
UBIFS error (pid 1394): ubifs_recover_leb: bad node
UBIFS error (pid 1394): ubifs_scanned_corruption: corruption at LEB 42:182336
UBIFS error (pid 1394): ubifs_scanned_corruption: first 8192 bytes from LEB 42:182336
00000000: 31181006 70b30c3c fbb30100 00000000 71520000 33330000 7b310000 f7030020
00000020: 00000000 00000000 00100000 00000000 41424331 32334142 43313233 41424331
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
...

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 fs/ubifs/recovery.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 4278ae7..65e4664 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -430,7 +430,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 	int skip, dlen = le32_to_cpu(ch->len);
 
 	/* Check for empty space after the corrupt node's common header */
-	skip = ALIGN(offs + UBIFS_CH_SZ, c->min_io_size) - offs;
+	skip = ALIGN(offs + UBIFS_CH_SZ, c->max_write_size) - offs;
 	if (is_empty(buf + skip, len - skip))
 		return 1;
 	/*
@@ -442,7 +442,7 @@ static int no_more_nodes(const struct ubifs_info *c, void *buf, int len,
 		return 0;
 	}
 	/* Now we know the corrupt node's length we can skip over it */
-	skip = ALIGN(offs + dlen, c->min_io_size) - offs;
+	skip = ALIGN(offs + dlen, c->max_write_size) - offs;
 	/* After which there should be empty space */
 	if (is_empty(buf + skip, len - skip))
 		return 1;
-- 
1.7.4
