Received: from tmailt1.svr.pol.co.uk ([195.92.137.107])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19qNoT-0005sd-HA
	for <linux-mtd@lists.infradead.org>; Sat, 23 Aug 2003 03:07:33 +0100
Received: from user-1321.bbd16tcl.dsl.pol.co.uk ([81.77.189.41]
	helo=dubmail.net)	by tmailt1.svr.pol.co.uk with esmtp (Exim 4.14)
	id 19qNo8-0002b6-5z
	for linux-mtd@lists.infradead.org; Sat, 23 Aug 2003 03:07:12 +0100
Message-ID: <001d01c3691b$3ec5f4e0$a500a8c0@kienpc>
From: "Phung Chi Kien" <kienpc@dubmail.net>
To: <linux-mtd@lists.infradead.org>
References: <E19q9eF-0004P5-7H@pentafluge.infradead.org>
Date: Sat, 23 Aug 2003 09:07:01 +0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: tdrury@siliconmotorsports.com
Subject: Re: NFTL device not found (boot floppies) (Tim Drury)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You should use DOS utilities (dformat) from M-sys to format the DOC with
driver version 5.1.4. After that reboot the PC and I think NFTL driver can
mount your DOC.

> Date: Thu, 21 Aug 2003 20:06:56 -0400
> From: "Tim Drury" <tdrury@siliconmotorsports.com>
> To: <linux-mtd@lists.infradead.org>
> Subject: NFTL device not found (boot floppies)
> Message-ID: <000601c36841$4d06a570$3301a8c0@SIMOTORSPORTS>
> Content-Type: text/plain;
> charset="us-ascii"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Precedence: list
> Message: 1
>
>
> I'm building a couple boot floppies for my target system - an Elan/586
> based system with a 32MB DOC 2000.  I built the kernel with MTD built in
> (not modules) according to the faq.  On bootup I get the following:
>
> ----
> NFTL driver: nftlcore.c $Revision: 1.94 $, nftlmount.c $Revision: 1.34 $
> DiskOnChip 2000 found at address 0xE0000 Flash chip found: Manufacturer
> ID: EC, Chip ID: 75 (Samsung: NAND 32MiB 3,3V) 1 flash chips found.
> Total DiskOnChip size: 32 MiB Could not find valid boot record
> NFTL: could not mount device
> ----
>
> Could this be because I'm using 2-floppy boot system with the /dev fs on
> the second floppy (which hasn't been inserted yet)?  After I insert it
> and /dev is loaded, I try to do anything with /dev/nftla I get errors. I
> made /dev/nftla and /dev/nftla1 using 'mknod /dev/nftla b 90 0' and
> 'mknod /dev/nftla b 90 1' on the 2nd boot disk.
>
> % fdisk /dev/nftla
>
> Unable to open /dev/nftla
>
> % fdisk /dev/nftla1
>
> Unable to open /dev/nftla1
>
> I can see the MTD via /proc:
>
> % cat /proc/mtd
> dev:   size    erasesize   name
> mtd0: 02000000 00004000 "DiskOnChip 2000"
>
> Any ideas?
>
> -tim
