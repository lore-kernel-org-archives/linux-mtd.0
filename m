Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gRpm-0006YI-TO
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 17:23:50 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HIN00M4M46WQ8@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Sat, 26 Jul 2003 18:23:21 +0200 (MEST)
Date: Sat, 26 Jul 2003 19:20:03 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1059232112.539.5.camel@lapdancer.baythorne.internal>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <200307261920.03702.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
 <200307261339.13142.tglx@linutronix.de>
 <1059232112.539.5.camel@lapdancer.baythorne.internal>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
cc: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Subject: Re: Handling multiple NAND chips
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 26 July 2003 17:08, David Woodhouse wrote:
> On Sat, 2003-07-26 at 07:39, Thomas Gleixner wrote:
> > You can do this, but the question is, if it is really an advantage.
>
> Dunno. In general, interrupt-driven operation is an advantage over
> polling -- it lets us get on with something else while we're waiting for
> the flash, and come straight back to the flash driver when it's done.
> Given the latencies involved on NAND, though, it might not really be
> worth the effort -- but I'd like to investigate.

For write it has really no advantage. All chips I have tested so far work near  
the min. timings. 

For erase it could be useful, as it can last a little bit longer. But I know 
for sure, that the current yield and some polling code has better performance 
than most ide drives.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
