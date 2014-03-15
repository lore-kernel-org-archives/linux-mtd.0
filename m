Received: from ppp118-210-37-193.lns20.adl2.internode.on.net ([118.210.37.193]
 helo=audi.shelbyville.oz)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOsYU-0000Oi-Aq
 for linux-mtd@lists.infradead.org; Sat, 15 Mar 2014 17:39:31 +0000
From: Ron <ron@debian.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] Use the nand_read_subpage index everywhere
Date: Sun, 16 Mar 2014 04:01:08 +1030
Message-Id: <1394904668-22978-3-git-send-email-ron@debian.org>
In-Reply-To: <1394904668-22978-1-git-send-email-ron@debian.org>
References: <1394904668-22978-1-git-send-email-ron@debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the index variable is correctly set earlier in this function
we can use it in other places that compute the same thing too.

Signed-off-by: Ron <ron@debian.org>
---
 drivers/mtd/nand/nand_base.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index be23dff..fca43b5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1200,8 +1200,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	 * ecc.pos. Let's make sure that there are no gaps in ECC positions.
 	 */
 	for (i = 0; i < eccfrag_len - 1; i++) {
-		if (eccpos[i + start_step * chip->ecc.bytes] + 1 !=
-			eccpos[i + start_step * chip->ecc.bytes + 1]) {
+		if (eccpos[i + index] + 1 != eccpos[i + index + 1]) {
 			gaps = 1;
 			break;
 		}
-- 
1.7.2.5
