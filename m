Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMxUa-0001Ox-EA
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 07:17:57 +0000
Received: by pvh11 with SMTP id 11so1246397pvh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 00:17:54 -0700 (PDT)
Message-ID: <4DD4C41E.9020807@mvista.com>
Date: Thu, 19 May 2011 16:17:50 +0900
From: Tadashi Abe <tabe@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: mtd: remove duplicate assignment of chip->state
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: Tadashi Abe <tabe@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a trivial patch which removes unnecessary assignment of chip->state
in put_chip(). It's duplicated.

Signed-off-by: Tadashi Abe <tabe@mvista.com>

---
 drivers/mtd/chips/cfi_cmdset_0001.c |    1 -
 drivers/mtd/chips/cfi_cmdset_0002.c |    1 -
 drivers/mtd/lpddr/lpddr_cmds.c      |    1 -
 3 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 09cb7c8..308709a 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -997,7 +997,6 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 
 	switch(chip->oldstate) {
 	case FL_ERASING:
-		chip->state = chip->oldstate;
 		/* What if one interleaved chip has finished and the
 		   other hasn't? The old code would leave the finished
 		   one in READY mode. That's bad, and caused -EROFS
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 0b49266..6d55281 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -762,7 +762,6 @@ static void put_chip(struct map_info *map, struct flchip *chip, unsigned long ad
 
 	switch(chip->oldstate) {
 	case FL_ERASING:
-		chip->state = chip->oldstate;
 		map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 1267992..c8f79c7 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -383,7 +383,6 @@ static void put_chip(struct map_info *map, struct flchip *chip)
 
 	switch (chip->oldstate) {
 	case FL_ERASING:
-		chip->state = chip->oldstate;
 		map_write(map, CMD(LPDDR_RESUME),
 				map->pfow_base + PFOW_COMMAND_CODE);
 		map_write(map, CMD(LPDDR_START_EXECUTION),
-- 
1.7.4.4
