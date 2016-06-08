Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAf2F-0003Mr-65
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 15:04:48 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/3] mtd: nand: Add an option to maximize the ECC
 strength
Date: Wed,  8 Jun 2016 17:04:22 +0200
Message-Id: <1465398264-8202-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465398264-8202-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The generic NAND DT bindings allows one to tweak the ECC strength and
step size to their need. It can be used to lower the ECC strength to
match a bootloader/firmware config, but might also be used to get a better
reliability.

In the latter case, the user might want to use the maximum ECC strength
without having to explicitly calculate the exact value (this value not
only depends on the OOB size, but also on the NAND controller, and can
be tricky to extract).

Add a generic 'nand-ecc-maximize' DT property and the associated
NAND_ECC_MAXIMIZE flag, to let ECC controller drivers select the best
ECC strength and step-size on their own.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 9 +++++++++
 drivers/mtd/nand/nand_base.c                   | 3 +++
 include/linux/mtd/nand.h                       | 1 +
 3 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 3733300..b056016 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -35,6 +35,15 @@ Optional NAND chip properties:
 - nand-ecc-step-size: integer representing the number of data bytes
 		      that are covered by a single ECC step.
 
+- nand-ecc-maximize: boolean used to specify that you want to maximize ECC
+		     strength. The maximum ECC strength is both controller and
+		     chip dependent. The controller side has to select the ECC
+		     config providing the best strength and taking the OOB area
+		     size constraint into account.
+		     This is particularly useful when only the in-band area is
+		     used by the upper layers, and you want to make your NAND
+		     as reliable as possible.
+
 The ECC strength and ECC step size properties define the correction capability
 of a controller. Together, they say a controller can correct "{strength} bit
 errors per {size} bytes".
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0b0dc29..d374129 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4113,6 +4113,9 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (ecc_step > 0)
 		chip->ecc.size = ecc_step;
 
+	if (of_property_read_bool(dn, "nand-ecc-maximize"))
+		chip->ecc.options |= NAND_ECC_MAXIMIZE;
+
 	return 0;
 }
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index fbe8e16..737b00d 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -141,6 +141,7 @@ enum nand_ecc_algo {
  * pages and you want to rely on the default implementation.
  */
 #define NAND_ECC_GENERIC_ERASED_CHECK	BIT(0)
+#define NAND_ECC_MAXIMIZE		BIT(1)
 
 /* Bit mask for flags passed to do_nand_read_ecc */
 #define NAND_GET_DEVICE		0x80
-- 
2.7.4
