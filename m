Received: from plane.gmane.org ([80.91.229.3])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRJWX-0003OS-VS
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 10:19:18 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1VRJW9-0007YG-2W
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 12:18:53 +0200
Received: from 146.187.3.109.rev.sfr.net ([109.3.187.146])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 12:18:53 +0200
Received: from romain.izard.pro by 146.187.3.109.rev.sfr.net with local
 (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 12:18:53 +0200
To: linux-mtd@lists.infradead.org
From: Romain Izard <romain.izard.pro@gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC
 NAND eraseblock
Date: Wed, 2 Oct 2013 10:18:31 +0000 (UTC)
Message-ID: <l2grtn$svg$1@ger.gmane.org>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2013-10-01, Avery Pennarun <apenwarr@gmail.com> wrote:
> Hi everyone,
>
> Does this sound familiar?
>
> Setup:
> - Linux 2.6.37 or 3.2.26 (apologies for the old versions, but I
> couldn't find any related patches in newer kernels and these are
> embedded systems that are a bit hard to upgrade)
> - Micron MT29F16G08CBACAWP - MLC NAND
> - 1 Mbyte eraseblocks
> - 1 kbyte pages
> - Tested on two different hardware platforms (MIPS and ARM devices)
>
> Steps:
> - Disable ECC to avoid any confusion (ECC turns out to not affect the
> test results, but I wanted to make sure)
> - Erase any eraseblock
> - Write all-zeroes to page 0x18 of that eraseblock; read it back -> ok
> - Write all-zeroes to page 0x12 of that eraseblock; read it back ->
> FAIL, all 0xff instead
> - Read page 0x18 -> completely random data (about 12% of bits are flipped)
>
> More details:
> - It doesn't happen with a related Micron SLC NAND
> - If you write the pages in the opposite order there is no problem
> - Delays before/after reading and writing, and the sequence of reads,
> has no effect
> - This turns out to happen for any pair of pages, where pairs are
> always exactly 6 pages apart (n and n+6), other than the first and
> last 4 pages in each eraseblock, which are paired with different pages
> to make the math work out
>
> I've read about the concept of MLC "paired pages" causing corruption
> elsewhere, but it supposedly only happens when you get a power
> failure.  It's happening for me during normal runtime, which seems
> wrong.

For me you're violating one key MLC assumption: the pages within a block
must be written in a strictly increasing order. It should be written
somewhere in the component's datasheet.

Best regards,
-- 
Romain Izard
