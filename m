Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqtdo-0007BT-Ij
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 18:01:37 +0000
Date: Fri, 17 Oct 2008 20:01:35 +0200
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
Message-ID: <20081017180135.GA4129@xi.wantstofly.org>
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, nico@cam.org,
	David Woodhouse <dwmw2@infradead.org>,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 17, 2008 at 10:27:47AM -0700, Jared Hulbert wrote:

> > IMHO it's fine if physmap gets additional options, but those extra
> > options should be configured via platform data, and not via the legacy
> > CONFIG_MTD_PHYSMAP_xxx kernel config options.
> 
> How?  Maybe I don't understand what you mean by platform data...

There are two ways to instantiate physmap-flash:

1. By setting the legacy CONFIG_MTD_PHYSMAP_xxx kernel config options, eg:

	arch/blackfin/configs/BF537-STAMP_defconfig:CONFIG_MTD_PHYSMAP=m
	arch/blackfin/configs/BF537-STAMP_defconfig:CONFIG_MTD_PHYSMAP_START=0x20000000
	arch/blackfin/configs/BF537-STAMP_defconfig:CONFIG_MTD_PHYSMAP_LEN=0x0
	arch/blackfin/configs/BF537-STAMP_defconfig:CONFIG_MTD_PHYSMAP_BANKWIDTH=2


2. By instantiating a physmap plaform device in your platform code, eg
   arch/arm/mach-iop32x/glantank.c:

	static struct physmap_flash_data glantank_flash_data = {
		.width		= 2,
	};

	static struct resource glantank_flash_resource = {
		.start		= 0xf0000000,
		.end		= 0xf007ffff,
		.flags		= IORESOURCE_MEM,
	};

	static struct platform_device glantank_flash_device = {
		.name		= "physmap-flash",
		.id		= 0,
		.dev		= {
			.platform_data	= &glantank_flash_data,
		},
		.num_resources	= 1,
		.resource	= &glantank_flash_resource,
	};

	platform_device_register(&glantank_flash_device);


(2) is the preferred way, and (1) only still exists because of backward
compatibility.  If we want to add new options to physmap, we shouldn't
introduce new kernel config options but just convert prospective users
over to (2) while we're at it.
