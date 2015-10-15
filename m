Received: from mail-lf0-f52.google.com ([209.85.215.52])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZmiIC-0002XR-7D
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 13:10:00 +0000
Received: by lfeh64 with SMTP id h64so27166665lfe.3
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 06:09:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Harkin <ryan.harkin@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 09/10] mtd: afs: factor the IIS read into partition parser
Date: Thu, 15 Oct 2015 15:08:52 +0200
Message-Id: <1444914533-27782-10-git-send-email-linus.walleij@linaro.org>
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

Factor the IIS (Image Information Structure) reading into the
partition parser, giving us a single, clean partition parser
function.

Cc: Ryan Harkin <ryan.harkin@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/afs.c | 59 +++++++++++++++++++------------------------------------
 1 file changed, 20 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/afs.c b/drivers/mtd/afs.c
index cdee8295d4c0..1ce6842c917c 100644
--- a/drivers/mtd/afs.c
+++ b/drivers/mtd/afs.c
@@ -88,42 +88,6 @@ static bool afs_is_v1(struct mtd_info *mtd, u_int off)
 	return (magic == AFSV1_FOOTER_MAGIC);
 }
 
-static int
-afs_read_iis_v1(struct mtd_info *mtd, struct image_info_v1 *iis, u_int ptr)
-{
-	size_t sz;
-	int ret, i;
-
-	memset(iis, 0, sizeof(*iis));
-	ret = mtd_read(mtd, ptr, sizeof(*iis), &sz, (u_char *)iis);
-	if (ret < 0)
-		goto failed;
-
-	if (sz != sizeof(*iis)) {
-		ret = -EINVAL;
-		goto failed;
-	}
-
-	ret = 0;
-
-	/*
-	 * Validate the name - it must be NUL terminated.
-	 */
-	for (i = 0; i < sizeof(iis->name); i++)
-		if (iis->name[i] == '\0')
-			break;
-
-	if (i < sizeof(iis->name))
-		ret = 1;
-
-	return ret;
-
- failed:
-	printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
-		ptr, ret);
-	return ret;
-}
-
 static int afs_parse_v1_partition(struct mtd_info *mtd,
 				  u_int off, struct mtd_partition *part)
 {
@@ -139,6 +103,7 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 	u_int ptr;
 	size_t sz;
 	int ret;
+	int i;
 
 	/*
 	 * This is the address mask; we use this to mask off out of
@@ -185,9 +150,25 @@ static int afs_parse_v1_partition(struct mtd_info *mtd,
 		return 0;
 
 	/* Read the image info block */
-	ret = afs_read_iis_v1(mtd, &iis, iis_ptr);
-	if (ret < 0)
-		return ret;
+	memset(&iis, 0, sizeof(iis));
+	ret = mtd_read(mtd, iis_ptr, sizeof(iis), &sz, (u_char *)&iis);
+	if (ret < 0) {
+		printk(KERN_ERR "AFS: mtd read failed at 0x%x: %d\n",
+		       iis_ptr, ret);
+		return -EINVAL;
+	}
+
+	if (sz != sizeof(iis))
+		return -EINVAL;
+
+	/*
+	 * Validate the name - it must be NUL terminated.
+	 */
+	for (i = 0; i < sizeof(iis.name); i++)
+		if (iis.name[i] == '\0')
+			break;
+	if (i > sizeof(iis.name))
+		return -EINVAL;
 
 	part->name = kstrdup(iis.name, GFP_KERNEL);
 	if (!part->name)
-- 
2.4.3
