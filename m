Received: from orngca-mls02.socal.rr.com ([66.75.160.17])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QYIo-0005IQ-1n
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 21:04:06 +0100
Received: from [192.168.2.4] (66-75-241-113.san.rr.com [66.75.241.113])
	h5CK1Fk15667	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jun 2003 13:01:15 -0700 (PDT)
From: roger <rogerxxmaillist@san.rr.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1055397377.16455.129.camel@imladris.demon.co.uk>
References: <1055118239.10424.49.camel@localhost3.localdomain>
	 <1055322085.31819.31.camel@localhost3.localdomain>
	 <1055322846.2097.18.camel@passion.cambridge.redhat.com>
	 <1055375590.31819.567.camel@localhost3.localdomain>
	 <1055397377.16455.129.camel@imladris.demon.co.uk>
Message-Id: <1055447448.3079.8.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 12 Jun 2003 12:50:48 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: Problems with using doc2001 module - 000F0000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 22:56, David Woodhouse wrote:
> On Thu, 2003-06-12 at 00:53, roger wrote:
> > The DiskOnChip (DoC) Shows the following (data doesn't start again until
> > approximately  000F57F0)
> > 000F57F0   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  55 AA 10
> > EB  3C 00 00 28  ................U...<..(
> > 000F5808   43 29 4D 2D  53 79 73 74  65 6D 73 31  39 39 38 00  00 00 21
> > 00  00 04 00 1C  C)M-Systems1998...!.....
> 
> This is a hexdump from physical memory?
> 
> Odd. That 0x55 0xAA ought to be at 0xF0000. Is it possible that your
> address lines to the chip are in the wrong order?
> 
> What happens if you now unload the l440gx module and load the DiskOnChip
> driver, with the probe address 0xf5800?

nothing. doc2001 module w/ docprobe still doesn't find it at 0xf5800. 
So, in order to get doc2001 to recognize that there is a DoC @
0xfff00000, i still need to induce the kernel panic.  and on a second
440BX/VX/ZX (?) the l440gx.o module won't even load.

> 
> > It certainly looks like i'm looking at the actual chips through the
> > L440GX memory map and the modules load fine without having to induce the
> > kernel panic.  However, the offset of the start & ending of the hardware
> > chip appears incorrect.  I'm guessing I only have to modify the l440gx.c
> > code to reflect the proper parameters?  On the cosemetic side of things,
> > the module labels the DoC as a "L440GX BIOS" instead of a "DOC
> > MIL"....another small oddity.
> 
> It thinks it's ROM, and that's why it's labelled as BIOS. You're only
> loading the l440gx module to make it do the PCI config magic to enable
> writes to that physical address range.
> 
> Unless you load the DiskOnChip driver, you won't drive a DiskOnChip
> properly ;)

yup. exactly. I was able to see the DOC and Original bios flash rom chip
at 0xfff00000 using the l440gx module but with diff (incorrect) memory
start/stop offsets.

So, I need to modify the doc2001.c code to reflect a similar chip
recognization that l440gx.c does.  Otherwise, the doc2001.c will not
even see the mtd chip(s).  looks very close to getting this working.


-- 

Roger
http://www.eskimo.com/~roger/index.html
