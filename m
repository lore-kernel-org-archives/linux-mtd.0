Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZnjL-0004XN-Bx
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 09:21:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <1057589533.1135.8572.camel@tubarao.lnxi.com>
References: <200307042232.43815.joshua@joshuawise.com>
	 <200307052157.06325.joshua@joshuawise.com>
	 <m3el142yly.fsf@maxwell.lnxi.com>
	 <200307052215.35596.joshua@joshuawise.com>
	 <1057589533.1135.8572.camel@tubarao.lnxi.com>
Message-Id: <1057652512.28965.107.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 08 Jul 2003 09:21:52 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jedec_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-07-07 at 15:52, Thayne Harbaugh wrote:
> Having a generic, forced configuration would be very useful for those
> that already know what they have in the system.  It would also fix cases
> where hardware is impossible to reliably probe.  This type of work would
> be very much appreciated.

If we do this, it needs to be easy to switch back to the generic probe
code. Many people don't really know how their board is wired up, or are
given incorrect information. I have customers who _insist_ their boot
flash is wired up as 32 bits, and file bugs against the working kernel
because of the comments and board setup for 16 bit flash. Not because
they claim it doesn't work, but just because they're comparing with
their docs.

-- 
dwmw2
