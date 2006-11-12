Received: from bay0-omc1-s16.bay0.hotmail.com ([65.54.246.88])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GjEvQ-0006bD-7T
	for linux-mtd@lists.infradead.org; Sun, 12 Nov 2006 12:59:08 +0000
Message-ID: <BAY110-F54DAAE24A2200CA5883ADB2F50@phx.gbl>
From: "Ming Liu" <eemingliu@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: how to adress flash memory in Linux
Date: Sun, 12 Nov 2006 12:56:50 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,
My problem is very basic probably. But I really have no clue to achieve 
this. So I have to ask for help.

My thinking is to update the content in flash memory in Linux. My platform 
is Xilinx ML403. So the FGPA Hardware bitstream and Linux kernel image are 
both stored in flash memory. In linux, if I can address the flash memory, 
then I can update the bitstream file and kernel image using some basic 
commands, such as "dd if=bitstreamfile.bit of=[a flash partition area]". 

I know the mtd driver is the proper one to provide functions for accessing 
flash memory in Linux. So I have included the mtd driver from the kernel 
configuration. But I don't know how to clearly partition my flash memory. 
That is, reserve a part for bitstream file and make it as maybe /dev/mtd0. 
And reserve another part for kernel image and make it as /dev/mtd1...So how 
to partition the flash and make it accessible from Linux? I am a little 
messy with this. If anyone can give me a clear process to achieve that, I 
will really appreciate a lot.

Thanks a lot in advance.

Regards
Ming

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn/  
