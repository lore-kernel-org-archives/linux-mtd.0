Received: from grimli.r00tworld.net ([83.169.44.195] helo=mail.r00tworld.net)
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PjTdQ-0005Ty-Tl
	for linux-mtd@lists.infradead.org; Sun, 30 Jan 2011 09:31:53 +0000
From: Mathias Krause <minipli@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: fix memory leak
Date: Sun, 30 Jan 2011 10:31:48 +0100
Message-Id: <1296379908-10150-1-git-send-email-minipli@googlemail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Mathias Krause <minipli@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 4f678a58 missed two cases where the memory allocated for name
would be leaked. This commit frees the memory when register_device()
fails and on unregister_devices().

Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 drivers/mtd/devices/phram.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 5239328..8d28fa0 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -117,6 +117,7 @@ static void unregister_devices(void)
 	list_for_each_entry_safe(this, safe, &phram_list, list) {
 		del_mtd_device(&this->mtd);
 		iounmap(this->mtd.priv);
+		kfree(this->mtd.name);
 		kfree(this);
 	}
 }
@@ -275,6 +276,8 @@ static int phram_setup(const char *val, struct kernel_param *kp)
 	ret = register_device(name, start, len);
 	if (!ret)
 		pr_info("%s device: %#x at %#x\n", name, len, start);
+	else
+		kfree(name);
 
 	return ret;
 }
-- 
1.5.6.5
