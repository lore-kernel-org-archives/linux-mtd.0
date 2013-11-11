Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VfpG7-0003u2-UB
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2013 11:02:21 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2] mtd: gpmi: fix the NULL pointer
Date: Mon, 11 Nov 2013 18:40:19 +0800
Message-ID: <1384166419-23568-1-git-send-email-b32955@freescale.com>
In-Reply-To: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
References: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The imx23 board will check the fingerprint, so it will call the
mx23_check_transcription_stamp. This function will use @chip->buffers->databuf
as its buffer which is allocated in the nand_scan_tail().

Unfortunately, the mx23_check_transcription_stamp is called before the
nand_scan_tail(). So we will meet a NULL pointer bug:

--------------------------------------------------------------------
[    1.150000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd7 (Samsung NAND 4GiB 3,3V 8-bit), 4096MiB, page size: 4096, OOB size: 8
[    1.160000] Unable to handle kernel NULL pointer dereference at virtual address 000005d0
[    1.170000] pgd = c0004000
[    1.170000] [000005d0] *pgd=00000000
[    1.180000] Internal error: Oops: 5 [#1] ARM
[    1.180000] Modules linked in:
[    1.180000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.0 #89
[    1.180000] task: c7440000 ti: c743a000 task.ti: c743a000
[    1.180000] PC is at memcmp+0x10/0x54
[    1.180000] LR is at gpmi_nand_probe+0x42c/0x894
[    1.180000] pc : [<c025fcb0>]    lr : [<c02f6a68>]    psr: 20000053
[    1.180000] sp : c743be2c  ip : 600000d3  fp : ffffffff
[    1.180000] r10: 000005d0  r9 : c02f5f08  r8 : 00000000
[    1.180000] r7 : c75858a8  r6 : c75858a8  r5 : c7585b18  r4 : c7585800
[    1.180000] r3 : 000005d0  r2 : 00000004  r1 : c05c33e4  r0 : 000005d0
[    1.180000] Flags: nzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment kernel
[    1.180000] Control: 0005317f  Table: 40004000  DAC: 00000017
[    1.180000] Process swapper (pid: 1, stack limit = 0xc743a1c0)
--------------------------------------------------------------------

This patch does two things:
 1.) Allocates the @chip->buffers itself, and set the NAND_OWN_BUFFERS
     for chip->options.
 2.) Also initialize the @chip->oob_poi which is used by the
     mx23_write_transcription_stamp(). We replace the @chip->ecc.write_page_raw
     with chip->write_buf, since the the @chip->ecc.write_page_raw is
     initialize in the nand_scan_tail() too. If we not do so, we will meet
     a NULL pointer too.

Cc: stable@vger.kernel.org
Reported-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
v1 --> v2: do not use a local array any more.
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 6e74917..a2531e7 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1465,7 +1465,7 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 		/* Write the first page of the current stride. */
 		dev_dbg(dev, "Writing an NCB fingerprint in page 0x%x\n", page);
 		chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-		chip->ecc.write_page_raw(mtd, chip, buffer, 0);
+		chip->write_buf(mtd, buffer, mtd->writesize);
 		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
 
 		/* Wait for the write to finish. */
@@ -1609,6 +1609,12 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	struct bch_geometry *bch_geo = &this->bch_geometry;
 	int ret;
 
+	chip->buffers = kzalloc(sizeof(*chip->buffers), GFP_KERNEL);
+	if (!chip->buffers)
+		return -ENOMEM;
+	chip->options |= NAND_OWN_BUFFERS;
+	chip->oob_poi = chip->buffers->databuf + mtd->writesize;
+
 	/* Prepare for the BBT scan. */
 	ret = gpmi_pre_bbt_scan(this);
 	if (ret)
-- 
1.7.2.rc3
