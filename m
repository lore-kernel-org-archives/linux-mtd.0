Date: Wed, 6 Jan 2010 23:27:11 +0000
From: Jamie Lokier <jamie@shareable.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Sending UTF-8 patches (was: [PATCH 2/2] Remove now-defunct ts7250
	nand driver)
Message-ID: <20100106232711.GF24250@shareable.org>
References: <201001051459.58621.hartleys@visionengravers.com>
	<1262784693.3181.8034.camel@macbook.infradead.org>
	<20100106180705.GC11773@shareable.org>
	<alpine.LFD.2.00.1001061342240.21025@xanadu.home>
	<20100106230546.GD24250@shareable.org>
	<1262819289.3181.8784.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1262819289.3181.8784.camel@macbook.infradead.org>
Cc: joff@embeddedarm.com, Nicolas Pitre <nico@fluxnic.net>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	H Hartley Sweeten <hartleys@visionengravers.com>, mcrapet@gmail.com,
	ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Wed, 2010-01-06 at 23:05 +0000, Jamie Lokier wrote:
> > As I don't work with Git source and don't have enough time, I won't be
> > doing this, but I'd be delighted if someone else took the idea to the
> > Git people.  This thread could be used to explain why :-) 
> 
> I won't be bothering -- I'm quite happy just telling people not to send
> me legacy crap. There really is no justification for it, these days.

I suggest mutt users put this in .muttrc to work around git's inconsistency:

   set send_charset="us-ascii:utf-8"

If that's not acceptable, one could always add a hook to grep for a
patch when sending to decide what to do :-)

-- Jamie
