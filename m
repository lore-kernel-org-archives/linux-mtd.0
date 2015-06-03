Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0GBp-0003Kh-Th
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 21:27:13 +0000
Date: 3 Jun 2015 21:26:40 -0000
Message-Id: <36e315552c849a4d22ac0fcff7958f6ffcafb160.1433364398.git.hramrach@gmail.com>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 04/11] mtd: ofpart: do not fail probe when no partitions exist
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
  Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>,
  Kukjin Kim <kgene@kernel.org>,
  Krzysztof Kozlowski <k.kozlowski@samsung.com>,
  Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
  David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>,
  "Rafał Miłecki" <zajec5@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Knut Wohlrab <knut.wohlrab@de.bosch.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org,
  linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Exynos it is necessary to set SPI controller parameters that apply to
a SPI slave in a DT subnode of the slave device. The ofpart code returns
an error when there are subnodes of the SPI flash but no partitions are
found. Change this condition to a warning so that flash without
partitions can be accessed on Exynos.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 drivers/mtd/ofpart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index aa26c32..a29d29f 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -94,10 +94,10 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 
 	if (!i) {
 		of_node_put(pp);
-		pr_err("No valid partition found on %s\n", node->full_name);
+		pr_warn("No valid partition found on %s\n", node->full_name);
 		kfree(*pparts);
 		*pparts = NULL;
-		return -EINVAL;
+		return 0;
 	}
 
 	return nr_parts;
-- 
2.1.4
