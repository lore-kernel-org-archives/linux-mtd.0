Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BB8HQ-0006TX-4x
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 09:19:28 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Jon Schlueter <jonschl@umd.umich.edu>,
 linux-mtd@lists.infradead.org
Date: Wed, 7 Apr 2004 10:15:16 +0200
References: <Pine.LNX.4.44.0404041514100.12090-100000@kiire.colleduc.ee>
	<200404041421.11425.tglx@linutronix.de> <407355CB.8000602@umd.umich.edu>
In-Reply-To: <407355CB.8000602@umd.umich.edu>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404071015.16985.tglx@linutronix.de>
Subject: Re: CVS compile errors
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 April 2004 03:13, Jon Schlueter wrote:
> Thomas Gleixner wrote:
> > I'm in the middle of an overhaul of nand stuff. I modified the id
> > structure and forgot to adjust the doc stuff. I have a look into it
>
> doc2000.c:415: structure has no member named `page256'

Thanks for pointing it out. I will fix it.

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
