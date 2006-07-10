Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FztRJ-0002zo-68
	for linux-mtd@lists.infradead.org; Mon, 10 Jul 2006 06:56:41 -0400
Date: Mon, 10 Jul 2006 14:56:37 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Subject: [PATCH] fix small nand_base errors
Message-Id: <20060710145637.03433875.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

please find the patch that fixes small nand_base errors inlined.
Brief explanation: for nand_write_oob_syndrome, you should first set the position to eccsize, as OOB starts past the eccsize, not eccsize + chunk.
For nand_fill_oob I guess that's just a typo, otherwise it just doesn't make sense (and OTOH makes this routine write to 0-th OOB byte thus actually marking it as bad).

Best regards,
   Vitaly

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 62b8613..faabca2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1203,7 +1203,7 @@ static int nand_write_oob_syndrome(struc
 		pos = steps * (eccsize + chunk);
 		steps = 0;
 	} else
-		pos = eccsize + chunk;
+		pos = eccsize;
 
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, pos, page);
 	for (i = 0; i < steps; i++) {
@@ -1566,7 +1566,7 @@ static uint8_t *nand_fill_oob(struct nan
 				bytes = min_t(size_t, len, free->length);
 				boffs = free->offset;
 			}
-			memcpy(chip->oob_poi + woffs, oob, bytes);
+			memcpy(chip->oob_poi + boffs, oob, bytes);
 			oob += bytes;
 		}
 		return oob;
