Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRHKU-0008L2-Er
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 07:58:43 +0000
Date: Wed, 2 Oct 2013 09:58:13 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Avery Pennarun <apenwarr@gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
In-Reply-To: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1310020954040.18310@lnxricardw.se.axis.com>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2 Oct 2013, Avery Pennarun wrote:

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

Not much help, but AFAIU, you can get so-called 'write disturb' when 
writing to the other page in a pair, even without power failure during the 
write. But to my mind, 12% flipped bits sounds very excessive. I don't 
have any experience with MLC though.

Instictively it sounds like there is some other mechanism causing 
problems, for instance if mtd does the write to the pages in two goes, 
rather than in one write, as I think MLC in general can only accept one 
write operation per page, in contrast to SLC where it is legal to write 
the main and oob data at different times (normally 2 or 3 writes per page 
is legal, after that the page must be erased or the data can not be 
considered stable).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
