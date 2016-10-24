Received: from mail1.bemta8.messagelabs.com ([216.82.243.200])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byenr-00046s-7f
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 12:56:36 +0000
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v6 3/4] mtd: nand: Actually apply the optimal timings
To: linux-mtd <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
References: <580E0318.5020004@sigmadesigns.com>
Message-ID: <580E0497.607@sigmadesigns.com>
Date: Mon, 24 Oct 2016 14:54:47 +0200
MIME-Version: 1.0
In-Reply-To: <580E0318.5020004@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0acb0070280a..b311ebc4bebc 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1108,7 +1108,7 @@ static int nand_init_data_interface(struct nand_chip *chip)
 		}
 	}
 
-	return 0;
+	return nand_setup_data_interface(chip);
 }
 
 static void nand_release_data_interface(struct nand_chip *chip)
-- 
2.9.0
