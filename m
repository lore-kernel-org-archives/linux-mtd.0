Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZHl-00016t-Bs
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 07:04:10 +0000
Received: by eyh6 with SMTP id 6so536945eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 00:04:06 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307602388.7374.13.camel@localhost>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307602388.7374.13.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 09:59:48 +0300
Message-ID: <1307602788.7374.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 09:53 +0300, Artem Bityutskiy wrote:
> On Wed, 2011-06-08 at 11:25 -0700, Brian Norris wrote:
> > -		printk(KERN_DEBUG "Bad block table written to 0x%012llx, version "
> > +		pr_debug("Bad block table written to 0x%012llx, version "
> >  		       "0x%02X\n", (unsigned long long)to, td->version[chip]);
> 
> Hmm, the side effect of this change is this message will disappear if
> DEBUG is undefined / dynamic debugging is disabled.
> 
> So I think we need to change all these pr_debug to pr_info, because this
> is really just info.

I've pushed the following patch on top, is this OK with you?

>From b40c110df5943149892f9d6b2973a03f90e78e6c Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 9 Jun 2011 10:03:26 +0300
Subject: [PATCH] mtd: nand_bbt: turn pr_debug into pr_info

In the previous patch we changed all "prink(KERN_DEBUG" messages with
"pr_debug()", which means that the messages will now disappear unless
they are explicitly enabled with DEBUG macro and dynamic debugging means.

But if you look at those messages, they are information messages like "bad
block table found or re-written", so we do want to see them. This patch turns
those messages into 'pr_info()'.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nand_bbt.c |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index a1e51dc..e3b0d62 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -219,14 +219,14 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					pr_debug("nand_read_bbt: reserved block at 0x%012llx\n",
-						 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
+						(loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
-				pr_debug("nand_read_bbt: bad block at 0x%012llx\n",
-					 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
+					(loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
 					this->bbt[offs + (act >> 3)] |= 0x3 << (act & 0x06);
@@ -379,8 +379,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
-		pr_debug("Bad block table at page %d, version 0x%02X\n",
-			 td->pages[0], td->version[0]);
+		pr_info("Bad block table at page %d, version 0x%02X\n",
+			td->pages[0], td->version[0]);
 	}
 
 	/* Read the mirror version, if available */
@@ -388,8 +388,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
-		pr_debug("Bad block table at page %d, version 0x%02X\n",
-			 md->pages[0], md->version[0]);
+		pr_info("Bad block table at page %d, version 0x%02X\n",
+			md->pages[0], md->version[0]);
 	}
 	return 1;
 }
@@ -492,7 +492,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	} else {
 		if (chip >= this->numchips) {
 			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
-			       chip + 1, this->numchips);
+				chip + 1, this->numchips);
 			return -EINVAL;
 		}
 		numblocks = this->chipsize >> (this->bbt_erase_shift - 1);
@@ -605,8 +605,8 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		if (td->pages[i] == -1)
 			pr_warn("Bad block table not found for chip %d\n", i);
 		else
-			pr_debug("Bad block table found at page %d, version "
-				 "0x%02X\n", td->pages[i], td->version[i]);
+			pr_info("Bad block table found at page %d, version "
+				"0x%02X\n", td->pages[i], td->version[i]);
 	}
 	return 0;
 }
@@ -834,8 +834,8 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		pr_debug("Bad block table written to 0x%012llx, version 0x%02X\n",
-			 (unsigned long long)to, td->version[chip]);
+		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",
+			(unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
 		td->pages[chip] = page;
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
