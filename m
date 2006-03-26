Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FNYgX-0003LL-0P
	for linux-mtd@lists.infradead.org; Sun, 26 Mar 2006 12:05:59 -0500
Date: Sun, 26 Mar 2006 19:05:46 +0200
From: Adrian Bunk <bunk@stusta.de>
To: dwmw2@infradead.org
Message-ID: <20060326170546.GO4053@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: "Petri T. Koistinen" <petri.koistinen@iki.fi>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [2.6 patch] drivers_mtd_maps_vmax301.c: fix off by one vmax_mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Petri T. Koistinen" <petri.koistinen@iki.fi>

This patch fixes an obcious off-by-one error (vmax_mtd[] contains 
two elements).

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.14-rc3-git3/drivers/mtd/maps/vmax301.c	2005-05-25 13:48:53.000000000 +1000
+++ .6877.trivial/drivers/mtd/maps/vmax301.c	2005-10-04 19:29:50.000000000 +1000
@@ -182,7 +182,7 @@ int __init init_vmax301(void)
 		}
 	}
 
-	if (!vmax_mtd[1] && !vmax_mtd[2]) {
+	if (!vmax_mtd[0] && !vmax_mtd[1]) {
 		iounmap((void *)iomapadr);
 		return -ENXIO;
 	}
