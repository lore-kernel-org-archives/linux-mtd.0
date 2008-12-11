Received: from [202.230.225.126] (helo=topsms.toshiba-tops.co.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAaoc-0008Sx-Q3
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 01:58:11 +0000
Date: Thu, 11 Dec 2008 10:39:08 +0900 (JST)
Message-Id: <20081211.103908.192842546.nemoto@toshiba-tops.co.jp>
To: dwmw2@infradead.org
Subject: Re: [patch 1/6] physmap: make map_info customizable
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1228925679.21454.69.camel@macbook.infradead.org>
References: <200812012223.mB1MNbjl014522@imap1.linux-foundation.org>
	<1228925679.21454.69.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 Dec 2008 16:14:39 +0000, David Woodhouse <dwmw2@infradead.org> wrote:
> > Add a hook to physmap_flash_data for map_info initialization.  This makes
> > platform code can customize map operations.
> > 
> > Background: I wrote this patch to support RBTX4939 board, which requires
> > custom map->{read,write,copy_from} function.  I think extending the
> > physmap driver is better than adding a new map driver.
> 
> Hm. I'm unconvinced -- surely you're calling into a function which does
> everything that a 'new map driver' would have to do anyway?

Yes.  Once I wrote a new map driver and realized most of it is
duplication of physmap driver.

> Would you advocate that we remove _all_ the dedicated map drivers and
> replace them with this method?

Well, not _all_, but perhaps some drivers can be converted to physmap
with this method.  (And I suppose some drivers can be converted even
without this patch.)

> Can't you enable physmap without CONFIG_MTD_COMPLEX_MAPPINGS being set
> anyway? The 'special' functions can't be used in that config, and we
> just assume that direct access works.

The board has four flash rom areas and only boot flash rom area needs
special mapping.  So I can enable physmap always, but the boot rom
cannot be used without MTD_COMPLEX_MAPPINGS.


FYI, Here is a platform code I want to send if the physmap patch was
merged.  Note that this patch cannot be applied cleanly on any tree
while it depends on some patches pending on linux-mips ML.

Subject: [PATCH] rbtx4939: mtd support

This board has complex flash mappings, controlled by its DIPSW setting.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 arch/mips/txx9/rbtx4939/setup.c |  161 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 161 insertions(+), 0 deletions(-)

diff --git a/arch/mips/txx9/rbtx4939/setup.c b/arch/mips/txx9/rbtx4939/setup.c
index 74839f2..b1a5949 100644
--- a/arch/mips/txx9/rbtx4939/setup.c
+++ b/arch/mips/txx9/rbtx4939/setup.c
@@ -16,6 +16,8 @@
 #include <linux/leds.h>
 #include <linux/interrupt.h>
 #include <linux/smc91x.h>
+#include <linux/mtd/physmap.h>
+#include <linux/mtd/map.h>
 #include <asm/reboot.h>
 #include <asm/txx9/generic.h>
 #include <asm/txx9/pci.h>
@@ -282,6 +284,164 @@ static void rbtx4939_7segled_putc(unsigned int pos, unsigned char val)
 	__rbtx4939_7segled_putc(pos, val);
 }
 
