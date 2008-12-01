Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7A8b-000369-9M
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 14:52:37 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L7A8T-0000Fz-UJ
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 14:52:29 +0000
Received: from 194.56.133.3 ([194.56.133.3])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2008 14:52:29 +0000
Received: from marcel by 194.56.133.3 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2008 14:52:29 +0000
To: linux-mtd@lists.infradead.org
From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: PXA3xx NAND Driver Questions
Date: Mon, 1 Dec 2008 14:52:19 +0000 (UTC)
Message-ID: <loom.20081201T144959-313@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there

Looking at drivers/mtd/nand/pxa3xx_nand.c lines 470 and 482 (see below) I
noticed that the sizes in the __raw_{read|write}sl() calls are left shifted by
two meaning multiplied by 4. Unfortunately I could not find an accurate
description of those __raw_{read|write}sl() calls, them being in ARM assembly I
assume they just read and write a block of IO memory. Now my first question:
Does this multiply by 4 really make sense? Aren't sizes usually specified in
bytes everywhere?

463 static int handle_data_pio(struct pxa3xx_nand_info *info)
464 {
465         int ret, timeout = CHIP_DELAY_TIMEOUT;
466
467         switch (info->state) {
468         case STATE_PIO_WRITING:
469                 __raw_writesl(info->mmio_base + NDDB, info->data_buff,
470                                 info->data_size << 2);
471
472                 enable_int(info, NDSR_CS0_BBD | NDSR_CS0_CMDD);
473
474                 ret = wait_for_completion_timeout(&info->cmd_complete,
 timeout);
475                 if (!ret) {
476                         printk(KERN_ERR "program command time out\n");
477                         return -1;
478                 }
479                 break;
480         case STATE_PIO_READING:
481                 __raw_readsl(info->mmio_base + NDDB, info->data_buff,
482                                 info->data_size << 2);
483                 break;
484         default:
485                 printk(KERN_ERR "%s: invalid state %d\n", __func__,
486                                 info->state);
487                 return -EINVAL;
488         }
489
490         info->state = STATE_READY;
491         return 0;
492 }

My second question is concerning operation without DMA. This currently seems to
be broken (e.g. if I load the module with use_dma set to 0, see below line 170)
it does not even recognize the NAND chip. Has anybody else tried this lately? It
worked just fine with the pre-mainline version using the manual {read,
write}_fifo_pio() calls.

170 static int use_dma = 1;
171 module_param(use_dma, bool, 0444);
172 MODULE_PARM_DESC(use_dma, "enable DMA for data transfering to/from NAND
 HW");

Cheers

Marcel
