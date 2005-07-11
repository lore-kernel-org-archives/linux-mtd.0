Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Drtgo-0005LM-Ob
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2005 04:31:02 -0400
Received: from ep_mmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IJG0091QFM30N@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 11 Jul 2005 17:30:03 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0IJG00C0LFM33V@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 11 Jul 2005 17:30:03 +0900 (KST)
Date: Mon, 11 Jul 2005 17:30:05 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <1121068041.26713.309.camel@tglx.tec.linutronix.de>
To: tglx@linutronix.de
Message-id: <0IJG00C0MFM33V@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND MTD support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> > > 
> > > +EXPORT_SYMBOL(onenand_scan);
> > > +EXPORT_SYMBOL(onenand_release);
> > > 
> > > Would you mind to change those exports to EXPORT_SYMBOL_GPL ?
> > 
> > In fact I not sure and also don't know license issue. 
> > If we develop the some commercial mtd user software then 
> can we use mtd
> > device code exported with GPL? Is there no problem?
> 
> User space software is not concerned of kernel licences.
> 
> If you talk about a proprietary closed source kernel module 
> which needs
> those exports, you are stepping into a legal grey area 
> regardless of the
> exports style. I don't see a point where it makes sense to 
> have a closed
> source board driver, as it just initializes a data structure and calls
> generic handling code. 
> 

OK
 
> 
> Some nitpicks though
> 
> +	/* The 10 msec is enough */
> +	timeout = jiffies + msecs_to_jiffies(10);
> +	while (time_before(jiffies, timeout)) {
> 
> On CPU's which have HZ=100 (1 jiffy == 10ms) this might be 
> critical, as
> you might set the timeout immidiately before the timer interrupt
> happens. Using a 20ms timeout will keep you on the safe side 
> in any case

No problem.

> 
> 
> Please clean up your includes to avoid redundant includes of header
> files.

which one do you mean?
Are there not required header file?


Regards

Kyungmin Park.
