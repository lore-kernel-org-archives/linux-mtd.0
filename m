Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BA6tb-0004CD-VE
	for linux-mtd@lists.infradead.org; Sun, 04 Apr 2004 13:38:40 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Kalev Lember <kalev@colleduc.ee>,
 linux-mtd@lists.infradead.org
Date: Sun, 4 Apr 2004 14:34:44 +0200
References: <Pine.LNX.4.44.0404041514100.12090-100000@kiire.colleduc.ee>
	<200404041421.11425.tglx@linutronix.de>
In-Reply-To: <200404041421.11425.tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404041434.44768.tglx@linutronix.de>
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

On Sunday 04 April 2004 14:21, Thomas Gleixner wrote:
> On Sunday 04 April 2004 14:21, Kalev Lember wrote:
> >
> > And indeed, there is no member named chipshift in nand.h.
>
> I'm in the middle of an overhaul of nand stuff. I modified the id structure
> and forgot to adjust the doc stuff. I have a look into it

Fixed in CVS. cvs up

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
