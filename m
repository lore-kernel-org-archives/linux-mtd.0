Received: from gw3.laser5.co.jp ([211.5.140.198] helo=mail.laser5.co.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g0o7-0004x7-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 11:00:03 +0000
Message-ID: <3E3F9DA6.60607@laser5.co.jp>
Date: Tue, 04 Feb 2003 20:01:58 +0900
From: Vishal <vishal@laser5.co.jp>
MIME-Version: 1.0
To: tglx@linutronix.de
Cc: linux-mtd@lists.infradead.org
References: <3E3E517F.9010908@laser5.co.jp> <200302040835.14667.tglx@linutronix.de> <3E3F8853.708@laser5.co.jp> <200302041138.14013.tglx@linutronix.de>
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

Thomas Gleixner wrote:

>On Tuesday 04 February 2003 10:30, Vishal wrote:
>
>>>Yep. copy your compressed kernel image in chunks of blocksize to your
>>>NAND-FLASH. Reserve enough spare in the case you have bad blocks.
>>>Provide a bad block aware read function and modify the decompressor in the
>>>kernel to read the image via this function from NAND.
>>>Then you don't need JFFS2 inside the bootloader.
>>>Then your NAND-CHIP has to have min. 2 Partitions
>>>1 for the kernel Image and 1 for the root-fs. You do not mount the
>>>partition, where your kernel image is stored.
>>>
>>hmm....correct me if i am wrong but what you are saying is i have a char
>>device /dev/mtd1 (right??) on which i store the kernel image. this
>>partition will never be mounted. The kernel image is stored on this
>>device in chunks of blocksize.
>>   Now while reading from this device on bootup, i read from the char
>>device, and generate blocks of the known size in memory, carry out error
>>checking and correction on each block. and when the whole of the kernel
>>has been read, i run it...right?
>>Pardon me if i am wrong.
>>
>You don't need to implement a character device. Implement raw NAND access with 
>ECC and bad block handling (just skip a bad block, when you program your 
>image) in your bootloader. So you can program your kernel image in chunks of 
>blocksize into the NAND chip. On boot you provide a small function, which can 
>read the kernel image out of the nand-flash. You can do this by copying the 
>hole image to RAM and then start the kernel, or load just the decompressor 
>portion of the kernel image and modify the decompressor code, so it can read 
>the chunks from your NAND-chip.
>
>I'm not sure, why you want to do all this, if there is an out of the box 
>solution in YAFFS ? 
>
let me explain the problem in more detail here
the thing is that currently i have a boot loader code which reads from a 
char device /dev/mtd/ on NAND where only the kernel image is placed. Bad 
blocks on the /dev/mtd device can cause problems loading the kernel 
which is why i was asked to move the kernel to /dev/mtdblock (which is 
 runs a JFFS), and change the boot loader accordingly.
     Thats the reson why i was thinking in terms of using a  char driver.
  As per your suggestion of using YAFFS, what kind of effort would it 
require to get going on this system where JFFS had been completely 
cutomised? will it require any changes for the kind of flash(samsung 
K9F2808U0B) we are using?
