Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d4OLW-0002Eq-FZ
 for linux-mtd@lists.infradead.org; Sat, 29 Apr 2017 09:07:20 +0000
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
Subject: [PATCH v2 2/5] mtd: nand: add core support for on-die ECC
Date: Sat, 29 Apr 2017 11:06:43 +0200
Message-Id: <1493456806-18898-3-git-send-email-thomas.petazzoni@free-electrons.com>
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

A number of NAND flashes have a capability called "on-die ECC" where the
NAND chip itself is capable of detecting and correcting errors.

Linux already has support for using the ECC implementation of the NAND
controller, or a software based ECC implementation, but not for using
the ECC implementation of the NAND controller. However, such an
implementation is sometimes useful in situations where the NAND
controller provides ECC algorithms that are not strong enough for the
NAND chip used on the system. A typical case is a NAND chip that
requires a 4-bit ECC, while the NAND controller only provides a 1-bit
ECC algorithm.

This commit introduces the support for the NAND_ECC_ON_DIE ECC mode:

 - Parsing of the "on-die" value for the "nand-ecc-mode" Device Tree
   property

 - Handling NAND_ECC_ON_DIE case in nand_scan_tail(). The idea is that
   the vendor specific code for the NAND chip must implement
   ->read_page() and ->write_page(). It may optionally provide its own
   ->read_page_raw() and ->write_page_raw() as well. For OOB operation,
   we assume the standard operations are good enough, but they can be
   overridden by the vendor specific code if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/nand_base.c | 13 +++++++++++++
 include/linux/mtd/nand.h     |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ed49a1d..b639e88 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4109,6 +4109,7 @@ static const char * const nand_ecc_modes[] = {
 	[NAND_ECC_HW]		= "hw",
 	[NAND_ECC_HW_SYNDROME]	= "hw_syndrome",
 	[NAND_ECC_HW_OOB_FIRST]	= "hw_oob_first",
+	[NAND_ECC_ON_DIE]	= "on-die",
 };
 
 static int of_get_nand_ecc_mode(struct device_node *np)
@@ -4649,6 +4650,18 @@ int nand_scan_tail(struct mtd_info *mtd)
 		}
 		break;
 
+	case NAND_ECC_ON_DIE:
+		if (!ecc->read_page || !ecc->write_page) {
+			WARN(1, "No ECC functions supplied; on-die ECC not possible\n");
+			ret = -EINVAL;
+			goto err_free;
+		}
+		if (!ecc->read_oob)
+			ecc->read_oob = nand_read_oob_std;
+		if (!ecc->write_oob)
+			ecc->write_oob = nand_write_oob_std;
+		break;
+
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. This is not recommended!\n");
 		ecc->read_page = nand_read_page_raw;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8f67b15..6035220 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -116,6 +116,7 @@ typedef enum {
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
+	NAND_ECC_ON_DIE,
 } nand_ecc_modes_t;
 
 enum nand_ecc_algo {
-- 
2.7.4
