Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQyaW-0007ay-5l
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 15:43:53 +0000
Message-ID: <1484062739.2133.25.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] UBI: Make mtd parameter readable
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Date: Tue, 10 Jan 2017 17:38:59 +0200
In-Reply-To: <da5b6bae-8416-45ac-5153-d1a479715793@nod.at>
References: <20170110125643.10990-1-andriy.shevchenko@linux.intel.com>
 <20170110125643.10990-2-andriy.shevchenko@linux.intel.com>
 <CAFLxGvyTKH-7X0byYOYardGZXGQZtpHTr=aRhqD6WunDqXbneg@mail.gmail.com>
 <1484056111.2133.16.camel@linux.intel.com>
 <71c71f00-dcb1-081b-ec55-bc7c39ad32d5@nod.at>
 <1484057496.2133.18.camel@linux.intel.com>
 <adfd384d-edb7-1255-f614-174a6793a2a8@nod.at>
 <1484058912.2133.22.camel@linux.intel.com>
 <da5b6bae-8416-45ac-5153-d1a479715793@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-01-10 at 16:31 +0100, Richard Weinberger wrote:
> Andy,
> 
> Am 10.01.2017 um 15:35 schrieb Andy Shevchenko:
> > > Did you check? Do other drivers in the kernel that have a parser
> > > behind a non-trivial
> > > module parameter also expose it to user space?
> > 
> > Just checked. The only one which is not, this one.
> > 
> 
> That's an excellent reason. :-)
> But I see also:
> mtd/devices/phram.c:module_param_call(phram, phram_param_call, NULL,
> NULL, 000);
> 
> If these two are the only users of 000, let's rip them out to be
> consistent
> with the rest of the kernel.

Okay, this is full(?) list of those. 3 drivers.

$ git grep -n 'module_param_call(.*, 0\+)' drivers/
drivers/ide/ide.c:277:module_param_call(chs, ide_set_disk_chs, NULL,
NULL, 0);
drivers/ide/ide.c:351:module_param_call(ignore_cable,
ide_set_ignore_cable, NULL, NULL, 0);
drivers/mtd/devices/phram.c:301:module_param_call(phram,
phram_param_call, NULL, NULL, 000);
drivers/platform/x86/thinkpad_acpi.c:9666:      module_param_call(featur
e, set_ibm_param, NULL, NULL, 0); \

$ git grep -n 'module_param_cb(.*, 0\+)' drivers/
drivers/mtd/ubi/block.c:168:module_param_cb(block, &ubiblock_param_ops,
NULL, 0);

I doubt about worth to fix IDE (last time I sent clean up maintainer
told me not to do).

For thinkpad I will look at.

For MTD let's do it now.

So, would you like me to resend with / send separate fix to the other
one?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
