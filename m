Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gMVw-0005gK-Va
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 11:43:01 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HIM00MK3OEUQ8@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Sat, 26 Jul 2003 12:42:30 +0200 (MEST)
Date: Sat, 26 Jul 2003 13:39:13 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <a05200f05bb4803789a4f@[130.161.115.44]>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>,
 David Woodhouse <dwmw2@infradead.org>
Message-id: <200307261339.13142.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <a05200f4ebb46f6708c1c@[130.161.115.44]>
 <1059148567.28255.47.camel@lapdancer.baythorne.internal>
 <a05200f05bb4803789a4f@[130.161.115.44]>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
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

On Saturday 26 July 2003 12:22, J.D. Bakker wrote:
> At 11:56 -0400 25-07-2003, David Woodhouse wrote:
> >On Fri, 2003-07-25 at 11:51, J.D. Bakker wrote:
> >>  I have a two-hour old CVS; where should I look ?
> >  > Does it *help* to have separate data/CLE/ALE ?
> >
> >Probably not. What may help, and to be honest I won't be 100% sure till
> >we actually come to implement it, is having separate FR/B# so you can
> >happily poll for completion and leave multiple chips _busy_
> >independently.
>
> Polling should be possible through the Status Read command
> (0x70/0x71) anyway, right ? 

Yep, that works always and you don't have to have seperate FR/B# lines.

> Or would you want hardware to generate an
> interrupt when any of the FR/B# lines change ? Hmmm...

You can do this, but the question is, if it is really an advantage.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
