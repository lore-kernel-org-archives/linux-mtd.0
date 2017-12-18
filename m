Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQsjY-0005v4-1z
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 10:33:22 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 Greg Cook <greg@morpheus.ws>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>, stable@kernel.vger.org
Subject: [PATCH] mtd: nand: pxa3xx: Fix READOOB implementation
Date: Mon, 18 Dec 2017 11:32:45 +0100
Message-Id: <20171218103245.22516-1-boris.brezillon@free-electrons.com>
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

In the current driver, OOB bytes are accessed in raw mode, and when a
page access is done with NDCR_SPARE_EN set and NDCR_ECC_EN cleared, the
driver must read the whole spare area (64 bytes in case of a 2k page,
16 bytes for a 512 page). The driver was only reading the free OOB
bytes, which was leaving some unread data in the FIFO and was somehow
leading to a timeout.

We could patch the driver to read ->spare_size + ->ecc_size instead of
just ->spare_size when READOOB is requested, but we'd better make
in-band and OOB accesses consistent.
Since the driver is always accessing in-band data in non-raw mode (with
the ECC engine enabled), we should also access OOB data in this mode.
That's particularly useful when using the BCH engine because in this
mode the free OOB bytes are also ECC protected.

Fixes: 43bcfd2bb24a ("mtd: nand: pxa3xx: Add driver-specific ECC BCH support")
Cc: <stable@kernel.vger.org>
Reported-by: Sean Nyekjær <sean.nyekjaer@prevas.dk>
Tested-by: Willy Tarreau <w@1wt.eu>
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 021374fe59dc..d1979c7dbe7e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -961,6 +961,7 @@ static void prepare_start_command(struct pxa3xx_nand_info *info, int command)
 
 	switch (command) {
 	case NAND_CMD_READ0:
+	case NAND_CMD_READOOB:
 	case NAND_CMD_PAGEPROG:
 		info->use_ecc = 1;
 		break;
-- 
2.11.0
