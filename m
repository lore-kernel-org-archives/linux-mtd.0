Received: from zone0.gcu-squad.org ([212.85.147.21]
	helo=services.gcu-squad.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KGuSZ-0004no-DJ
	for linux-mtd@lists.infradead.org; Thu, 10 Jul 2008 11:37:15 +0000
Date: Thu, 10 Jul 2008 13:37:08 +0200
From: Jean Delvare <khali@linux-fr.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] No debug message when debugging is disabled
Message-ID: <20080710133708.32e53b71@hyperion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: John Stoffel <john@stoffel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use pr_debug(...) instead of printk(KERN_DEBUG ...) so that the message
is only printed when debugging is enabled.

Signed-off-by: Jean Delvare <khali@linux-fr.org>
Tested-by: John stoffel <john@stoffel.org>
---
This patch was already sent on:
 * 2008-06-12

David, can you please add this patch to your tree? Thanks.

 drivers/mtd/chips/gen_probe.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.26-rc5.orig/drivers/mtd/chips/gen_probe.c	2008-04-17 04:49:44.000000000 +0200
+++ linux-2.6.26-rc5/drivers/mtd/chips/gen_probe.c	2008-06-12 22:20:12.000000000 +0200
@@ -71,8 +71,8 @@ static struct cfi_private *genprobe_iden
 	   interleave and device type, etc. */
 	if (!genprobe_new_chip(map, cp, &cfi)) {
 		/* The probe didn't like it */
-		printk(KERN_DEBUG "%s: Found no %s device at location zero\n",
-		       cp->name, map->name);
+		pr_debug("%s: Found no %s device at location zero\n",
+			 cp->name, map->name);
 		return NULL;
 	}
 


-- 
Jean Delvare
