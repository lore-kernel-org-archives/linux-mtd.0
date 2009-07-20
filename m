Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MShZQ-00081o-VG
	for linux-mtd@lists.infradead.org; Mon, 20 Jul 2009 01:21:40 +0000
Date: Sun, 19 Jul 2009 21:19:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] MTD:  Correct typo "MTD_DATAFLASH_VERIFY_WRITE".
Message-ID: <alpine.LFD.2.00.0907192115420.18015@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Fix the misspelling to match the actual config variable defined in
drivers/mtd/devi ces/Kconfig:

config MTD_DATAFLASH_WRITE_VERIFY
        bool "Verify DataFlash page writes"
        depends on MTD_DATAFLASH

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  you know, there's a *reason* i keep reporting these anomalies...

diff --git a/drivers/char/vr41xx_giu.c b/drivers/char/vr41xx_giu.c
deleted file mode 100644
index e69de29..0000000
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 43976aa..70a7369 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -401,7 +401,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		(void) dataflash_waitready(priv->spi);


-#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
+#ifdef CONFIG_MTD_DATAFLASH_WRITE_VERIFY

 		/* (3) Compare to Buffer1 */
 		addr = pageaddr << priv->page_offset;
@@ -430,7 +430,7 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 		} else
 			status = 0;

-#endif	/* CONFIG_MTD_DATAFLASH_VERIFY_WRITE */
+#endif	/* CONFIG_MTD_DATAFLASH_WRITE_VERIFY */

 		remaining = remaining - writelen;
 		pageaddr++;

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
"Kernel Newbie Corner" column @ linux.com:          http://cli.gs/WG6WYX
========================================================================
