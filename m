Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFrA0-00064i-55
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 20:20:57 +0000
Date: Tue, 18 Feb 2014 17:20:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v6 2/3] ubi-utils: Add ubiblkvol tool
Message-ID: <20140218202028.GA13799@localhost>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392710080.21319.52.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392710080.21319.52.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 18, 2014 at 09:54:40AM +0200, Artem Bityutskiy wrote:
> On Sun, 2014-02-16 at 17:04 -0300, Ezequiel Garcia wrote:
> > With the addition of block device access to UBI volumes, we now
> > add a simple userspace tool to access the new ioctls.
> 
> I noticed you call this driver "block device access to UBI volumes" or
> even "block device interface of UBI volumes". I am not sure we picked
> the best terminology.

Yes, given we've shaped this more like a new UBI feature, than a standalone
driver, I tried to move away from the "ubiblock driver" wording.

> Could we please discuss this a bit. Here are my
> thoughts.
> 

Sure.

> Essentially, what you have implemented is a R/O block driver. This
> driver works on top of UBI volumes. It uses simple "1-to-1" mapping,
> which is basically its media format.
> 

So far, so good.

> Someone, in theory, may implement a more sophisticated block driver
> which would be an R/W driver with good random I/O performance. This
> driver would not use 1-to-1 mapping. It would have internal block
> mapping tables, and garbage-collector.
> 

Indeed. I've been playing with that idea, but (as we already discussed)
this simpler implementation is already interesting enough.

> There may be multiple drivers like this implemented.
> 

Well, I thought the above as future improvements of the current proposal.
But I guess we can't know in advance, how are they going to be like.

> These multiple drivers would have the same user interface - the block
> API. But very different implementation, and different incompatible media
> format.
> 
> What would be our terminology then, I wonder. What do yo think:
> 
> * If your driver is ubiblock, how would those be called, any idea?
> * How would we distinguish between them when doing 'modprobe' ?o

I'm not sure about any of these.

Are you thinking in having multiple block emulation implementations living
together using this same design; i.e. all being part of the UBI driver?

I'm not sure that would be sane. I'm more inclined towards improvements of
the current code. Is this idea too narrow-minded?

> * How would we specify which one to use when using "ubiblkvol" ?
>

Supposing we have several options, I guess a parameter will do.

> BTW, I am not sure "ubiblkvol" is a good name, may be you have other
> ideas? Absent better ideas, may be calling it 'ubiblock' would be
> better, just like the name of the driver? This would at least use less
> of the "namespace".
> 

Yes, could be. "ubiblock" looks a bit cleaner.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
