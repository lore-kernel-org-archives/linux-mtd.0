Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMK7q-0005hv-HZ
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 03:25:30 -0500
Date: Wed, 28 Feb 2007 09:25:21 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: "sam nathan" <sam-natha@hotmail.com>
Subject: Re: MTD driver for ATMEL AT49BV642D flash chip
Message-ID: <20070228092521.2af67f9b@dhcp-252-105.norway.atmel.com>
In-Reply-To: <BAY107-F19A82530DA0DA9C1AAA51EEF820@phx.gbl>
References: <BAY107-F19A82530DA0DA9C1AAA51EEF820@phx.gbl>
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

On Tue, 27 Feb 2007 13:54:52 -0600
"sam nathan" <sam-natha@hotmail.com> wrote:

> 1. Is there any matching MTD driver for Atmel AT49BV642D
> parallel flash?

Yes, it should be supported by cfi_cmdset_0002.

> 2. I learn from ATMEL's datasheet that this chip supports
> CFI. Does CFI detection  work for Atmel AT49BV642D?
> Has anyone  been able to make the CFI detection working for
> AT49BV642D using 2.4.27-vrs1? If so, can you provide some
> insight into this?

Yes, a colleague did some testing on a AVR32 board with AT49BV642D
flash. I think the only problem was that the chip somehow reported
burst mode to be supported even though it is not. The following patch
should fix up the information gathered from CFI so that it works.

It also converts the CFI table to Intel format for cmdset_0001 Atmel
chips. I can split this out into a separate patch if necessary.

Best regards,
Haavard Skinnemoen

==============[cut here]==============
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: [PATCH] More CFI fixups for Atmel chips

Convert CFI tables from Atmel cmdset_0001 chips to Intel format and set
BufWrite timeouts to 0 for Atmel cmdset_0001 and cmdset_0002 chips.
Some chips may indicate support for buffered writes even though they
only support dual-word writes.

The CFI fixup must run before fixup_use_write_buffers for this to work.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   43 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/chips/cfi_cmdset_0002.c |    6 ++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

Index: linux-2.6.18-avr32/drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
--- linux-2.6.18-avr32.orig/drivers/mtd/chips/cfi_cmdset_0001.c	2007-02-19 15:13:56.000000000 +0100
+++ linux-2.6.18-avr32/drivers/mtd/chips/cfi_cmdset_0001.c	2007-02-19 15:34:09.000000000 +0100
@@ -47,6 +47,7 @@
 #define I82802AC	0x00ac
 #define MANUFACTURER_ST         0x0020
 #define M50LPW080       0x002F
+#define AT49BV640D	0x02de
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
@@ -153,6 +154,47 @@ static void cfi_tell_features(struct cfi
 }
 #endif
 
+/* Atmel chips don't use the same PRI format as Intel chips */
+static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
+	struct cfi_pri_atmel atmel_pri;
+	uint32_t features = 0;
+
+	/* Reverse byteswapping */
+	extp->FeatureSupport = cpu_to_le32(extp->FeatureSupport);
+	extp->BlkStatusRegMask = cpu_to_le16(extp->BlkStatusRegMask);
+	extp->ProtRegAddr = cpu_to_le16(extp->ProtRegAddr);
+
+	memcpy(&atmel_pri, extp, sizeof(atmel_pri));
+	memset((char *)extp + 5, 0, sizeof(*extp) - 5);
+
+	printk(KERN_ERR "atmel Features: %02x\n", atmel_pri.Features);
+
+	if (atmel_pri.Features & 0x01) /* chip erase supported */
+		features |= (1<<0);
+	if (atmel_pri.Features & 0x02) /* erase suspend supported */
+		features |= (1<<1);
+	if (atmel_pri.Features & 0x04) /* program suspend supported */
+		features |= (1<<2);
+	if (atmel_pri.Features & 0x08) /* simultaneous operations supported */
+		features |= (1<<9);
+	if (atmel_pri.Features & 0x20) /* page mode read supported */
+		features |= (1<<7);
+	if (atmel_pri.Features & 0x40) /* queued erase supported */
+		features |= (1<<4);
+	if (atmel_pri.Features & 0x80) /* Protection bits supported */
+		features |= (1<<6);
+
+	extp->FeatureSupport = features;
+
+	/* burst write mode not supported */
+	cfi->cfiq->BufWriteTimeoutTyp = 0;
+	cfi->cfiq->BufWriteTimeoutMax = 0;
+}
+
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 /* Some Intel Strata Flash prior to FPO revision C has bugs in this area */
 static void fixup_intel_strataflash(struct mtd_info *mtd, void* param)
@@ -221,6 +263,7 @@ static void fixup_use_write_buffers(stru
 }
 
 static struct cfi_fixup cfi_fixup_table[] = {
+	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_intel_strataflash, NULL },
 #endif
Index: linux-2.6.18-avr32/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.6.18-avr32.orig/drivers/mtd/chips/cfi_cmdset_0002.c	2007-02-19 15:30:17.000000000 +0100
+++ linux-2.6.18-avr32/drivers/mtd/chips/cfi_cmdset_0002.c	2007-02-19 15:34:09.000000000 +0100
@@ -184,6 +184,10 @@ static void fixup_convert_atmel_pri(stru
 		extp->TopBottom = 2;
 	else
 		extp->TopBottom = 3;
+
+	/* burst write mode not supported */
+	cfi->cfiq->BufWriteTimeoutTyp = 0;
+	cfi->cfiq->BufWriteTimeoutMax = 0;
 }
 
 static void fixup_use_secsi(struct mtd_info *mtd, void *param)
@@ -216,6 +220,7 @@ static void fixup_use_atmel_lock(struct 
 }
 
 static struct cfi_fixup cfi_fixup_table[] = {
+	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
 #endif
@@ -228,7 +233,6 @@ static struct cfi_fixup cfi_fixup_table[
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif
-	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 	{ 0, 0, NULL, NULL }
 };
 static struct cfi_fixup jedec_fixup_table[] = {
