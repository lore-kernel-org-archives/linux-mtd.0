Received: from mail28.messagelabs.com ([216.82.249.131])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLCZB-0007Pi-UL
	for linux-mtd@lists.infradead.org; Tue, 22 Jul 2008 07:45:50 +0000
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] [RFC] [MTD] cfi_probe: remove Intel chip workaround
Date: Tue, 22 Jul 2008 09:38:59 +0200
Message-ID: <1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
In-Reply-To: <1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For me this workaround breaks detection of a M29W128GL flash because it
doesn't switch to CFI Query mode after writing 0xff.

This workaround was introduced in 2004 between v2.6.8-rc1 and
v2.6.8-rc2 in CVS revision 1.77 of cfi_probe.c.  ("Send 0xFF to switch Intel
chips back to read mode too. Some of them ignore 0xF0")

Alternatively writing 0xff *before* 0xf0 works with the M29W128GL.

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
---
 drivers/mtd/chips/cfi_probe.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index a4463a9..6b7ee5a 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -46,7 +46,6 @@ do { \
 #define xip_enable(base, map, cfi) \
 do { \
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL); \
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL); \
 	xip_allowed(base, map); \
 } while (0)
 
@@ -54,7 +53,6 @@ do { \
 do { \
 	xip_disable(); \
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL); \
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL); \
 	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL); \
 } while (0)
 
@@ -118,7 +116,6 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 
 	xip_disable();
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
 
 	if (!qry_present(map,base,cfi)) {
@@ -146,7 +143,6 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 			/* Eep. This chip also had the QRY marker.
 			 * Is it an alias for the new one? */
 			cfi_send_gen_cmd(0xF0, 0, start, map, cfi, cfi->device_type, NULL);
-			cfi_send_gen_cmd(0xFF, 0, start, map, cfi, cfi->device_type, NULL);
 
 			/* If the QRY marker goes away, it's an alias */
 			if (!qry_present(map, start, cfi)) {
@@ -160,7 +156,6 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 			 * too and if it's the same, assume it's an alias. */
 			/* FIXME: Use other modes to do a proper check */
 			cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-			cfi_send_gen_cmd(0xFF, 0, start, map, cfi, cfi->device_type, NULL);
 
 			if (qry_present(map, base, cfi)) {
 				xip_allowed(base, map);
@@ -178,7 +173,6 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 
 	/* Put it back into Read Mode */
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
 	xip_allowed(base, map);
 
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
@@ -239,8 +233,6 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 
 	/* Put it back into Read Mode */
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-	/* ... even if it's an Intel chip */
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
 	xip_allowed(base, map);
 
 	/* Do any necessary byteswapping */
-- 
1.5.6.3
