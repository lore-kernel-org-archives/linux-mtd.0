Subject: Re: Sending UTF-8 patches (was: [PATCH 2/2] Remove now-defunct
	ts7250 nand driver)
From: David Woodhouse <dwmw2@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20100106180705.GC11773@shareable.org>
References: <201001051459.58621.hartleys@visionengravers.com>
	<1262784693.3181.8034.camel@macbook.infradead.org>
	<20100106180705.GC11773@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 18:36:50 +0000
Message-ID: <1262803010.3181.8484.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: joff@embeddedarm.com, linux-mtd <linux-mtd@lists.infradead.org>,
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

On Wed, 2010-01-06 at 18:07 +0000, Jamie Lokier wrote:
> David Woodhouse wrote:
> > It looks like your patch has legacy garbage in it:
> > 
> > > - *   Copyright (C) 2004 Marius Gr<F6>ger (mag@sysgo.de)
> > 
> > It fails to apply because the ö (correctly represented as 0xc3 0xb6) has
> > been converted into a single byte 0xf6 in some legacy character set.
> >
> > When applying patches, git-am does look at the Content-Type: header and
> > convert legacy crap into UTF-8 for the changelog, but it leaves the
> > patch itself alone.
> 
> That's unfortunate.  An option to git-am or it's subsidiary tools to
> convert the patch as well as the commit would be useful.  After all it
> _is_ made clear in the MIME header how it's formatted.

ISTR there was some resistance to that suggestion when git-am was first
fixed to handle the Content-Type of mails. The idea was that the patch
should be considered sacrosanct and shouldn't be mangled.

Personally, I suspect you're right, and it should be converted too.

But I still think it's useful to discourage people from sending patches
in EBCDIC and other legacy crap.

> > Care to join us in the 21st century?
> 
> You mean send the mail in UTF-8 format when it only contains
> characters in ISO-8859-1?  To make that the default behaviour of an
> email sender would possibly violate RFC2045, 

Um, why? Can you point at the particular section you think would be
violated?

> Do you instead mean send the patch in UTF-8 embedded in a mail encoded
> as 8859-1?  That sounds quite difficult, if the patch is inline rather
> than attached.

God no. Just send UTF-8.

Would you advise that I send a mail as EBCDIC if it can fit into that?

> What settings do you use to get this right?

We've learned the hard way that marking text with encodings is
complicated and error-prone. The only viable option is to eliminate that
need as much as possible.

The rule is simplesimple -- just use UTF-8 everywhere, for everything.

Then the only time you have to deal with the issue of encodings is when
you're taking legacy crap in from people who don't follow that rule.

-- 
dwmw2
