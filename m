From: David Woodhouse <dwmw2@infradead.org>
To: Sean Kelley <sean.sweng@gmail.com>
In-Reply-To: <43507b7c0502141847134e1e68@mail.gmail.com>
References: <43507b7c0502141847134e1e68@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 15 Feb 2005 07:48:05 +0000
Message-Id: <1108453685.22597.30.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Linux MTD and NFTL - Question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-02-14 at 20:47 -0600, Sean Kelley wrote:
> However, in the course of my research it came to my attention that a
> company called M-Systems has a hefty amount of IP with regards to FTL
> and NFTL for pseudo-block devices. How does the Linux MTD-NFTL skirt
> the patents that M-Systems has in place?  If I want to sell my product
> commercially what sort of risk? It is not terribly clear. 

In general, we only really use FTL/NFTL/INFTL for backwards
compatibility on devices which already had it when we started. The block
device emulation thing just doesn't make much sense now that we're not
running on DOS where we have to provide an INT 13h disk BIOS handler.

So even outside the Free World it's never really been much of an issue,
because that means we tend to operate within the licence which was
granted for use on PCMCIA devices (for FTL) or for use on M-Systems
hardware (NFTL).

I'm happy enough shipping the code like that, following the precedent
set by David Hinds with FTL in pcmcia-cs. AFAICT the GPL doesn't
actually specify that you have to be able to _use_ the code without
restrictions -- only to copy, modify and redistribute it. I could write
GPL'd code for running a nuclear power plant, for example -- but I
suspect the authorities will be less than amused if you try to _use_ it.

If you're in a part of the world where the patents apply, and you think
that they're sufficiently non-obvious or the patent office is
sufficiently corrupt that you'd stand a good chance of losing in court
when you try to challenge them, then you probably shouldn't be using the
techniques outside the terms of the licence granted by M-Systems. You
should consult a patent lawyer though.

> > I've looked at YAFFS and JFFS2, but those won't work if I wish to
> > support USB mass storage for the Windows desktop.

Does it have to be USB mass storage? What about the file system profile
which is used with cameras? That should work when backed by JFFS2.

-- 
dwmw2
