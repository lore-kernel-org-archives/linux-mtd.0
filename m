Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UY9af-0000kE-KD
 for linux-mtd@lists.infradead.org; Fri, 03 May 2013 06:35:36 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH 4/4] mtd: gpmi: update the ecc step size for mtd_info{}
Date: Fri, 3 May 2013 14:21:44 +0800
Message-ID: <1367562104-8955-5-git-send-email-b32955@freescale.com>
In-Reply-To: <1367562104-8955-1-git-send-email-b32955@freescale.com>
References: <1367562104-8955-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

update the ecc step size when we have already get the right value.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 0451a1d..b9e05df 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1644,6 +1644,7 @@ static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
 	/* Adjust the ECC strength according to the chip. */
 	this->nand.ecc.strength = this->bch_geometry.ecc_strength;
 	this->mtd.ecc_strength = this->bch_geometry.ecc_strength;
+	this->mtd.ecc_size = this->bch_geometry.ecc_chunk_size;
 	this->mtd.bitflip_threshold = this->bch_geometry.ecc_strength;
 
 	/* NAND boot init, depends on the gpmi_set_geometry(). */
-- 
1.7.1
