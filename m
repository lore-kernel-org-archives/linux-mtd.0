Received: from mail-pb0-f42.google.com ([209.85.160.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnJ0G-0002Ri-8C
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 02:12:53 +0000
Received: by mail-pb0-f42.google.com with SMTP id uo5so17904532pbc.29
 for <linux-mtd@lists.infradead.org>; Sun, 01 Dec 2013 18:12:30 -0800 (PST)
Message-ID: <1385950345.30717.1.camel@phoenix>
Subject: [PATCH] mtd: Convert to use ATTRIBUTE_GROUPS
From: Axel Lin <axel.lin@ingics.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
Date: Mon, 02 Dec 2013 10:12:25 +0800
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use new ATTRIBUTE_GROUPS macro to declare attribute groups.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/mtd/mtdcore.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 92311a5..34c0b16 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -313,15 +313,7 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_bitflip_threshold.attr,
 	NULL,
 };
-
-static struct attribute_group mtd_group = {
-	.attrs		= mtd_attrs,
-};
-
-static const struct attribute_group *mtd_groups[] = {
-	&mtd_group,
-	NULL,
-};
+ATTRIBUTE_GROUPS(mtd);
 
 static struct device_type mtd_devtype = {
 	.name		= "mtd",
-- 
1.8.1.2
