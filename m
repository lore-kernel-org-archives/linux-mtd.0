Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwWs-00038V-NO
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:32:55 +0000
Received: by pbbrq13 with SMTP id rq13so1739571pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:32:53 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 05/10] mtd: denali: utilize oob_required parameter
Date: Fri, 27 Apr 2012 18:29:49 -0700
Message-Id: <1335576594-25267-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Axel Lin <axel.lin@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't return OOB if the caller doesn't require it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/denali.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 436ea83..c56757f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1204,7 +1204,9 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	denali_enable_dma(denali, false);
 
 	memcpy(buf, denali->buf.buf, mtd->writesize);
-	memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize, mtd->oobsize);
+	if (oob_required)
+		memcpy(chip->oob_poi, denali->buf.buf + mtd->writesize,
+				mtd->oobsize);
 
 	return 0;
 }
-- 
1.7.5.4.2.g519b1
