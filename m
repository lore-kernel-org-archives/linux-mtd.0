Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aift9-0004pQ-14
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2016 10:19:44 +0000
Received: by mail-lb0-x22e.google.com with SMTP id k12so6725872lbb.1
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2016 03:19:22 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 0/4] mtd: nand: add enum nand_ecc_algo
Date: Wed, 23 Mar 2016 11:18:59 +0100
Message-Id: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
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

V2: Add of_get_nand_ecc_algo helper (in 2/4) instead of this slightly hacky code
    in nand_dt_init that would be replaced anyway.

Rafał Miłecki (4):
  mtd: nand: add new enum for storing ECC algorithm
  of: mtd: prepare helper reading NAND ECC algo from DT
  mtd: nand: set ECC algorithm in nand_dt_init
  mtd: nand: nandsim: set ECC algorithm explicitly

 drivers/mtd/nand/nand_base.c |  6 +++++-
 drivers/mtd/nand/nandsim.c   |  2 ++
 drivers/of/of_mtd.c          | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h     |  7 +++++++
 include/linux/of_mtd.h       |  6 ++++++
 5 files changed, 56 insertions(+), 1 deletion(-)

-- 
1.8.4.5
