Received: from [207.209.118.131] (helo=msi-ex6.ccm.msyscal.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ePo3-0006jX-00
	for <linux-mtd@lists.infradead.org>; Sat, 23 Feb 2002 00:12:52 +0000
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BF9D7@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: 'Ilguiz Latypov' <ilatypov@superbt.com>, Mark Meade
	 <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Fri, 22 Feb 2002 16:23:53 -0800
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

[Ilguiz]
Vadim, should the Millennium SPL check sum include IPL?

[Vadim]
I will verify it with IPL developer , but as far as i know there is no
difference in behavior between IPL of DOC2000 and Millennium .

IPL that you use should load SPL ( secondary program loader ) . In case
of Millennium chip SPL should be placed right after IPL ( offset 0x400 ) and
i think that size of SPL should be no longer than 7K . 1KB of IPL + 7KB of
SPL = 8KB , which is the size of the Millennium chip erasable unit .


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
