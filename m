Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgTZM-0008N1-RV
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 18:47:16 +0000
Date: Tue, 13 Jan 2004 19:43:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
Message-ID: <20040113184351.GC25159@wohnheim.fh-wedel.de>
References: <20040113125031.GA5146@angel.research.nokia.com>
	<1074001140.17620.3.camel@hades.cambridge.redhat.com>
	<1074007527.9219.11.camel@spawn.uab.ericsson.se>
	<1074007799.17620.60.camel@hades.cambridge.redhat.com>
	<1074010874.9216.28.camel@spawn.uab.ericsson.se>
	<20040113172920.GB25159@wohnheim.fh-wedel.de>
	<1074015609.9220.35.camel@spawn.uab.ericsson.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1074015609.9220.35.camel@spawn.uab.ericsson.se>
cc: David Woodhouse <dwmw2@infradead.org>
cc: "Jarkko Lavinen \(NMP/Helsinki\)" <jarkko.lavinen@nokia.com>
cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 January 2004 18:40:09 +0100, Kenneth Johansson wrote:
> > 
> > But on nand it is not only possible, but also likely that flash size
> > is greater than ram size.  Does your approach still work then?
> 
> Obviously no. But maybe it's still cheaper to do the work in big chunks
> I don't know you need to actually do a test to see what happens. It's
> not so easy to see in advance what will happen. I thought for sure that
> it would be faster to only read what was needed but it was not, at least
> not on a 200 MHz ppc if you have an P4 3GHz the picture is quite
> different.

Could be, at least.  As long as we don't know where the time is lost,
everything else remains guesswork.

Anyway, David's approach sounds quite sane to me.

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
