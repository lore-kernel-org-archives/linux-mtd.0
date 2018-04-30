Received: from xes-mad.com ([216.165.139.220] helo=mail.xes-mad.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDBlm-0003cO-5q
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 16:35:20 +0000
Date: Mon, 30 Apr 2018 11:35:07 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1111011589.117630.1525106107675.JavaMail.zimbra@xes-inc.com>
Subject: [PATCH v2 2/2] mtd: cfi: Add early fixup for S70GL02GS
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

S70GL02GS flash reports a single 256 MiB chip, but is really made up
of two 128 MiB chips with 1024 sectors each.

Without early fixups (top half of device cannot be written or erased):
  ff0000000.nor-boot: Found 1 x16 devices at 0x0 in 16-bit bank. <snip>
  Amd/Fujitsu Extended Query Table at 0x0040
    Amd/Fujitsu Extended Query version 1.5.
  number of CFI chips: 1

With early fixups (entire device can be written and erased):
  Bad S70GL02GS CFI data; adjust to detect 2 chips
  ff0000000.nor-boot: Found 1 x16 devices at 0x0 in 16-bit bank. <snip>
  ff0000000.nor-boot: Found 1 x16 devices at 0x8000000 in 16-bit bank
  Amd/Fujitsu Extended Query Table at 0x0040
    Amd/Fujitsu Extended Query version 1.5.
  number of CFI chips: 2

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/chips/cfi_probe.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index c05deac..65f3ab0 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -174,7 +174,19 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 	return 1;
 }
 
+static void fixup_s70gl02gs_chips(struct cfi_private *cfi)
+{
+	/*
+	 * S70GL02GS flash reports a single 256 MiB chip, but is really made up
+	 * of two 128 MiB chips with 1024 sectors each.
+	 */
+	cfi->cfiq->DevSize = 27;
+	cfi->cfiq->EraseRegionInfo[0] = 0x20003ff;
+	pr_warn("Bad S70GL02GS CFI data; adjust to detect 2 chips\n");
+}
+
 static struct cfi_early_fixup cfi_early_fixup_table[] = {
+	{ CFI_MFR_AMD, 0x4801, fixup_s70gl02gs_chips },
 	{ 0, 0, NULL },
 };
 
-- 
2.7.4
