Received: from [207.215.131.7] (helo=mail.pioneer-pdt.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AYX1X-00021f-Gv
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2003 20:51:31 +0000
Received: from 127.0.0.1 (localhost.pioneer-pdt.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 4B2A29D835
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Dec 2003 12:49:18 -0800 (PST)
Received: from philt.pioneer-pdt.com (unknown [172.30.2.110])
	by mail.pioneer-pdt.com (Postfix) with ESMTP id 037DE9D834
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Dec 2003 12:49:16 -0800 (PST)
From: Patrick Hilt <philt@pioneer-pdt.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 22 Dec 2003 12:45:11 -0800
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200312221245.11108.philt@pioneer-pdt.com>
Subject: Weird chip/mtd behavior???
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody!
I'm seeing some weird mtd/flash behavior... I guess I should be a little more 
specific ;-)...

I'm working on Broadcom MIPS CPU based board with a 16 MB Micron flash CFI 
flash chip (MT28F640J3... seems it's pretty new on the market). Linux-wise 
I'm using a 2.4.18 Linux-mips kernel with a backported mtd subsystem (CVS 
snapshot from 12/17/03). After some smaller modifications, the kernel incl. 
the new mtd subsys compiled just fine. I configured mtd to access my chip and 
to create the partitions I need, which I think succeeded based on the boot 
output quoted below:

>physmap flash device: 1000000 at 1a000000
>phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit mode
> Intel/Sharp Extended Query Table at 0x0031
>cfi_cmdset_0001: Erase suspend on write enabled
>Using buffer write method
>request_module[cmdlinepart]: Root fs not mounted
>cmdlinepart partition parsing not available
>request_module[RedBoot]: Root fs not mounted
>RedBoot partition parsing not available
>Using physmap partition definition
>Creating 4 MTD partitions on "phys_mapped_flash":
>0x00000000-0x00500000 : "boot"
>mtd: Giving out device 0 to boot
>0x00500000-0x00800000 : "root"
>mtd: Giving out device 1 to root
>0x00800000-0x00f00000 : "pioneer"
>mtd: Giving out device 2 to pioneer
>0x00f00000-0x01000000 : "fonts"
>mtd: Giving out device 3 to fonts

So far, so good. But now the weird stuff: when I erase or write the lower 2 
partitions (lower 8 MEGS) everything works just fine. Erase on the upper two 
partitions seems to be OK but as soon as I try to write to one of the upper 
two partitions (upper 8 MEGS), I get input/output errors and the following 
messages on the console.

Sometimes, I get
>MTD_open
>MTD_ioctl
>Invalid ioctl 540d (MEMGETINFO = 40204d01)
>MTD_write
>Waiting for chip to be ready timed out. Status 3d45
>MTD_close

Other times I get
>MTD_open
>MTD_ioctl
>Invalid ioctl 540d (MEMGETINFO = 40204d01)
>MTD_write
>SR.4 or SR.5 bits set in buffer write (status ffff). Clearing.
>Waiting for chip to be ready timed out in bufwrite.
>MTD_close

Even weirder is that, when I had not partitioned the chip, and I erased the 
whole thing, it seemed that the speed of erase clearly slowed (by a factor of 
two or so) when the erase hit 50%/the 8MB boundary.

Has anybody in this list ever seen anything like this? (I haven't... searched 
the web and mailing list archives but did not find anything that would help.)
Any suggestions / comments??

Thanks a lot for any help in advance and sorry for the lengthy email ;-)

Patrick
