Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GOEqN-0006Jr-Fo
	for linux-mtd@lists.infradead.org; Fri, 15 Sep 2006 15:39:04 +0100
Date: Fri, 15 Sep 2006 16:37:11 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Andrew Morton <akpm@osdl.org>
Subject: [-mm patch 2/3] AVR32 MTD: Unlock flash if necessary (try 2)
Message-ID: <20060915163711.10d19763@cad-250-152.norway.atmel.com>
In-Reply-To: <20060915163554.4f326bf6@cad-250-152.norway.atmel.com>
References: <20060915163102.73bf171d@cad-250-152.norway.atmel.com>
	<20060915163554.4f326bf6@cad-250-152.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, David
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a cfi_cmdset_0002 fixup installs an unlock() operation, use it
to unlock the whole flash after the erase regions have been set up.

I wanted to do this in the fixup itself, but it wouldn't work because
the erase regions hadn't been initialized, and mtd->size was zero.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    9 +++++++++
 1 file changed, 9 insertions(+)

Index: linux-2.6.18-rc6-mm2/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.6.18-rc6-mm2.orig/drivers/mtd/chips/cfi_cmdset_0002.c	2006-09-15 14:39:40.000000000 +0200
+++ linux-2.6.18-rc6-mm2/drivers/mtd/chips/cfi_cmdset_0002.c	2006-09-15 15:45:41.000000000 +0200
@@ -416,6 +416,15 @@ static struct mtd_info *cfi_amdstd_setup
 	}
 #endif
 
+	/*
+	 * If an unlock() operation was installed by a fixup, use it
+	 * now to unlock the whole flash.
+	 */
+	if (mtd->unlock && mtd->unlock(mtd, 0, mtd->size))
+		printk(KERN_WARNING "%s: unlock failed, writes may not work\n",
+		       map->name);
+
+
 	/* FIXME: erase-suspend-program is broken.  See
 	   http://lists.infradead.org/pipermail/linux-mtd/2003-December/009001.html */
 	printk(KERN_NOTICE "cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.\n");
