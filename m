Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CH06J-0003gb-E3
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 09:20:32 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1097497518.318.285.camel@hades.cambridge.redhat.com>
References: <Pine.LNX.4.44.0410111519200.15371-100000@kiire.colleduc.ee>
	<1097497518.318.285.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1097500358.21607.37.camel@thomas>
Mime-Version: 1.0
Date: Mon, 11 Oct 2004 15:12:38 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nicolas Pouillon <nipo@ssji.net>
Subject: Re: [PATCH]Probing at 0x0
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-11 at 14:25, David Woodhouse wrote:
> > I think you are right. It did handle both of them in 8-bit mode.
> > I believe that if we are going to use 32 MB devices in 8-bit mode, we must 
> > deal with the interleaving crap, right?
> 
> I think so, yes.

You mean 16-bit mode ? Then you need the interleave hack.

http://www.m-systems.com/files/documentation/doc/Mobile_Plus_32_64MB_DS_Rev1.7.pdf

A 13-bit wide address bus enables access to the DiskOnChip 8KB memory
window (as shown in Section 6.2). In 32/64MB capacities, the 16-bit data
bus permits full 16-bit wide access to the flash, due to an internal,
dual-bank, interleaved architecture. With both internal and external
16-bit access, DiskOnChip Millennium Plus 32/64MB provides unrivaled
performance. In 16MB capacities, an 8-bit data bus permits 8-bit wide
internal access to the flash but 16-bit external access to the host.

That means, that the 2 chips are accessed in parallel. So each word you
write is split into two bytes. The even goes into chip 0 and the odd
into chip 1.

This increases pagesize to 1024 byte and the bad block table must be
aware of that too.

The only thing I can not figure out, is whether you must duplicate the
commands, address bytes. 
I assume yes. So we need a seperate command function which does 
writeb16 (command | (command << 8)); 
and shifts the address 1 time right and writes the address bytes the
same way as the command.

The remaining stuff should work unchanged including ecc, but we need a
seperate oobinfo though.

tglx
