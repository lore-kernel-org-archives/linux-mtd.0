Received: from elasmtp-galgo.atl.sa.earthlink.net ([209.86.89.61])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JrcyT-0005Wg-Vc
	for linux-mtd@lists.infradead.org; Thu, 01 May 2008 17:53:42 +0000
Message-ID: <481A037F.2010106@mindspring.com>
Date: Thu, 01 May 2008 13:53:03 -0400
From: Chuck Meade <chuckmeade@mindspring.com>
MIME-Version: 1.0
To: jkimble@one.net
Subject: Re: Strange faults using Intel P33 flash
References: <34025.137.237.242.42.1209662902.squirrel@webmail.nuvox.net>
In-Reply-To: <34025.137.237.242.42.1209662902.squirrel@webmail.nuvox.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jkimble@one.net wrote:
> 
> Yes it's an old 2.6.10 kernel but it's CFI NOR flash. Shouldn't it work
> with mtd circa 2.6.10?
> 
> The flash memory I am using is the Intel P33 (256P33B) NOR flash. I
> have two chips with the chip selects tied to the same logic line. The
> chips are on the Flexbus of a Coldfire processor (MCF5484). I'm able
> to work with the flash fine in the boot loader (Colilo) after porting
> the driver template from Intel into it. My question is how do I
> configure MTD to work with this. I've set the beginning address and
> the size. This is CFI complient NOR flash. I've set a chip interleave of 2
> with a 32 bit bus. As the kernel is booting I keep getting the
> message:
> 
> ================================================
> $Id: ftl.c,v 1.54 2004/11/16 18:33:15 dwmw2 Exp $
> Unlock all sector for Intel on Fire Engine...
> physmap flash device: 4000000 at f0000000
> phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank
>  Intel/Sharp Extended Query Table at 0x010A
>   Unknown Intel/Sharp Extended Query version 1.4.

I ran into something similar on a 2.6.11 variant.  The MTD of that era does
not support the version of CFI Extended Query found in the P33 flash.
What you can do is either a) use a newer kernel version which does support
this Extended Query version, or b) backport the bits of MTD logic that support
this Extended Query version from a newer kernel to your kernel.

If it is possible (for numerous reasons) it is preferable to use a newer
kernel version that has built-in support for the Extended Query version in
the P33 flash.

HTH,
Chuck