+#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
+/* special mapping for boot rom */
+static unsigned long rbtx4939_flash_fixup_ofs(unsigned long ofs)
+{
+	u8 bdipsw = readb(rbtx4939_bdipsw_addr) & 0x0f;
+	unsigned char shift;
+
+	if (bdipsw & 8) {
+		/* BOOT Mode: USER ROM1 / USER ROM2 */
+		shift = bdipsw & 3;
+		/* rotate A[23:22] */
+		return (ofs & ~0xc00000) | ((((ofs >> 22) + shift) & 3) << 22);
+	}
+#ifdef __BIG_ENDIAN
+	if (bdipsw == 0)
+		/* BOOT Mode: Monitor ROM */
+		ofs ^= 0x400000;	/* swap A[22] */
+#endif
+	return ofs;
+}
+
+static map_word rbtx4939_flash_read16(struct map_info *map, unsigned long ofs)
+{
+	map_word r;
+
+	ofs = rbtx4939_flash_fixup_ofs(ofs);
+	r.x[0] = __raw_readw(map->virt + ofs);
+	return r;
+}
+
+static void rbtx4939_flash_write16(struct map_info *map, const map_word datum,
+				   unsigned long ofs)
+{
+	ofs = rbtx4939_flash_fixup_ofs(ofs);
+	__raw_writew(datum.x[0], map->virt + ofs);
+	mb();	/* see inline_map_write() in mtd/map.h */
+}
+
+static void rbtx4939_flash_copy_from(struct map_info *map, void *to,
+				     unsigned long from, ssize_t len)
+{
+	u8 bdipsw = readb(rbtx4939_bdipsw_addr) & 0x0f;
+	unsigned char shift;
+	ssize_t curlen;
+
+	from += (unsigned long)map->virt;
+	if (bdipsw & 8) {
+		/* BOOT Mode: USER ROM1 / USER ROM2 */
+		shift = bdipsw & 3;
+		while (len) {
+			curlen = min((unsigned long)len,
+				     0x400000 -	(from & (0x400000 - 1)));
+			memcpy(to,
+			       (void *)((from & ~0xc00000) |
+					((((from >> 22) + shift) & 3) << 22)),
+			       curlen);
+			len -= curlen;
+			from += curlen;
+			to += curlen;
+		}
+		return;
+	}
+#ifdef __BIG_ENDIAN
+	if (bdipsw == 0) {
+		/* BOOT Mode: Monitor ROM */
+		while (len) {
+			curlen = min((unsigned long)len,
+				     0x400000 - (from & (0x400000 - 1)));
+			memcpy(to, (void *)(from ^ 0x400000), curlen);
+			len -= curlen;
+			from += curlen;
+			to += curlen;
+		}
+		return;
+	}
+#endif
+	memcpy(to, (void *)from, len);
+}
+
+static void rbtx4939_flash_map_init(struct map_info *map)
+{
+	map->read = rbtx4939_flash_read16;
+	map->write = rbtx4939_flash_write16;
+	map->copy_from = rbtx4939_flash_copy_from;
+}
+#endif /* CONFIG_MTD_COMPLEX_MAPPINGS */
+
+static void __init rbtx4939_mtd_init(void)
+{
+#if defined(CONFIG_MTD_PHYSMAP) || defined(CONFIG_MTD_PHYSMAP_MODULE)
+	static struct {
+		struct platform_device dev;
+		struct resource res;
+		struct physmap_flash_data data;
+	} pdevs[4];
+	int i;
+#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
+	static char names[4][8];
+	static struct mtd_partition parts[4];
+	struct physmap_flash_data *boot_pdata = &pdevs[0].data;
+	u8 bdipsw = readb(rbtx4939_bdipsw_addr) & 0x0f;
+
+	if (bdipsw & 8) {
+		/* BOOT Mode: USER ROM1 / USER ROM2 */
+		boot_pdata->nr_parts = 4;
+		for (i = 0; i < boot_pdata->nr_parts; i++) {
+			sprintf(names[i], "img%d", 4 - i);
+			parts[i].name = names[i];
+			parts[i].size = 0x400000;
+			parts[i].offset = MTDPART_OFS_NXTBLK;
+		}
+	} else if (bdipsw == 0) {
+		/* BOOT Mode: Monitor ROM */
+		boot_pdata->nr_parts = 2;
+		strcpy(names[0], "big");
+		strcpy(names[1], "little");
+		for (i = 0; i < boot_pdata->nr_parts; i++) {
+			parts[i].name = names[i];
+			parts[i].size = 0x400000;
+			parts[i].offset = MTDPART_OFS_NXTBLK;
+		}
+	} else {
+		/* BOOT Mode: ROM Emulator */
+		boot_pdata->nr_parts = 2;
+		parts[0].name = "boot";
+		parts[0].offset = 0xc00000;
+		parts[0].size = 0x400000;
+		parts[1].name = "user";
+		parts[1].offset = 0;
+		parts[1].size = 0xc00000;
+	}
+	boot_pdata->parts = parts;
+	boot_pdata->map_init = rbtx4939_flash_map_init;
+#endif
+
+	for (i = 0; i < ARRAY_SIZE(pdevs); i++) {
+		struct resource *r = &pdevs[i].res;
+		struct platform_device *dev = &pdevs[i].dev;
+
+#ifndef CONFIG_MTD_COMPLEX_MAPPINGS
+		/* skip boot flash */
+		if (i == 0)
+			continue;
+#endif
+		r->start = 0x1f000000 - i * 0x1000000;
+		r->end = r->start + 0x1000000 - 1;
+		r->flags = IORESOURCE_MEM;
+		pdevs[i].data.width = 2;
+		dev->num_resources = 1;
+		dev->resource = r;
+		dev->id = i;
+		dev->name = "physmap-flash";
+		dev->dev.platform_data = &pdevs[i].data;
+		platform_device_register(dev);
+	}
+#endif
+}
+
 static void __init rbtx4939_arch_init(void)
 {
 	rbtx4939_pci_setup();
@@ -333,6 +493,7 @@ static void __init rbtx4939_device_init(void)
 	    platform_device_add_data(pdev, &smc_pdata, sizeof(smc_pdata)) ||
 	    platform_device_add(pdev))
 		platform_device_put(pdev);
+	rbtx4939_mtd_init();
 	/* TC58DVM82A1FT: tDH=10ns, tWP=tRP=tREADID=35ns */
 	tx4939_ndfmc_init(10, 35,
 			  (1 << 1) | (1 << 2),
