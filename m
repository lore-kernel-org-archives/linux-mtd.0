Received: from emailhub.stusta.mhn.de ([141.84.69.5]
	helo=mailout.stusta.mhn.de)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CmZB2-00084o-DX
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2005 10:03:53 -0500
Date: Thu, 6 Jan 2005 16:03:46 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>, dwmw2@infradead.org
Message-ID: <20050106150346.GC3096@stusta.de>
References: <20050106002240.00ac4611.akpm@osdl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050106002240.00ac4611.akpm@osdl.org>
Cc: joern@wh.fh-wedel.de, Simon Evans <spse@secret.org.uk>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [patch] 2.6.10-mm2: fix MTD_BLOCK2MTD dependency
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch below fixes an obviously wrong dependency coming from Linus' 
tree.


Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.10-mm2-full/drivers/mtd/devices/Kconfig.old	2005-01-06 16:00:49.000000000 +0100
+++ linux-2.6.10-mm2-full/drivers/mtd/devices/Kconfig	2005-01-06 16:00:59.000000000 +0100
@@ -127,7 +127,7 @@
 
 config MTD_BLOCK2MTD
 	tristate "MTD using block device (rewrite)"
-	depends on MTD || EXPERIMENTAL
+	depends on MTD && EXPERIMENTAL
 	help
 	  This driver is basically the same at MTD_BLKMTD above, but
 	  experienced some interface changes plus serious speedups.  In
