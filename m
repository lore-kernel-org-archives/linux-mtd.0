Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HQXhd-0006ib-TT
	for linux-mtd@lists.infradead.org; Sun, 11 Mar 2007 19:43:52 -0400
Date: Mon, 12 Mar 2007 00:40:31 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: MTD_PHRAM - what filesystem to use?
Message-ID: <20070311234031.GC17463@lazybastard.org>
References: <20070311200508.GA3362@uranus.ravnborg.org>
	<20070311203122.GB17463@lazybastard.org>
	<20070311210835.GA3794@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070311210835.GA3794@uranus.ravnborg.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 11 March 2007 22:08:35 +0100, Sam Ravnborg wrote:
> > 
> > Write rate is 10kB / 10s * 1.1 = 1.1kB/s.
> > Total written data in 10a is: 1.1kB/s * 31536000s/a * 10a = 346GB
> > Required flash size: 346GB / 100k = 3468kB
> 
> I assume that from a performance point-of-view the FLASH based version
> suffer more than the RAM one - since it is simple to 'erase' RAM.

Not likely.  With the example numbers, 1.1kB/s will be peanuts compared
to flash write bandwidth.  Erases happen ahead-of-time in JFFS2, so
those won't matter much either.  Reads won't matter at all, if you are
looking at 100kB or so - all of that can easily be cached.

If you require a significantly higher write bandwidth, the required
flash size will equally increase.  Who knows, battery backed RAM may be
cheaper than flash due to the required size before the bandwidth becomes
a problem.

Good luck with your design, Sam!

Jörn

-- 
If you're willing to restrict the flexibility of your approach,
you can almost always do something better.
-- John Carmack
