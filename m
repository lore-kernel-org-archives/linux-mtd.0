Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbhjP-0000h0-2h
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 23:30:11 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 3/3] mtd: edit NAND-related comment
Date: Tue, 28 Jun 2011 16:29:00 -0700
Message-ID: <1309303740-9936-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
References: <1309303740-9936-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Jim Quinlan <jim2101024@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This comment was unclear regarding which NAND functions do and do not
support ECC on the spare area. This update should reflect the current
status of the NAND system but can be updated if changes are made in
the standard functions.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 0995e8e..978e084 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -482,8 +482,9 @@ static int mtd_do_readoob(struct mtd_info *mtd, uint64_t start,
 	 * to signal the caller that a bitflip has occured and has
 	 * been corrected by the ECC algorithm.
 	 *
-	 * Note: most NAND ECC algorithms do not calculate ECC
-	 * for the OOB area.
+	 * Note: currently the standard NAND function, nand_read_oob_std,
+	 * does not calculate ECC for the OOB area, so do not rely on
+	 * this behavior unless you have replaced it with your own.
 	 */
 	if (ret == -EUCLEAN || ret == -EBADMSG)
 		return 0;
-- 
1.7.0.4
