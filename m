Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zfoD-0007oP-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 15:28:21 +0100
To: "Alex Lennon" <ajlennon@arcom.co.uk>
Cc: "Eric W. Biederman" <ebiederman@lnxi.com>,
        "David Woodhouse" <dwmw2@infradead.org>,
        <linux-mtd@lists.infradead.org>
Subject: Re: CPU caching of flash regions.
References: <NEBBKJHOALKOLCFPGELEMEPACKAA.ajlennon@arcom.co.uk>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 15 May 2001 08:32:21 -0600
In-Reply-To: "Alex Lennon"'s message of "Tue, 15 May 2001 11:46:10 +0100"
Message-ID: <m3sni6r8cq.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

"Alex Lennon" <ajlennon@arcom.co.uk> writes:

> Eric,
> 
> > Actually, the board used for the offending profile is a board with paged
> > access to the flash, so it's slightly slower than some others - but the
> > overhead shouldn't be too high. And the cache benefit would be more
> limited.
> 
> > What kind of chip is being used?
> 
> Two contiguous Intel Strataflash 28F640's giving 16Mb total
> 
> > What bus is it on?
> 
> ISA
> 
> > And how fast is it?
> 
> 8Mhz

> 
> > Second. What kind of processor, and what kind of chipset are being used?
> 
> National Geode GX1 300Mhz with CS5530 support chipset
> 
> To generate some figures I knocked together code which reads the 16Mb from
> the flash, paging as it goes. Nothing is done with the data. This takes
> about 16s

O.k.  A really crude estimate places ISA at about 8Megabytes/sec.  
With protocol overhead you can probably only get maybe a 1/3 of that, but
I suspect your pure read case is bottlenecking on the chip read speed,
and not the ISA bus.

With these numbers it is easy to see that jffs2 is not being
bottlenecked by the flash chip.  There is internal overhead, and a
300Mhz processor should be fast enough that mildly inefficent
algorithms shouldn't show up.

> With the hardcoded value of CONFIG_JFFS2_FS_DEBUG set to 2 in
> fs/jffs2/nodelist.h
> I get jffs2 root fs mount times in excess of 34s.
> 
> When I remove the debugging I get mount times of around 26s
> 
> Obviously the figures obtained from df need some massaging to take account
> of compression
> but I get:
> 
> /dev/root                14336      3760     10576  26% 	/
> /dev/mtdblock1            1280       644       636  50% 	/var
> /dev/ram0 3963 26 3733 1% /var/tmp
> 
> 
> So what does this mean ? Can I expect a fourfold increase in mount time with
> a full f/s ?
> Should I be comparing a 26s jffs2 mount to an idealistic 4s 4Mb
> flash read ?

Someone who knows jffs2 whill have to comment on what is going on but
there is some significant overhead here.

Eric
