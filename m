Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NV1L-0003qS-CR
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 10:57:27 +0100
Date: Wed, 4 Jun 2003 11:57:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030604095754.GB27112@wohnheim.fh-wedel.de>
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Execute in place.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 4 June 2003 09:34:50 +0100, David Woodhouse wrote:
> 
> I've done some work on kernel XIP. The basic principle of operation is
> that we copy any code which may need to run while the flash chips are in
> anything but 'read' mode into RAM, and we disable interrupts while the
> chips are busy. During erases, we poll not only for erase completion but
> also for pending IRQs. If an IRQ is pending, we suspend the erase
> operation, re-enable IRQs and call cond_resched().

Maybe a stupid one, but anyway...

For my flash chips, an erase operation is in the ballpark of a second.
That is very long for interrupts, so I would assume, we never complete
an erase without being interrupted.  Does this mean that a formerly
suspended and resumed erase operation completes quicker than a fresh
one?  Or do we need really fast flash chips?

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
