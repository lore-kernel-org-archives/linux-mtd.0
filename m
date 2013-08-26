Received: from mail-db8lp0185.outbound.messaging.microsoft.com
 ([213.199.154.185] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDtJM-0001es-US
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2013 09:42:24 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v3 07/10] jffs2: do not support the MLC nand
Date: Mon, 26 Aug 2013 17:36:45 +0800
Message-ID: <1377509808-29363-8-git-send-email-b32955@freescale.com>
In-Reply-To: <1377509808-29363-1-git-send-email-b32955@freescale.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We should not support the MLC nand for jffs2. So if the nand type is
MLC, we quit immediatly.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 fs/jffs2/fs.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index fe3c052..09b3ed4 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -515,6 +515,10 @@ int jffs2_do_fill_super(struct super_block *sb, void *data, int silent)
 
 	c = JFFS2_SB_INFO(sb);
 
+	/* Do not support the MLC nand */
+	if (c->mtd->type == MTD_MLCNANDFLASH)
+		return -EINVAL;
+
 #ifndef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (c->mtd->type == MTD_NANDFLASH) {
 		pr_err("Cannot operate on NAND flash unless jffs2 NAND support is compiled in\n");
-- 
1.7.1
