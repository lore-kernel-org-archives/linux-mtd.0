Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGA82-0000nV-CG
 for linux-mtd@lists.infradead.org; Sat, 09 Aug 2014 17:08:27 +0000
Received: by mail-wi0-f177.google.com with SMTP id ho1so2375325wib.16
 for <linux-mtd@lists.infradead.org>; Sat, 09 Aug 2014 10:07:59 -0700 (PDT)
Sender: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH] mtd: nand: Use ULL-suffix for big u64 constant
Date: Sat,  9 Aug 2014 19:07:53 +0200
Message-Id: <1407604073-7484-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

drivers/mtd/nand/nand_timings.c:45: warning: integer constant is too large for ‘long’ type

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/mtd/nand/nand_timings.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_timings.c
index 8b36253420fa..e81470a8ac67 100644
--- a/drivers/mtd/nand/nand_timings.c
+++ b/drivers/mtd/nand/nand_timings.c
@@ -42,7 +42,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[] = {
 		.tRHZ_max = 200000,
 		.tRLOH_min = 0,
 		.tRP_min = 50000,
-		.tRST_max = 250000000000,
+		.tRST_max = 250000000000ULL,
 		.tWB_max = 200000,
 		.tRR_min = 40000,
 		.tWC_min = 100000,
-- 
1.9.1
