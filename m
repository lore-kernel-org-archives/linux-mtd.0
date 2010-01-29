Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Naxwl-0000UP-GF
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 21:00:12 +0000
Subject: [PATCHv3 9/9] mtdchar: Register the full range of minor numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
References: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Fri, 29 Jan 2010 21:00:04 +0000
Message-Id: <1264798804.2785.42.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

register_chrdev() registers minor numbers up to 255, but we can now
potentially have much larger numbers.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/mtdchar.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 04fd7e5..09b0ab5 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -955,7 +955,8 @@ static int __init init_mtdchar(void)
 {
 	int status;
 
-	status = register_chrdev(MTD_CHAR_MAJOR, "mtd", &mtd_fops);
+	status = __register_chrdev(MTD_CHAR_MAJOR, 0, 1 << MINORBITS,
+				   "mtd", &mtd_fops);
 	if (status < 0) {
 		printk(KERN_NOTICE "Can't allocate major number %d for Memory Technology Devices.\n",
 		       MTD_CHAR_MAJOR);
@@ -966,7 +967,7 @@ static int __init init_mtdchar(void)
 
 static void __exit cleanup_mtdchar(void)
 {
-	unregister_chrdev(MTD_CHAR_MAJOR, "mtd");
+	__unregister_chrdev(MTD_CHAR_MAJOR, 0, 1 << MINORBITS, "mtd");
 }
 
 module_init(init_mtdchar);
-- 
1.5.5

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
