Received: from zproxy.gmail.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2BE4-00070c-WF
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2006 12:48:09 -0500
Received: by zproxy.gmail.com with SMTP id i11so418890nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jan 2006 09:48:03 -0800 (PST)
Message-ID: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
Date: Thu, 26 Jan 2006 11:48:03 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
In-Reply-To: <F92C2EFE7C3BA745855BF7036E1F3F9A018B833E@NNSMSX401>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <F92C2EFE7C3BA745855BF7036E1F3F9A018B833E@NNSMSX401>
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

On 1/26/06, Korolev, Alexey <alexey.korolev@intel.com> wrote:
> Hi All,
>
> Some mapping drivers of linux-mtd has feature of cached mapping. This
> can improve read performance on FLASH significantly .
> I think adding the option of data cache mapping would also be helpful
> for physmap and mphysmap drivers.

Is this a read-only caching?  I know several architectures and
hardware configurations that would quickly throw a machine check if
trying to flush the cache back to flash since they don't support
bursted writes.


> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D
> diff -uNr a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> --- a/drivers/mtd/maps/Kconfig 2005-12-22 15:06:38.000000000 +0300
> +++ b/drivers/mtd/maps/Kconfig 2005-12-22 15:05:24.000000000 +0300
> @@ -60,6 +60,12 @@
>     Ignore this option if you use run-time physmap configuration
>     (i.e., run-time calling physmap_configure()).
>
> +config MTD_PHYSMAP_DCACHE
> + bool "Enable dcache for flash mapping"
> + depends on MTD_PHYSMAP
> + help
> +   This option enables CPU data cache for flash mapping
> +   This improves flash read speed significantly.

I would recommend adding a dependency on ARM for all of this for now.=20
As other architectures are proven to be working, they can be added.


> +#ifdef CONFIG_MTD_MULTI_PHYSMAP_DCACHE
> +        if (map->inval_cache)
> +        {
> +#ifdef CONFIG_ARM
> +           map->cached =3D ioremap_cached(map->phys, map->size);
> +#else
> +           map->cached =3D __ioremap(map->phys, map->size,
> L_PTE_CACHEABLE);
> +#endif

Gah.  The above doesn't work.  L_PTE_CACHEABLE seems to be an ARM only
flag.  And it wouldn't work on PPC for example.  That version of
__ioremap makes everything implicitly cached unless _PAGE_NO_CACHED is
passed in.

As I said before, I would make this an ARM only option for now.

> +#ifdef CONFIG_MTD_PHYSMAP_DCACHE
> +#ifdef CONFIG_ARM
> + physmap_map.cached =3D ioremap_cached(physmap_map.phys,
> physmap_map.size);
> +#else
> + physmap_map.cached =3D __ioremap(physmap_map.phys, physmap_map.size,
> L_PTE_CACHEABLE);
> +#endif

Same issues as in mphysmap.

josh
