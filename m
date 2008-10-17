Date: Fri, 17 Oct 2008 18:43:14 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
Message-ID: <alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: nico@cam.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> > IMHO it's fine if physmap gets additional options, but those extra
> > options should be configured via platform data, and not via the legacy
> > CONFIG_MTD_PHYSMAP_xxx kernel config options.
> 
> How?  Maybe I don't understand what you mean by platform data...
>
It is possible to setup flash physmap parameters in platform driver. In
the case of MainstoneII you just need to specify physmap flash data in mainstone.c 
like this.

static struct physmap_flash_data mst_flash_data = {
	.width = 2,
	.pfow_base = 0x0,
};

static struct resource flash_resources = {
	.start	= PXA_CS0_PHYS,
	.end	= PXA_CS0_PHYS + SZ_128M - 1,
	.flags	= IORESOURCE_MEM,
};

static struct platform_device mst_flash_device = {
	.name		= "physmap-flash",
	.id		= 0,
	.dev = {
		.platform_data = &mst_flash_data,
	},
	.resource = &flash_resources,
	.num_resources = 1,
};

Thanks,
Alexey
