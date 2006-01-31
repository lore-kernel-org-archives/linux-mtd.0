Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F3tJk-0005HK-8e
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2006 06:05:04 -0500
Message-ID: <43DF4402.9090803@intel.com>
Date: Tue, 31 Jan 2006 14:03:30 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>, Nicolas Pitre <nico@cam.org>,
	Jared Hulbert <jaredeh@gmail.com>
References: <625fc13d0601271419o7914b1ddu8a579e87deba9fb5@mail.gmail.com>
In-Reply-To: <625fc13d0601271419o7914b1ddu8a579e87deba9fb5@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, timofey.kutergin@intel.com
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

Jared, Josh

I looked at the map.h code. There is the only one function which 
operates cached regions. It is map_copy_from function.
This function is used for read operations only for almost all flash 
devices.
I found the only device driver which uses map_copy_from for write. It is 
AMDSTD device driver.
Josh I can bet that the cache write issues you faced were on AMDSTD 
devices. All other devices use cached regions in read only mode.
AMDSTD is obsolete and depends on CONFIG_BROKEN.
So functionally we can guarantee read only mode for cache. We can avoid 
data Cache mappings for AMDSTD or fix driver or do nothing because it's 
obsolete.

Nicolas,

Non standardized cache invalidation and mapping is a big issue for the 
kernel. I guess it's possible to provide universal interface for cahce 
operating. I don't think that it is a reason why we have to decline 
cache mapping for flash devices. I think eventually cache interfaces 
will be stadartized. I think we can do this for the first time for the 
ARM platforms. Solution with physmap and mphysmap are very flexible. For 
example we have platforms where the flash type, number of flash devices, 
band width, and map size may vary. The only good solution for these 
cases are physmap and mphysmap drivers.

Thanks,
Alexey

> On 1/27/06, Nicolas Pitre <nico@cam.org> wrote:
> > On Fri, 27 Jan 2006, Josh Boyer wrote:
> >
> > > On 1/27/06, Jared Hulbert <jaredeh@gmail.com> wrote:
> > > > When I first did a patch like this I used a very platform dependent
> > > > embedded assembly loop to _invalidate_ NOT _flush_ the specific
> > > > cachelines possibly affected by the flash program or erase.
> > >
> > > Yep, that would be better.
> >
> > No it wouldn't.  It would quickly become crufty and unreadable as more
> > architectures add their stuff.
>
> /me sighs.
>
> Yes, I misread what Jared had said.  I was solely focusing on
> "_invalidate_ NOT _flush_" and missed the embedded assembly loop part.
>
> I think you're probably right in that there is no clean way to do this
> in a non-platform specific driver.  At least not a way that would be
> worthwhile.
>
> josh
>
