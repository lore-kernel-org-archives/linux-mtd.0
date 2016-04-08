Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoTaP-00014o-P4
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:24:22 +0000
Received: by mail-lf0-x236.google.com with SMTP id c126so76083351lfb.2
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 03:24:01 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 0/8] mtd: nand: set ECC algorithm explicitly
Date: Fri,  8 Apr 2016 12:23:43 +0200
Message-Id: <1460111031-8706-1-git-send-email-zajec5@gmail.com>
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

As part of nand_ecc_modes_t cleaning process we introduced enum
nand_ecc_algo. Before we start using it (mostly in nand_core.c) we have
to modify all driver to set it properly.

This is the first patchset modifying existing drivers. All patches were
compile-tested. More patches will follow in the future, but I was hoping
to have this first series accepted meanwhile.

This work is based on the nand/next branch.

Rafał Miłecki (8):
  mtd: nand: ams-delta: set ECC algorithm explicitly
  mtd: nand: gpio: set ECC algorithm explicitly
  mtd: nand: mxc: set ECC algorithm explicitly
  mtd: nand: nuc900: set ECC algorithm explicitly
  mtd: nand: orion: set ECC algorithm explicitly
  mtd: nand: pasemi: set ECC algorithm explicitly
  mtd: nand: plat: set ECC algorithm explicitly
  mtd: nand: socrates: set ECC algorithm explicitly

 drivers/mtd/nand/ams-delta.c     | 1 +
 drivers/mtd/nand/gpio.c          | 1 +
 drivers/mtd/nand/mxc_nand.c      | 1 +
 drivers/mtd/nand/nuc900_nand.c   | 1 +
 drivers/mtd/nand/orion_nand.c    | 1 +
 drivers/mtd/nand/pasemi_nand.c   | 1 +
 drivers/mtd/nand/plat_nand.c     | 1 +
 drivers/mtd/nand/socrates_nand.c | 1 +
 8 files changed, 8 insertions(+)

-- 
1.8.4.5
