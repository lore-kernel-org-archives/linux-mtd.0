Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1Oaq-0001u8-Co
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:19:33 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 14/14] mtd: nand: switch `check_pattern()' to standard
	`memcmp()'
Date: Wed, 7 Sep 2011 13:13:41 -0700
Message-ID: <1315426421-16243-15-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A portion of the `check_pattern()' function is basically a `memcmp()'.
Since it's possible for `memcmp()' to be optimized for a particular
architecture, we should use it instead.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 26d6a51..6576afb 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -107,10 +107,8 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 	p += end;
 
 	/* Compare the pattern */
-	for (i = 0; i < td->len; i++) {
-		if (p[i] != td->pattern[i])
-			return -1;
-	}
+	if (memcmp(p, td->pattern, td->len))
+		return -1;
 
 	if (td->options & NAND_BBT_SCANEMPTY) {
 		p += td->len;
-- 
1.7.5.4
