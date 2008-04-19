Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JnFW3-0000eL-3P
	for linux-mtd@lists.infradead.org; Sat, 19 Apr 2008 16:02:16 +0000
Date: Sat, 19 Apr 2008 16:56:58 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: linux-mtd@lists.infradead.org
Subject: Fwd: Re: [PATCH 5/9] magician: enable flash VPP GPIO and build in MTD,
	physmap-flash and JFFS2
Message-ID: <20080419155658.GD19303@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: LAK <linux-arm-kernel@lists.arm.linux.org.uk>,
	Philipp Zabel <philipp.zabel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It would be nice if someone in MTD land could take a look at this.  It's
been hanging for about a month wanting an answer to the question.  Thanks.

----- Forwarded message from Philipp Zabel <philipp.zabel@gmail.com> -----
Subject: Re: [PATCH 5/9] magician: enable flash VPP GPIO and build in MTD,
	physmap-flash and JFFS2
From: Philipp Zabel <philipp.zabel@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel <linux-arm-kernel@lists.arm.linux.org.uk>
Date: Tue, 08 Apr 2008 20:52:53 +0200

Am Freitag, den 21.03.2008, 12:07 +0000 schrieb Russell King - ARM
Linux:
> On Fri, Mar 21, 2008 at 12:48:42PM +0100, pHilipp Zabel wrote:
> > On Thu, Mar 20, 2008 at 10:01 PM, Russell King - ARM Linux
> > <linux@arm.linux.org.uk> wrote:
> > > On Mon, Mar 17, 2008 at 09:17:51PM +0100, Philipp Zabel wrote:
> > >  > This enables rootfs on StrataFlash if the bootloader supplies the
> > >  > partition list.
> > >
> > > > diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
> > >  > index 3a3252e..531be3d 100644
> > >  > --- a/arch/arm/mach-pxa/magician.c
> > >  > +++ b/arch/arm/mach-pxa/magician.c
> > >  > @@ -223,6 +223,15 @@ static struct pxaohci_platform_data magician_ohci_info = {
> > >  >   * StrataFlash
> > >  >   */
> > >  >
> > >  > +static void magician_set_vpp(struct map_info *map, int vpp)
> > >  > +{
> > >  > +     static int old_vpp;
> > >  > +     if (vpp == old_vpp)
> > >  > +             return;
> > >  > +     gpio_set_value(EGPIO_MAGICIAN_FLASH_VPP, vpp);
> > >  > +     old_vpp = vpp;
> > >  > +}
> > >  > +
> > >
> > >  Have you checked that this can't race with itself?
> > 
> > No, I have just seen that set_vpp is called very often in quick
> > succession with the same vpp value and wanted to avoid overhead,
> > assuming that the mtd subsystem cares about locking.
> > I have just seen that omap-nor does something similar but with a
> > counter. Maybe this would be better?
> 
> No idea.  These are questions that only the MTD folk can answer.

I got no answer yet, probably because I'm not subscribed my mail got lost in moderation.
For now is it ok if I just drop that 'optimization'?

regards
Philipp

diff --git a/arch/arm/configs/magician_defconfig b/arch/arm/configs/magician_defconfig
index 76960c7..b9b234b 100644
--- a/arch/arm/configs/magician_defconfig
+++ b/arch/arm/configs/magician_defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.24-rc3
-# Tue Nov 20 12:05:40 2007
+# Linux kernel version: 2.6.24-rc6
+# Sat Dec 22 10:38:43 2007
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -461,7 +461,6 @@ CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_CHAR=m
 CONFIG_MTD_BLKDEVS=m
 CONFIG_MTD_BLOCK=m
-# CONFIG_MTD_BLOCK_RO is not set
 # CONFIG_FTL is not set
 # CONFIG_NFTL is not set
 # CONFIG_INFTL is not set
@@ -472,9 +471,8 @@ CONFIG_MTD_BLOCK=m
 #
 # RAM/ROM/Flash chip drivers
 #
-CONFIG_MTD_CFI=m
+CONFIG_MTD_CFI=y
 # CONFIG_MTD_JEDECPROBE is not set
-CONFIG_MTD_GEN_PROBE=m
 # CONFIG_MTD_CFI_ADV_OPTIONS is not set
 CONFIG_MTD_MAP_BANK_WIDTH_1=y
 CONFIG_MTD_MAP_BANK_WIDTH_2=y
@@ -486,10 +484,9 @@ CONFIG_MTD_CFI_I1=y
 CONFIG_MTD_CFI_I2=y
 # CONFIG_MTD_CFI_I4 is not set
 # CONFIG_MTD_CFI_I8 is not set
-CONFIG_MTD_CFI_INTELEXT=m
+CONFIG_MTD_CFI_INTELEXT=y
 # CONFIG_MTD_CFI_AMDSTD is not set
 # CONFIG_MTD_CFI_STAA is not set
-CONFIG_MTD_CFI_UTIL=m
 # CONFIG_MTD_RAM is not set
 # CONFIG_MTD_ROM is not set
 # CONFIG_MTD_ABSENT is not set
@@ -499,10 +496,10 @@ CONFIG_MTD_CFI_UTIL=m
 # Mapping drivers for chip access
 #
 # CONFIG_MTD_COMPLEX_MAPPINGS is not set
-CONFIG_MTD_PHYSMAP=m
-CONFIG_MTD_PHYSMAP_START=0x8000000
-CONFIG_MTD_PHYSMAP_LEN=0x0
-CONFIG_MTD_PHYSMAP_BANKWIDTH=2
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_START=0x00000000
+CONFIG_MTD_PHYSMAP_LEN=0x04000000
+CONFIG_MTD_PHYSMAP_BANKWIDTH=4
 # CONFIG_MTD_PXA2XX is not set
 # CONFIG_MTD_ARM_INTEGRATOR is not set
 # CONFIG_MTD_SHARP_SL is not set
@@ -951,7 +948,7 @@ CONFIG_TMPFS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-CONFIG_JFFS2_FS=m
+CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
 # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
@@ -1142,10 +1139,10 @@ CONFIG_CRC_CCITT=y
 CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
 # CONFIG_LIBCRC32C is not set
-CONFIG_ZLIB_INFLATE=m
-CONFIG_ZLIB_DEFLATE=m
-CONFIG_LZO_COMPRESS=m
-CONFIG_LZO_DECOMPRESS=m
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
 CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magician.c
index dadd1a1..10376a1 100644
--- a/arch/arm/mach-pxa/magician.c
+++ b/arch/arm/mach-pxa/magician.c
@@ -223,6 +223,11 @@ static struct pxaohci_platform_data magician_ohci_info = {
  * StrataFlash
  */
 
+static void magician_set_vpp(struct map_info *map, int vpp)
+{
+	gpio_set_value(EGPIO_MAGICIAN_FLASH_VPP, vpp);
+}
+
 #define PXA_CS_SIZE		0x04000000
 
 static struct resource strataflash_resource = {
@@ -233,6 +238,7 @@ static struct resource strataflash_resource = {
 
 static struct physmap_flash_data strataflash_data = {
 	.width = 4,
+	.set_vpp = magician_set_vpp,
 };
 
 static struct platform_device strataflash = {
-- 
1.5.4.5



----- End forwarded message -----
