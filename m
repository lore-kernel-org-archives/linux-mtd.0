Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ass8Q-0003yD-Vn
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2016 13:25:39 +0000
Date: Wed, 20 Apr 2016 15:25:16 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de
Subject: Pass -EUCLEN to userspace?
Message-ID: <20160420132516.GC31101@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am currently working on a program similar to ubihealthd, just for raw
mtd pages, not UBI. Basically I want to find out in userspace if my Nand needs
scrubbing. Is it possible somehow to get this information in userspace?

So far I can count the number of bitflips corrected using the
ECCGETSTATS ioctl. Also I can read the bitflip_threshold from
/sys/class/mtdx/bitflip_threshold. The problem is now that I can only
read full pages, but the bitflip threshold is per ecc_step_size. Simply
dividing by the number of ecc_steps is not accurate. Any way to solve
this?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
