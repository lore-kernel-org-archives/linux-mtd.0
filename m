Received: from pony1.arc.nasa.gov ([128.102.31.31] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1944q3-0004jm-T5
	for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2003 21:09:32 +0100
Message-Id: <5.1.1.5.2.20030411130135.018a6698@mail.arc.nasa.gov>
Date: Fri, 11 Apr 2003 13:10:54 -0700
To: Ilguiz Latypov <ilatypov@infradead.org>
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <Pine.LNX.4.44.0304110336470.3790-100000@CPE00e0292061fa-CM
 014370001917.cpe.net.cable.roger>
References: <3E9312BF.50009@mail.arc.nasa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
Subject: Re: DoC + GRUB booting problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ilguiz,
         The bootloader is definitely the M-Sys BIOS extension.  My 
impression is that for DoC 2000s, the BIOS extension is in a ROM that can't 
be changed.  I am still trying to verify that, but if its true, I have to 
deal with it.  If it can be changed, like in a DoC Millenium, I could be in 
business.

So far, I have only used DFORMAT as described in the GRUB/MTD Readme_doc 
file.  I haven't tried using doc_loadbios yet, but if the BIOS extension 
code is in ROM, I will still have to change its checksums to get it to 
load.  Since M-Sys hasn't told me (yet) what format DFORMAT expects from 
binary files, doc_loadbios may indeed be the best way to proceed.

Thanks,
Ted Hildum

At 03:50 AM 4/11/2003 -0400, you wrote:

>On Tue, 8 Apr 2003, Edward A. Hildum wrote:
>
> > I have disassembled the BIOS boot code (included below) and found some
> > conflicts with the README_DiskOnChip info:
>
>Ted,
>
>May I suggest that the DoC bootloader you've disassembled was the one
>supplied by M-Sys?  I myself didn't use the DFORMAT utility to load the
>GRUB firmware, but that shouldn't mean it isn't possible.
>
>Is it possible to DFORMAT the DoC's NFTL layer only, starting from the
>given offset?  If yes, it would be a good choice, accompanied by the
>mtd/util/doc_loadbios utility which will store the grub_firmware file into
>the beginning of the flash memory.
>
>I heard that the mtd/util/nftl_format utility may not be compatible with
>the bad block table stored in the DoC at the factory.  I was lucky enough
>to disregard the bad block table by issuing the erase_all command against
>/dev/mtd0 and then proceeding with nftl_format.  However, this is not the
>safest approach because NAND memory is error prone.
>
>--
>Ilguiz Latypov
>Montreal, Quebec
>Canada
>
>tel. +1 (514) 526-6911
