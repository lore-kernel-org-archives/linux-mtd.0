Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBFJN-0004fT-Ji
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 02:35:30 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 7/9] jffs2: init the ret with -EINVAL
Date: Mon, 19 Aug 2013 10:31:16 +0800
Message-ID: <1376879478-22128-8-git-send-email-b32955@freescale.com>
In-Reply-To: <1376879478-22128-1-git-send-email-b32955@freescale.com>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the media is not SLC nand, dataflash, Sibley flash or a
ubi volume, we should return -EINVAL to the caller.
The caller should exit in this case.

Current code returns 0 in this case which is not proper.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 fs/jffs2/fs.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index fe3c052..0452445 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -702,7 +702,7 @@ void jffs2_gc_release_page(struct jffs2_sb_info *c,
 }
 
 static int jffs2_flash_setup(struct jffs2_sb_info *c) {
-	int ret = 0;
+	int ret = -EINVAL;
 
 	if (jffs2_cleanmarker_oob(c)) {
 		/* NAND flash... do setup accordingly */
-- 
1.7.1
