Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHfLT-0005Zz-Vy
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 13:08:54 +0000
Date: Wed, 23 Jan 2008 14:01:55 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080123130144.GD24953@lazybastard.org>
References: <20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
	<20080123101915.GA24953@lazybastard.org>
	<Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
	<20080123105713.GC24953@lazybastard.org>
	<Pine.LNX.4.64.0801231248400.25733@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0801231248400.25733@lnxricardw.se.axis.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>, Josh Boyer <jwboyer@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 January 2008 12:57:09 +0100, Ricard Wanderlof wrote:
> 
> Perhaps it's possible to devise something that at least accomplishes part 
> of the goal. Such as when writing a new block, also write some statistical 
> information such as the number of read accesses since the previous write 
> (or power up), or the reason for writing (new data, gc because of 
> bitflips, ...) and a write counter. Something of that nature.

I'm still fairly unconvinced about the read accounting.  We could do
something purely stochastic like accounting _every_ read, but just with
a probability of, say, 1:100,000.  That would still, within statistical
jitter, behave the same for everyone.  But once we depend on the average
mount time of systems, I'm quite unhappy with the solution.

Also, logfs stores a very limited amount of data for each segment (read:
eraseblock).  Currently this is just the erase count, used for wear
leveling and the segment number.  The latter can be used to detect
blocks being moved around by "something", be it an image flasher,
bootloader, FTL or whatever.  There are still 16 bytes of padding in the
structure, so we could add an error counter without breaking the format.

> I'd be a bit wary of this with NAND chips some of which have a 100 000 
> maximum erase/write cycle specification, though. And I think that 
> especially when nearing the maximum value and going beyond it, that there 
> is some bit decay occurring over time and not just from reading.

It doesn't really matter whether the data degrades from a number of
reads or from time passing.  With a constantly high write rate, there is
less time for degradations then with a low write rate.

Problematic would be to have a high write rate for a while, then a very
low write rate that allows data to rot for a long time.  And also this
depends on your numbers being representative for every flash chip. ;)

Jörn

-- 
The only real mistake is the one from which we learn nothing.
-- John Powell
