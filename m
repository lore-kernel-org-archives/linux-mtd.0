Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KKa3-0006w6-7C
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 17:12:11 +0100
Date: Mon, 26 May 2003 18:12:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030526161242.GD18612@wohnheim.fh-wedel.de>
References: <20030522195708.GB11240@wohnheim.fh-wedel.de>
	<004101c3214d$223c9560$740486da@w0a3t0>
	<20030526094050.GA30361@wohnheim.fh-wedel.de>
	<1053942836.17182.83.camel@imladris.demon.co.uk>
	<20030526101918.GA11734@wohnheim.fh-wedel.de>
	<20030526123500.GA12485@wohnheim.fh-wedel.de>
	<1053956308.17182.88.camel@imladris.demon.co.uk>
	<20030526134852.GA18612@wohnheim.fh-wedel.de>
	<1053957469.17182.90.camel@imladris.demon.co.uk>
	<20030526143324.GB18612@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030526143324.GB18612@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: linux-mtd@lists.infradead.org
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 May 2003 16:33:24 +0200, Jörn Engel wrote:
> 
> How about the following:
> 
> static int workspace_pid[some];
> 	...
> 	for (i=0; i<some; i++) {
> 		if (likely(workspace_pid[i] == current_pid))
> 			break;
> 	}

Why do I always have to produce 90% crap before the other 10% come
out?  Ok, ok, don't tell me! ;)

The information, which workspace belongs to which process can be put
into the z_stream.  That removes the ugly code above.  The
information, which workspaces are still free can now be put into
bit-array, aka long and the loop be replaces with fls().

This design should perform as good as the current one in the worst
case and a lot better for SMP and several parallel zlib processes
currently on the same semaphore.

Maybe this time, the design is complete.  Any comments before the
patch is finished and benchmarks prove me right or wrong?

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
