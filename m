Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1CFM-0006oN-9w
 for linux-mtd@lists.infradead.org; Sun, 29 Jun 2014 10:22:08 +0000
Received: by mail-wg0-f52.google.com with SMTP id b13so6862226wgh.11
 for <linux-mtd@lists.infradead.org>; Sun, 29 Jun 2014 03:21:45 -0700 (PDT)
Sender: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Jiri Kosina <trivial@kernel.org>
Subject: [PATCH -trivial 2/4] mtd: cmdlinepart: Spelling s/trucate/truncate/
Date: Sun, 29 Jun 2014 12:21:37 +0200
Message-Id: <1404037299-31570-2-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1404037299-31570-1-git-send-email-geert@linux-m68k.org>
References: <1404037299-31570-1-git-send-email-geert@linux-m68k.org>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/cmdlinepart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 3e829b37af8d..c8503006f17a 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -26,7 +26,7 @@
  * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
  * <size>    := standard linux memsize OR "-" to denote all remaining space
  *              size is automatically truncated at end of device
- *              if specified or trucated size is 0 the part is skipped
+ *              if specified or truncated size is 0 the part is skipped
  * <offset>  := standard linux memsize
  *              if omitted the part will immediately follow the previous part
  *              or 0 if the first part
-- 
1.9.1
