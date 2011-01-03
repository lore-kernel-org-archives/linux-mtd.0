Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PZprZ-0000sa-9a
	for linux-mtd@lists.infradead.org; Mon, 03 Jan 2011 19:14:37 +0000
Received: by wwb17 with SMTP id 17so15049173wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Jan 2011 11:14:35 -0800 (PST)
Date: Mon, 3 Jan 2011 22:14:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: smatch stuff: mtd/cafe_nand: cafe_device_ready() always returns true
Message-ID: <20110103191415.GA15176@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

cafe_device_ready() always returns 1.  It looks like something else was
intended but I don't know the code enough to say what should go there.

drivers/mtd/nand/cafe_nand.c +107 cafe_device_ready(3)
	warn: condition is always true

   104  static int cafe_device_ready(struct mtd_info *mtd)
   105  {
   106          struct cafe_priv *cafe = mtd->priv;
   107          int result = !!(cafe_readl(cafe, NAND_STATUS) | 0x40000000);
                                                             ^^^^^^^^^^^^^
	This bit is always non-zero because we take the result of
	cafe_readl() and do a bitwize or with 0x40000000.  Then the
	double negate means that result is always 1.

   108          uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
   109

regards,
dan carpenter
