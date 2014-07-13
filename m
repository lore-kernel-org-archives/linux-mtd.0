Received: from mail-we0-x22c.google.com ([2a00:1450:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6QAa-0004x3-5T
 for linux-mtd@lists.infradead.org; Sun, 13 Jul 2014 20:14:48 +0000
Received: by mail-we0-f172.google.com with SMTP id x48so1465449wes.17
 for <linux-mtd@lists.infradead.org>; Sun, 13 Jul 2014 13:14:25 -0700 (PDT)
From: Rob Ward <robert.ward114@googlemail.com>
Date: Sun, 13 Jul 2014 21:14:21 +0100 (BST)
To: joern@lazybastard.org, dwmw2@infradead.org
Subject: [PATCH] mtd: phram: Fix whitespace issues
Message-ID: <alpine.DEB.2.02.1407132105320.19235@rob-thinkpad>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From ae6ea29f112475aa1e2da20caabe36e318fd51c4 Mon Sep 17 00:00:00 2001
From: Rob Ward <robert.ward114@googlemail.com>
Date: Sun, 13 Jul 2014 20:39:01 +0100
Subject: [PATCH] mtd: phram: Fix whitespace issues

Fix various whitespace issues.

No functional changes.

Signed-off-by: Rob Ward <robert.ward114@googlemail.com>
---
 drivers/mtd/devices/phram.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 2cceebf..cf02f24 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -195,6 +195,7 @@ static int parse_name(char **pname, const char *token)
 static inline void kill_final_newline(char *str)
 {
 	char *newline = strrchr(str, '\n');
+
 	if (newline && !newline[1])
 		*newline = 0;
 }
@@ -233,7 +234,7 @@ static int phram_setup(const char *val)
 	strcpy(str, val);
 	kill_final_newline(str);
 
-	for (i=0; i<3; i++)
+	for (i = 0; i < 3; i++)
 		token[i] = strsep(&str, ",");
 
 	if (str)
-- 
1.8.1.2
