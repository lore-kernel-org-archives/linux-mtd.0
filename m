Received: from fep04-mail.bloor.is.net.cable.rogers.com ([66.185.86.74])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194XJx-0007Tz-7V
	for <linux-mtd@lists.infradead.org>; Sun, 13 Apr 2003 03:34:17 +0100
Date: Sat, 12 Apr 2003 22:33:42 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@infradead.org>
To: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <5.1.1.5.2.20030411130135.018a6698@mail.arc.nasa.gov>
Message-ID: <Pine.LNX.4.44.0304121422070.9032-100000@CPE00e0292061fa-CM014370001917.cpe.net.cable.roger>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DoC + GRUB booting problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 11 Apr 2003, Ted Hildum wrote:

>          The bootloader is definitely the M-Sys BIOS extension.  My 
> impression is that for DoC 2000s, the BIOS extension is in a ROM that can't 
> be changed.  I am still trying to verify that, but if its true, I have to 
> deal with it.  If it can be changed, like in a DoC Millenium, I could be in 
> business.


Ted,

My fault.  I now understand that your analisys shows intersting details 
about 256MB DoC 2000 IPL.

> 1. The IPL in the BIOS extension loads 0x3000 bytes, not 0x2000 bytes.

I understand the makecsum.c program should be modified to calculate the
proper checksum.

> 2. The IPL doesn't necessarily load the SPL to address 0x2000:0.  It 
> looks for a 64Kbyte block containing nothing but 0's between 0x2000:0 
> and 0xA000:0 and uses that block if it is found, otherwise it uses 
> 0x5800:0.

My opinion is that the doc_stage1 SPL will happily work from any other
place in memory, as long as the IP offset is 0 and the SPL code in RAM 
doesn't overlap with the GRUB stage2 code in RAM (0x8200:0).

Looking at the code you've disassembled, I found the confirmation to the 
first condition:

> cs:0260 33C0           xor    ax,ax
> cs:0262 50             push   ax    ;offset of transferred code --> stack
> cs:0263 CB             retf         ;Use far return to jump to ES:0

As for overlapping with 0x8200 area, I see that the current GRUB
implementation hard codes this address.  Moving stage2 around might
involve replacing the hard-coded absolute references with relative ones
and recompiling stage2 in position-independent mode (-fPIC?).  I've never
tried that myself.

> 3. The IPL looks for a 4-byte sequence (0x84 0xA8 0xAC 0xA0) in the SPL 
> image before it loads it.  I don't have any DoC documentation of the 
> access registers, so I can't tell where it starts looking, and I don't 
> know where the IPL starts loading the image if it doesn't find the 
> signature its looking for.

Can't find an explanation for this.  Perhaps inserting the signature at 
that offset might help.

-- 
Ilguiz Latypov
Montreal, Quebec
Canada

tel. +1 (514) 526-6911
