Received: from fep01-mail.bloor.is.net.cable.rogers.com ([66.185.86.71])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193tJ6-0003DS-Sw
	for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2003 08:50:45 +0100
Date: Fri, 11 Apr 2003 03:50:16 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@infradead.org>
To: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <3E9312BF.50009@mail.arc.nasa.gov>
Message-ID: <Pine.LNX.4.44.0304110336470.3790-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Tue, 8 Apr 2003, Edward A. Hildum wrote:

> I have disassembled the BIOS boot code (included below) and found some
> conflicts with the README_DiskOnChip info:

Ted,

May I suggest that the DoC bootloader you've disassembled was the one 
supplied by M-Sys?  I myself didn't use the DFORMAT utility to load the 
GRUB firmware, but that shouldn't mean it isn't possible.  

Is it possible to DFORMAT the DoC's NFTL layer only, starting from the
given offset?  If yes, it would be a good choice, accompanied by the 
mtd/util/doc_loadbios utility which will store the grub_firmware file into 
the beginning of the flash memory.

I heard that the mtd/util/nftl_format utility may not be compatible with 
the bad block table stored in the DoC at the factory.  I was lucky enough 
to disregard the bad block table by issuing the erase_all command against 
/dev/mtd0 and then proceeding with nftl_format.  However, this is not the 
safest approach because NAND memory is error prone.

-- 
Ilguiz Latypov
Montreal, Quebec
Canada

tel. +1 (514) 526-6911
