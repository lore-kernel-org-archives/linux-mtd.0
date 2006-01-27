Received: from petasus.ims.intel.com ([62.118.80.130])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2Va7-0002yE-Cm
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 10:32:16 -0500
Message-ID: <43DA3CDF.5050202@intel.com>
Date: Fri, 27 Jan 2006 18:31:43 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
In-Reply-To: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
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

Josh,

Thanks a lot for your feedback.


Josh Boyer wrote:

> On 1/26/06, Korolev, Alexey <alexey.korolev@intel.com> wrote:
> > Hi All,
> >
> > Some mapping drivers of linux-mtd has feature of cached mapping. This
> > can improve read performance on FLASH significantly .
> > I think adding the option of data cache mapping would also be helpful
> > for physmap and mphysmap drivers.
>
> Is this a read-only caching?  I know several architectures and
> hardware configurations that would quickly throw a machine check if
> trying to flush the cache back to flash since they don't support
> bursted writes.
>
In general case not.  I've never heard about the such issue. Is there 
any way to define has platform flash devices with bursted writes or not?
What architectures have this problem?

> I would recommend adding a dependency on ARM for all of this for now.
> As other architectures are proven to be working, they can be added.
>
Oh. It's a good point. I'll add ARM dependency to Kconfig file. Thanks.

> > +#ifdef CONFIG_MTD_MULTI_PHYSMAP_DCACHE
> > +        if (map->inval_cache)
> > +        {
> > +#ifdef CONFIG_ARM
> > +           map->cached = ioremap_cached(map->phys, map->size);
> > +#else
> > +           map->cached = __ioremap(map->phys, map->size,
> > L_PTE_CACHEABLE);
> > +#endif
>
> Gah.  The above doesn't work.  L_PTE_CACHEABLE seems to be an ARM only
> flag.  And it wouldn't work on PPC for example.  That version of
> __ioremap makes everything implicitly cached unless _PAGE_NO_CACHED is
> passed in.
>
> As I said before, I would make this an ARM only option for now.
>
> > +#ifdef CONFIG_MTD_PHYSMAP_DCACHE
> > +#ifdef CONFIG_ARM
> > + physmap_map.cached = ioremap_cached(physmap_map.phys,
> > physmap_map.size);
> > +#else
> > + physmap_map.cached = __ioremap(physmap_map.phys, physmap_map.size,
> > L_PTE_CACHEABLE);
> > +#endif
>
> Same issues as in mphysmap.
>
> josh
>
Thanks,
Alexey
