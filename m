From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>,
 Russell King <linux@arm.linux.org.uk>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@linaro.org>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, Jingoo Han <jg1.han@samsung.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Subject: [PATCHv4 2/5] mtd: gpmi: remove line breaks from error messages and
 improve wording
Date: Thu, 12 Jun 2014 15:20:42 +0200
Message-Id: <1402579245-13377-3-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
 <1402579245-13377-2-git-send-email-LW@KARO-electronics.de>
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


Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 31032b1..16a533a 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -285,9 +285,8 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 	geo->ecc_strength = get_ecc_strength(this);
 	if (!gpmi_check_ecc(this)) {
 		dev_err(this->dev,
-			"We can not support this nand chip."
-			" Its required ecc strength(%d) is beyond our"
-			" capability(%d).\n", geo->ecc_strength,
+			"required ecc strength of the NAND chip: %d is not supported by the GPMI controller (%d)\n",
+			geo->ecc_strength,
 			this->devdata->bch_max_ecc_strength);
 		return -EINVAL;
 	}
@@ -1597,8 +1596,9 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
 			dev_dbg(dev, "Transcribing mark in block %u\n", block);
 			ret = chip->block_markbad(mtd, byte);
 			if (ret)
-				dev_err(dev, "Failed to mark block bad with "
-							"ret %d\n", ret);
+				dev_err(dev,
+					"Failed to mark block bad with ret %d\n",
+					ret);
 		}
 	}
 
-- 
1.7.10.4
