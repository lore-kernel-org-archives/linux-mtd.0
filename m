From: David Woodhouse <dwmw2@infradead.org>
To: Russell King <rmk@arm.linux.org.uk>
In-Reply-To: <20041110204331.A26346@flint.arm.linux.org.uk>
References: <20041110204331.A26346@flint.arm.linux.org.uk>
Content-Type: text/plain
Message-Id: <1100171705.8191.1359.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Nov 2004 11:15:06 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD suspend/resume bug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-11-10 at 20:43 +0000, Russell King wrote:
> Shouldn't the resume function set both cfi->oldstate and cfi->state
> to FL_READY ?

Yes, it probably should. Can you try the (untested) v1.162 from CVS?

You mentioned that we should probably be waiting for any operation to
complete, instead of returning -EAGAIN. Once upon a time, I think these
routines weren't allowed to sleep -- I assume that's changed now?

Still, the upper layers are supposed to have quiesced everything so
there shouldn't _be_ anything happening, surely? Doing it that way may
allow us to just switch to using get_chip() nicely like everyone else
does... I wouldn't be averse to it if someone cares enough to implement
it.

-- 
dwmw2
