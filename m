Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1rk-0004Yk-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 22:39:04 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BF9C8@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'Mark Meade' <mark@lakeshoremicro.com>, Ilguiz Latypov
	 <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Thu, 21 Feb 2002 14:50:22 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Guys,
I'm not sure what doc-loadbios is doing, but i assume that it writes some
stuff to the physical offset 0 of the diskonchip
in order to replace diskonchip BIOS driver with grub loader .
It should work fine with DOC2000 series , since the IPL code ( the one that
starts with 55AA signature ) is placed in ROM .
It will not work for the Millennium chip because IPL code is placed in flash
( offset 0 ) and downloaded to SRAM upon reset.
Millennium chip has small piece of SRAM instead of ROM . So, like i said
upon reset first 512 bytes of data are downloaded from flash to SRAM . Then
BIOS can access it read 55AA signature and hand control over to this piece
of code .
If you want to make doc-loadbios to work with Millennium chip you should put
it behind IPL code . IPL is 512 bites long . We have two copies of it . So,
you can put your code at offset 1KB .

Vadim


-----Original Message-----
From: Mark Meade [mailto:mark@lakeshoremicro.com]
Sent: Thu, February 21, 2002 2:32 PM
To: Ilguiz Latypov
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 


Ilguiz,

It appears that the 2-byte signature (55 AA) is not there after I run the
"doc_loadbios"
program.  The entire IPL that was there (after the M-Sys DFORMAT) is
modified by
doc_loadbios.  The motherboard BIOS is no longer seeing that 2-byte
signature, so none of
the other steps are even attempted.

I did apply the grub-2002-02-19-doc.patch prior to trying all of this; I
used the
2002-02-19 version of GRUB as detailed in your initial post, using the
configure options
specified.

Regards,

Mark

On Thur, 21 Feb 2002,  Ilguiz Latypov wrote:

> Can you please try the updated DoC GRUB patch?  This shouldn't fix the INT
> 19h problem though.





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
