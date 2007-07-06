Received: from nwd2mail11.analog.com ([137.71.25.57])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6eny-0005Ff-PF
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 23:48:31 -0400
Received: from nwd2exm4.ad.analog.com (nwd2exm4.ad.analog.com [10.64.53.123])
	by nwd2mhb2.analog.com (8.9.3 (PHNE_28810+JAGae91741)/8.9.3) with
	ESMTP id XAA11310 for <linux-mtd@lists.infradead.org>;
	Thu, 5 Jul 2007 23:37:27 -0400 (EDT)
Subject: [Question] How to support large page (2K size) operation with only
	256/512 page size operation Nand Flash Controller?
From: Bryan Wu <bryan.wu@analog.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jul 2007 11:40:34 +0800
Message-Id: <1183693234.22501.12.camel@roc-desktop>
Mime-Version: 1.0
Reply-To: bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Folks,

This days I am developing a NAND Flash Controller driver in latest
Blackfin BF54x processor.

The read/write buffer operation without DMA can work now. The NFC
hardware supporting 256/512 page size operation, but my target NAND chip
STMicro's NAND2G (256Mbytes) is 2048 large page size.

After digging into the code (nand_base.c), I found is very difficult to
support this in my driver:

I tried to replace read_page and write_page function with HW DMA
supporting. But the page size is 2K not 256/512, I need split the whole
large page operation to 8 or 4 steps. In every step, DMA will transfer
256 or 512 bytes. 

Before start every HW DMA operation, a NAND_CMD_READ0 command should be
sent to the chip following by a page address. But in my
read_page/write_page function I can't get the page address for
increasing 256/512 page size because of splitting DMA operation.

Any idea about this issue?

Thanks
Best Regards
- Bryan Wu
