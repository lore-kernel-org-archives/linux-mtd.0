Received: from mo-p07-ob.rzone.de ([81.169.146.188])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H7bLF-0001bo-Qy
	for linux-mtd@lists.infradead.org; Thu, 18 Jan 2007 12:46:29 -0500
Date: Thu, 18 Jan 2007 18:46:03 +0100 (MET)
From: Stefan Roese <ml@stefan-roese.de>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [PATCH] [MTD] physmap: Add support for 64 bit resources on PPC44x
References: <200701181808.11143.ml@stefan-roese.de>
	<45AFAD41.4030801@ru.mvista.com>
In-Reply-To: <45AFAD41.4030801@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200701181846.21776.ml@stefan-roese.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

On Thursday 18 January 2007 18:24, Sergei Shtylyov wrote:
> > This patch adds support for 64 bit resources and can be used on
> > PPC440 platforms to pass the complete 64 bit address from the
> > platform file to the physmap driver. This is first used on the
> > AMCC Taishan 440GX evaluation board.
>
>     Is this board support in arch/ppc/ or arch/powerpc/?

Not yet in the kernel.org repository. It's right now in the denx repository 
but I plan to sent the board support patches to the lists, even if I know, 
that it most likely won't get included right now, because of the ppc->powerpc 
merge.

And yes, it's still an "arch->ppc" port.

> > Signed-off-by: Stefan Roese <sr@denx.de>
> >
> > ---
> > commit 428858620a600f991662969be6d6b3e3720da1ac
> > tree cf3c861fbdddd841401a1e66f441623f0b3fb83c
> > parent d637c5644df789f15dfe06550fab1dddb87083ca
> > author Stefan Roese <sr@denx.de> Thu, 18 Jan 2007 14:40:53 +0100
> > committer Stefan Roese <sr@denx.de> Thu, 18 Jan 2007 14:40:53 +0100
> >
> >  drivers/mtd/maps/physmap.c |    7 +++++++
> >  1 files changed, 7 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
> > index d171776..23072e3 100644
> > --- a/drivers/mtd/maps/physmap.c
> > +++ b/drivers/mtd/maps/physmap.c
> > @@ -116,7 +116,14 @@ static int physmap_flash_probe(struct
> > platform_device *dev)
>
>     And what do you assign to info->map.phys, a meaninglessly truncated
> 64-bit address?
>     I think that 'phys' field's type should be changed to a more
> appropriate one, like resource_size_t, instead...

Yes, this makes sense.

> >  	info->map.bankwidth = physmap_data->width;
> >  	info->map.set_vpp = physmap_data->set_vpp;
> >
> > +#ifdef CONFIG_44x
>
>     Don't think we need this #ifdef at all.
>
> > +	if (sizeof(dev->resource->start) == 4)
> > +		info->map.virt = ioremap(info->map.phys, info->map.size);
>
>     This line is meaningless duplication of the existing one (below #else).
>
> > +	else
> > +		info->map.virt = ioremap64(dev->resource->start, info->map.size);
>
>     I see -- this is arch/ppc/... :-)
>     Wait, ioremap() takes phys_addr_t which should be 64-bit in your case.
> Is there the need to call ioremap64()?

Yes, but ioremap() first call fixup_bigphys_addr() and this unfortunately 
corrupts my addresses.

I know this patch is far from perfect, so any suggestions are very welcome.

Thanks.

Best regards,
Stefan
