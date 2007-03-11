Received: from djurbala-pt.tunnel.tserv2.fmt.ipv6.he.net
	([2001:470:1f01:ffff::eb] helo=gate.crashing.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HQXQO-0006Mw-E4
	for linux-mtd@lists.infradead.org; Sun, 11 Mar 2007 19:26:02 -0400
Date: Sun, 11 Mar 2007 18:23:22 -0500 (CDT)
From: Kumar Gala <galak@kernel.crashing.org>
To: linux-mtd@lists.infradead.org
Subject: how to handle Atmel fixup -- swapping erase regions
Message-ID: <Pine.LNX.4.64.0703111815330.12995@gate.crashing.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working with a Atmel AT49BV162A and it appears that the device reports
the order of erase sectors incorrectly:

Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x10000 bytes, 31 blocks
  Erase Region #1: BlockSize 0x2000 bytes, 8 blocks

Amd/Fujitsu Extended Query Table at 0x0041
  Silicon revision: 0
  Address sensitive unlock: Required
  Erase Suspend: Read/write
  Block protection: Not supported
  Temporary block unprotect: Not supported
  Block protect/unprotect scheme: 0
  Number of simultaneous operations: 0
  Burst mode: Not supported
  Page mode: Not supported
  Vpp Supply Minimum Program/Erase Voltage: 0.0 V
  Vpp Supply Maximum Program/Erase Voltage: 0.0 V
  Top/Bottom Boot Block: Bottom boot

When the devices are 'Bottom boot' region 0 should be 8/8k blocks, and
region 1 should be 31/64k blocks.

I'm not sure how many other Atmel devices this effects.  I was wondering
what the best way to implement the fixup was.  Something like:

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 702ae4c..9b47f2b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -50,6 +50,7 @@
 #define SST49LF004B	        0x0060
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
+#define AT49BV162		0x00c0

 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
@@ -215,6 +216,27 @@ static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)
 	mtd->flags |= MTD_STUPID_LOCK;
 }

+static void fixup_swap_atmel(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
+	unsigned char bootloc = extp->TopBottom;
+
+	if (bootloc == 2 && cfi->cfiq->NumEraseRegions > 1) {
+		int i;
+
+		for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
+			int j = (cfi->cfiq->NumEraseRegions-1)-i;
+			__u32 swap;
+
+			swap = cfi->cfiq->EraseRegionInfo[i];
+			cfi->cfiq->EraseRegionInfo[i] = cfi->cfiq->EraseRegionInfo[j];
+			cfi->cfiq->EraseRegionInfo[j] = swap;
+		}
+	}
+}
+
 static struct cfi_fixup cfi_fixup_table[] = {
 #ifdef AMD_BOOTLOC_BUG
 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
@@ -245,6 +267,7 @@ static struct cfi_fixup fixup_table[] = {
 	 */
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip, NULL },
 	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock, NULL },
+	{ CFI_MFR_ATMEL, AT49BV162, fixup_swap_atmel, NULL },
 	{ 0, 0, NULL, NULL }
 };

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
