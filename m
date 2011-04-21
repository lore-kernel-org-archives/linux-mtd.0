Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCxVe-0003Jg-1p
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 17:17:42 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
	by co202.xi-lite.net (Postfix) with ESMTPS id A8BC8260180
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 20:52:46 +0200 (CEST)
Message-ID: <4DB06693.5000100@parrot.com>
Date: Thu, 21 Apr 2011 19:17:07 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: bbt and bitflip
References: <4DB033E4.6030105@parrot.com>
In-Reply-To: <4DB033E4.6030105@parrot.com>
Content-Type: multipart/mixed; boundary="------------060901040705080500030800"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------060901040705080500030800
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

Matthieu CASTET a écrit :
> Hi,
> 
> the current bad block table implementation doesn't seem robust against bit flip.
> 
> at boot we call :
> - search_read_bbts which scan for bbt using oob pattern.
> - check_create
> -- read_abs_bbt
> --- read_bbt which ignore ecc bit flip/error
> 
> So if bit flip happen in BBT, we never scrub it.
> And if bit flip accumulate and we can't correct it anymore, the code will parse
> the corrupted data and our bad block info will be wrong (valid block can be
> marked as bad and we lose bad, bad block can be see as valid).
> 
> 
> Also the pattern and version in oob isn't protected by ecc. They can be corrupted.
> 
> Are bbt safe to use ?
> 
> Are there any plan to make the bbt more robust ?
> 
Here a quick and dirty patch to make them more robust.
Any comment are welcomed.


Matthieu

--------------060901040705080500030800
Content-Type: text/plain; name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="diff"

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 5fedf4a..7b85b54 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -171,7 +171,7 @@ static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
 static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		    int bits, int offs, int reserved_block_code)
 {
-	int res, i, j, act = 0;
+	int res, i, j, act = 0, ret = 0;
 	struct nand_chip *this = mtd->priv;
 	size_t retlen, len, totlen;
 	loff_t from;
@@ -188,6 +188,12 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				printk(KERN_INFO "nand_bbt: Error reading bad block table\n");
 				return res;
 			}
+			if (res != -EUCLEAN) {
+				printk(KERN_INFO "nand_bbt: Error reading bad block table2\n");
+				return res;
+			}
+			/* inform caller that there is bit flips */
+			ret |= res;
 			printk(KERN_WARNING "nand_bbt: ECC error while reading bad block table\n");
 		}
 
@@ -220,7 +226,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		totlen -= len;
 		from += len;
 	}
-	return 0;
+	return ret;
 }
 
 /**
@@ -900,7 +906,20 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 	writecheck:
 		/* read back first ? */
 		if (rd)
-			read_abs_bbt(mtd, buf, rd, chipsel);
+			res = read_abs_bbt(mtd, buf, rd, chipsel);
+		if (!rd2) {
+			if (res == -EBADMSG) {
+				/* bad recreate it */
+				rd = NULL;
+				writeops = 0x03;
+				goto create;
+			}
+			else if (!rd2 && res == -EUCLEAN) {
+				/* rewrite it */
+				writeops = 0x03;
+			}
+		}
+
 		/* If they weren't versioned, read both. */
 		if (rd2)
 			read_abs_bbt(mtd, buf, rd2, chipsel);

--------------060901040705080500030800--
