Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18664x-000446-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2002 09:20:59 +0000
Message-Id: <200210280950.g9S9oIs02838@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: parse_cmdline_partitions equivalent for map_info
Date: Mon, 28 Oct 2002 11:56:55 +0100
References: <20021018104910.GA11807@jupiter> <200210231616.g9NGGJs10316@dagobert.svc.sysgo.de> <20021027180001.GA28417@wohnheim.fh-wedel.de>
In-Reply-To: <20021027180001.GA28417@wohnheim.fh-wedel.de>
Cc: Frank Neuber <neuber@convergence.de>, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Am Sonntag, 27. Oktober 2002 19:00 schrieben Sie:
> On Wed, 23 October 2002 18:22:49 +0200, Robert Kaiser wrote:
> >    1) It turned out that there is really not much a concat layer could
> >       sensibly share with the partitioning code. They are indeed closely
> >       related concepts, but only in the sense that each of them is the
> >       opposite to the other :-)
>
> True. All you have to do is grab a couple of partitions and create a
> new device from those.

Basically yes. As usual, the devil is in the details, like when concatenating 
devices of different type with varying erase block sizes, etc. But this seems 
to work pretty well now (though I'm not sure what will happen if someone 
pushes it, e.g. by concatenating NAND and NOR flash..).

> A little performance gets lost, as both concat and partitioning have
> to adjust the offset and do some checks. This could be done just once,
> but I doubt if the performance gain will be noticeable at all.

Yep. I did make a few benchmarks before I comitted the concat stuff (they 
should be somewhere in the mailing list archive). The difference was not 
measurable.

> Sounds interesting enough. Worth a close look, when motivation shows
> up again.

See. That's the problem. Most of the time, people (including myself, btw :-() 
can't afford to spend the additional time required to bring a new concept 
into shape. All we do most of the time is work on an isolated problem (such 
as "add MTD support for platform XYZ"), but there is hardly enough motivation 
to do a true redesign. So we end up copy-pasting mapping drivers. Sooner or 
later, I fear that this will result in a Big Mess(tm).


> > I wouldn't be so sure about that. It seems to me that many of the
> > problems you were facing at the time have been addressed in David's tree
> > in the meantime, albeit with different methods.
>
> I wouldn't know, how. With current partitioning, imagine two devices,
> both with two partitions.
> The first device will get minor 0 for the device and minors 1 and 2
> for the partitions. The second will get 3, 4 and 5.
> Once you create a third partition on the first device, the second will
> have 4, 5 and 6. Can you spell trouble?

Funny, this concept in the partitioning code to not only create but also 
register devices at the same time bothered me too. So I added a small 
modification to it when I checked in the concat code: If you look at function 
add_mtd_partitions() in mtdpart.c you see that the call to add_mtd_device() 
gets bypassed if the caller has passed an mtd object structure to store the 
device descriptor to. So the caller (usually a mapping driver) can do the 
registration of the device if (and when) it sees fit, and it can thus control 
which minor number (if any) will be assigned to a partition. This small 
change has probably gone largely unnoticed since it is compatible with 
existing mapping drivers. Conceptually, it would have been better to do a 
bold re-write of the partitioning code, but at the time I was already boldy 
writing the concat code, so I was reluctant to open yet another can of worms.



>
> This was the main issue with my new partitioning code. That and
> removing those useless mtd-ro devices, they also cause tons of
> problems.

I'm not sure but I seem to remember that removal of the mtd-ro devices has 
been discussed on this list lately. I haven't been following the discussions 
though.

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
