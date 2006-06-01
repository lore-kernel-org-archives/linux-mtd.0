Subject: Re: [PATCH] avoid unnnecessary mtd read when read can be satisfied
	by write buffer
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060601144902.GC15216@wohnheim.fh-wedel.de>
References: <447E0FA4.7010201@realmsys.com>
	<20060601143249.GB15216@wohnheim.fh-wedel.de>
	<200606011539.35964.dwmw2@infradead.org>
	<20060601144902.GC15216@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Jun 2006 16:05:07 +0100
Message-Id: <1149174307.10909.3.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Kevin Vigor <kevin@realmsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-06-01 at 16:49 +0200, Jörn Engel wrote:
> One of the observations was that a lot of flash is being read multiple
> times.  Reads on NAND happen in page granularity, so first we have to
> read pretty much everything during scan, later again when accessing
> the actual files.  There is some room for savings, as RAM is faster
> than flash even in the real world. 

My point is that for any given problem, raw caching of flash is not the
answer -- something more cunning is going to be better.

The specific cases of dirents and symlinks I already talked about. Any
other time we keep reading the same bit of flash over and over again is
also a problem. The one you mention is fixed by using eraseblock
summary.

I need to finish what I was doing yesterday, which halves the amount of
space taken by summaries. We should probably also remove the dependency
on EXPERIMENTAL.

-- 
dwmw2
