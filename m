Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NtgLW-0006HO-3U
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2010 12:03:06 +0000
Received: by bwz10 with SMTP id 10so7463460bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Mar 2010 05:02:59 -0700 (PDT)
Date: Mon, 22 Mar 2010 15:02:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: silence compile warning
Message-ID: <20100322115819.GA21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This gets rid of a compile warning:
drivers/mtd/maps/dmv182.c:120: warning: format ‘%d’ expects type 
	‘int’, but argument 2 has type ‘uint64_t’

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/maps/dmv182.c b/drivers/mtd/maps/dmv182.c
index d171674..680ba2d 100644
--- a/drivers/mtd/maps/dmv182.c
+++ b/drivers/mtd/maps/dmv182.c
@@ -116,7 +116,7 @@ static int __init init_svme182(void)
 		return -ENXIO;
 	}
 
-	printk(KERN_NOTICE "SVME182 flash device: %dMiB at 0x%08x\n",
+	printk(KERN_NOTICE "SVME182 flash device: %lldMiB at 0x%08x\n",
 		   this_mtd->size >> 20, FLASH_BASE_ADDR);
 
 	this_mtd->owner = THIS_MODULE;
