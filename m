Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzqO-0000iS-2M
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:17:40 +0000
Received: by mail-pd0-f175.google.com with SMTP id z10so1066819pdj.6
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:17:19 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/6] mtd: pfow: remove unused variable
Date: Tue, 20 May 2014 23:16:58 -0700
Message-Id: <1400653023-25757-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
References: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes warning:

In file included from drivers/mtd/lpddr/qinfo_probe.c:31:0:
include/linux/mtd/pfow.h: In function ‘send_pfow_command’:
include/linux/mtd/pfow.h:104:6: warning: variable ‘chipnum’ set but not used [-Wunused-but-set-variable]
  int chipnum;
      ^

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/pfow.h |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/mtd/pfow.h b/include/linux/mtd/pfow.h
index b730d4f84655..42ff7ff09bf5 100644
--- a/include/linux/mtd/pfow.h
+++ b/include/linux/mtd/pfow.h
@@ -101,9 +101,6 @@ static inline void send_pfow_command(struct map_info *map,
 				unsigned long len, map_word *datum)
 {
 	int bits_per_chip = map_bankwidth(map) * 8;
-	int chipnum;
-	struct lpddr_private *lpddr = map->fldrv_priv;
-	chipnum = adr >> lpddr->chipshift;
 
 	map_write(map, CMD(cmd_code), map->pfow_base + PFOW_COMMAND_CODE);
 	map_write(map, CMD(adr & ((1<<bits_per_chip) - 1)),
-- 
1.7.9.5
