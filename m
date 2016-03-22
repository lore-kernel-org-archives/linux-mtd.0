Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiVCb-00027x-At
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2016 22:55:06 +0000
Received: by mail-lf0-x231.google.com with SMTP id d192so7151261lfg.2
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2016 15:54:44 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 0/3] mtd: nand: add enum nand_ecc_algo
Date: Tue, 22 Mar 2016 23:54:11 +0100
Message-Id: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
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

Some time ago I started working on a new "nand-ecc-algo" property to allow
specifying ECC algorithm for hardware ECC mode as well.
Boris pointed out it's becoming a bit messy that way as we already have value
NAND_ECC_SOFT_BCH.
I suggested deprecating "soft_bch" value from nand-ecc-mode property and got
Boris agreed and no objections from others. So there is how I want to implement
this.
If you agree on this way & apply my patches, I'll start modifying NAND drivers
(similarly to the nandsim) and then will try to drop NAND_ECC_SOFT_BCH except
for handling backward compatibility.
Then finally we should be able to add "nand-ecc-algo" property support properly.

Rafał Miłecki (3):
  mtd: nand: add new enum for storing ECC algorithm
  mtd: nand: set ECC algorithm in nand_dt_init
  mtd: nand: nandsim: set ECC algorithm explicitly

 drivers/mtd/nand/nand_base.c | 15 ++++++++++++++-
 drivers/mtd/nand/nandsim.c   |  2 ++
 include/linux/mtd/nand.h     |  7 +++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
1.8.4.5
