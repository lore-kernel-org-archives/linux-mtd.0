Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHgLS-0002kL-Dk
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 14:12:56 +0000
Date: Wed, 23 Jan 2008 15:06:39 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080123140639.GE24953@lazybastard.org>
References: <20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
	<20080123101915.GA24953@lazybastard.org>
	<Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
	<20080123105713.GC24953@lazybastard.org>
	<Pine.LNX.4.64.0801231248400.25733@lnxricardw.se.axis.com>
	<20080123130144.GD24953@lazybastard.org>
	<Pine.LNX.4.64.0801231410410.25733@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0801231410410.25733@lnxricardw.se.axis.com>
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

On Wed, 23 January 2008 14:16:12 +0100, Ricard Wanderlof wrote:
> >
> >It doesn't really matter whether the data degrades from a number of
> >reads or from time passing.  With a constantly high write rate, there is
> >less time for degradations then with a low write rate.
> 
> If we have a system that is only used (= powered on) rarely, then any 
> degradation from time passing could become significant.

In that case the write rate wouldn't be _constantly_ high. ;)

> The only input I have got from chip manufacturers regarding this issue is 
> that with inreasing bit densities and decreasing bit cell sizes in the 
> future, things like the probability of random bit flips are likely to 
> increase. (Somewhere there is a limit when the amount of error correction 
> needed to handle this things grows too large to make the chip practically 
> useful; say 10 error correction bits per stored bit or whatever).

If error rates increase, device drivers have to do stronger error
correction.  Quality after error correction has been done should stay
roughly the same.

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
