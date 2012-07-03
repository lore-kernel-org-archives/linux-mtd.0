From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH 2/2] mtd: gpmi: update the bitflip_threshold
Date: Tue, 3 Jul 2012 16:24:33 +0800
Message-ID: <1341303873-23040-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1341303873-23040-1-git-send-email-b32955@freescale.com>
References: <1341303873-23040-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The origin code misses to update the bitflip_threshold when
we have already get the right ecc_strength.

The patch fixes it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index a1bf31f..ed9571b 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1501,6 +1501,7 @@ static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
 	/* Adjust the ECC strength according to the chip. */
 	this->nand.ecc.strength = this->bch_geometry.ecc_strength;
 	this->mtd.ecc_strength = this->bch_geometry.ecc_strength;
+	this->mtd.bitflip_threshold = this->bch_geometry.ecc_strength;
 
 	/* NAND boot init, depends on the gpmi_set_geometry(). */
 	return nand_boot_init(this);
-- 
1.7.0.4
