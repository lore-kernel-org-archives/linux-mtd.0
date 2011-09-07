Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OZB-0001gT-2Q
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:17:50 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 07/14] mtd: nand: begin restructuring check_create
Date: Wed, 7 Sep 2011 13:13:34 -0700
Message-ID: <1315426421-16243-8-git-send-email-computersforpeace@gmail.com>
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

We will begin restructuring the code for check_create so that we can
make some important changes. For now, we should just begin to get rid of
some goto statements to make things cleaner. This is the first step of a
few, which are separated to make them easier to follow.

This step should just be a code refactor.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   24 +++++-------------------
 1 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index cba4c44..6b5b2c0 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -898,30 +898,19 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			if (td->pages[i] == -1 && md->pages[i] == -1) {
 				writeops = 0x03;
 				goto create;
-			}
-
-			if (td->pages[i] == -1) {
+			} else if (td->pages[i] == -1) {
 				rd = md;
 				td->version[i] = md->version[i];
 				writeops = 0x01;
-				goto writecheck;
-			}
-
-			if (md->pages[i] == -1) {
+			} else if (md->pages[i] == -1) {
 				rd = td;
 				md->version[i] = td->version[i];
 				writeops = 0x02;
-				goto writecheck;
-			}
-
-			if (td->version[i] == md->version[i]) {
+			} else if (td->version[i] == md->version[i]) {
 				rd = td;
 				if (!(td->options & NAND_BBT_VERSION))
 					rd2 = md;
-				goto writecheck;
-			}
-
-			if (((int8_t)(td->version[i] - md->version[i])) > 0) {
+			} else if (((int8_t)(td->version[i] - md->version[i])) > 0) {
 				rd = td;
 				md->version[i] = td->version[i];
 				writeops = 0x02;
@@ -930,17 +919,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 				td->version[i] = md->version[i];
 				writeops = 0x01;
 			}
-
-			goto writecheck;
-
 		} else {
 			if (td->pages[i] == -1) {
 				writeops = 0x01;
 				goto create;
 			}
 			rd = td;
-			goto writecheck;
 		}
+		goto writecheck;
 	create:
 		/* Create the bad block table by scanning the device? */
 		if (!(td->options & NAND_BBT_CREATE))
-- 
1.7.5.4
