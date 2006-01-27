Received: from zproxy.gmail.com ([64.233.162.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2Zcp-0005hV-Jr
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 14:51:22 -0500
Received: by zproxy.gmail.com with SMTP id i11so731395nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Jan 2006 11:51:14 -0800 (PST)
Message-ID: <625fc13d0601271151i796ab647v629495dc80cbc940@mail.gmail.com>
Date: Fri, 27 Jan 2006 13:51:14 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0601271115l5e18a03bs920237f09dfa2877@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
	<43DA3CDF.5050202@intel.com>
	<6934efce0601271115l5e18a03bs920237f09dfa2877@mail.gmail.com>
Cc: "Alexey, Korolev" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
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

On 1/27/06, Jared Hulbert <jaredeh@gmail.com> wrote:
> > > Is this a read-only caching?  I know several architectures and
> > > hardware configurations that would quickly throw a machine check if
> > > trying to flush the cache back to flash since they don't support
> > > bursted writes.
> > >
> > In general case not.  I've never heard about the such issue. Is there
> > any way to define has platform flash devices with bursted writes or not=
?
> > What architectures have this problem?
>
> When I first did a patch like this I used a very platform dependent
> embedded assembly loop to _invalidate_ NOT _flush_ the specific
> cachelines possibly affected by the flash program or erase.

Yep, that would be better.

>  In this case the point is the flash was changed by a program or erase
> that  does not change the state of possible contents of the cache so
> the flash and cache are out of sync.  We don't care what the cache
> contents that point to the affected regions of cache are, we don't
> ever want to read them again, so we mark them as invalid and wait for
> those lines to be replaced.

Right.

>
> Flushing the caches back _could_ be a very bad thing, it could cause
> flash to do many bad things because you would be write arbitrary data
> back to the flash bus.  I'm not sure why it would machine check.  If
> your processor was configured properly I'm not sure why flushing would
> trigger burst writes to a memory not capable of bursting, but then
> hardware can have its mysterious ways.  Either way you would likely do

I didn't say it was sane hardware :).  But some ppc 4xx boards can't
handle bursted writes to the EBCs.  I'm not sure if they've all been
fixed out there or not.

> bad things to the flash by flushing garbage back to it.  However, from
> a higher level look at it you should never be writing directly to the
> cached mapping of flash as only the mtd really knows about it and only
> uses it read.  Therefore the cachelines are always clean and don't get
> written back so it's not really a problem.

I agree.  As long as things are getting invalidated instead of
flushed, then there should be no issue.  flushing =3D=3D bad, invalidating
=3D=3D sane :)

josh
