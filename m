Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Flp5L-0000lQ-Ix
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 11:27:57 -0400
Date: Thu, 1 Jun 2006 17:27:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] avoid unnnecessary mtd read when read can be satisfied by
	write buffer
Message-ID: <20060601152738.GA26319@wohnheim.fh-wedel.de>
References: <447E0FA4.7010201@realmsys.com>
	<20060601143249.GB15216@wohnheim.fh-wedel.de>
	<200606011539.35964.dwmw2@infradead.org>
	<20060601144902.GC15216@wohnheim.fh-wedel.de>
	<1149174307.10909.3.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1149174307.10909.3.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, Kevin Vigor <kevin@realmsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 1 June 2006 16:05:07 +0100, David Woodhouse wrote:
> 
> My point is that for any given problem, raw caching of flash is not the
> answer -- something more cunning is going to be better.

Not necessarily.  JFFS2, all metadata is not just cached, but cannot
even get evicted from cache.  Logfs*) currently doesn't cache metadata
at all, which is fairly bad.  But there is no requirement to pin the
metadata into memory, so it can have a dynamic cache with a shrinker.
And now the caching should be based on a (device, offset) tupel.
Nothing cunning about it, except to decide whether any given offset
contains metadata or file data, which is already cached elsewhere.

*) No code released yet, yadda yadda

Jörn

-- 
The wise man seeks everything in himself; the ignorant man tries to get
everything from somebody else.
-- unknown
