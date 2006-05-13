From: David Woodhouse <dwmw2@infradead.org>
To: David Vrabel <dvrabel@arcom.com>
In-Reply-To: <44635DD6.10805@arcom.com>
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
	<44635DD6.10805@arcom.com>
Content-Type: text/plain
Date: Sat, 13 May 2006 12:22:42 +0100
Message-Id: <1147519362.32310.21.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Do not oops when configured flash size is less then
	chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-05-11 at 16:52 +0100, David Vrabel wrote:
> This sounds like a valid, if unlikely, board configuration.  e.g., a
> board with chips fitted that are larger than the chip-select memory
> window.
> 
> It might be better to pretend such configuration is a single chip
> that's smaller than it physically is.

Yes, I agree.

> Maybe something as simple as:
> 
>     /* there's at least one chip present */
>     max_chips = max(map->size >> cfi.chipshift, 1);
> 
> ?

You also need to reduce mtd->size after you've done the probe.
And while we're at it, we'll slap Deepak around a little bit and stop
using byte arrays with the Linux bitops. 

Please could you test this for me?

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 9b252d2..9915ab8 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -37,8 +37,14 @@ struct mtd_info *mtd_do_chip_probe(struc
 	if (!mtd)
 		mtd = check_cmd_set(map, 0); /* Then the secondary */
 
-	if (mtd)
+	if (mtd) {
+		if (mtd->size > map->size) {
+			printk(KERN_WARNING "Reducing visibility of %dKiB chip to %dKiB\n",
+			       mtd->size >> 10, map->size >> 10);
+			mtd->size = map->size;
+		}
 		return mtd;
+	}
 
 	printk(KERN_WARNING"gen_probe: No supported Vendor Command Set found\n");
 
@@ -100,7 +106,12 @@ #endif
 	 * Align bitmap storage size to full byte.
 	 */
 	max_chips = map->size >> cfi.chipshift;
-	mapsize = (max_chips / 8) + ((max_chips % 8) ? 1 : 0);
+	if (!max_chips) {
+		printk(KERN_WARNING "NOR chip too large to fit in mapping. Attempting to cope...\n");
+		max_chips = 1;
+	}
+
+	mapsize = (max_chips + BITS_PER_LONG-1) / BITS_PER_LONG;
 	chip_map = kmalloc(mapsize, GFP_KERNEL);
 	if (!chip_map) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", map->name);


-- 
dwmw2
