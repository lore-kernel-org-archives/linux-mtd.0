Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Niosw-00040J-0h
	for linux-mtd@lists.infradead.org; Sat, 20 Feb 2010 12:56:42 +0000
Subject: [PATCH 3/6] mtd: cfi_probe: enable Auto Select Mode for
	SST39VF160x/39VF320x chips
To: David Woodhouse <dwmw2@infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 20 Feb 2010 13:57:59 +0100
Message-ID: <20100220125759.14843.46780.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
References: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SST 39VF160x/39VF320x chips differ from the CFI specifications, they need
the 0xAA / 0x55 / 0x90 sequence to be sent to 0x5555 / 0x2AAA / 0x5555 to
enter Auto Select Mode.
Trying this sequence and testing for (cfi->mfr != CFI_MFR_SST) then fallback
to the standard sequence seems to work and to add no regressions.

Signed-off-by: Guillaume Lecerf <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_probe.c |   25 ++++++++++++++++++++++---
 1 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index e63e674..05207f7 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -189,12 +189,31 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	 * back into Read Mode, which is a nop in this case).
 	 */
 	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+
+	/* SST 39VF160x/39VF320x chips differ from the CFI specifications, they need
+	 * the 0xAA / 0x55 / 0x90 sequence to be sent to 0x5555 / 0x2AAA / 0x5555 to
+	 * enter Auto Select Mode.
+	 * Trying this sequence and testing for (cfi->mfr != CFI_MFR_SST) then fallback
+	 * to the standard sequence seems to work and to add no regressions.
+	 */
+	cfi_send_gen_cmd(0xAA, 0x5555, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, 0x2AAA, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, 0x5555, base, map, cfi, cfi->device_type, NULL);
+
 	cfi->mfr = cfi_read_query16(map, base);
 	cfi->id = cfi_read_query16(map, base + ofs_factor);
 
+	if(cfi->mfr != CFI_MFR_SST) {
+		cfi_send_gen_cmd(0xF0,     0, base, map, cfi, cfi->device_type, NULL);
+
+		cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+
+		cfi->mfr = cfi_read_query16(map, base);
+		cfi->id = cfi_read_query16(map, base + ofs_factor);
+	}
+
 	/* Get AMD/Spansion extended JEDEC ID */
 	if (cfi->mfr == CFI_MFR_AMD && (cfi->id & 0xff) == 0x7e)
 		cfi->id = cfi_read_query(map, base + 0xe * ofs_factor) << 8 |
