Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXqh6-00014O-SU
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 09:52:42 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so2247427bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 01:52:40 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] MTD: bcm63xxpart: move the last curpart++ to its correct
 place
Date: Mon, 12 Nov 2012 10:52:50 +0100
Message-Id: <1352713971-1685-5-git-send-email-jonas.gorski@gmail.com>
In-Reply-To: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
References: <1352713971-1685-1-git-send-email-jonas.gorski@gmail.com>
Cc: Maxime Bizon <mbizon@freebox.fr>, Kevin Cernekee <cernekee@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The line belongs above the comment, not below it.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index b3db8e3..44cba4e 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -190,9 +190,9 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	parts[curpart].name = "nvram";
 	parts[curpart].offset = master->size - nvramlen;
 	parts[curpart].size = nvramlen;
+	curpart++;
 
 	/* Global partition "linux" to make easy firmware upgrade */
-	curpart++;
 	parts[curpart].name = "linux";
 	parts[curpart].offset = cfelen;
 	parts[curpart].size = master->size - cfelen - nvramlen;
-- 
1.7.2.5
