Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGDDC-0004Zg-UW
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 08:22:02 -0400
Date: Wed, 1 Aug 2007 14:18:00 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070801121800.GB2747@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
Cc: dhowells <dhowells@redhat.com>, Carsten Otte <cotte@de.ibm.com>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I ignored this in my previous reply.

On Tue, 31 July 2007 12:55:23 -0700, Jared Hulbert wrote:
> 
> Like what? :)  I'm all for the kinds of ideas that Jörn and others are
> tossing about as replacement for better XIP awareness in the MTD.  I'm
> just not catching the vision enough to start coding.

Neither am I.  My missing puzzle piece is how to zap all page mappings
for the chip in question.  Maybe the fs/vm meeting at lce will clear
things up.

> One of the major problems with working on Flash based XIP stuff for
> the kernel is that there are no mergeable filesystems to use the any
> frameworks we develop.  The VM still doesn't handle this correctly,
> point() needs work.  There are a lot of fronts to attack.  What I was
> hoping for was to get the minimum requirements for me to get AXFS
> supported by the kernel, then to come back and provide more educated
> and correct interfaces in the vm and mtd layers.  That way we could
> have the example of how it is being done in AXFS to frame the
> discussion and give it more urgency.  I'm beginning to think this
> isn't the correct approach.

If I started working on this I'd probably want AXFS on one partition and
JFFS2 on another.  Being able to write to JFFS2 while reading XIP files
from AXFS without corruptions is the major milestone.  When that works
we can think about the other 90% of having both write support and XIP in
the same filesystem.

How serious is Intel about merging AXFS in mainline, btw?

> If that won't work then can I propose a face to face meeting with
> interested parties like a mini XIP summit or something.  There are
> those that are informed and interested enough to want this done right
> and have a definate opinion as to what is right and wrong here, but
> that don't have time to develop this.  I on the other hand have the
> ability to get this coded up but am more in the dark as to the
> 'correct' way to do this.  If we could sit down and sketch out how to
> go about this I think it would be very productive.  Potential
> interested parties could include me, Woodhouse, Engel, and Otte.
> Anybody else come to mind?

Maybe another vm person or two.  The vm part is the critical missing
piece and needs all the brainpower we can get.

Jörn

-- 
Joern's library part 1:
http://lwn.net/Articles/2.6-kernel-api/
