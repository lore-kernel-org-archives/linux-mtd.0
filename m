Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MlhgK-0002wF-V7
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 11:19:20 +0000
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1MlhgH-0002LQ-RR
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 07:19:14 -0400
Date: Thu, 10 Sep 2009 07:19:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] Kconfig: MTD_DATAFLASH_WRITE_VERIFY ->
	MTD_DATAFLASH_VERIFY_WRITE
Message-ID: <alpine.LFD.2.00.0909100716440.19313@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Fix the misspelled Kconfig variable "MTD_DATAFLASH_WRITE_VERIFY" so
that it matches the spelling here:

drivers/mtd/devices/mtd_dataflash.c:#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
drivers/mtd/devices/mtd_dataflash.c:#endif	/* CONFIG_MTD_DATAFLASH_VERIFY_WRITE */

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index 325fab9..3265e96 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -59,7 +59,7 @@ config MTD_DATAFLASH
 	  Sometimes DataFlash chips are packaged inside MMC-format
 	  cards; at this writing, the MMC stack won't handle those.

-config MTD_DATAFLASH_WRITE_VERIFY
+config MTD_DATAFLASH_VERIFY_WRITE
 	bool "Verify DataFlash page writes"
 	depends on MTD_DATAFLASH
 	help


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
