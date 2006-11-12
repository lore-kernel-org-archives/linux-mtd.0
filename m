Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GjFmI-0002PD-0q
	for linux-mtd@lists.infradead.org; Sun, 12 Nov 2006 08:53:45 -0500
Date: Sun, 12 Nov 2006 14:56:37 +0100 (CET)
From: Peter Wippich <pewi@gw-instruments.de>
To: Ming Liu <eemingliu@hotmail.com>
Subject: Re: how to adress flash memory in Linux
In-Reply-To: <BAY110-F54DAAE24A2200CA5883ADB2F50@phx.gbl>
Message-ID: <Pine.LNX.4.63.0611121438500.21876@redbean.intranet.gw-instruments.de>
References: <BAY110-F54DAAE24A2200CA5883ADB2F50@phx.gbl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Ming, 

On Sun, 12 Nov 2006, Ming Liu wrote:

> Dear all,
> My problem is very basic probably. But I really have no clue to achieve 
> this. So I have to ask for help.
> 
> My thinking is to update the content in flash memory in Linux. My platform 
> is Xilinx ML403. So the FGPA Hardware bitstream and Linux kernel image are 
> both stored in flash memory. In linux, if I can address the flash memory, 
> then I can update the bitstream file and kernel image using some basic 
> commands, such as "dd if=bitstreamfile.bit of=[a flash partition area]". 
> 
> I know the mtd driver is the proper one to provide functions for accessing 
> flash memory in Linux. So I have included the mtd driver from the kernel 
> configuration. But I don't know how to clearly partition my flash memory. 
> That is, reserve a part for bitstream file and make it as maybe /dev/mtd0. 
> And reserve another part for kernel image and make it as /dev/mtd1...So how 
> to partition the flash and make it accessible from Linux? I am a little 
> messy with this. If anyone can give me a clear process to achieve that, I 
> will really appreciate a lot.
> 
First of all, check the type of flash you have. You need a flash chip 
driver. Most likely you can use one of the CFI (Common Flash Interface) 
drivers either for Intel or AMD like chips. Select the appropriate driver 
when building your kernel. If you got some flash chip which (very 
unlikely) does not support CFI you need your own chip driver (or maybe 
there is already one, check the sources under drivers/mtd/chips) 

Also select MTD partition support. 

Next you need a mapping driver. You may either use the generic physmap 
driver and supply your partitions too it or write your own mapping driver. 
This is not very complicated. For examples look under drivers/mtd/maps. 

Once you got a chip driver and a mapping driver you need to create the 
appropriate device nodes. E.g.: 

mknod -m 644 $XROOT/dev/mtd0    c 90 0
mknod -m 644 $XROOT/dev/mtdr0   c 90 1
mknod -m 644 $XROOT/dev/mtd1    c 90 2
mknod -m 644 $XROOT/dev/mtdr1   c 90 3
mknod -m 644 $XROOT/dev/mtd2    c 90 4
mknod -m 644 $XROOT/dev/mtdr2   c 90 5

mkdir -p $XROOT/dev/mtdblock
mknod -m 644 $XROOT/dev/mtdblock/0 b 31 0
mknod -m 644 $XROOT/dev/mtdblock/1 b 31 1
mknod -m 644 $XROOT/dev/mtdblock/2 b 31 2

if you have three flash partitions. $XROOT is the path to your target 
file system. 

To access the raw partitions just use soemthing like 

dd if=MyImage of=/dev/mtdblock/1 

to write the file MyImage to your flash partition number 1.

Hope this helps, 

Peter  

|       Peter Wippich                   Voice: +49 30 46776411          |
|       G&W Instruments GmbH            fax:   +49 30 46776419          |
|       Gustav-Meyer-Allee 25, Geb. 12  Email: pewi@gw-instruments.de   |
|       D-13355 Berlin  / Germany                                       |
