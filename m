Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRM4Y-0003c1-4V
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 06:35:22 +0000
Received: by wa-out-1112.google.com with SMTP id v33so3020530wah.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Feb 2008 22:35:20 -0800 (PST)
Message-ID: <f17812d70802182235l56914c2ai4f87d8c41f1aa4d7@mail.gmail.com>
Date: Tue, 19 Feb 2008 14:35:20 +0800
From: "eric miao" <eric.y.miao@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/4] pxa: cleaned up patch set for pxa3xx NAND controller
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, spodstavin@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I cleaned up the previous patch a bit, and added support for zylonite
and littleton. And this version is intended for merging upstream.

The minor changes from the previous submitted version are:

1. removed un-used ERR_BUSY

2. sanitized states, and use different states for reading/writing, thus
eliminate the unnecessary "info->cur_cmd" field, another consequence
of this DMA setup is now performed in interrupt handler, and this
change should be quite safe.

3. use IORESOURCE_DMA defined in the device for DRCMR(x)
register indexing

4. use IORESOURCE_IRQ defined in the device for IRQ number

5. use __raw_{read, write}sl() instead of {read, write}_fifo_pio()

6. filling un-used info->ndcbx with 0 so it doesn't bother to initialize
them to zeros every time in the beginning of _cmdfunc()

7. combine CMD_READID and CMD_STATUS, they share almost
same code

8. corrected some mistakes in the exiting path of pxa3xx_nand_probe()

Thanks Sergey Podstavin, for your effort on testing out the previous
version, yet I'm quite satisifed with your version due to the following
reasons:

1. the badblock management code in the Marvell released NAND driver is
   actually not clean enough, so the that part of the code was removed
   on purpose, hopefully someone later can come up with a clean enough
   version

2. The OBM version code is way too ugly to be embedded into a generic
   NAND controller driver, so that part of the code was also removed
   on purpose. Besides, along with the development of OBM, the legacy
   versions will be slowly obsoleted, so it's really un-necessary to
   calculate the OBM version within new code.

3. [include/asm-arch/arm-pxa/pxa3xx_nand.h] should really include
   platform _only_ code, the NAND controller registers are better
   to be defined within pxa3xx_nand.c itself.

4. the above statement is also true for driver specific structures and
   constants

5. We should really make individual patches for the support of various
   platforms, instead of making this a big patch

-- 
Cheers
- eric
