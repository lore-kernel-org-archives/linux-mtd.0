Received: from gw3.laser5.co.jp ([211.5.140.198] helo=mail.laser5.co.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18ftcm-0003Hf-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 03:19:53 +0000
Message-ID: <3E3F31CC.7070701@laser5.co.jp>
Date: Tue, 04 Feb 2003 12:21:48 +0900
From: Vishal <vishal@laser5.co.jp>
MIME-Version: 1.0
To: tglx@linutronix.de
Cc: linux-mtd@lists.infradead.org
References: <3E3E517F.9010908@laser5.co.jp> <200302032004.17611.tglx@linutronix.de>
Subject: Re: help: bootloader for loading kernel from mtdblock device on flash........
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Its for an ARM7 core.
I have the block driver for the JFFS on NAND Flash ready. I have the 
basic bootloader code. I was wondering whether i can do the proceed in 
the following way :
1. take the read/verify  code from the JFFS block driver for NAND flash, 
and put it in my bootloader code
2. The driver code that i copy will have a lot of kernel API calls...so 
i need to incorporate those also into my driver.
3. finally use this functionality achieved to read a kernel.bin file 
from the /dev/mtdblock device and load it.
 or is there  any other workaroud?

Thomas Gleixner wrote:

>On Monday 03 February 2003 12:24, Vishal wrote:
>
>>Hi all,
>>  I am a mtd newbie, and have been assigned the task of writting a boot
>>loader that can boot a kernel file placed in a mtdblock device, on NAND
>>flash( Samsung K9F2808U08). I would like suggestions on going about with
>>this process. If some one could take some time to at least list down the
>>steps involved in the same, it would be of immense help me.
>>
>What CPU architecture ?
>
