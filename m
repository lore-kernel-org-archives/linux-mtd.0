Received: from mail.base45.de ([2001:67c:2050:310::a:2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Swc-0005KO-5w
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 08:14:05 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 0/3][v2] fixing 1bit hamming
Date: Tue,  2 May 2017 10:13:20 +0200
Message-Id: <20170502081323.3138-1-lynxis@fe80.eu>
In-Reply-To: <20170313074641.28b383e7@bbrezillon>
References: <20170313074641.28b383e7@bbrezillon>
In-Reply-To: <20170313074641.28b383e7@bbrezillon>
References: <20170313074641.28b383e7@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

v1:
Use the old layout for all drivers/chips which doesn't set it explicit.

v2:
Only use the old layout for 1bit hamming if the layout isn't set
by the driver or devicetree.

Alexander Couzens (3):
  mtd/nand: add ooblayout for old hamming layout
  nand_base: use nand_ooblayout_lp_hamming_ops for 1bit hamming as
    default
  mtd: nand: davinci: set ECC algorithm explicitly for HW based ECC

 drivers/mtd/nand/davinci_nand.c |  4 ++-
 drivers/mtd/nand/nand_base.c    | 77 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/nand.h        |  1 +
 3 files changed, 80 insertions(+), 2 deletions(-)

-- 
2.12.2
