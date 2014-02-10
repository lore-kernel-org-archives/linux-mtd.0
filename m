Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCsC1-0006Ke-RU
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 14:50:43 +0000
Message-ID: <1392043814.32363.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 10 Feb 2014 16:50:14 +0200
In-Reply-To: <20140210142026.GB15607@localhost>
References: <52F6BA07.60707@nod.at> <20140208231501.GG22376@1wt.eu>
 <52F6BCCD.5070302@nod.at> <20140208233758.GH22376@1wt.eu>
 <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-02-10 at 11:20 -0300, Ezequiel Garcia wrote:
> On Mon, Feb 10, 2014 at 09:46:16AM +0100, Willy Tarreau wrote:
> > > > 
> > > > If write support has 0 or 1.5 customers and it was not tested
> > > > extensively, and never used in any kind of production, I am not sure it
> > > > is needed to be there. But let's first hear your answers.
> > > > 
> > > 
> > > No, this hasn't been tested intensively and I'm pretty sure nobody would
> > > ever put it in production before conducting such tests himself.
> > 
> > For sure, but conversely, disabling it in the code would result in
> > nobody ever testing it !
> > 
> 
> I agree completely and it's why I wanted to have it available.
> 
> > > 
> > > If you really think distros will enable it and users will "just it", without
> > > thinking about the consequences, then I'd say let's just remove it.
> > 
> > In my opinion, this would result in users falling back to mtdblock as
> > they currently to when they want a block device. This is even worse.
> > 
> > I'd really like to have this feature as a standard one, it shortens
> > the gap which exists between MTD and eMMC which is becoming more and
> > more common these days, precisely because of the difficulty to deal
> > with NAND directly while eMMC provides the abstraction which offers
> > more flexibility.
> > 
> 
> Artem, I'd say it's your call. Want me to drop write support or not?

I guess what I am concerned of more now is not the feature, since at
least Willy used is.

I am concerned of a kernel option. All these little tiny compile-time
options are so annoying. We have so many of them.

I'd say, either support write or not.

If you support it, document its limitations in mtd-www. Print a run-time
warning that it is not power-cut-safe on module initialization, after
all. Let others improve it later if needed.

Or mark R/W as experimental and make your module to be R/O by default.
Force people to use 'blockdev --setro' if they want R/W. Run-time.

But do not add anther tiny little Kconfig option.

Just like the option for the cache that you added - please, try to make
it go away. Have only one single option - enable or disable the entire
driver.

How does this sound?

And I understand your concerns about stalling. I do not have time to
carefully review your patch. It looks good in general. And I do not know
if I will have time for review or not. I hope I will soon. But even if I
won't, I am thinking to just merge it to my tree for 3.14 anyway, unless
someone rises a blocking concern.

How does this sound?

-- 
Best Regards,
Artem Bityutskiy
