Received: from mail-bk0-f41.google.com ([209.85.214.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Trrq6-0000TP-Uw
 for linux-mtd@lists.infradead.org; Sun, 06 Jan 2013 15:08:43 +0000
Received: by mail-bk0-f41.google.com with SMTP id jg9so8049775bkc.0
 for <linux-mtd@lists.infradead.org>; Sun, 06 Jan 2013 07:08:38 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 1/2] mtd: bcm47xxpart: simplify size calculation to one loop
Date: Sun,  6 Jan 2013 16:08:35 +0100
Message-Id: <1357484916-29965-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
I've checked this patch and got:
> Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-", no issues
---
 drivers/mtd/bcm47xxpart.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index e06d782..06125eb 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -169,11 +169,12 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	 * Assume that partitions end at the beginning of the one they are
 	 * followed by.
 	 */
-	for (i = 0; i < curr_part - 1; i++)
-		parts[i].size = parts[i + 1].offset - parts[i].offset;
-	if (curr_part > 0)
-		parts[curr_part - 1].size =
-				master->size - parts[curr_part - 1].offset;
+	for (i = 0; i < curr_part; i++) {
+		u64 next_part_offset = (i < curr_part - 1) ?
+				       parts[i + 1].offset : master->size;
+
+		parts[i].size = next_part_offset - parts[i].offset;
+	}
 
 	*pparts = parts;
 	return curr_part;
-- 
1.7.7
