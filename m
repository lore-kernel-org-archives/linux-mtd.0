Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QL3q-0000hE-1D
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 06:55:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: roger <rogerxxmaillist@san.rr.com>
In-Reply-To: <1055375590.31819.567.camel@localhost3.localdomain>
References: <1055118239.10424.49.camel@localhost3.localdomain>
	 <1055322085.31819.31.camel@localhost3.localdomain>
	 <1055322846.2097.18.camel@passion.cambridge.redhat.com>
	 <1055375590.31819.567.camel@localhost3.localdomain>
Message-Id: <1055397377.16455.129.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 12 Jun 2003 06:56:18 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with using doc2001 module - 000F0000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-12 at 00:53, roger wrote:
> The DiskOnChip (DoC) Shows the following (data doesn't start again until
> approximately  000F57F0)
> 000F57F0   00 00 00 00  00 00 00 00  00 00 00 00  00 00 00 00  55 AA 10
> EB  3C 00 00 28  ................U...<..(
> 000F5808   43 29 4D 2D  53 79 73 74  65 6D 73 31  39 39 38 00  00 00 21
> 00  00 04 00 1C  C)M-Systems1998...!.....

This is a hexdump from physical memory?

Odd. That 0x55 0xAA ought to be at 0xF0000. Is it possible that your
address lines to the chip are in the wrong order?

What happens if you now unload the l440gx module and load the DiskOnChip
driver, with the probe address 0xf5800?

> It certainly looks like i'm looking at the actual chips through the
> L440GX memory map and the modules load fine without having to induce the
> kernel panic.  However, the offset of the start & ending of the hardware
> chip appears incorrect.  I'm guessing I only have to modify the l440gx.c
> code to reflect the proper parameters?  On the cosemetic side of things,
> the module labels the DoC as a "L440GX BIOS" instead of a "DOC
> MIL"....another small oddity.

It thinks it's ROM, and that's why it's labelled as BIOS. You're only
loading the l440gx module to make it do the PCI config magic to enable
writes to that physical address range.

Unless you load the DiskOnChip driver, you won't drive a DiskOnChip
properly ;)
 
-- 
dwmw2
