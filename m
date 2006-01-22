Received: from uproxy.gmail.com ([66.249.92.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F0hxD-0008RN-41
	for linux-mtd@lists.infradead.org; Sun, 22 Jan 2006 11:20:38 -0500
Received: by uproxy.gmail.com with SMTP id m3so619099ugc
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Jan 2006 08:20:33 -0800 (PST)
Date: Sun, 22 Jan 2006 19:32:08 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Andrew Morton <akpm@osdl.org>
Message-ID: <20060122163208.GA9016@mipter.zuzino.mipt.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] tsunami_flash: fix "parse error before ';' token"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/mtd/maps/tsunami_flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

--- a/drivers/mtd/maps/tsunami_flash.c
+++ b/drivers/mtd/maps/tsunami_flash.c
@@ -62,7 +62,7 @@ static void tsunami_flash_copy_to(
 static struct map_info tsunami_flash_map = {
 	.name = "flash chip on the Tsunami TIG bus",
 	.size = MAX_TIG_FLASH_SIZE,
-	.phys = NO_XIP;
+	.phys = NO_XIP,
 	.bankwidth = 1,
 	.read = tsunami_flash_read8,
 	.copy_from = tsunami_flash_copy_from,
