Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fVTj-00046p-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 00:28:23 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BF9E4@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'Ilguiz Latypov' <ilatypov@superbt.com>, Mark Meade
	 <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Mon, 25 Feb 2002 16:39:35 -0800
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

Another thing that i forgot to mention earlier . When you guys write SPL to
flash i assume you read the content of the first 1Kb ( 2 copies of IPL ) of
flash and attach it to your SPL . The important thing here is to write IPL
part with ECC/EDC syndrom . Otherwise, IPL will not be able to read SPL out
of flash .

Vadim

-----Original Message-----
From: Vadim Khmelnitsky [mailto:VadimK@m-sys.com]
Sent: Mon, February 25, 2002 4:26 PM
To: 'Ilguiz Latypov'; Mark Meade
Cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 and Millenium support in GRUB bootloader 


[Ilguiz]
Vadim, should the Millennium SPL check sum include IPL?

[Vadim]
No . IPL of Millennium chip copies 7K of data out of offset 0x400 and
calculates the checksum  , which should be 0x55 . If it's not 0x55 IPL
returns to BIOS without executing SPL .

Vadim
-----Original Message-----
From: Ilguiz Latypov [mailto:ilatypov@superbt.com]
Sent: Fri, February 22, 2002 2:39 PM
To: Mark Meade
Cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 



Mark,

On Fri, 22 Feb 2002, Mark Meade wrote:

> The doc_loadbios output to /dev/mtd0 is off by 512 bytes (when I use an
> offset of 1024):

Thanks for the correction.   I adjusted your patch to take into account 
the almost impossible case when IPL is bigger than erase sector.

> My system now recognizes that something is there, but refuses to boot:
>     Searching for boot record from SCSI: Not Found.

Perhaps, IPL refuses to execute SPL (GRUB's doc_stage1) because the
doc_stage1's check sum didn't include IPL itself.  

Vadim, should the Millennium SPL check sum include IPL?

The other thought is if the stage1 code can be placed instead of IPL.

Ilguiz



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
