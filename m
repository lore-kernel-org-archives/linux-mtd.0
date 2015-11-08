Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvLde-0000uz-JG
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2015 08:47:51 +0000
Received: by pabfh17 with SMTP id fh17so166952120pab.0
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2015 00:47:29 -0800 (PST)
From: Saurabh Sengar <saurabh.truth@gmail.com>
To: joern@lazybastard.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Saurabh Sengar <saurabh.truth@gmail.com>
Subject: [PATCH] mtd: phram: error handling
Date: Sun,  8 Nov 2015 14:17:20 +0530
Message-Id: <1446972440-3795-1-git-send-email-saurabh.truth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

registering the device with NULL pointer can lead to crash,
hence fixing it.

Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
---
in case of 'illegal start address' or 'illegal device length', name pointer is getting freed.
we shouldn't register the device with NULL pointer. 

 drivers/mtd/devices/phram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 8b66e52..9a7aed3 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -249,12 +249,14 @@ static int phram_setup(const char *val)
 	if (ret) {
 		kfree(name);
 		parse_err("illegal start address\n");
+		goto err;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
 		kfree(name);
 		parse_err("illegal device length\n");
+		goto err;
 	}
 
 	ret = register_device(name, start, len);
@@ -262,7 +264,7 @@ static int phram_setup(const char *val)
 		pr_info("%s device: %#llx at %#llx\n", name, len, start);
 	else
 		kfree(name);
-
+err:
 	return ret;
 }
 
-- 
1.9.1
