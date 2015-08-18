From: Mike Scherban <m-scherban@ti.com>
To: <linux-mtd@lists.infradead.org>
CC: <dwmw2@infradead.org>, <m-karicheri2@ti.com>, Mike Scherban
 <m-scherban@ti.com>
Subject: [PATCH] mtd: davinci-nand: correct empty sector bit flips
Date: Tue, 18 Aug 2015 15:23:46 -0500
Message-ID: <1439929426-12284-1-git-send-email-m-scherban@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently empty page bit flips are not corrected and report 0 errors.
If there happens to be a bit flip, this will cause UBIFS to fail to
mount with a "corruption in empty space" error. The only way to recover
from this is to reflash the NAND partition.

This changes the empty page handling to count the number of bit flips
and correct them if they are under or equal to the ECC strength. UBI
will then resolve the mounting error without requiring a reflash.

Signed-off-by: Mike Scherban <m-scherban@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |   21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index feb6d18..8189d8a 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -316,12 +316,27 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
 	unsigned num_errors, corrected;
 	unsigned long timeo;
 
-	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
-	for (i = 0; i < 10; i++) {
+	/* All bytes 0xff?  It's an erased page;
+	 * Ignore its ECC, but check for bit flips.
+	 */
+	for (i = 0; i < info->chip.ecc.bytes; i++) {
 		if (ecc_code[i] != 0xff)
 			goto compare;
 	}
-	return 0;
+
+	/* Count bit flips in empty space. */
+	for (i = 0, corrected = 0; i < info->chip.ecc.size; i++)
+		corrected += hweight8(~data[i]);
+
+	/* If bit flips are above the ecc strength produce an error */
+	if (corrected > info->chip.ecc.strength)
+		return -EIO;
+
+	/* If there are bit flips correct the data */
+	if (corrected)
+		memset(data, 0xff, info->chip.ecc.size);
+
+	return corrected;
 
 compare:
 	/* Unpack ten bytes into eight 10 bit values.  We know we're
-- 
1.7.9.5
