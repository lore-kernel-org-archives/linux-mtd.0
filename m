Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5hog-0006Bo-3a
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 16:02:52 +0000
Subject: [PATCH v5 2/9] mtd: cfi_probe: make the addresses used to enter Auto
	Select Mode variable
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 24 Apr 2010 17:57:57 +0200
Message-ID: <20100424155757.14723.39823.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Wolfram Sang <w.sang@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Chris Moore <moore@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make the addresses used to enter Auto Select Mode variable to leave place
for handling chips using non-standard addresses.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/chips/cfi_probe.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index f657d16..045dc10 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -158,6 +158,7 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	__u32 base = 0;
 	int num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);
 	int i;
+	int addr_unlock1 = 0x555, addr_unlock2 = 0x2AA;
 
 	xip_enable(base, map, cfi);
 #ifdef DEBUG_CFI
@@ -214,9 +215,9 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	 * back into Read Mode, which is a nop in this case).
 	 */
 	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 	cfi->mfr = cfi_read_query16(map, base);
 	cfi->id = cfi_read_query16(map, base + ofs_factor);
 
