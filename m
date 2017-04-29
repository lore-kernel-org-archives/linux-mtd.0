Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d4OLs-0002S7-Ou
 for linux-mtd@lists.infradead.org; Sat, 29 Apr 2017 09:07:42 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Kumar Gala <galak@codeaurora.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 5/5] mtd: nand: fsmc_nand: handle on-die ECC case
Date: Sat, 29 Apr 2017 11:06:46 +0200
Message-Id: <1493456806-18898-6-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1493456806-18898-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1493456806-18898-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adjusts the fsmc_nand driver so that it accepts the
NAND_ECC_ON_DIE case. It simply does nothing in this case, since both
the ECC operations and OOB layout will be defined by the NAND chip code
rather than by the NAND controller code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/fsmc_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index cea50d2..5c058e8 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -986,6 +986,9 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 				break;
 			}
 
+		case NAND_ECC_ON_DIE:
+			break;
+
 		default:
 			dev_err(&pdev->dev, "Unsupported ECC mode!\n");
 			goto err_probe;
-- 
2.7.4
