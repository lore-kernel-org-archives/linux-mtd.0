Received: from smtprelay03.ispgateway.de ([80.67.31.41])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dmdas-00025r-Ow
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 10:18:10 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 2/2] mtd: nand: complain loudly when chip->bits_per_cell is
 not correctly initialized
Date: Tue, 29 Aug 2017 12:17:13 +0200
Message-Id: <1504001833-18097-3-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
References: <1504001833-18097-1-git-send-email-LW@KARO-electronics.de>
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

chip->bits_per_cell which is used to determine the NAND cell type
(SLC/MLC) should always have a value != 0.
Complain loudly if the value is 0 in nand_is_slc() to catch use before
correct initialization.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 include/linux/mtd/rawnand.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 94feece..2b05f42 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1234,6 +1234,8 @@ int onfi_init_data_interface(struct nand_chip *chip,
  */
 static inline bool nand_is_slc(struct nand_chip *chip)
 {
+	WARN(chip->bits_per_cell == 0,
+	     "chip->bits_per_cell is used uninitialized\n");
 	return chip->bits_per_cell == 1;
 }
 
-- 
2.1.4
