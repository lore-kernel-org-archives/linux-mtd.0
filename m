Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnVGG-0007yI-3r
 for linux-mtd@lists.infradead.org; Thu, 31 Aug 2017 19:36:21 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdchar: handle a block that should be marked bad that
 already is
Date: Thu, 31 Aug 2017 21:35:43 +0200
Message-Id: <20170831193543.27543-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Otherwise at least /sys/class/mtd/mtdX/bad_blocks is increased each time
the same block is remarked as bad.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/mtdchar.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 3568294d4854..049496a1d7a5 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -916,6 +916,11 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 
 		if (copy_from_user(&offs, argp, sizeof(loff_t)))
 			return -EFAULT;
+
+		if (mtd_block_isbad(mtd, offs))
+			/* already done */
+			return 0;
+
 		return mtd_block_markbad(mtd, offs);
 		break;
 	}
-- 
2.11.0
