Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fCnp8-0003uJ-K1
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2018 15:01:12 +0000
Received: by mail-pg0-x241.google.com with SMTP id p9-v6so1785602pgc.9
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2018 08:00:56 -0700 (PDT)
Date: Sun, 29 Apr 2018 08:00:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: nftl: Remove VLA usage
Message-ID: <20180429150053.GA27374@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On the quest to remove all stack VLAs from the kernel[1] this changes
the check_free_sectors() routine to use a kmalloc()ed buffer instead
of a large VLA stack buffer.

[1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: kmalloc() instead of stack buffer (Boris)
---
 drivers/mtd/inftlmount.c | 23 ++++++++++++++++-------
 drivers/mtd/nftlmount.c  | 23 ++++++++++++++++-------
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index aab4f68bd36f..2d598412972d 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -334,28 +334,37 @@ static int memcmpb(void *a, int c, int n)
 static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 	int len, int check_oob)
 {
-	u8 buf[SECTORSIZE + inftl->mbd.mtd->oobsize];
 	struct mtd_info *mtd = inftl->mbd.mtd;
 	size_t retlen;
-	int i;
+	int i, ret;
+	u8 *buf;
+
+	buf = kmalloc(SECTORSIZE + mtd->oobsize, GFP_KERNEL);
+	if (!buf)
+		return -1;
 
+	ret = -1;
 	for (i = 0; i < len; i += SECTORSIZE) {
 		if (mtd_read(mtd, address, SECTORSIZE, &retlen, buf))
-			return -1;
+			goto out;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
-			return -1;
+			goto out;
 
 		if (check_oob) {
 			if(inftl_read_oob(mtd, address, mtd->oobsize,
 					  &retlen, &buf[SECTORSIZE]) < 0)
-				return -1;
+				goto out;
 			if (memcmpb(buf + SECTORSIZE, 0xff, mtd->oobsize) != 0)
-				return -1;
+				goto out;
 		}
 		address += SECTORSIZE;
 	}
 
-	return 0;
+	ret = 0;
+
+out:
+	kfree(buf);
+	return ret;
 }
 
 /*
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index a6fbfa4e5799..6281da3dadac 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -272,28 +272,37 @@ static int memcmpb(void *a, int c, int n)
 static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int len,
 			      int check_oob)
 {
-	u8 buf[SECTORSIZE + nftl->mbd.mtd->oobsize];
 	struct mtd_info *mtd = nftl->mbd.mtd;
 	size_t retlen;
-	int i;
+	int i, ret;
+	u8 *buf;
+
+	buf = kmalloc(SECTORSIZE + mtd->oobsize, GFP_KERNEL);
+	if (!buf)
+		return -1;
 
+	ret = -1;
 	for (i = 0; i < len; i += SECTORSIZE) {
 		if (mtd_read(mtd, address, SECTORSIZE, &retlen, buf))
-			return -1;
+			goto out;
 		if (memcmpb(buf, 0xff, SECTORSIZE) != 0)
-			return -1;
+			goto out;
 
 		if (check_oob) {
 			if(nftl_read_oob(mtd, address, mtd->oobsize,
 					 &retlen, &buf[SECTORSIZE]) < 0)
-				return -1;
+				goto out;
 			if (memcmpb(buf + SECTORSIZE, 0xff, mtd->oobsize) != 0)
-				return -1;
+				goto out;
 		}
 		address += SECTORSIZE;
 	}
 
-	return 0;
+	ret = 0;
+
+out:
+	kfree(buf);
+	return ret;
 }
 
 /* NFTL_format: format a Erase Unit by erasing ALL Erase Zones in the Erase Unit and
-- 
2.7.4


-- 
Kees Cook
Pixel Security
