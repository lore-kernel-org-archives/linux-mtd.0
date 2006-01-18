Received: from zproxy.gmail.com ([64.233.162.207])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ez4oF-0007Lm-OX
	for linux-mtd@lists.infradead.org; Tue, 17 Jan 2006 23:20:47 -0500
Received: by zproxy.gmail.com with SMTP id i11so1537541nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Jan 2006 20:20:27 -0800 (PST)
Message-ID: <7e560e180601172020u20e8af62q4a355676de4f8082@mail.gmail.com>
Date: Wed, 18 Jan 2006 17:20:27 +1300
From: Braden Simpson <braden.simpson@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_12720_29341443.1137558027196"
Subject: Suggested fix for fill_autooob_layout eternal loop
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_12720_29341443.1137558027196
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,

I have attached what is hopefully a patch for the problem I had with
the fill_autooob_layout
function in nand_base.c where it would loop forever.  I have
'refactored' the code to handle
the out of order .oobfree list in the latest version of diskonchip.c
and it should be a little
more resilient to unusual arrangements inside nand_oobinfo structures.

I'm new to this creating patches thing so if I've missed something
then let me know.

Regards,

Braden Simpson

------=_Part_12720_29341443.1137558027196
Content-Type: application/octet-stream; name=fill_autooob_layout.patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fill_autooob_layout.patch"

diff -urN nand.original/nand_base.c nand.modified/nand_base.c
--- nand.original/nand_base.c	2005-12-17 14:02:11.000000000 +1300
+++ nand.modified/nand_base.c	2006-01-19 05:55:27.673737208 +1300
@@ -2558,21 +2558,29 @@
 	DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: data type, length %d\n", this->layout[0].length);
 
 	while (i < HW_AUTOOOB_LAYOUT_SIZE / this->eccsteps - 1 && cur < mtd->oobsize / this->eccsteps) {
-		if (oob->oobfree[oobcur][0] == cur) {
-			int len = oob->oobfree[oobcur][1];
-			oobfreesize += this->layout[i].length;
-			oobcur++;
-			if (i > 0 && this->layout[i-1].type == ITEM_TYPE_OOB) {
-				i--;
-				cur -= this->layout[i].length;
-				this->layout[i].length += len;
-				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob concatenated, aggregate length %d\n", this->layout[i].length);
-			} else {
-				this->layout[i].type = ITEM_TYPE_OOB;
-				this->layout[i].length = len;
-				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob type, length %d\n", this->layout[i].length);
+		/* Check for an oob free marker that corresponds to this location  */
+		/* Note that the .oobfree list may not be in order (diskonchip is the main culprit here) so */
+		/* scan through the entire list each time */
+		for (oobcur = 0; oob->oobfree[oobcur][1] != 0; oobcur++) {
+			if (oob->oobfree[oobcur][0] == cur) {
+				oobfreesize = oob->oobfree[oobcur][1];
+				if (i > 0 && this->layout[i-1].type == ITEM_TYPE_OOB) {
+					this->layout[i-1].length += oobfreesize;
+					DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: marked oob concatenated, aggregate length %d\n", this->layout[i-1].length);
+				} else {
+					this->layout[i].type = ITEM_TYPE_OOB;
+					this->layout[i].length = oobfreesize;
+					DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: marked oob type, length %d\n", this->layout[i].length);
+					i++;
+				}
+				cur += oobfreesize;
+				/* Restart the scan as the oob free marker for this next location may be earlier in the list */
+				oobcur = 0;
 			}
-		} else if (oob->eccpos[eccpos] == cur) {
+		}
+		/* Check if this location in the oob is used to store the ecc */
+		/* This assumes that the ecc position list is in ascending order, which seems reasonable */
+		if (oob->eccpos[eccpos] == cur) {
 			int eccpos_cur = eccpos;
 			do  {
 				eccpos++;
@@ -2583,21 +2591,21 @@
 			this->layout[i].type = ITEM_TYPE_ECC;
 			this->layout[i].length = eccpos - eccpos_cur;
 			DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: ecc type, length %d\n", this->layout[i].length);
-		} else {
-			int len = min_t(int, oob->eccpos[eccpos], oob->oobfree[oobcur][0]);
+			cur += this->layout[i].length;
+			i++;
+		} else if (cur < mtd->oobsize / this->eccsteps) {
+			/* Handle any unclaimed locations by collecting them one by one */
 			if (i > 0 && this->layout[i-1].type == ITEM_TYPE_OOB) {
-				i--;
-				cur -= this->layout[i].length;
-				this->layout[i].length += len;
-				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob concatenated, aggregate length %d\n", this->layout[i].length);
+				this->layout[i-1].length += 1;
+				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob concatenated, aggregate length %d\n", this->layout[i-1].length);
 			} else {
 				this->layout[i].type = ITEM_TYPE_OOB;
-				this->layout[i].length = len;
+				this->layout[i].length = 1;
 				DEBUG (MTD_DEBUG_LEVEL3, "fill_autooob_layout: oob type, length %d\n", this->layout[i].length);
+				i++;
 			}
+			cur++;
 		}
-		cur += this->layout[i].length;
-		i++;
 	}
 	if (cur < mtd->oobsize / this->eccsteps - 1) {
 		kfree(this->layout);







------=_Part_12720_29341443.1137558027196--
