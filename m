Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fOVsJ-0005gG-1s
 for linux-mtd@lists.infradead.org; Thu, 31 May 2018 22:16:52 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, thierry.reding@gmail.com
Cc: dev@lynxeye.de, miquel.raynal@bootlin.com, richard@nod.at,
 marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com,
 benjamin.lindqvist@endian.se, jonathanh@nvidia.com,
 pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mirza.krak@gmail.com,
 stefan@agner.ch, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] mtd: rawnand: add Reed-Solomon error correction
 algorithm
Date: Fri,  1 Jun 2018 00:16:32 +0200
Message-Id: <20180531221637.6017-2-stefan@agner.ch>
In-Reply-To: <20180531221637.6017-1-stefan@agner.ch>
References: <20180531221637.6017-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Reed-Solomon (RS) to the enumeration of ECC algorithms.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/raw/nand_base.c | 1 +
 include/linux/mtd/rawnand.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f28c3a555861..9eb5678dd6d0 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5744,6 +5744,7 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 static const char * const nand_ecc_algos[] = {
 	[NAND_ECC_HAMMING]	= "hamming",
 	[NAND_ECC_BCH]		= "bch",
+	[NAND_ECC_RS]		= "rs",
 };
 
 static int of_get_nand_ecc_algo(struct device_node *np)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5dad59b31244..6a82da8c44ce 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -114,6 +114,7 @@ enum nand_ecc_algo {
 	NAND_ECC_UNKNOWN,
 	NAND_ECC_HAMMING,
 	NAND_ECC_BCH,
+	NAND_ECC_RS,
 };
 
 /*
-- 
2.17.0
