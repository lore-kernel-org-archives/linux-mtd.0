Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194K9Z-0006XA-Ri
	for <linux-mtd@lists.infradead.org>; Sat, 12 Apr 2003 13:30:42 +0100
Date: Sat, 12 Apr 2003 14:30:27 +0200 (CEST)
From: Henrik Nordstrom <hno@marasystems.com>
To: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <5.1.1.5.2.20030411130135.018a6698@mail.arc.nasa.gov>
Message-ID: <Pine.LNX.4.44.0304121420080.9036-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
cc: Ilguiz Latypov <ilatypov@infradead.org>
Subject: Re: DoC + GRUB booting problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have had no problem to load the Doc GRUB as a binary partition with 
DFORMAT 5.x on DoC 2000 32MB. Unfortunately when I tried there was 
problems with unit_size == -1 when using DFORMAT 5.x (applied both to 
GRUB and the Linux kernel), but at least the GRUB image loaded OK, and was 
using the boot block from the GRUB image as the GRUB bypass keys and 
everything worked like expected.

I think the unit_size == -1 problem have been addressed both in the
current GRUB and in the MTD code, but I have not had the possibility to
verify this (every time we have a DoC based system in stock there has beed
too much other things to do, not leaving room for new tests).

I do not think the DoC initial boot block is in room. The hardware is
supposed to work with correct programming even on non-X86 platforms.

Personally I have much higher trust in DFORMAT installing the firmware 
than using doc_loadbios and ntfl_format. It seem to easy to loose the bad 
block list when using doc_loadbios and ntfl_format.

Regards
Henrik


On Fri, 11 Apr 2003, Edward A. Hildum wrote:

> Ilguiz,
>          The bootloader is definitely the M-Sys BIOS extension.  My 
> impression is that for DoC 2000s, the BIOS extension is in a ROM that can't 
> be changed.  I am still trying to verify that, but if its true, I have to 
> deal with it.  If it can be changed, like in a DoC Millenium, I could be in 
> business.
> 
> So far, I have only used DFORMAT as described in the GRUB/MTD Readme_doc 
> file.  I haven't tried using doc_loadbios yet, but if the BIOS extension 
> code is in ROM, I will still have to change its checksums to get it to 
> load.  Since M-Sys hasn't told me (yet) what format DFORMAT expects from 
> binary files, doc_loadbios may indeed be the best way to proceed.
> 
> Thanks,
> Ted Hildum
