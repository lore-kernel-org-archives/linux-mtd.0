Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9HDp-0001fa-8c
	for linux-mtd@lists.infradead.org; Thu, 19 Jun 2008 10:18:29 +0000
From: Bryan Wu <cooloney@kernel.org>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] [MTD] Blackfin NFC Driver: fix bug - do not clobber the
	status from the first 256 bytes if operating on 512 pages
Date: Thu, 19 Jun 2008 18:18:28 +0800
Message-Id: <1213870709-17356-2-git-send-email-cooloney@kernel.org>
In-Reply-To: <1213870709-17356-1-git-send-email-cooloney@kernel.org>
References: <1213870709-17356-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Singed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index e87a572..3254348 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -273,7 +273,7 @@ static int bf5xx_nand_correct_data(struct mtd_info *mtd, u_char *dat,
 		dat += 256;
 		read_ecc += 8;
 		calc_ecc += 8;
-		ret = bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
+		ret |= bf5xx_nand_correct_data_256(mtd, dat, read_ecc, calc_ecc);
 	}
 
 	return ret;
-- 
1.5.6
