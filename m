Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fnqg3-0002Wg-Vi
	for linux-mtd@lists.infradead.org; Wed, 07 Jun 2006 01:34:05 -0400
Date: Wed, 7 Jun 2006 09:34:37 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] NAND: fix remaining OOB length calculation in
	nand_read_page_syndrome/nand_write_page_syndrome
Message-Id: <20060607093437.f6ceb09b.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

inlined is the trivial patch that fixes remaining OOB length calculation in nand_read_page_syndrome/nand_write_page_syndrome.

Signed-off-by: Vitaly Wool <vwool@ru.mvista.com>

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 77406fc..e74678e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -883,7 +883,7 @@ static int nand_read_page_syndrome(struc
 	}
 
 	/* Calculate remaining oob bytes */
-	i = oob - chip->oob_poi;
+	i = mtd->oobsize - (oob - chip->oob_poi);
 	if (i)
 		chip->read_buf(mtd, oob, i);
 
@@ -1334,7 +1334,7 @@ static void nand_write_page_syndrome(str
 	}
 
 	/* Calculate remaining oob bytes */
-	i = oob - chip->oob_poi;
+	i = mtd->oobsize - (oob - chip->oob_poi);
 	if (i)
 		chip->write_buf(mtd, oob, i);
 }
