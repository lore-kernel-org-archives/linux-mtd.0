Received: from kroah.org ([198.145.64.141] helo=coco.kroah.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KoARw-0007fa-HH
	for linux-mtd@lists.infradead.org; Fri, 10 Oct 2008 05:22:04 +0000
Date: Thu, 9 Oct 2008 22:13:21 -0700
From: Greg KH <greg@kroah.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] USB: remove info() macro from usb mtd drivers
Message-ID: <20081010051321.GA32687@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-usb@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Greg Kroah-Hartman <gregkh@suse.de>

USB should not be having it's own printk macros, so remove info() and
use the system-wide standard of dev_info() wherever possible.

Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
---
David, this has been in the USB tree for a few months now, sorry for not
sending it to you sooner.  I can easily keep it in my tree and send it
to Linus for this merge if you want me to, or you can take it in your
tree, which ever you want me to do.

thanks,

greg k-h

 drivers/mtd/nand/alauda.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -691,7 +691,7 @@ static int alauda_probe(struct usb_inter
 	al[0].port = ALAUDA_PORT_XD;
 	al[1].port = ALAUDA_PORT_SM;
 
-	info("alauda probed");
+	dev_info(&interface->dev, "alauda probed\n");
 	alauda_check_media(al);
 	alauda_check_media(al+1);
 
@@ -716,7 +716,7 @@ static void alauda_disconnect(struct usb
 	if (al)
 		kref_put(&al->kref, alauda_delete);
 
-	info("alauda gone");
+	dev_info(&interface->dev, "alauda gone");
 }
 
 static struct usb_driver alauda_driver = {
