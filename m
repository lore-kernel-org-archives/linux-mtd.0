Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AcHt-0000RJ-2h
	for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2003 22:05:17 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE400M01IKAP1@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 29 Apr 2003 23:04:59 +0200 (MEST)
Date: Wed, 30 Apr 2003 00:04:21 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030429194216.56C10447E@blood.actrix.co.nz>
To: manningc2@actrix.gen.nz, Thayne Harbaugh <tharbaugh@lnxi.com>,
 =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Message-id: <200304300004.21495.tglx@linutronix.de>
MIME-version: 1.0
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
 <200304291003.10437.tglx@linutronix.de>
 <20030429194216.56C10447E@blood.actrix.co.nz>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 29 April 2003 21:37, Charles Manning wrote:
> > I have tested this with both chiptypes. The erase is aborted and
> > restarted by the erase function.
>
> A couple of comments:
> * "Both chip types" is misleading. There is not just a Toshiba and a
> Samsung chiptype. Each of these vendors provides chips with different
> internal architectures. That is one of the reason characteristics like the
> number of partial page writes etc change.

True. I meant a couple of different types.

> * "Aborted and restarted" is perhaps incorrect. Don't you really mean
> "aborted and re-performed"? I do not believe these parts have a way of
> remembering their internal eraseure state to restart line NOR parts do.

Yep. The command is thrown away according to datasheet and it is issued again 
later. Sorry for misleading expression.

> My other question remains: do you really gain anything by adding the erase
> interruption feature? From a Samsung datasheet:
> * Block erase takes typically 2ms, max 3ms.
> * If you do a reset while the part is erasing, the reset might take as long
> as 500us.
> You then have to restart the erase for it to take another 2ms (unless it
> gets interrupted again).

I have done test on different chips. The erasetime varies a lot. The peak was 
45ms. So that matters IMHO. The specs allow up to 200ms.

> This certainly adds some unpredictability to the behaviour. Most likely it
> does all work, but is it worth it?

Depends. :)

> > It would really be interresting, if those problems are in related to an
> > erase abort. Can anybody insert some debugging in nand_get_chip, where
> > the abort is done?
>
> Yes, it certianly would be interesting.

I think, I have to throw out some harsh remarks again to get an answer on this 
question, as the "hurray, I'm willing to volunteer" replies are not really 
much up to now. :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
