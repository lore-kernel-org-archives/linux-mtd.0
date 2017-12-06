Received: from mo1502.tsb.2iij.net ([210.149.48.174] helo=mo.tsb.2iij.net)
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMaQa-00004z-Bw
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 14:12:02 +0000
Content-Transfer-Encoding: 7bit
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Subject: [PATCH -next v3 0/2] mtd: nand: toshiba: Add Toshiba BENAND support
Date: Wed,  6 Dec 2017 23:04:56 +0900
Message-Id: <1512569098-30038-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series enables to support Toshiba BENAND. The first patch
retreive ECC requirement from extended ID for all Toshiba SLC NAND
devices. The ECC requirement information uses to show a warning
message in second patch.

KOBAYASHI Yoshitake (2):
  mtd: nand: toshiba: Retrieve ECC requirements from extended ID
  mtd: nand: toshiba: Add support for Toshiba Memory BENAND (Built-in
    ECC NAND)

 drivers/mtd/nand/nand_toshiba.c | 117 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

-- 
2.7.4
