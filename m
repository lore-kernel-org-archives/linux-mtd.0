Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5LJm-0001uM-4m
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 00:05:27 +0000
Received: by mail-pf0-x243.google.com with SMTP id g23so29729249pfj.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 17:05:09 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] mtd: nand: samsung: warn about un-parseable ECC info
Date: Mon,  1 May 2017 17:04:55 -0700
Message-Id: <20170502000455.13240-6-computersforpeace@gmail.com>
In-Reply-To: <20170502000455.13240-1-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We don't handle cases larger than 7. We probably shouldn't pretend we
know the ECC step size in this case, and it's probably also good to
WARN() like we do in many other similar cases.

Cc: Hans de Goede <hdegoede@redhat.com>
Fixes: 8fc82d456e40 ("mtd: nand: samsung: Retrieve ECC requirements from extended ID")
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/nand/nand_samsung.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
index 9cfc4035a420..1e0755997762 100644
--- a/drivers/mtd/nand/nand_samsung.c
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -84,6 +84,9 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 			case 7:
 				chip->ecc_strength_ds = 60;
 				break;
+			default:
+				WARN(1, "Could not decode ECC info");
+				chip->ecc_step_ds = 0;
 			}
 		}
 	} else {
-- 
2.13.0.rc1.294.g07d810a77f-goog
