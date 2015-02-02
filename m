Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIDBP-0005Yx-EF
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 09:20:40 +0000
Received: by mail-pa0-f54.google.com with SMTP id eu11so80110821pac.13
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 01:20:17 -0800 (PST)
Date: Mon, 2 Feb 2015 01:20:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH] mtd: avoid registering reboot notifier twice
Message-ID: <20150202092013.GG3523@norris-Latitude-E6410>
References: <1422752930-696-1-git-send-email-nks@flawful.org>
 <20150201230723.GA3523@norris-Latitude-E6410>
 <54CF2261.1040707@flawful.org>
 <alpine.DEB.2.02.1502020958310.11532@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1502020958310.11532@lnxricardw1.se.axis.com>
Cc: Niklas Cassel <nks@flawful.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 02, 2015 at 10:01:51AM +0100, Ricard Wanderlof wrote:
> 
> > On 02/02/2015 12:07 AM, Brian Norris wrote:
> > >
> > > No driver should be calling mtd_device_parse_register() multiple times
> > > on the same mtd_info. Under what context do you see this? What driver?
> > arch/cris/arch-v32/drivers/axisflashmap.c
> 
> Looking at it another way, why should it not be allowed, if the only 
> thing stopping it from working is Niklas' fix below?

It severely breaks the way that normal MTD partition parsers work, for
one. cmdlineparts could never be sanely applied here, for instance.

> If there are multiple 
> ways a driver can acquire partitioning information, it is handy to be able 
> to do mtd_device_parse_register() several times, rather than collecting 
> all the partitioning information in one place and doing the call there, 
> which I suppose would be the alternative.

It may be handy, but it breaks the abstraction that is established in
most every other case, that partitions are determined by exactly one
source: a single list from platform data, device tree, the kernel
command line, or an on-flash parser (e.g., RedBoot, bcm47xxpart, etc.).

> I've noted that mtd/nand/diskonchip.c does it too:
> 
>         mtd_device_register(mtd, NULL, 0);
>         if (!no_autopart)
>                 mtd_device_register(mtd, parts, numparts);
> 
> but this driver might be essentially deprecated, I don't know.

Yeah, I just noticed that one too.

TBH, I'm not sure the reboot notifier patch places that code in the best
place anyway. There really is no central initialization code for the
'master' mtd_info struct, as this initialization is handled ad-hoc in
every single MTD driver. It just happens that the partition
parsing/registration function fit nicely as the one place that (almost)
all MTD master devices got registered. But this just exposed yet another
instance where my assumptions are challenged.

There's so much legacy crap in MTD that sometimes I wonder why I even
bother...

Brian
