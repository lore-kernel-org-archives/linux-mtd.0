Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KJGD-0006fD-AU
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 15:47:37 +0100
Date: Mon, 26 May 2003 16:48:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030526144807.GC18612@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<20030522195708.GB11240@wohnheim.fh-wedel.de>
	<004101c3214d$223c9560$740486da@w0a3t0>
	<20030526094050.GA30361@wohnheim.fh-wedel.de>
	<1053942836.17182.83.camel@imladris.demon.co.uk>
	<20030526101918.GA11734@wohnheim.fh-wedel.de>
	<20030526123500.GA12485@wohnheim.fh-wedel.de>
	<1053956308.17182.88.camel@imladris.demon.co.uk>
	<20030526134852.GA18612@wohnheim.fh-wedel.de>
	<1053957469.17182.90.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1053957469.17182.90.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 May 2003 14:57:49 +0100, David Woodhouse wrote:
> > preempt_disable();
> > down();
> 
>  // which causes BUG() due to scheduling with preemption disabled.
> 
> > //long processing time
> > up();
> > preempt_enable();
> > 
> > That way, preemption will be turned of on all CPUs for a long time,
> 
> Is that true? I thought not.

No, it isn't.  Sometimes I tend to misread things.  But still, the new
design appears to be better, imho.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
