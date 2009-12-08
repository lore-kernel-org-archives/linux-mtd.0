Subject: Missing ARM/BCMRING MTD NAND DRIVER files?
From: Joe Perches <joe@perches.com>
To: Leo Chen <leochen@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Dec 2009 10:21:55 -0800
Message-ID: <1260296515.27677.45.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 57a473f2f97cf3bca78df08aac2f438ddef03bee added
this MAINTAINERS entry, but not the files listed.

No other commit added these files either.

Are these files supposed to be part of kernel sources?
If not, I think the MAINTAINERS entry should be removed.

ARM/BCMRING MTD NAND DRIVER
M:	Leo Chen <leochen@broadcom.com>
M:	Scott Branden <sbranden@broadcom.com>
L:	linux-mtd@lists.infradead.org
S:	Maintained
F:	drivers/mtd/nand/bcm_umi_nand.c
F:	drivers/mtd/nand/bcm_umi_bch.c
F:	drivers/mtd/nand/bcm_umi_hamming.c
F:	drivers/mtd/nand/nand_bcm_umi.h
