From: David Woodhouse <dwmw2@infradead.org>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E793518138D@atcml01.atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E793518138D@atcml01.atc.army.mil>
Content-Type: text/plain
Date: Mon, 13 Dec 2004 14:00:01 +0000
Message-Id: <1102946402.6694.82.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DOC 128 Mbyte, which boot loader?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-12-13 at 07:33 -0500, Carlos, John J USAATC wrote:
>   I have a DOC 128Mbyte DIP on a pc104 board.  I am running 2.4.28 kernel
> with a recent patch from MTD site.  Modules loaded are DiskONChip, Inftl,
> Mtdchar, Mtdblock.  I can access the chip, read and write to it.  I am
> having problems booting from it. 

The patch for LILO is just to make it cope with the fact that the
standard M-Systems BIOS extension for NFTL/INFTL uses a _lot_ of RAM.
There's no real support for the DiskOnChip in it; you need to keep the
original BIOS extension loaded on the DiskOnChip. I think that newer
versions of LILO don't need the patch -- I'm not sure. I think the patch
also makes a default mapping from /dev/nftla to BIOS drive 0x80 but you
can put that in your lilo.conf anyway.

Grub could also work in the same way too, without modification -- you
put it into the 'MBR' of the emulated hard drive. The Grub patches you
see in CVS are to make it support the DiskOnChip directly, so it can be
put directly into the flash on the DiskOnChip _instead_ of the M-Systems
BIOS extension. And I think you're right that INFTL support is missing
from that. Adding it is left as an exercise for the reader.

-- 
dwmw2
