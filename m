Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmS-0004md-MD
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:18 +0000
Received: by mail-ie0-f178.google.com with SMTP id f4so1523967iea.9
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:56 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/12] mtd: lpddr_cmds: make function static
Date: Wed,  4 Sep 2013 11:25:26 -0700
Message-Id: <1378319126-24473-13-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

do_xxlock() is only used locally. This silences a sparse warning:

drivers/mtd/lpddr/lpddr_cmds.c:706:5: warning: no previous prototype for 'do_xxlock' [-Wmissing-prototypes]

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/lpddr/lpddr_cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index d3cfe26b..2ef19aa 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -703,7 +703,7 @@ static int lpddr_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 #define DO_XXLOCK_LOCK		1
 #define DO_XXLOCK_UNLOCK	2
-int do_xxlock(struct mtd_info *mtd, loff_t adr, uint32_t len, int thunk)
+static int do_xxlock(struct mtd_info *mtd, loff_t adr, uint32_t len, int thunk)
 {
 	int ret = 0;
 	struct map_info *map = mtd->priv;
-- 
1.8.4
