From: David Woodhouse <dwmw2@infradead.org>
To: David Updegraff <dave@cray.com>
In-Reply-To: <406D6AF3.9010808@cray.com>
References: <Pine.LNX.4.44.0404011658150.6508-100000@kiire.colleduc.ee>
	<1080830176.24117.1858.camel@hades.cambridge.redhat.com>
	<1080885452.17863.39.camel@imladris.demon.co.uk>
	<406D6AF3.9010808@cray.com>
Content-Type: text/plain
Message-Id: <1080913168.1213.69.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 02 Apr 2004 14:39:28 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: patch for AMD am29dl800b
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-04-02 at 07:30 -0600, David Updegraff wrote:
> > Hmmm. And this chip really doesn't do CFI?
> 
> My attempts at that failed; and their PDF only says 'JEDEC compatible'.

OK.

> > I wonder how much space we take up with this table, and if we should put
> > the regions outside the table rather than inline ("ulong *regions").
> 
> .. or invent a command-line syntax; since in embedded situations one 
> usually knows what one is looking for.. or has that alredy been 
> discussed and discarded?

You assume far too much competence on the part of the people who would
be expected to provide such arguments. You _can_ write a map driver
which bypasses the probe and set up the appropriate command set
directly, I think. There's not really much need to -- if you're _that_
concerned about bloat you won't be using Linux in the first place.

I've committed your patch; thanks.

-- 
dwmw2
