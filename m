Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QOke-0002QU-Nj
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 10:52:12 +0100
Date: Thu, 12 Jun 2003 11:52:37 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20030612095237.GC1718@wohnheim.fh-wedel.de>
References: <3EE752EE.8090902@imc-berlin.de>
	<1055347637.2097.240.camel@passion.cambridge.redhat.com>
	<3EE84317.1090307@imc-berlin.de>
	<1055409538.2097.438.camel@passion.cambridge.redhat.com>
	<3EE8497F.30402@imc-berlin.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EE8497F.30402@imc-berlin.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: MTD <linux-mtd@lists.infradead.org>
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Stopping the GC thread?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 12 June 2003 11:35:59 +0200, Steven Scholz wrote:
> 
> But the impact on system performance done by kupdated is not as 
> critical as the one that's done by the GC intself, is it?

The impact on system performance is practically zero, really.  The
work that GC is doing has to be done anyway.  The only question is,
when will this work be done.

Try the following:
time for i in `seq 10`; do 
	cp $largefile $jffs2;
	sleep 3;
	rm $jffs2/$largefile;
	sleep 3;
done

$largefile should be around 50% or of fs size, roughly.

Run this with and whithout the sleeps.  Notice that the difference it
not just one minute of idle time, it is more in the order of 2,
ignoring the idle time.  And I bet you a fiver that you get the same
order between enabled and disabled GC if you keep the sleep.

GC eats up cpu cycles when the system is idle, so you have more left
when you are under pressure.  And that is a Good Thing(tm).

> >'sector'?  Read http://sources.redhat.com/jffs2/jffs2.pdf 
> I meant flash sectors.

Most people prefer to call them erase blocks or something similar. :)

Jörn

-- 
Everything should be made as simple as possible, but not simpler.
-- Albert Einstein
