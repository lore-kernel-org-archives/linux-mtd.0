Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 199Mq2-0005TT-3R
	for <linux-mtd@lists.infradead.org>; Sat, 26 Apr 2003 11:23:22 +0100
Date: Sat, 26 Apr 2003 12:23:23 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
Message-ID: <20030426102323.GB31391@wohnheim.fh-wedel.de>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030423204440.258661528E@desire.actrix.co.nz>
	<000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
	<20030425130134.GC27144@wohnheim.fh-wedel.de>
	<000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
	<1051312243.1172.388.camel@tubarao>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1051312243.1172.388.camel@tubarao>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: Alex Samoutin <samoutin@hotbox.ru>
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 April 2003 17:10:43 -0600, Thayne Harbaugh wrote:
> 
> The big question is how common is this problem (needing retries)? 
> Should this be more formalized and added to he chip drivers or should it
> be left up to individuals having to fix things for their special or less
> common cases?

This looks more like an implementation problem. If you manage to add
retry code somewhere central so that all drivers benefit from it,
there should hardly be a performance hit, even for drivers that don't
need it. And once in a central place, it would be trivial to add a
config option for this.

But someone has to do it. :)

Jörn

-- 
You can't tell where a program is going to spend its time. Bottlenecks
occur in surprising places, so don't try to second guess and put in a
speed hack until you've proven that's where the bottleneck is.
-- Rob Pike
