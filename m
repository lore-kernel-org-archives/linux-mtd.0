Received: from eitan.rosario.sinectis.com.ar ([216.244.217.3] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Mp6U-00049W-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 12:39:42 +0000
Received: from nnn123 (modem162-as4.rosario.sinectis.com.ar [216.244.228.162])
	by eitan.rosario.sinectis.com.ar (8.9.3/8.9.3) with SMTP id KAA05777
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 10:10:16 -0300
Message-ID: <002c01c2a2a9$54ea2900$a2e4f4d8@nnn123>
Reply-To: "Alejandro O. Gonzalez" <aogonzalez@uolsinectis.com.ar>
From: "Alejandro O. Gonzalez" <aogonzalez@uolsinectis.com.ar>
To: <linux-mtd@lists.infradead.org>
Subject: Linux installation on DOC / problems / I need your help
Date: Fri, 13 Dec 2002 10:12:46 -0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
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

I rebuild the kernel. Then I made this

1- run the driver
#modprobe doc2000
#modprobe docprobe

2- format the memory
#nftl_format /dev/mtd0 0 16777216

3- run nftl
#modprobe nftl

4- make a partition
#fdisk /dev/nftla
I make two partition first DOS, and second Linux.

5- make filesystem
#mkfs.msdos /dev/nftla1
#mke2fs /dev/nftla2

6-Install syslinux
#syslinux /dev/nftla1

7-configure boot and reboot

I don´t know if this procedure is correct, but when reboot the bios not
found a valid boot device.
When I format all memory with nftl_format command I delete the TrueFFS bios
of MSYS. This is Ok ?

I try then to overwrite the TrueFFS bios driver

DFORMAT /WIN:E000 /S:DOC512.EXB /NOFORMAT /FIRST

but display an error, can´t write the bios.

I do so that the bios recognize the DOC like a valid device of boot.

I try also to format with MSYS utility, then create a 2MB of DOS partition.
Boot with linux and format the last 14 MB of memory with
nftl_format. But when startup nftl driver says "we don´t support
UnitSizeFactor!=1" and it is not possible to work with a nftl partition.
I will appreciate any commentary, thank you for your time.
Regards,
Alejandro Gonzalez
