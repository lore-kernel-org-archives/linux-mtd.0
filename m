Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Msof-0004ZX-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 16:37:33 +0000
Date: Fri, 13 Dec 2002 18:08:03 +0100 (CET)
From: Henrik Nordstrom <hno@marasystems.com>
To: "Alejandro O. Gonzalez" <aogonzalez@uolsinectis.com.ar>
cc: linux-mtd@lists.infradead.org
Subject: Re: Linux installation on DOC / problems / I need your help
In-Reply-To: <002c01c2a2a9$54ea2900$a2e4f4d8@nnn123>
Message-ID: <Pine.LNX.4.44.0212131805070.17198-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
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

This will as you assume erase the BIOS from the DOC.

If you want to be able to access the DOC from DOS without first booting 
from another media and loading a separate DOS DOC driver you need to use 
the mSYS DOC BIOS, installed by running DFORMAT from DOS.

However, using the mSYS 5.1.5 DOS driver (I think, not entirely sure about 
version but a 5 something) I could not make it function reliably if the 
DOC had been partitioned with more than one partition.. No such problems 
with the Linux driver.

Regards
Henrik


On Fri, 13 Dec 2002, Alejandro O. Gonzalez wrote:

> I rebuild the kernel. Then I made this
> 
> 1- run the driver
> #modprobe doc2000
> #modprobe docprobe
> 
> 2- format the memory
> #nftl_format /dev/mtd0 0 16777216
> 
> 3- run nftl
> #modprobe nftl
> 
> 4- make a partition
> #fdisk /dev/nftla
> I make two partition first DOS, and second Linux.
> 
> 5- make filesystem
> #mkfs.msdos /dev/nftla1
> #mke2fs /dev/nftla2
> 
> 6-Install syslinux
> #syslinux /dev/nftla1
> 
> 7-configure boot and reboot
> 
> I don´t know if this procedure is correct, but when reboot the bios not
> found a valid boot device.
> When I format all memory with nftl_format command I delete the TrueFFS bios
> of MSYS. This is Ok ?
> 
> I try then to overwrite the TrueFFS bios driver
> 
> DFORMAT /WIN:E000 /S:DOC512.EXB /NOFORMAT /FIRST
> 
> but display an error, can´t write the bios.
> 
> I do so that the bios recognize the DOC like a valid device of boot.
> 
> I try also to format with MSYS utility, then create a 2MB of DOS partition.
> Boot with linux and format the last 14 MB of memory with
> nftl_format. But when startup nftl driver says "we don´t support
> UnitSizeFactor!=1" and it is not possible to work with a nftl partition.
> I will appreciate any commentary, thank you for your time.
> Regards,
> Alejandro Gonzalez
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
