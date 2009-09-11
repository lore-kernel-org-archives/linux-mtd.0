Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm2gX-0004iS-92
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 09:44:57 +0000
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1Mm2gW-0007d0-I1
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 05:44:52 -0400
Date: Fri, 11 Sep 2009 05:44:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: [PATCH] MTD: Correct misspelled Kconfig var
	CONFIG_MTD_DATAFLASH_VERIFY_WRITE
Message-ID: <alpine.LFD.2.00.0909110543410.11692@localhost>
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


Make the source file correction CONFIG_MTD_DATAFLASH_VERIFY_WRITE ->
CONFIG_MTD_DATAFLASH_WRITE_VERIFY to match the Kconfig variable in
drivers/mtd/devices/Kconfig.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  whoops, sorry, previous commit msg didn't show the actual
correction, this one does.



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
========================================================================
