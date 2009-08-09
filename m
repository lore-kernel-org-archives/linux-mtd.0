Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma4ng-0005b3-UN
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 09:34:53 +0000
Received: by ewy7 with SMTP id 7so2089665ewy.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 09 Aug 2009 02:34:48 -0700 (PDT)
Message-ID: <4A7E9917.4050307@gmail.com>
Date: Sun, 09 Aug 2009 11:38:31 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] MTD: Prevent a read from regions[-1]
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the erase region was found in the first iteration we read from
regions[-1]

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 349fcbe..a83cfa1 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -453,7 +453,8 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		for (i = 0; i < max && regions[i].offset <= slave->offset; i++)
 			;
 		/* The loop searched for the region _behind_ the first one */
-		i--;
+		if (i > 0)
+			i--;
 
 		/* Pick biggest erasesize */
 		for (; i < max && regions[i].offset < end; i++) {
