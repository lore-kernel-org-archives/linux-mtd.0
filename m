Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKtLM-0000ei-Vq
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 04:01:04 -0400
Date: Thu, 29 Sep 2005 09:53:44 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Message-ID: <20050929075344.GC16687@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si>
	<20050928100031.GA18192@wohnheim.fh-wedel.de>
	<433AB60D.4090107@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433AB60D.4090107@cetrtapot.si>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 September 2005 17:26:05 +0200, hinko.kocevar@cetrtapot.si wrote:
> Jörn Engel wrote:
> >On Wed, 28 September 2005 11:36:13 +0200, hinko.kocevar@cetrtapot.si wrote:
> >
> >>On new setup - using yesterdays MTD CVS and 2.6.12 kernel with EBS 
> >>enabled:
> >>Mounting flash4 clean partition	[1]
> >>real    0m 3.75s
> >>user    0m 0.02s
> >>sys     0m 1.17s
> >>-- -- -- -- -- -- -- -- -- --
> >>Mounting flash4 dirty partition	[2]
> >>real    0m 0.75s
> >>user    0m 0.02s
> >>sys     0m 0.73s
> >
> >
> >I assume above numbers are for a dirty partition and below for a clean
> >one?
> 
> No.
> 
> I've used the same script - It seemed little weird, but ...
> I'll do more tests in days to come, hopefully I'll be able solve this too.

Then your results don't make sense to me.  Either you made a stupid
mistake when measuring this or you have found something quite
interesting.  Remember, most inventions don't start with the word
"Heureka!" but rather with "This is odd!".

Can anyone verify/falsify?

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918
