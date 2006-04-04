Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FQhrC-000334-Fx
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 10:29:51 +0100
Date: Tue, 4 Apr 2006 11:29:30 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Andrew Morton <akpm@osdl.org>
Message-ID: <20060404092930.GC12277@wohnheim.fh-wedel.de>
References: <20060404092628.GA12277@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060404092628.GA12277@wohnheim.fh-wedel.de>
Cc: Simon Evans <spse@secret.org.uk>, "Eric W. Biederman" <ebiederman@lnxi.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [Patch 2/3] Mark block2mtd as not deprecated
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The last (and only) bugreport for this driver was > 1 year ago.  There
is no reason to mark it as experimental anymore.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 drivers/mtd/devices/Kconfig |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)


--- blkmtd/drivers/mtd/devices/Kconfig~block2mtd_experimental	2006-04-04 11:05:33.000000000 +0200
+++ blkmtd/drivers/mtd/devices/Kconfig	2006-04-04 11:08:40.000000000 +0200
@@ -143,12 +143,10 @@ config MTD_BLKMTD
 
 config MTD_BLOCK2MTD
 	tristate "MTD using block device (rewrite)"
-	depends on MTD && EXPERIMENTAL
+	depends on MTD
 	help
 	  This driver is basically the same at MTD_BLKMTD above, but
-	  experienced some interface changes plus serious speedups.  In
-	  the long term, it should replace MTD_BLKMTD.  Right now, you
-	  shouldn't entrust important data to it yet.
+	  experienced some interface changes plus serious speedups.
 
 comment "Disk-On-Chip Device Drivers"
 
