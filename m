From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Feb 2003 00:41:47 -0700
Subject: Q: MTD and NIC Roms...
In-Reply-To: <1045117634.9349.19.camel@imladris.demon.co.uk>
References: <m3znp0zqaw.fsf@lnxi.com>
 <1045117634.9349.19.camel@imladris.demon.co.uk>
Message-ID: <m34r78bpac.fsf@lnxi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

David Woodhouse <dwmw2@infradead.org> writes:

> On Thu, 2003-02-13 at 05:45, Eric W. Biederman wrote:
> > Currently I have a patch to eepro100.c that adds an MTD map driver so
> > the onboard rom can be written.  Making code like etherboot easier to
> > flash etc. 
> > 
> > This works by default except when everything is compiled into the
> > kernel.  In the latter case the map driver fails because NIC are
> > initialized before the mtd subsystem.  This can be handled be
> > modifying the link order of the kernel in 2.4. but that is not
> > a pretty situation.
> > 
> > I am currently looking for ideas on ways to cleanly get this code
> > into the kernel, and I am looking for ideas. 
> 
> grep --after-context=15 'BIG UGLY NOTE' drivers/mtd/
> 
> Thankfully, the inter_module_register() abortion is now gone and we can
> fix it all again in 2.5 by reverting to get_module_symbol() as it was
> before.

That one is good to hear.

Eric
