Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kZIS-0001by-00
	for mtd-list@infradead.org; Tue, 03 Apr 2001 23:29:08 +0100
Received: from gatekeeper.emware.com ([209.140.75.114])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14kZIR-0001bs-00
	for mtd@infradead.org; Tue, 03 Apr 2001 23:29:07 +0100
Message-ID: <3ACA4F38.908FA4C7@emware.com>
Date: Tue, 03 Apr 2001 16:31:20 -0600
From: Tim Bowman <tbowman@emware.com>
MIME-Version: 1.0
To: Eric <ebrower@usa.net>, mtd mailing list <mtd@infradead.org>
Subject: Re: [RPX Classic/Lite and byte ordering]
References: <20010403024521.10444.qmail@nwcst285.netaddress.usa.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Tim Bowman <tbowman@emware.com> wrote:

> The rpxlite layer seems to be using memcpy_fromio, writeb, writew, etc,
> not __raw_writeb.  Should these be replaced with the raw versions?

Yes, in any case they should be using the __raw equivalents to force
untranslated byte ordering.  This allows the ENDIAN defines to work
appropriately.  I can't say if this is your problem, but you should
go 'raw' at the very least to be idiomatic with the other drivers.

-----------------

Ta-Da.... I fixed the problem in include/asm-ppc/io.h:
...
#define readb(addr) in_8((volatile u8 *)(addr))
#define writeb(b,addr) out_8((volatile u8 *)(addr), (b))
#if defined(CONFIG_APUS) || defined(RPXCLASSIC)
#define readw(addr) (*(volatile u16 *) (addr))
#define readl(addr) (*(volatile u32 *) (addr))
#define writew(b,addr) ((*(volatile u16 *) (addr)) = (b))
#define writel(b,addr) ((*(volatile u32 *) (addr)) = (b))
#else
#define readw(addr) in_le16((volatile u16 *)(addr))
#define readl(addr) in_le32((volatile u32 *)(addr))
#define writew(b,addr) out_le16((volatile u16 *)(addr),(b))
#define writel(b,addr) out_le32((volatile u32 *)(addr),(b))
#endif
...

Everything works great now, in fact so great that I blew away the RPX
utility with a jffs file system and rendered my board useless.  Has
anyone re-programmed the flash via BDM on these boards?  I wonder what
hardware and software works the best.

This solution doesn't explain why some of you haven't had this problem. 
Maybe the flash really is wired up two different ways on RPX boards...

Thanks a lot for everybody's help.  -T


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
