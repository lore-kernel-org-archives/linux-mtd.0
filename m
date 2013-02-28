Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UB1bt-0006xe-Go
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 11:25:15 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 1/4] mtd: cfi_probe: Fix detection of Micron M29EW flashes
Date: Thu, 28 Feb 2013 12:23:23 +0100
In-Reply-To: <1362050606-29475-1-git-send-email-christian.riesch@omicron.at>
References: <1362050606-29475-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <d18e4efe-d65f-4ba6-b037-ba6201de8449@mary.at.omicron.at>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Christian Riesch <christian.riesch@omicron.at>,
 Gerlando Falauto <gerlando.falauto@keymile.com>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 420962884379bd434a7f643d0936281b2ab4b30c introduces two
bugfixes for Micron M29EW flash chips.

Whereas the fixes are fine, the detection of the M29EW devices only
checks the first byte of the device code and not the full three byte
code. Similar to some Spansion devices, the Micron M29EW have an extended
three byte id.

Reading the three byte id is already supported for Spansion flashes.
This patch applies this also for Micron M29EW devices (which have
an Intel manufacturer ID).

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
Cc: Gerlando Falauto <gerlando.falauto@keymile.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
---

Hi,

According to the datasheet of the Micron M29EW, the device codes obtained
with the patch below should be

0x2201 for 256 Mb devices,
0x2301 for 512 Mb devices,
0x2801 for 1 Gb devices, and
0x4801 for 2 Gb devices.

However, with my 512 Mb flash (ordering code PC28F512M29EWH), the code results
in 0x3901, this is why I added this device code in is_m29ew() as well. Has
anyone any experience with these flashes? Is there anyone around who could try
this patch on a M29EW device?

Thank you!

Best regards, Christian

 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index b861972..8391890 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -434,8 +434,8 @@ static void cfi_fixup_major_minor(struct cfi_private *cfi,
 static int is_m29ew(struct cfi_private *cfi)
 {
 	if (cfi->mfr == CFI_MFR_INTEL &&
-	    ((cfi->device_type == CFI_DEVICETYPE_X8 && (cfi->id & 0xff) == 0x7e) ||
-	     (cfi->device_type == CFI_DEVICETYPE_X16 && cfi->id == 0x227e)))
+	    (cfi->id == 0x2201 || cfi->id == 0x2301 || cfi->id == 0x2801 ||
+	     cfi->id == 0x4801 || cfi->id == 0x3901))
 		return 1;
 	return 0;
 }
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index d255352..3d4b42d 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -228,8 +228,8 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	cfi->mfr = cfi_read_query16(map, base);
 	cfi->id = cfi_read_query16(map, base + ofs_factor);
 
-	/* Get AMD/Spansion extended JEDEC ID */
-	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
+	/* Get AMD/Spansion (and compatible devices) extended JEDEC ID */
+	if ((cfi->mfr == CFI_MFR_AMD || cfi->mfr == CFI_MFR_INTEL) && (cfi->id & 0xff) == 0x7e)
 		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
 			  cfi_read_query(map, base + 0xf * ofs_factor);
 
-- 
1.7.9.5
