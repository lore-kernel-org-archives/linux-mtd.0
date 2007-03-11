Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HQUlV-0004pj-BH
	for linux-mtd@lists.infradead.org; Sun, 11 Mar 2007 16:35:40 -0400
Date: Sun, 11 Mar 2007 21:31:22 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: MTD_PHRAM - what filesystem to use?
Message-ID: <20070311203122.GB17463@lazybastard.org>
References: <20070311200508.GA3362@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070311200508.GA3362@uranus.ravnborg.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 11 March 2007 21:05:08 +0100, Sam Ravnborg wrote:
> 
> At my new job we are planning to start usign a ARM9 based
> design where we need to store data persistently.
> 
> Since the data are updated several times / minute the FLASH
> devices are not suitable and therefore alternative solutions
> are being looked at.
> 
> The most promising solutions semms to use battery
> backed-up RAM.
> >From Linux we could memorymap this area but using a filesystem
> gives all sorts of extra bonusses so this is preferred.
> 
> I looked shortly at PRAMFS that seems to do the trick but PRMFS
> seems unmaintained and not merged.
> Then I stumbled over PHRAM.
> I and pretty clear upon the basic parts lettign the RAM look
> like any other FLASH device.
> But then the question popped up.
> 
> What is the best filesystem to use on top of a PHRAM based
> MTD device?
> My first two ideas were to use either JFFS2 or ext2
> (the latter with the blocklayer emulation).
> But reading the documentation both looks like overkill.
> 
> The requirement so far is to gain maximum bebefit of the
> avalable 100 kbytes of RAM.
> There will be a limited number of files (< 500).

If you decide on battery-backed RAM, the PHRAM/JFFS2 combo would be the
best existing solution.  Alternatively you could write a custom
filesystem.

With JFFS2 you should carefully decide on a suitable erasesize.  The
JFFS2 overhead can be minimized by tuning this number.  Most likely
something small, 4KiB or 8KiB is optimal.

Yet another alternative would be to use flash.  The math is quite
simple.  Example calculation:
Update interval: 10s
Updated data size: 10kB
Required device lifetime: 10a
JFFS2 overhead: 10%
Flash durability: 100k erases

Write rate is 10kB / 10s * 1.1 = 1.1kB/s.
Total written data in 10a is: 1.1kB/s * 31536000s/a * 10a = 346GB
Required flash size: 346GB / 100k = 3468kB

So with the example numbers, you would only need a 4MiB flash chip.
Those should be rather cheap.  But it remains your duty to redo the
calculation with correct numbers and check for any mistakes I may have
made.

Also make sure that your supplier guarantees 100k erases on the flash.
At 10k erases, you would need a device 10x bigger.  1M erases, if
available, are even better.

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
