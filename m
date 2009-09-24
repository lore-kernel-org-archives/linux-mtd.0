Received: from mail.perches.com ([173.55.12.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mquvl-0002nJ-BL
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 20:28:50 +0000
Subject: linux MAINTAINERS: drivers/mtd/nand/bcm* files not in kernel
From: Joe Perches <joe@perches.com>
To: Leo Chen <leochen@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Sep 2009 13:28:42 -0700
Message-Id: <1253824122.1806.20.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Leo and Scott.

These pattern files are not (yet?) in the linus' repository.
Are they expected to be soon or is this just an error?

cheers, Joe

ARM/BCMRING MTD NAND DRIVER
ddd559b1 (Russell King                      2009-09-12 12:02:26 +0100  540) M:  Leo Chen <leochen@broadcom.com>
ddd559b1 (Russell King                      2009-09-12 12:02:26 +0100  541) M:  Scott Branden <sbranden@broadcom.com>
57a473f2 (Leo Chen                          2009-08-12 22:08:48 +0100  542) L:  linux-mtd@lists.infradead.org
57a473f2 (Leo Chen                          2009-08-12 22:08:48 +0100  543) S:  Maintained
57a473f2 (Leo Chen                          2009-08-12 22:08:48 +0100  544) F:  drivers/mtd/nand/bcm_umi_nand.c
57a473f2 (Leo Chen                          2009-08-12 22:08:48 +0100  545) F:  drivers/mtd/nand/bcm_umi_bch.c
57a473f2 (Leo Chen                          2009-08-12 22:08:48 +0100  546) F:  drivers/mtd/nand/bcm_umi_hamming.c
57a473f2 (Leo Chen                          2009-08-12 22:08:48 +0100  547) F:  drivers/mtd/nand/nand_bcm_umi.h
