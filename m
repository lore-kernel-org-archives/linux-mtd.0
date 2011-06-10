Received: from nm3.access.bullet.mail.mud.yahoo.com ([66.94.237.204])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QVLEr-0008O9-ER
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 10:16:23 +0000
From: Brian Walsh <brian@walsh.ws>
To: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
Subject: Re: Question reg. parsing of mtd partitions
Date: Fri, 10 Jun 2011 08:49:28 -0400
References: <20110609083419.GA23553@doriath.ww600.siemens.net>
	<4DF08D79.9090707@gmail.com>
	<BANLkTi=rBr0YS9vApbhTGJLEWAsfWWu8Fg@mail.gmail.com>
In-Reply-To: <BANLkTi=rBr0YS9vApbhTGJLEWAsfWWu8Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201106100849.29032.brian@walsh.ws>
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org,
	Deepak Sanexa <dsanexa@mvista.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, June 09, 2011 05:23:31 am Dmitry Eremin-Solenikov wrote:
> On 6/9/11, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> > On 09.06.2011 12:34, Dmitry Eremin-Solenikov wrote:
> >> Hello, colleagues,
> >>
> >> While doing MTD partitions cleanup I noticed one strange thing.
> >> parse_mtd_partitions function bears one extra argument (origin)
> >> which isn't clearly described, set to non-zero only by ixp4xx.c
> >> driver and then read by redboot partition table handling. I wander if we
> >> can add some other way to handle this situation and drop this extra 0
> >> argument from lots of drivers/handlers/etc.
> >>
> >> Could you please check it?
> >
> > At least the ixp4xx part was added by commit f40a6f1cc7fe522,
> > back in 2006:
> >
> > If the amount of flash is not divisible by 2 then the mask in
> > parse_mtd_partitions would fail to work as designed.  Passing in the
> > base address corrects this problem.
> 
> Found the original patch/report at
> http://thread.gmane.org/gmane.linux.ports.arm.kernel/24662
> 
> Awaiting for comments on this.
> 

The problem apparently only affects ixp4xx based boards running RedBoot as a 
boot loader. I thought that it should possibly go as a fix in 
drivers/mtd/redboot.c but I found the dev->resource->start parameter to 
parse_mtd_partitions to be the most graceful at the time.

RedBoot on ixp4xx based boards starts flash addresses at 0x50000000 which Linux
then starts at 0. So the partition table address entries are all offset by the 
RedBoot start point.

I may be the only one who actually ran into the problem. I was working with a 
modified design that only had 48MB of flash. So as far as I am concerned it can
be dropped. If every other board is using zero for that parameter it seems like
it would make more sense to handle this condition in drivers/mtd/redboot.c?

Brian
