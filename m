Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OcCEG-0007Pr-A9
	for linux-mtd@lists.infradead.org; Fri, 23 Jul 2010 06:59:33 +0000
Received: from epmmp1. (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L6000KE30R44S80@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 23 Jul 2010 15:59:28 +0900 (KST)
Received: from roh83 (unknown [107.108.214.183])
	by mmp1.samsung.com (Sun Java(tm) System Messaging Server 7u3-15.01
	64bit
	(built Feb 12 2010)) with ESMTPA id <0L600007K0R12I40@mmp1.samsung.com>
	for
	linux-mtd@lists.infradead.org; Fri, 23 Jul 2010 15:59:27 +0900 (KST)
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com,
	=?iso-8859-1?Q?'Enric_Balletb=F2_i_Serra'?= <eballetbo@gmail.com>
Subject: [PATCH]  [MTD] onenand/onenand_base.c:Fix for page addr calculation
	based on device type
Date: Fri, 23 Jul 2010 12:29:25 +0530
Message-id: <000401cb2a34$974af890$c5e0e9b0$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7bit
Content-language: en-us
Cc: rohit.hs@samsung.com, v.dalal@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

Sending the patch for page address calculation based on device type. This resolves the 
OneNAND DDP device read problem as pointed by Enric.
http://lists.infradead.org/pipermail/linux-mtd/2010-July/030920.html


Signed-off-by: Rohit HS <rohit.hs@samsung.com>
---
drivers/mtd/onenand/onenand_base.c |    7 +++++--
1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 26caf25..f749935 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -377,8 +377,11 @@ static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t le
 
 	default:
 		block = onenand_block(this, addr);
-		page = (int) (addr - onenand_addr(this, block)) >> this->page_shift;
-
+		if (FLEXONENAND(this))
+			page = (int) (addr - onenand_addr(this, block))>>\
+				this->page_shift;
+		else
+			page = (int) (addr >> this->page_shift);
 		if (ONENAND_IS_2PLANE(this)) {
 			/* Make the even block number */
 			block &= ~1;
---
