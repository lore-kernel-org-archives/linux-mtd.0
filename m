Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KIKq-0006Am-LP
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 14:48:21 +0100
Date: Mon, 26 May 2003 15:48:52 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030526134852.GA18612@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<20030522195708.GB11240@wohnheim.fh-wedel.de>
	<004101c3214d$223c9560$740486da@w0a3t0>
	<20030526094050.GA30361@wohnheim.fh-wedel.de>
	<1053942836.17182.83.camel@imladris.demon.co.uk>
	<20030526101918.GA11734@wohnheim.fh-wedel.de>
	<20030526123500.GA12485@wohnheim.fh-wedel.de>
	<1053956308.17182.88.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1053956308.17182.88.camel@imladris.demon.co.uk>
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

On Mon, 26 May 2003 14:38:28 +0100, David Woodhouse wrote:
> On Mon, 2003-05-26 at 13:35, Jörn Engel wrote:
> > A workmate of mine had another good point.  The mutex and workspace
> > could be two arrays instead, with one member per CPU.  That way, we
> > don't need a CONFIG_TINY option and the code scales automatically from
> > small embedded to multi-gigabyte SMP.
> 
> Assuming you add a preempt_disable()... in one of the pieces of code
> which was one of the main culprits for non-voluntary scheduling anyway.

Good point!

preempt_disable();
down();
//long processing time
up();
preempt_enable();

That way, preemption will be turned of on all CPUs for a long time,
doesn't sound too inviting.  But until preemption is able to be
(en|dis)abled for the current CPU only, I will ignore that problem.

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
