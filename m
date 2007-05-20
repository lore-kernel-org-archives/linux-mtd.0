Received: from mail.gmx.net ([213.165.64.20])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hpriq-00006v-NZ
	for linux-mtd@lists.infradead.org; Sun, 20 May 2007 16:09:46 -0400
Date: Sun, 20 May 2007 22:09:37 +0200
From: Eric Sesterhenn / Snakebyte <snakebyte@gmx.de>
To: joern@wh.fh-wedel.de
Subject: leak in mtd/devices/phram.c
Message-ID: <20070520200936.GB22049@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

coverity spotted this leak in mtd/devices/phram.c (bug id #1512),
when register_device() fails, we dont kfree() name and leak it,
attached patch should fix this.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6/drivers/mtd/devices/phram.c.orig	2007-05-20 22:04:24.000000000 +0200
+++ linux-2.6/drivers/mtd/devices/phram.c	2007-05-20 22:06:12.000000000 +0200
@@ -276,7 +276,9 @@ static int phram_setup(const char *val, 
 		parse_err("illegal device length\n");
 	}
 
-	register_device(name, start, len);
+	ret = register_device(name, start, len);
+	if (ret)
+		kfree(name);
 
 	return 0;
 }
