Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIlKW-0007FN-NE
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 15:21:15 +0000
Received: by ewy7 with SMTP id 7so8487262ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 08:21:07 -0700 (PDT)
Message-ID: <4A3FBDA2.3070403@gmail.com>
Date: Mon, 22 Jun 2009 19:21:38 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: [PATCH] ubi: gluebi_{read, write} len + {from,
	to} can exceed mtd->size
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

when size_t `len' is negative it is wrapped so the test `len < 0' fails.
`from' and `to' have type loff_t (signed). During the addition `len' is
converted to signed. So when `len' is negative `from + len` can be
less than `mtd->size' while `from' is larger than `mtd->size'. This
patch fixes this.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
It should be correct, but please review.

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 95aaac0..093729b 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -173,7 +173,7 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int err = 0, lnum, offs, total_read;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || from < 0 || from + len > mtd->size)
+	if (len > mtd->size || from < 0 || from + len > mtd->size)
 		return -EINVAL;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
@@ -217,7 +217,7 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int err = 0, lnum, offs, total_written;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || to < 0 || len + to > mtd->size)
+	if (len > mtd->size || to < 0 || len + to > mtd->size)
 		return -EINVAL;
 
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
