Return-path: <dwmw2@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ASTO-0002Rp-00
	for mtd-list@infradead.org; Tue, 18 Jan 2000 06:50:38 +0000
Received: from edison.dialix.com.au ([203.12.2.8] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ASTK-0002Rj-00
	for mtd@infradead.org; Tue, 18 Jan 2000 06:50:35 +0000
Message-ID: <38840189.D35EE633@ctam.com.au>
Date: Tue, 18 Jan 2000 17:00:42 +1100
From: Brendan J Simon <Brendan.Simon@ctam.com.au>
Reply-To: Brendan.Simon@ctam.com.au
MIME-Version: 1.0
To: Stuart Lynne <sdjl@fireplug.net>
CC: linux-mtd <mtd@infradead.org>
Subject: Re: DiskOnChip for PowerPC embedded system.
References: <38726ECE.D3E3AAEE@ctam.com.au> <38719CC6.93FB5729@ctam.com.au> <E125Qft-0007VY-00@devel2.axiom.internal> <E125mWX-0001Gh-00@devel2.axiom.internal> <20000117225245.42847@fireplug.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-ID: <linux-mtd.lists.infradead.org>

Stuart Lynne wrote:

> On Wed, Jan 05, 2000 at 09:09:35AM +0000, David Woodhouse wrote:
>
> > If you use M-Systems' code in a production system (i.e. something you
> > distribute) you mustn't compile it into your kernel - that would violate the
> > GPL.
>
> It is trivial to compile their code as a module and use from an initrd file.

I thought that the linux kernel didn't support modules for ppc, at least not for
the 2.2.5 kernel which I got from the linuxppc.org site.  It is the
embedded-2.2.5 kernel put together by Dan Malek.

I assume that the newer version do support modules.  Is this true.
Would this be true of all ppc targets such as 860, 8260, etc or is it just for
common workstations like PowerMacs, etc ?

What kernel versions support modules on ppc ?

Brendan Simon.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
