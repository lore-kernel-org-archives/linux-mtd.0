Received: from conuserg-11.nifty.com ([210.131.2.78])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAhNm-000510-QU
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2016 18:07:30 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 06/39] mtd: nand: denali: fix write_oob_data() function
Date: Sun, 27 Nov 2016 03:05:52 +0900
Message-Id: <1480183585-592-7-git-send-email-yamada.masahiro@socionext.com>
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

The function write_oob_data() performs write access to the spare
area, so passing "false" to the 3rd argument (transfer_spare) of
denali_send_pipeline_cmd() is weird.

Actually, the transfer_spare is ignored for MAP10 operation with
SPARE_ACCESS (0x41), so this change has no impact on the hardware
behavior.  Yet, we should keep our code to make sense.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 61e1e33..b2b050b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -834,7 +834,7 @@ static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
 
 	denali->page = page;
 
-	if (denali_send_pipeline_cmd(denali, false, false, SPARE_ACCESS,
+	if (denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS,
 							DENALI_WRITE) == PASS) {
 		write_data_to_flash_mem(denali, buf, mtd->oobsize);
 
-- 
2.7.4
