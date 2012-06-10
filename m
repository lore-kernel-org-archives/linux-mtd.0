Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sdfqe-0002HQ-Fd
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2012 10:58:21 +0000
Received: by laap9 with SMTP id p9so2439638laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 03:58:17 -0700 (PDT)
Date: Sun, 10 Jun 2012 13:58:12 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading its
 version
Message-ID: <20120610135812.01dce4e7@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code responsible for reading the version of the mirror bbt was
incorrectly using the descriptor of the main bbt.

Pass the mirror bbt descriptor to 'scan_read_raw' when reading the
version of the mirror bbt.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
- Spotted while reviewing BBT code.
- Introduced by 7cba7b1 [mtd: nand: add support for BBT without OOB].
- Looks like a typo.
- Not runtime tested.
- Sebastian, care to take a look and Ack?

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 30d1319..c126469 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -390,7 +390,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
-			      mtd->writesize, td);
+			      mtd->writesize, md);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 md->pages[0], md->version[0]);
