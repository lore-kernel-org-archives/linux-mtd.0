From: David Woodhouse <dwmw2@infradead.org>
To: Brian T <btuch@usa.net>
In-Reply-To: <011201c40c45$d318a160$fd0ba8c0@briantpc>
References: <002901c406cb$3c049ec0$fd0ba8c0@briantpc>
	 <1079387201.5835.344.camel@imladris.demon.co.uk>
	 <405686B3.4090607@wasp.net.au>
	 <1079424685.5835.404.camel@imladris.demon.co.uk>
	 <011201c40c45$d318a160$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1079544909.16952.92.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 17 Mar 2004 17:35:10 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: free_list / free_size messages
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-03-17 at 11:32 -0600, Brian T wrote:
> >
> > Yes please. It should be harmless; it's just an accounting screwup. We
> > seem to have placed a block on the free_list which doesn't actually have
> > any significant amount of free space in it at all.
> >
> > -- 
> 
> I am limited to my debugging output, but here is what I caught from syslog
> around the "eep".

That's not useful; we need to see what it was thinking at the time it
put it _on_ the list, not at the time it later takes it off and finds it
shouldn't have been there in the first place.

If you update to the current code, does it still happen?


-- 
dwmw2
