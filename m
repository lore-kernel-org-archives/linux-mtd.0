Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKRIa-0000Ja-6f
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 08:31:09 +0000
Received: by wwb39 with SMTP id 39so1076064wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 01:31:06 -0700 (PDT)
Date: Thu, 12 May 2011 09:31:02 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC PATCH 4/9] nand/denali: split the generic driver and PCI
	layer
Message-ID: <20110512083102.GA2974@pulham.picochip.com>
References: <1304692143-22432-1-git-send-email-jamie@jamieiles.com>
	<1304692143-22432-5-git-send-email-jamie@jamieiles.com>
	<1305187710.2713.61.camel@localhost>
	<1305188149.30435.199.camel@i7.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1305188149.30435.199.camel@i7.infradead.org>
Cc: Jamie Iles <jamie@jamieiles.com>, chuanxiao.dong@intel.com,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 12, 2011 at 09:15:48AM +0100, David Woodhouse wrote:
> On Thu, 2011-05-12 at 11:08 +0300, Artem Bityutskiy wrote:
> > 
> > I do not know for sure, but I bet there is a way to avoid adding
> > another
> > config option. In general - the Linux kernel is overloaded with config
> > options and we try to avoid adding new ones.
> > 
> > Can this be done the following way? - you check if there is a PCI bus,
> > if no - try mmio. If yes, try to discover the device in PCI.
> 
> Better still, support *only* device-tree. The Intel board should have
> been doing that instead of its stupid fake-pci thing anyway, and using
> device properties instead of that stupid hack with putting information
> at an MMIO address.

We don't _yet_ have device tree support on ARM, so that's why I used a 
platform_device.  There are patches circulating at the moment so I guess 
it won't be long though.

The other problem is that x86 doesn't support the clk API and that's 
something we need for our ARM system hence the dependency on HAVE_CLK 
for the MMIO driver.  But these could be stubbed out for X86.

Jamie
