Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjScE-0004QM-OD
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 07:54:19 +0000
Received: by wwi17 with SMTP id 17so1156951wwi.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Aug 2010 00:54:17 -0700 (PDT)
Date: Thu, 12 Aug 2010 09:53:52 +0200
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch 1/2] mtd/m25p80: retlen is never NULL
Message-ID: <20100812075352.GN645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Anton Vorontsov <avorontsov@mvista.com>, kernel-janitors@vger.kernel.org,
	Gabor Juhos <juhosg@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is just a cleanup, it doesn't fix any bugs.

These functions all check retlen inconsistently and it generates a
warning in Smatch (http://smatch.sf.net).  If retlen were ever NULL it
would cause an oops and the code has been this way since 2006 so someone
would have complained.  Also I looked at other places that implemented
the mtd read and write functions and they dereference retlen without
checking.

I removed the checks.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index f90941a..83c9086 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -347,8 +347,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	spi_message_add_tail(&t[1], &m);
 
 	/* Byte count starts at zero. */
-	if (retlen)
-		*retlen = 0;
+	*retlen = 0;
 
 	mutex_lock(&flash->lock);
 
@@ -394,8 +393,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 			dev_name(&flash->spi->dev), __func__, "to",
 			(u32)to, len);
 
-	if (retlen)
-		*retlen = 0;
+	*retlen = 0;
 
 	/* sanity checks */
 	if (!len)
@@ -466,8 +464,7 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			spi_sync(flash->spi, &m);
 
-			if (retlen)
-				*retlen += m.actual_length - m25p_cmdsz(flash);
+			*retlen += m.actual_length - m25p_cmdsz(flash);
 		}
 	}
 
@@ -485,8 +482,7 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t actual;
 	int cmd_sz, ret;
 
-	if (retlen)
-		*retlen = 0;
+	*retlen = 0;
 
 	/* sanity checks */
 	if (!len)
