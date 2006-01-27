Received: from uproxy.gmail.com ([66.249.92.199])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2Z40-0005CJ-Mv
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 14:15:20 -0500
Received: by uproxy.gmail.com with SMTP id o2so73110uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Jan 2006 11:15:14 -0800 (PST)
Message-ID: <6934efce0601271115l5e18a03bs920237f09dfa2877@mail.gmail.com>
Date: Fri, 27 Jan 2006 11:15:14 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
In-Reply-To: <43DA3CDF.5050202@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
	<43DA3CDF.5050202@intel.com>
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH] map drivers. DCACHE option for physmap and mphysmap
	drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Is this a read-only caching?  I know several architectures and
> > hardware configurations that would quickly throw a machine check if
> > trying to flush the cache back to flash since they don't support
> > bursted writes.
> >
> In general case not.  I've never heard about the such issue. Is there
> any way to define has platform flash devices with bursted writes or not?
> What architectures have this problem?

When I first did a patch like this I used a very platform dependent
embedded assembly loop to _invalidate_ NOT _flush_ the specific
cachelines possibly affected by the flash program or erase.=20
consistent_sync() is a great arm specific option to do this but then
ioremap_cached() is very arm specific too.  Invalidating on the arm
arch marks a cacheline as invalid but doesn't try to write it back
while a flush typically refers to a writeback followed by an
invalidate.

 In this case the point is the flash was changed by a program or erase
that  does not change the state of possible contents of the cache so
the flash and cache are out of sync.  We don't care what the cache
contents that point to the affected regions of cache are, we don't
ever want to read them again, so we mark them as invalid and wait for
those lines to be replaced.

Flushing the caches back _could_ be a very bad thing, it could cause
flash to do many bad things because you would be write arbitrary data
back to the flash bus.  I'm not sure why it would machine check.  If
your processor was configured properly I'm not sure why flushing would
trigger burst writes to a memory not capable of bursting, but then
hardware can have its mysterious ways.  Either way you would likely do
bad things to the flash by flushing garbage back to it.  However, from
a higher level look at it you should never be writing directly to the
cached mapping of flash as only the mtd really knows about it and only
uses it read.  Therefore the cachelines are always clean and don't get
written back so it's not really a problem.

However I don't see the value of keeping the commented out lines with
the flushing calls around unless there was a more generic alternative
to ioremap_cached().
