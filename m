Date: Tue, 5 Aug 2008 14:15:01 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org
Subject: [CFI] Cleanup of missprint in probe procedure.
Message-ID: <alpine.LFD.1.10.0808051355510.19768@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is a small missprint in CFI probe detect aliasing procedure. 
Please look at the lines 161&162 of cfi_probe.c

160:	/* FIXME: Use other modes to do a proper check */
161:	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
162:	cfi_send_gen_cmd(0xFF, 0, start, map, cfi, cfi->device_type, NULL);
163:

If I properly understand we should send these commands at the same addresses. (base address)

The following diff fixes it. 

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index c418e92..1b61eb4 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -159,7 +159,7 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 			 * too and if it's the same, assume it's an alias. */
 			/* FIXME: Use other modes to do a proper check */
 			cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-			cfi_send_gen_cmd(0xFF, 0, start, map, cfi, cfi->device_type, NULL);
+			cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
 
 			if (qry_present(map, base, cfi)) {
 				xip_allowed(base, map);
