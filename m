Received: from ns2.happymany.net ([217.148.255.244] helo=minnie.happymany.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2QjH-0001GW-0S
	for linux-mtd@lists.infradead.org; Thu, 04 Jan 2007 06:25:54 -0500
Received: from mail.wowcompany.com (217-148-242-202.happymany.net
	[217.148.242.202])
	by minnie.happymany.net (8.13.7/8.13.7) with ESMTP id l04BPeh5007207
	for <linux-mtd@lists.infradead.org>; Thu, 4 Jan 2007 12:25:44 +0100
Received: from [192.168.100.73] (mail.wowcompany.com [127.0.0.1])
	by mail.wowcompany.com (Postfix) with ESMTP id DB436D2787
	for <linux-mtd@lists.infradead.org>;
	Thu,  4 Jan 2007 12:25:37 +0100 (CET)
Message-ID: <459CE45D.8060307@wowcompany.com>
Date: Thu, 04 Jan 2007 12:26:21 +0100
From: Fabian Rami <fabian.rami@wowcompany.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [NAND-JFFS2] Writting file error no space left (35% used)
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all ,

I try to make JFFS2 File system working on a embedded device.
This device had 2M0 of Ram and 16 Mo of NAND flash.
Here you have the boot sequence information:

    [21474538.190000] S3C24XX NAND Driver, (c) 2004 Simtec Electronics
    [21474538.200000] s3c2410-nand: mapped registers at c1200000
    [21474538.205000] 80 ns is too big for current clock rate 100000000
    [21474538.210000] 80 ns is too big for current clock rate 100000000
    [21474538.215000] 80 ns is too big for current clock rate 100000000
    [21474538.220000] s3c2410-nand: timing: Tacls 419ns, Twrph0 419ns,
    Twrph1 419ns
    [21474538.225000] NAND device: Manufacturer ID: 0xec, Chip ID: 0x73
    (Samsung NAND 16MiB 3,3V 8-bit)
    [21474538.230000] Scanning device for bad blocks
    [21474538.275000] Creating 3 MTD partitions on "NAND 16MiB 3,3V 8-bit":
    [21474538.280000] 0x00000000-0x00040000 : "UBoot"
    [21474538.285000] mtd: Giving out device 0 to UBoot
    [21474538.295000] 0x00040000-0x00160000 : "Kernel"
    [21474538.300000] mtd: Giving out device 1 to Kernel
    [21474538.315000] 0x00160000-0x01000000 : "FileSystem"
    [21474538.320000] mtd: Giving out device 2 to FileSystem


When i use a little soft who made 1000 file of  size 1024 i get a 
OOMKiller.

when i made a df after the oomkiller i see the following :

    root@akt:~# df
    Filesystem           1k-blocks      Used Available Use% Mounted on
    /dev/mtdblock2           14976      5228      9748  35% /
    /dev/ram1                  115        15       100  13% /var

As we can see , we are not going out of space on the flash device.

Is there a problem with the way i make the jffs2 Image ?
Here is the way i do it :

       ./mkfs.jffs2 --root=/AktImageDirectory --output=Akt.jffs2 -e 
0x4000 --pad=0x00EA0000 -n

Is there something else to do ?
Have i something to care of the flash_erase if i use dd for install the 
image ?
The install command is :
      
       dd if=/Akt.jffs2 of=/dev/mtdblock2

I am lost!!!

Greetings,

Fabian Rami

 
