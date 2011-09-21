Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R6BkB-0000Gs-O5
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 01:37:00 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 11/14] mtd: nand: wait to set BBT version
Date: Tue, 20 Sep 2011 18:35:57 -0700
Message-ID: <1316568957-21625-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-12-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-12-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Because there are so many cases of checking, writing, and re-writing of
the bad block table(s), we might as well wait until the we've settled on
a valid, clean copy of the table. This also prevents us from falsely
incrementing the table version. For example, we may have the following:

  Primary table, with version 0x02
  Mirror table, with version 0x01
  Primary table has uncorrectable ECC errors

If we don't have this fix applied, then we will:

  Choose to read the primary table (higher version)
  Set mirror table version to 0x02
  Read back primary table
  Invalidate table because of ECC errors
  Retry readback operation with mirror table, now version 0x02
  Mirrored table reads cleanly
  Writeback BBT to primary table location (with "version 0x02")

However, the mirrored table shouldn't have a new version number.
Instead, we actually want:

  Choose to read the primary table (higher version)
  Read back primary table
  Invalidate table because of ECC errors
  Retry readback with mirror table (version 0x01)
  Mirrored table reads cleanly
  Set both tables to version 0x01
  Writeback BBT to primary table location (version 0x01)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: change to `mtd_is_*' prefix

 drivers/mtd/nand/nand_bbt.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 11185aa..e7976c7 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -909,11 +909,9 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 				writeops = 0x03;
 			} else if (td->pages[i] == -1) {
 				rd = md;
-				td->version[i] = md->version[i];
 				writeops = 0x01;
 			} else if (md->pages[i] == -1) {
 				rd = td;
-				md->version[i] = td->version[i];
 				writeops = 0x02;
 			} else if (td->version[i] == md->version[i]) {
 				rd = td;
@@ -921,11 +919,9 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 					rd2 = md;
 			} else if (((int8_t)(td->version[i] - md->version[i])) > 0) {
 				rd = td;
-				md->version[i] = td->version[i];
 				writeops = 0x02;
 			} else {
 				rd = md;
-				td->version[i] = md->version[i];
 				writeops = 0x01;
 			}
 		} else {
@@ -957,6 +953,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			if (mtd_is_eccerr(res)) {
 				/* Mark table as invalid */
 				rd->pages[i] = -1;
+				rd->version[i] = 0;
 				i--;
 				continue;
 			}
@@ -967,6 +964,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			if (mtd_is_eccerr(res2)) {
 				/* Mark table as invalid */
 				rd2->pages[i] = -1;
+				rd2->version[i] = 0;
 				i--;
 				continue;
 			}
@@ -976,6 +974,12 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 		if (mtd_is_bitflip(res) || mtd_is_bitflip(res2))
 			writeops = 0x03;
 
+		/* Update version numbers before writing */
+		if (md) {
+			td->version[i] = max(td->version[i], md->version[i]);
+			md->version[i] = td->version[i];
+		}
+
 		/* Write the bad block table to the device? */
 		if ((writeops & 0x01) && (td->options & NAND_BBT_WRITE)) {
 			res = write_bbt(mtd, buf, td, md, chipsel);
-- 
1.7.5.4
