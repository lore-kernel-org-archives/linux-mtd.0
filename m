Received: from gw3.laser5.co.jp ([211.5.140.198] helo=mail.laser5.co.jp)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fzNz-0004TB-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 09:28:59 +0000
Message-ID: <3E3F8853.708@laser5.co.jp>
Date: Tue, 04 Feb 2003 18:30:59 +0900
From: Vishal <vishal@laser5.co.jp>
MIME-Version: 1.0
To: tglx@linutronix.de
Cc: linux-mtd@lists.infradead.org
References: <3E3E517F.9010908@laser5.co.jp> <200302032004.17611.tglx@linutronix.de> <3E3F31CC.7070701@laser5.co.jp> <200302040835.14667.tglx@linutronix.de>
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

>On Tuesday 04 February 2003 04:21, Vishal wrote:
>
>>Its for an ARM7 core.
>>I have the block driver for the JFFS on NAND Flash ready. I have the
>>basic bootloader code. I was wondering whether i can do the proceed in
>>the following way :
>>1. take the read/verify  code from the JFFS block driver for NAND flash,
>>and put it in my bootloader code
>>2. The driver code that i copy will have a lot of kernel API calls...so
>>i need to incorporate those also into my driver.
>>3. finally use this functionality achieved to read a kernel.bin file
>>from the /dev/mtdblock device and load it.
>> or is there  any other workaroud?
>>
>Yep. copy your compressed kernel image in chunks of blocksize to your 
>NAND-FLASH. Reserve enough spare in the case you have bad blocks. 
>Provide a bad block aware read function and modify the decompressor in the 
>kernel to read the image via this function from NAND. 
>Then you don't need JFFS2 inside the bootloader. 
>Then your NAND-CHIP has to have min. 2 Partitions 
>1 for the kernel Image and 1 for the root-fs. You do not mount the partition, 
>where your kernel image is stored.
>
>

hmm....correct me if i am wrong but what you are saying is i have a char 
device /dev/mtd1 (right??) on which i store the kernel image. this 
partition will never be mounted. The kernel image is stored on this 
device in chunks of blocksize.
   Now while reading from this device on bootup, i read from the char 
device, and generate blocks of the known size in memory, carry out error 
checking and correction on each block. and when the whole of the kernel 
has been read, i run it...right?
Pardon me if i am wrong.

regards,
Vishal
