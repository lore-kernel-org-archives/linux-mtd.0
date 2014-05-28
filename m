Received: from mail-bn1blp0189.outbound.protection.outlook.com
 ([207.46.163.189] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpXaX-0003Oh-Gw
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 06:43:50 +0000
Date: Wed, 28 May 2014 13:22:40 +0800
From: Huang Shijie <b32955@freescale.com>
To: Christophe KERELLO <christophe.kerello@st.com>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Message-ID: <20140528052237.GA7984@shlinux1.ap.freescale.net>
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <20140527011231.GA5876@shlinux1.ap.freescale.net> <5384B5EB.4050203@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5384B5EB.4050203@st.com>
Cc: marex@denx.de, angus.clark@st.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 27, 2014 at 05:57:31PM +0200, Christophe KERELLO wrote:
> Hello Huang,
> 
> I have one remark on this patch.
> 
> S25FL128S flash has 2 variants:
>  - Uniform 256-kB sectors (ext_id = 0x4D00)
>  - 4-kB parameter sectors with uniform 64-kB sectors (ext_id = 0x4D01)
> 
> If i would like to distinguish these 2 variants in spi_nor_ids
> array, i replace:
> { "s25fl128s", INFO(0x012018, 0x4d0180, 64 * 1024, 256,
> SPI_NOR_QUAD_READ) },
> with
> { "s25fl128s0", INFO(0x012018, 0x4d0080, 256 * 1024, 64,
> SPI_NOR_QUAD_READ) },
> { "s25fl128s1", INFO(0x012018, 0x4d0180, 64 * 1024, 256,
> SPI_NOR_QUAD_READ) },
> 
> In this case, i fail to find s25fl128s1 device.
> 
> The problem is coming from ext_jedec calculation.
> first try:
>     - jedec = 0x012018,
>     - ext_jedec = 0x4d0180,
>     - info->ext_id = 0x4d0080,
>     =>s25fl128s0 doesn't match
> 
> second try:
>     - jedec = 0x012018,
>     - ext_jedec = 0x4d018080,
>     - info->ext_id = 0x4d0180,
>     => s25fl128s1 doesn't match
> 
> I think there is similar issue with s25fl129p1 (if i use this patch
> without modifying it).
> first try:
>     - jedec = 0x012018,
>     - ext_jedec = 0x4d01xx, (xx = probably 0x00 or 0xff)
>     - info->ext_id = 0x4d0180,
>     =>s25fl128s doesn't match
> 
> second try:
>     - jedec = 0x012018,
>     - ext_jedec = 0x4d01xx,
>     - info->ext_id = 0x4d01,
>     => s25fl129p1 doesn't match
> 
> If I reset ext_jedec after each try, it works.
> 
> ext_jedec = ext_jedec << 8 | id[5];
> if (info->ext_id == ext_jedec)
>     return &spi_nor_ids[tmp];
> else
>     /* reset ext_jdec for next try */
>     ext_jedec = ext_jedec >> 8;
> 
hi Christophe:
  thanks for pointing this!

  Please try the new version.

thanks
Huang Shijie

---------------------------------------
>From 7b920141899e4e7249bd23792dc8d5f1558cb7ca Mon Sep 17 00:00:00 2001
From: Huang Shijie <b32955@freescale.com>
Date: Mon, 14 Apr 2014 18:09:34 +0800
Subject: [PATCH v2] mtd: spi-nor: read 6 bytes for the ID

Currently, we read 5 bytes for ID, but s25fl128s has the same ext_id(0x4d01)
with s25fl129p1. The s25fl128s can support the DDR Quad read, while s25fl129p1
does not. So we have to distinguish the two NOR flashs.

This patch reads out 6 bytes for the ID, and use the 6 bytes ID to search the
right flash_info.

The detail of the patch is:
  [1] change the "ext_id" from u16 to u32.
      We can store two bytes or three bytes with the @ext_id now.

  [2] search the right flash_info with the 6byte ID and the new @ext_id.
      We use "matched" variable to track the legacy two bytes @ext_id.
      If the flash_info's @ext_id is three bytes, we will use the
      sixth byte of the ID to check it.

  [3] add the new item to spi_nor_ids for s25fl128s.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   30 +++++++++++++++++++++++++-----
 1 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c713c86..f21d3ef 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -383,7 +383,7 @@ struct flash_info {
 	 * then a two byte device id.
 	 */
 	u32		jedec_id;
-	u16             ext_id;
+	u32		ext_id;
 
 	/* The size listed here is what works with SPINOR_OP_SE, which isn't
 	 * necessarily called a "sector" by the vendor.
@@ -505,6 +505,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
+	{ "s25fl128s",	INFO(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
@@ -593,12 +594,13 @@ EXPORT_SYMBOL_GPL(spi_nor_ids);
 static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 {
 	int			tmp;
-	u8			id[5];
+	u8			id[6];
 	u32			jedec;
-	u16                     ext_jedec;
+	u32                     ext_jedec;
 	struct flash_info	*info;
+	int			matched = -1;
 
-	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, 5);
+	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, 6);
 	if (tmp < 0) {
 		dev_dbg(nor->dev, " error %d reading JEDEC ID\n", tmp);
 		return ERR_PTR(tmp);
@@ -614,8 +616,26 @@ static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 	for (tmp = 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
 		info = (void *)spi_nor_ids[tmp].driver_data;
 		if (info->jedec_id == jedec) {
-			if (info->ext_id == 0 || info->ext_id == ext_jedec)
+			if (info->ext_id == 0)
 				return &spi_nor_ids[tmp];
+
+			/* the legacy two bytes ext_id */
+			if ((info->ext_id >> 16) == 0) {
+				if (info->ext_id == ext_jedec)
+					matched = tmp;
+			} else {
+				/* check the sixth byte now */
+				ext_jedec = ext_jedec << 8 | id[5];
+				if (info->ext_id == ext_jedec)
+					return &spi_nor_ids[tmp];
+
+				/* reset back the ext_jedec */
+				ext_jedec >>= 8;
+			}
+		} else {
+			/* shortcut */
+			if (matched != -1)
+				return &spi_nor_ids[matched];
 		}
 	}
 	dev_err(nor->dev, "unrecognized JEDEC id %06x\n", jedec);
-- 
1.7.8
