Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXntE-0001lt-Ja
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 12:47:58 +0000
Subject: [PATCH 3/3] mtd/nftlmount: Add some spaces for better code readability
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <57d4cbcf-c99c-f3d5-e2bf-f67873f321ea@users.sourceforge.net>
Message-ID: <a0ebf648-a73a-e3ff-5ca9-e84598d4196c@users.sourceforge.net>
Date: Sat, 6 Jan 2018 13:47:37 +0100
MIME-Version: 1.0
In-Reply-To: <57d4cbcf-c99c-f3d5-e2bf-f67873f321ea@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 12:58:37 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nftlmount.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index d1eaa87c88ba..457f3572c582 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -253,7 +253,7 @@ The new DiskOnChip driver already scanned the bad block table.  Just query it.
 
 	} /* foreach (block) */
 
-	return boot_record_count?0:-1;
+	return boot_record_count ? 0 : -1;
 }
 
 static int memcmpb(void *a, int c, int n)
@@ -282,8 +282,8 @@ static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int
 			return -1;
 
 		if (check_oob) {
-			if(nftl_read_oob(mtd, address, mtd->oobsize,
-					 &retlen, &buf[SECTORSIZE]) < 0)
+			if (nftl_read_oob(mtd, address, mtd->oobsize,
+					  &retlen, &buf[SECTORSIZE]) < 0)
 				return -1;
 			if (memcmpb(buf + SECTORSIZE, 0xff, mtd->oobsize) != 0)
 				return -1;
@@ -389,7 +389,7 @@ static void check_sectors_in_chain(struct NFTLrecord *nftl, unsigned int first_b
 			else
 				status = bci.Status | bci.Status1;
 
-			switch(status) {
+			switch (status) {
 			case SECTOR_FREE:
 				/* verify that the sector is really free. If not, mark
 				   as ignore */
-- 
2.15.1
