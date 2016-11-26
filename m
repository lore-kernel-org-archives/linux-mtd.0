Received: from conuserg-11.nifty.com ([210.131.2.78])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhOB-0006Od-TQ
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:53 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 20/39] mtd: nand: denali_dt: enable HW_ECC_FIXUP capability
 for DT platform
Date: Sun, 27 Nov 2016 03:06:06 +0900
Message-Id: <1480183585-592-21-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The denali_dt.c was split out by Altera for the SOCFPGA port.  The
Denali IP on SOCFPGA incorporates the hardware ECC fixup feature.
Newer versions are very likely to support it.  So, it should be OK
to set DENALI_CAPS_HW_ECC_FIXUP for all DT platforms.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali_dt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 293ddb8..9dcd203 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -59,6 +59,8 @@ static int denali_dt_probe(struct platform_device *ofdev)
 	if (data)
 		denali->caps = data->caps;
 
+	denali->caps |= DENALI_CAPS_HW_ECC_FIXUP;
+
 	denali->platform = DT;
 	denali->dev = &ofdev->dev;
 	denali->irq = platform_get_irq(ofdev, 0);
-- 
2.7.4
