Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CyVLe-00065O-2O
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 08:24:11 -0500
Date: Tue, 8 Feb 2005 14:23:54 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Charles Manning <manningc2@actrix.gen.nz>
Message-ID: <20050208132354.GA21515@wohnheim.fh-wedel.de>
References: <54CC136E5398384485619BC34B3A0F0B055D0DB0@ma00exh02.atitech.com>
	<20050207195209.GC25504@wohnheim.fh-wedel.de>
	<20050208001528.C613F409A@blood.actrix.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050208001528.C613F409A@blood.actrix.co.nz>
Cc: linux-mtd@lists.infradead.org, Matthew Cole <mcole@ati.com>
Subject: Re: Follow-up to wearing / caching question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 February 2005 13:22:23 +1300, Charles Manning wrote:
> 
> 20 year product life? Really? What stuff are you still using that was first 
> plugged in in 1985?

Most likely some old mainframes.  But even for them it'd be a long
life.

> There are two factors which skew this:
> 
> 1) Garbage collection. Depending on the way the files are rewritten and freed 
> up, different amounts of garbage collection rewrites will be performed. Worst 
> case GC can drive up the number of writes.
> 
> 2) "Squatter files". Some files live a long time and some are transient. 
> Those that live a long time will tend to take up "squatters rights" on an 
> area of flash which means that the rest gets written more often.

I guess dwmw2's approach to split up writes between two erase blocks
would solve both issues.  GC'd data can be expected to be rather
long-living, so it goes to a different block than newly written data.

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown
