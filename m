Received: from mailout03.sul.t-online.com ([194.25.134.81])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBcc2-0004Xm-Dh
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 17:42:46 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Steven Scholz <steven.scholz@imc-berlin.de>
Date: Thu, 8 Apr 2004 15:19:57 +0200
References: <407547DF.1020404@imc-berlin.de>
	<200404081458.56018.tglx@linutronix.de> <40754F47.9060404@imc-berlin.de>
In-Reply-To: <40754F47.9060404@imc-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404081519.57712.tglx@linutronix.de>
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Changing the number of JFFS2 erasblocks?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 08 April 2004 15:10, Steven Scholz wrote:
>
> We need some place to store a few configuration files (ca. 50KB compressed
> each) for our application. These 320KB are unused so I thought we could use
> it for this dedicated purpose instead of wasting space (and poluting) on
> our root fs...
>
Is this data which changes a lot ? Do you really need a r/w filesystem ?

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
