Received: from djurbala-pt.tunnel.tserv2.fmt.ipv6.he.net
	([2001:470:1f01:ffff::eb] helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCVlg-0007NS-39
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 08:59:04 +0000
Subject: Re: [PATCH] POWERPC: MTD: Add cached map support to physmap_of MTD
	driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Trent Piepho <tpiepho@freescale.com>
In-Reply-To: <Pine.LNX.4.64.0812151653050.28806@t2.domain.actdsltmp>
References: <1229365518-20538-1-git-send-email-tpiepho@freescale.com>
	<18758.62580.416920.482077@cargo.ozlabs.ibm.com>
	<Pine.LNX.4.64.0812151653050.28806@t2.domain.actdsltmp>
Content-Type: text/plain
Date: Tue, 16 Dec 2008 19:56:56 +1100
Message-Id: <1229417816.7319.4.camel@pasglop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@samba.org>,
	xyzzy@speakeasy.org, MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-12-15 at 17:11 -0800, Trent Piepho wrote:
> Shame, as it provides a huge speed up.  I suppose an alternative would be
> to map the chip twice at different physical addresses, by just configuring
> the chip select to be twice the size it should be, and giving them
> different cacheability.

Nice trick. That would probably work.

> Or changing the mapping for writes and then changing it back.  It wouldn't
> be necessary to change the whole thing, just the page being written to.

Right though changing mappings can be expensive. It might be worth
looking at using fixmap for that tho, which is the fastest way to setup
and tear down mappings, especially since we can (though we don't today)
implement a bypass on those to directly load the TLB.

Cheers,
Ben.
