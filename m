Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKVxK-0005Il-8d
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 16:43:07 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/3] UBI: block: Use 'u64' for the 64-bit dividend
Date: Mon,  3 Mar 2014 13:42:39 -0300
Message-Id: <1393864960-20825-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393864960-20825-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393864960-20825-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes the following warning on ARCH=avr32:

  drivers/mtd/ubi/block.c: In function 'ubiblock_read':
  drivers/mtd/ubi/block.c:207: warning: comparison of distinct pointer types lacks a cast

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 4c970bc..7a9eeb20 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -201,7 +201,7 @@ static int ubiblock_read(struct ubiblock *dev, char *buffer,
 	int ret, leb, offset;
 	int bytes_left = len;
 	int to_read = len;
-	loff_t pos = sec << 9;
+	u64 pos = sec << 9;
 
 	/* Get LEB:offset address to read from */
 	offset = do_div(pos, dev->leb_size);
-- 
1.8.1.5
