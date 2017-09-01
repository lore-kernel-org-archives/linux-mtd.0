Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dngoo-0001X8-7O
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 07:56:47 +0000
Received: by mail-io0-x243.google.com with SMTP id f99so2172716ioi.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Sep 2017 00:56:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Cc: Stefan Roese <sr@denx.de>
Subject: [PATCH 03/10] spi-nor: intel-spi: Fix broken software sequencing codes
Date: Fri,  1 Sep 2017 01:00:34 -0700
Message-Id: <1504252841-2445-4-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
References: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are two bugs in current intel_spi_sw_cycle():

- The 'data byte count' field should be the number of bytes
  transferred minus 1
- SSFSTS_CTL is the offset from ispi->sregs, not ispi->base

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 drivers/mtd/spi-nor/intel-spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 07626ca..263c6ab 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -426,7 +426,7 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len)
 	if (ret < 0)
 		return ret;
 
-	val = (len << SSFSTS_CTL_DBC_SHIFT) | SSFSTS_CTL_DS;
+	val = ((len - 1) << SSFSTS_CTL_DBC_SHIFT) | SSFSTS_CTL_DS;
 	val |= ret << SSFSTS_CTL_COP_SHIFT;
 	val |= SSFSTS_CTL_FCERR | SSFSTS_CTL_FDONE;
 	val |= SSFSTS_CTL_SCGO;
@@ -436,7 +436,7 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len)
 	if (ret)
 		return ret;
 
-	status = readl(ispi->base + SSFSTS_CTL);
+	status = readl(ispi->sregs + SSFSTS_CTL);
 	if (status & SSFSTS_CTL_FCERR)
 		return -EIO;
 	else if (status & SSFSTS_CTL_AEL)
-- 
2.9.2
