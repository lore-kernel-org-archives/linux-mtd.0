Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ons7Y-0003f0-3J
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 11:56:54 +0000
Received: by eye22 with SMTP id 22so3692497eye.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 04:56:50 -0700 (PDT)
Date: Tue, 24 Aug 2010 13:56:27 +0200
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd/pcmciamtd: remove dead code
Message-ID: <20100824115627.GD29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Magnus Damm <damm@opensource.se>, Alexander Kurz <linux@kbdbabel.org>,
	linux-mtd@lists.infradead.org, Karsten Keil <keil@b1-systems.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This code isn't reachable.  I looked through the git history and it
hasn't been reachable for years.  Someone removed the label to silence
gcc's unused label warning but these few lines accidentally got left
behind.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index e9ca5ba..86c7468 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -654,10 +654,6 @@ static int pcmciamtd_config(struct pcmcia_device *link)
 	}
 	dev_info(&dev->p_dev->dev, "mtd%d: %s\n", mtd->index, mtd->name);
 	return 0;
-
-	dev_err(&dev->p_dev->dev, "CS Error, exiting\n");
-	pcmciamtd_release(link);
-	return -ENODEV;
 }
 
 
