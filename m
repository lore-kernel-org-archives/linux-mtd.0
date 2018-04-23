Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAiB9-0004zY-EF
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 20:35:31 +0000
Received: by mail-pg0-x244.google.com with SMTP id i6so9172571pgv.3
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2018 13:35:03 -0700 (PDT)
Date: Mon, 23 Apr 2018 13:35:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nftl: Remove VLA usage
Message-ID: <20180423203500.GA36488@beast>
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

On the quest to remove all VLAs from the kernel[1] this changes the
check_free_sectors() routine to use the same stack buffer for both
data byte checks (SECTORSIZE) and oob byte checks (oobsize). Since
these regions aren't needed at the same time, they don't need to be
consecutively allocated. Additionally, while it's possible for oobsize
to be large, it is unlikely to be larger than the actual SECTORSIZE. As
such, remove the VLA, adjust offsets and add a sanity check to make sure
we never get a pathological oobsize.

[1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mtd/inftlmount.c | 11 ++++++++---
 drivers/mtd/nftlmount.c  | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index aab4f68bd36f..9cdae7f0fc2e 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -334,7 +334,7 @@ static int memcmpb(void *a, int c, int n)
 static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 	int len, int check_oob)
 {
-	u8 buf[SECTORSIZE + inftl->mbd.mtd->oobsize];
+	u8 buf[SECTORSIZE];
 	struct mtd_info *mtd = inftl->mbd.mtd;
 	size_t retlen;
 	int i;
@@ -346,10 +346,15 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 			return -1;
 
 		if (check_oob) {
+			if (mtd->oobsize > sizeof(buf)) {
+				pr_warn("MTD oobsize > SECTORSIZE: %d\n",
+					mtd->oobsize);
+				return -1;
+			}
 			if(inftl_read_oob(mtd, address, mtd->oobsize,
-					  &retlen, &buf[SECTORSIZE]) < 0)
+					  &retlen, buf) < 0)
 				return -1;
-			if (memcmpb(buf + SECTORSIZE, 0xff, mtd->oobsize) != 0)
+			if (memcmpb(buf, 0xff, mtd->oobsize) != 0)
 				return -1;
 		}
 		address += SECTORSIZE;
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index a6fbfa4e5799..e6eba7f3fdf5 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -272,7 +272,7 @@ static int memcmpb(void *a, int c, int n)
 static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int len,
 			      int check_oob)
 {
-	u8 buf[SECTORSIZE + nftl->mbd.mtd->oobsize];
+	u8 buf[SECTORSIZE];
 	struct mtd_info *mtd = nftl->mbd.mtd;
 	size_t retlen;
 	int i;
@@ -284,10 +284,15 @@ static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int
 			return -1;
 
 		if (check_oob) {
+			if (mtd->oobsize > sizeof(buf)) {
+				pr_warn("MTD oobsize > SECTORSIZE: %d\n",
+					mtd->oobsize);
+				return -1;
+			}
 			if(nftl_read_oob(mtd, address, mtd->oobsize,
-					 &retlen, &buf[SECTORSIZE]) < 0)
+					 &retlen, buf) < 0)
 				return -1;
-			if (memcmpb(buf + SECTORSIZE, 0xff, mtd->oobsize) != 0)
+			if (memcmpb(buf, 0xff, mtd->oobsize) != 0)
 				return -1;
 		}
 		address += SECTORSIZE;
-- 
2.7.4


-- 
Kees Cook
Pixel Security
