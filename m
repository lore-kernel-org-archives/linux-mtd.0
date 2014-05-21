Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzqP-0000iZ-4n
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 06:17:41 +0000
Received: by mail-pb0-f50.google.com with SMTP id ma3so1085717pbc.23
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 23:17:20 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/6] mtd: slram: fix unused variable warning
Date: Tue, 20 May 2014 23:16:59 -0700
Message-Id: <1400653023-25757-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
References: <1400653023-25757-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  drivers/mtd/devices/slram.c: In function 'init_slram':
  drivers/mtd/devices/slram.c:283:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/slram.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 5a5cd2ace4a6..2fc4957cbe7f 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -280,14 +280,11 @@ __setup("slram=", mtd_slram_setup);
 static int __init init_slram(void)
 {
 	char *devname;
-	int i;
 
 #ifndef MODULE
 	char *devstart;
 	char *devlength;
 
-	i = 0;
-
 	if (!map) {
 		E("slram: not enough parameters.\n");
 		return(-EINVAL);
@@ -314,6 +311,7 @@ static int __init init_slram(void)
 	}
 #else
 	int count;
+	int i;
 
 	for (count = 0; count < SLRAM_MAX_DEVICES_PARAMS && map[count];
 			count++) {
-- 
1.7.9.5
