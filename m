Received: from mail-by2on0115.outbound.protection.outlook.com
 ([207.46.100.115] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCOTP-0000Qk-Ql
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 08:43:28 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@freescale.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH 1/8 v3] mtd: spi-nor: fsl-quadspi: Fix qspi irq handler
 complete exception
Date: Tue, 7 Jul 2015 16:38:13 +0800
Message-ID: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In case of interrupt arrive immediately after requesting irq,
kernel will panic due to uninitialized variable.

Fix below exception on LS1021AQDS:
Unable to handle kernel NULL pointer dereference at virtual address
00000000
pgd = 80003000
[00000000] *pgd=80000080004003, *pmd=00000000
Internal error: Oops: 206 [#1] SMP THUMB2
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.1.0-rc5+ #2
Hardware name: Freescale LS1021A
task: 80526f30 ti: 80522000 task.ti: 80522000
PC is at __wake_up_common+0x14/0x46
LR is at __wake_up_locked+0xb/0x10
pc : [<800388ae>]    lr : [<800388eb>]    psr: 400001b3
sp : 80523e78  ip : 00000008  fp : 00000001
r10: 00000000  r9 : 00000003  r8 : ee008000
r7 : 00000001  r6 : 80000193  r5 : 00000000  r4 : ee0c0bd0
r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : fffffff4
Flags: nZcv  IRQs off  FIQs on  Mode SVC_32  ISA Thumb  Segment kernel
Control: 70c5387d  Table: 80003000  DAC: fddff9d7
Process swapper/0 (pid: 0, stack limit = 0x80522210)
Stack: (0x80523e78 to 0x80524000)
3e60:                                                       00000000
ee0c0bcc
3e80: ee0c0bc8 80000193 00000000 ee0cb480 805532ff 800388eb 00000000
00000003
3ea0: 00000001 80038d7f ee0c0010 08010001 00000000 80211587 80211553
cf81af00
3ec0: 00000017 8003e199 ee0cb480 cf81af00 ee0cb480 80532ec0 6e2b4000
00000000
3ee0: ee008000 00000001 803326d0 8003e265 00000000 ee0cb480 80532ec0
8003ff6b
3f00: 8003ff09 00000017 8051ebc4 8003dc77 00000000 8003de47 80523f48
f0002000
3f20: 80523f48 805247d4 80523f7c 8051d384 8051fca0 8000924b 8000db28
40000133
3f40: ffffffff 8032df1b 00000001 00000000 00000000 80017be1 80522000
00000000
3f60: 00000000 80523f98 8051d384 8051fca0 803326d0 00000001 00000008
80523f90
3f80: 8000db27 8000db28 40000133 ffffffff 00000000 80038fd7 00000001
00000000
3fa0: 00000002 80556000 00000000 804eb933 ffffffff ffffffff 804eb545
00000000
3fc0: ffffffff 00000000 00000000 80512590 00000000 80556294 80524460
8051258c
3fe0: 80528050 80003010 410fc075 00000000 00000000 8000808f 00000000
	00000000
[<800388ae>] (__wake_up_common) from [<800388eb>]
	(__wake_up_locked+0xb/0x10)
[<800388eb>] (__wake_up_locked) from [<80038d7f>] (complete+0x1f/0x2a)
[<80038d7f>] (complete) from [<80211587>] (fsl_qspi_irq_handler+0x35/0x38)
[<80211587>] (fsl_qspi_irq_handler) from [<8003e199>]
	(handle_irq_event_percpu+0x1b/0xb6)
[<8003e199>] (handle_irq_event_percpu) from [<8003e265>]
	(handle_irq_event+0x31/0x48)
[<8003e265>] (handle_irq_event) from [<8003ff6b>]
	(handle_fasteoi_irq+0x63/0xb8)
[<8003ff6b>] (handle_fasteoi_irq) from [<8003dc77>]
	(generic_handle_irq+0x13/0x1c)
[<8003dc77>] (generic_handle_irq) from [<8003de47>]
	(__handle_domain_irq+0x53/0x74)
[<8003de47>] (__handle_domain_irq) from [<8000924b>]
	(gic_handle_irq+0x27/0x40)
[<8000924b>] (gic_handle_irq) from [<8032df1b>] (__irq_svc+0x3b/0x5c)
Exception stack(0x80523f48 to 0x80523f90)
3f40:                   00000001 00000000 00000000 80017be1 80522000
00000000
3f60: 00000000 80523f98 8051d384 8051fca0 803326d0 00000001 00000008
80523f90
3f80: 8000db27 8000db28 40000133 ffffffff
[<8032df1b>] (__irq_svc) from [<8000db28>] (arch_cpu_idle+0x14/0x20)
[<8000db28>] (arch_cpu_idle) from [<80038fd7>]
	(cpu_startup_entry+0x187/0x1c4)
[<80038fd7>] (cpu_startup_entry) from [<804eb933>]
	(start_kernel+0x27b/0x2e4)
[<804eb933>] (start_kernel) from [<8000808f>] (0x8000808f)
Code: 4617 469a f1a5 000c (682d) 3d0c
---[ end trace 420f2b58e4270f57 ]---
Kernel panic - not syncing: Fatal exception in interrupt
CPU1: stopping
CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D         4.1.0-rc5+ #2
Hardware name: Freescale LS1021A
[<80011937>] (unwind_backtrace) from [<8000f4e7>] (show_stack+0xb/0xc)
[<8000f4e7>] (show_stack) from [<8032ad55>] (dump_stack+0x51/0x64)
[<8032ad55>] (dump_stack) from [<80010ff9>] (handle_IPI+0x7d/0xf8)
[<80010ff9>] (handle_IPI) from [<8000925b>] (gic_handle_irq+0x37/0x40)
[<8000925b>] (gic_handle_irq) from [<8032df1b>] (__irq_svc+0x3b/0x5c)
Exception stack(0xee079f90 to 0xee079fd8)
9f80:                                     00000001 00000000 00000000
80017be1
9fa0: ee078000 00000000 00000000 ee079fe0 8051d384 8051fca0 803326d0
00000001
9fc0: 00000008 ee079fd8 8000db27 8000db28 40000133 ffffffff
[<8032df1b>] (__irq_svc) from [<8000db28>] (arch_cpu_idle+0x14/0x20)
[<8000db28>] (arch_cpu_idle) from [<80038fd7>]
	(cpu_startup_entry+0x187/0x1c4)
[<80038fd7>] (cpu_startup_entry) from [<80009311>] (__enable_mmu+0x1/0x10)
---[ end Kernel panic - not syncing: Fatal exception in interrupt

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
Changes in v3:
- Rebase

Changes in v2:
- Remove 'init_completion'

 drivers/mtd/spi-nor/fsl-quadspi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 4fe13dd..7e74567 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -637,6 +637,10 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	writel(QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,
 			base + QUADSPI_MCR);
 
+	/* clear flag register before enable the interrupt */
+	reg = qspi_readl(q, q->iobase + QUADSPI_FR);
+	qspi_writel(q, reg, q->iobase + QUADSPI_FR);
+
 	/* enable the interrupt */
 	writel(QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
 
-- 
2.1.0.27.g96db324
