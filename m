Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZuu-00059D-Gq
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:48:37 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 01/12] mtd: nand: initialize chip->oob_poi before write
Date: Tue, 30 Aug 2011 18:45:36 -0700
Message-ID: <1314755147-17756-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org,
	Adam Thomson <adam.thomson@alcatel-lucent.com>,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For raw (i.e., w/o ECC) page writes (i.e., w/o OOB), we may not have
initialized and filled the chip->oob_poi buffer. This can end up writing
junk to the flash if we're not careful. Say, for example, we use
`nandwrite -n' (without OOB). Then nand_do_write_ops calls
chip->write_page, which writes OOB data with some previous, junk data.

This fixes a bug with this commit (from l2-mtd-2.6.git):

  commit a8ee364bbf14861d5d0af39c4da06c30441895fb
  mtd: nand_base: always initialise oob_poi before writing OOB data

That commit removed the memset from under a conditional for:

  if (likely(!oob))

and moved it (indirectly) to the `nand_fill_oob()' function, which was
under:

  if (unlikely(oob))

Though the "likely" and "unlikely" can be confusing, these are not the
same conditions :)

And if the buggy commit is going stable, this should go stable (or just
amend it) as well.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Adam Thomson <adam.thomson@alcatel-lucent.com>
---
If the buggy commit is going into -stable, this should go -stable as
well (or just amend the original).

 drivers/mtd/nand/nand_base.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d2ee68a..273e6a5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2227,6 +2227,9 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			size_t len = min(oobwritelen, oobmaxlen);
 			oob = nand_fill_oob(mtd, oob, len, ops);
 			oobwritelen -= len;
+		} else {
+			/* We still need to erase leftover OOB data */
+			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
 
 		ret = chip->write_page(mtd, chip, wbuf, page, cached,
-- 
1.7.5.4
