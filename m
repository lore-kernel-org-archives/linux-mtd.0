Received: from zelda.netsplit.com ([87.194.19.211])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lh5ZE-0005lu-4B
	for linux-mtd@lists.infradead.org; Tue, 10 Mar 2009 17:16:38 +0000
Message-Id: <a4553a6f4cec3d5e844b2106484c69f66090777a.1236702228.git.scott@canonical.com>
In-Reply-To: <cover.1236702228.git.scott@canonical.com>
References: <cover.1236702228.git.scott@canonical.com>
From: Scott James Remnant <scott@canonical.com>
Date: Mon, 2 Mar 2009 18:42:39 +0000
Subject: [PATCH 23/31] mtd: Auto-load mtdchar module when device opened.
To: linux-kernel@vger.kernel.org
Sender: Scott James Remnant <scott@zelda.netsplit.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtdchar module is missing the char-major-90-* alias that would cause
it to be auto-loaded when a device of that type is opened.  This patch
adds the alia..

Signed-off-by: Scott James Remnant <scott@canonical.com>
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/mtd/mtdchar.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index e9ec59e..2c8a16f 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -825,3 +825,4 @@ module_exit(cleanup_mtdchar);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("Direct character-device access to MTD devices");
+MODULE_ALIAS_CHARDEV_MAJOR(MTD_CHAR_MAJOR);
-- 
1.6.0.5
