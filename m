Received: from zoot.lnxi.com ([63.145.151.20])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhDxp-0004tL-GB
	for linux-mtd@lists.infradead.org; Mon, 06 Nov 2006 18:33:19 -0500
Date: Mon, 6 Nov 2006 16:32:52 -0700
From: Ryan Jackson <rjackson@lnxi.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] [MTD] MAPS: Support for BIOS flash chips on the nvidia
	ck804 southbridge
Message-ID: <20061106233252.GD8198@localdomain>
References: <20061031235646.GE5968@localdomain>
	<1162399908.15435.16.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1162399908.15435.16.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy <dedekind@infradead.org> [061101 09:52]:
> I have few questions (may be silly) and comments.

Thanks for the feedback.  Sorry to take so long to reply.

> > +static int __devinit ck804xrom_init_one (struct pci_dev *pdev,
> > +	const struct pci_device_id *ent)
> I wonder why do you use __devinit here, not __init? AFAIK, __devinit is
> used for hotplug-able devices, is this the case for a video card?

Habit, I guess.  Technically the device isn't hotpluggable (unless you
consider ripping the chip off the board hot-plugging).  Some of the
other drivers seem to use __devinit as well, such as scb2_rom.

> > +	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
> So the interface may really be JEDEC and CFI?

I haven't seen any chips used with this southbridge that are detected by
cfi_probe, but the probe is there in case one is used.

> map->map.virt is 'void *', so 
> 
> map->map.virt = window->virt + offset * sizeof(long);
> 
> could be used instead and it looks neater. In gcc sizeof(void) is 1 and
> is is widely used in the kernel.

Actually, I get an oops in jedec_probe_chip if I use this.

> Why you commented out pci_module_init() and the related stuff? Why you
> do not use this standard mechanism?

After talking with the original author, the reason pci_module_init (or
rather pci_register_driver) isn't called is simply a side-effect of
cut-and-paste from an another, earlier driver.  In that driver, it was
not called because A) the mtd code barely touches the device and B)
there was some other driver that wanted to use that device for something
else.

I've changed the code to register and unregister the driver and it seems
to work fine.  I'll re-submit it.

Thanks.

-- 
Ryan Jackson
Linux Networx
