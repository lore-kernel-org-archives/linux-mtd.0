Received: from [66.78.22.109] (helo=host3.hosting4everyone.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VAYR-0000Lm-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 12:06:32 +0000
From: "Christopher Fowler" <cfowler@outpostsentinel.com>
To: "raji lakshmi suresh" <ramyam_ck@rediffmail.com>,linux-mtd@lists.infradead.org
Reply-To: cfowler@outpostsentinel.com
Subject: Re: DOC formatting problems
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Message-Id: <E16VAj3-0007IL-00@host3.hosting4everyone.com>
Date: Mon, 28 Jan 2002 07:17:29 -0500
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

It may be a bad unit.

> 
> hi all,
>    i have a DISKONCHIP 2000 and i am unable to format it.
> my BIOS recognizes the DOC but while i try to format it using the 
firmware (doc504.exb) i get a format failure message.
> 
> i am using the DOC in an ISA board in a pentium machine.
> (address c8000)
> the actual messages i got are below.
> 
> formatting DOC with doc504.exb
> command : dformat /win:c800 /s:doc504.exb
> 
> DFORMAT Version 5.0.4.10 for DOS
> Copyright (c) M-Systems ,1982-2001
> WARNING : All data on Disk On Chip will be destroyed
> Continue ? Y/N
> 
> Formatting
> Virgin card  rebuilding unit map
> Media has been scanned
> Error formatting Disk On Chip
> 
> Status code is 64(flvolume too small) recieved from flformatphysical 
Drive
> Format failed
> 
> formatting DOC with ! (no firmware)
> command : dformat /win:c800 /s:!
> 
> DFORMAT Version 5.0.4.10 for DOS
> Copyright (c) M-Systems ,1982-2001
> WARNING : All data on Disk On Chip will be destroyed
> Continue ? Y/N
> 
> Formatting
> Virgin card  rebuilding unit map
> Media has been scanned
> 40 of 2048
> Error formatting Disk On Chip
> 
> Status code is 29(flwritefault) recieved from flformatphysical Drive
> Format failed
> 
> my DINFO command gave this :
> 
> DINFO Version 5.0.0
> Copyright (C)M-Systems 1992-2001
> 
> Flash Media statistics
> 
> Software version could not be found
> Flash Device type : DiskOnChip
> Media Type        : Samsung KM29V64000
> Unit size         : 8192 Bytes
> Media size        : 16 MBytes
> Chip size         : 8 MBytes
> No. of chips      : 2
> Unformatted media
> 
> i am new to this so any one kindly help.
> 
> 
>  
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
