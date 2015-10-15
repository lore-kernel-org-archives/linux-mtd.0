Received: from mail-lb0-f173.google.com ([209.85.217.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmiHs-0005MS-5t
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 13:09:41 +0000
Received: by lbcao8 with SMTP id ao8so68525679lbc.3
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 06:09:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Harkin <ryan.harkin@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 03/10] mtd: afs: break out v1 footer magic to a define
Date: Thu, 15 Oct 2015 15:08:46 +0200
Message-Id: <1444914533-27782-4-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
References: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Break out the magic number to a #defined constant.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/afs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index 9af00528586f..d09280ae12bd 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -34,6 +34,8 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 
+#define AFSV1_FOOTER_MAGIC 0xA0FFFF9F
+
 struct footer_v1 {
 	u32 image_info_base;	/* Address of first word of ImageFooter  */
 	u32 image_start;	/* Start of area reserved by this footer */
@@ -90,7 +92,7 @@ afs_read_footer_v1(struct mtd_info *mtd, u_int *img_start, u_int *iis_start,
 	/*
 	 * Does it contain the magic number?
 	 */
-	if (fs.signature != 0xa0ffff9f)
+	if (fs.signature != AFSV1_FOOTER_MAGIC)
 		ret = 0;
 
 	/*
-- 
2.4.3
