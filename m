Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh8pZ-0001SE-Dj
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 21:50:18 +0000
Received: by ewy23 with SMTP id 23so429686ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 13:50:01 -0800 (PST)
Message-ID: <4B79C344.60908@gmail.com>
Date: Mon, 15 Feb 2010 22:57:24 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: misplaced parenthesis in find_boot_record()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The parenthesis was misplaced, upon error a one was shown.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index 32e82ae..a269c62 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -102,7 +102,7 @@ static int find_boot_record(struct INFTLrecord *inftl)
 		/* To be safer with BIOS, also use erase mark as discriminant */
 		if ((ret = inftl_read_oob(mtd, block * inftl->EraseSize +
 					  SECTORSIZE + 8, 8, &retlen,
-					  (char *)&h1) < 0)) {
+					  (char *)&h1)) < 0) {
 			printk(KERN_WARNING "INFTL: ANAND header found at "
 				"0x%x in mtd%d, but OOB data read failed "
 				"(err %d)\n", block * inftl->EraseSize,
