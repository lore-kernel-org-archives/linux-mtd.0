Received: from mail-qy0-f108.google.com ([209.85.221.108])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LxdEu-00019q-Oc
	for linux-mtd@lists.infradead.org; Sat, 25 Apr 2009 08:28:07 +0000
Received: by qyk6 with SMTP id 6so2698028qyk.28
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Apr 2009 01:27:59 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 25 Apr 2009 13:57:59 +0530
Message-ID: <3cc7a0df0904250127y3f2dbb65t50f349c3e9dfb969@mail.gmail.com>
Subject: [PATCH] Onenand Reset IOBE bit in SYS_CFG register in onenand_release
From: Gaurav Singh <gausinghnsit@gmail.com>
To: Linux mtd group <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am a Linux enthusiast and was using ONENAND device of an embedded
ARM device (Nomadik board - made and distributed by
STMicroelectronics).  The device is Muxed OneNAND 128MB 1.8V 16-bit
(0x30) OneNAND version = 0x0221 according to the probe prints. Looks
like a 1Gb Mux Onenand flash. The driver for this device is using the
interrupt mode operation.
Interestingly the GPIO interrupt pin of ONENAND is shared with a pin
of the NAND device. I was trying to use both NAND and ONENAND drivers
as modules and found that after inserting the ONENAND driver and
removing it I could not work with the NAND driver. This is inspite of
the fact all pins used by the ONENAND driver have been freed including
the interrupt pin. The NAND driver is able to acquire the common pin
but cannot write to this pin. Infact the ONENAND interrupt GPIO pin is
unusable even after the ONENAND driver is removed from the system.
I noticed that before the interrupt pin is acquired by the ONENAND
driver we are setting the IOBE bit in the SYS_CFG register as high. At
remove time this bit has not been reset. Resetting this bit and
repeating my test I found that the fix worked and the pin could now be
used by the NAND driver.

Proposed PATCH is as given below:


diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 0e168d8..9b2f9aa 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2728,6 +2728,13 @@ void onenand_release(struct mtd_info *mtd)
        /* Deregister partitions */
        del_mtd_partitions (mtd);
 #endif
+       /* Reset the IOBE bit in SYS_CFG Register */
+        if ( this->wait == onenand_interrupt_wait )
+       {
+               int syscfg = this->read_word(this->base + ONENAND_REG_SYS_CFG1);
+               syscfg &= ~ONENAND_SYS_CFG1_IOBE;
+               this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1);
+       }
        /* Deregister the device */
        del_mtd_device (mtd);

Will this proposed patch also help saving some power lost due to
output leakage current as IOBE is still enabled and the INT pin is
connected to the ONENAND instead of in High impedence state ?

Regards
Gaurav Singh
