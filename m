Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 186rZc-0000Vw-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 12:03:49 +0000
Received: from mail.fh-wedel.de ([195.37.86.23])
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 186Bvs-0004gP-00
	for linux-mtd@lists.infradead.org; Mon, 28 Oct 2002 15:36:01 +0000
Date: Mon, 28 Oct 2002 16:30:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Robert Kaiser <rob@sysgo.de>
Cc: Frank Neuber <neuber@convergence.de>, linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021028153051.GB24409@wohnheim.fh-wedel.de>
References: <20021018104910.GA11807@jupiter> <200210231616.g9NGGJs10316@dagobert.svc.sysgo.de> <20021027180001.GA28417@wohnheim.fh-wedel.de> <200210280950.g9S9oIs02838@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200210280950.g9S9oIs02838@dagobert.svc.sysgo.de>
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

On Mon, 28 October 2002 11:56:55 +0100, Robert Kaiser wrote:
> Basically yes. As usual, the devil is in the details, like when concatenating 
> devices of different type with varying erase block sizes, etc. But this seems 
> to work pretty well now (though I'm not sure what will happen if someone 
> pushes it, e.g. by concatenating NAND and NOR flash..).

This should be possible as well, if someone really wants it. The code
for the ECC-NOR-Chips works just fine with the plain NOR-Chips. And it
used quite a bit of the NAND-code.
Don't use any oob-data for nand, create large erase blocks, do use
write pages of 512 bytes and things should be working.

If someone really wants it. ;-)

> See. That's the problem. Most of the time, people (including myself, btw :-() 
> can't afford to spend the additional time required to bring a new concept 
> into shape. All we do most of the time is work on an isolated problem (such 
> as "add MTD support for platform XYZ"), but there is hardly enough motivation 
> to do a true redesign. So we end up copy-pasting mapping drivers. Sooner or 
> later, I fear that this will result in a Big Mess(tm).

Features cost 20%, cleaning them up costs 80%. That is a lot of work
to be saved in the short term, I know.

> > I wouldn't know, how. With current partitioning, imagine two devices,
> > both with two partitions.
> > The first device will get minor 0 for the device and minors 1 and 2
> > for the partitions. The second will get 3, 4 and 5.
> > Once you create a third partition on the first device, the second will
> > have 4, 5 and 6. Can you spell trouble?
> 
> Funny, this concept in the partitioning code to not only create but also 
> register devices at the same time bothered me too. So I added a small 
> modification to it when I checked in the concat code: If you look at function 
> add_mtd_partitions() in mtdpart.c you see that the call to add_mtd_device() 
> gets bypassed if the caller has passed an mtd object structure to store the 
> device descriptor to. So the caller (usually a mapping driver) can do the 
> registration of the device if (and when) it sees fit, and it can thus control 
> which minor number (if any) will be assigned to a partition. This small 
> change has probably gone largely unnoticed since it is compatible with 
> existing mapping drivers. Conceptually, it would have been better to do a 
> bold re-write of the partitioning code, but at the time I was already boldy 
> writing the concat code, so I was reluctant to open yet another can of worms.

Interesting idea. I still the my approach, which is the same as for
hard disks. n bits describe the device, m bits describe the partition
therein, n+m=8 in our case.
It has always bothered me that a user had no way to tell, whether she
was dealing with a device or a partition. That is quite
counter-intuitive. And the result is bugs caused by false assumptions,
education lessons,... I've spend weeks on that sort of stuff. :-(

> > This was the main issue with my new partitioning code. That and
> > removing those useless mtd-ro devices, they also cause tons of
> > problems.
> 
> I'm not sure but I seem to remember that removal of the mtd-ro devices has 
> been discussed on this list lately. I haven't been following the discussions 
> though.

Yes, that was between David and myself. My second try to get the code
merged, stopped due to lack of test hardware. Two weeks later, uml was
working on my machine, but I didn't receive _any_ feedback meanwhile.
That was, when I lost my motivation, I guess.

Jörn

-- 
Fantasy is more important than knowlegde. Knowlegde is limited,
while fantasy embraces the whole world.
-- Albert Einstein
