Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7VM5-0000xK-EP
	for linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 09:09:17 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HVA00CC31BFZ8@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 10:09:16 +0200 (MEST)
Date: Sun, 28 Mar 2004 09:05:51 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20040328075658.221981764D@desire.actrix.co.nz>
To: manningc2@actrix.gen.nz, David Woodhouse <dwmw2@infradead.org>,
 David Updegraff <dave@cray.com>
Message-id: <200403281005.51480.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406328A2.3060905@cray.com>
 <1080404311.17352.69.camel@imladris.demon.co.uk>
 <20040328075658.221981764D@desire.actrix.co.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: nand oob layout assumptions
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 28 March 2004 10:06, Charles Manning wrote:
> I agree with the idea of abstacting this as much as possible. Where the EEC
> is stores (if indeed it even is stored in OOB) should not be the FS's
> concern and should not be known to the FS. The FS should just be told that
> the ECC passed, failed or fixed a single bit error.

No problem with that

> Unless we go for one abstract interface it will [continue to] be hell to
> support more than one FS (it is already a /dev/ass/pain to try get YAFFS
> and JFFS2 going on one machine due to different OOB layouts). The [already
> bad] situation will only get worse when trying to deal with all the fun
> that the newer NAND devices bring us.

He ? I'm running YAFFS and JFFS2 since a long time on the same device and it 
works without any PITA. 

I just want to bring back into memories, that we had a long discussion about 
an abstract interface 2 years ago. There was no way to find a common solution 
as nobody was willing to break either JFFS2 or YAFFS1 or both. 

Again. I agree with the idea of an abstract interface as long as we keep the 
current stuff running. 

> No bitmask. That just passes mucky knowledge through the interface.
>
> Rather:
> * Have the mtd tell the FS the number of unused bytes in the OOB.
> * Pass a byte array through the interface and the mtd packs/unpacks this
> around the ECC, bad block markers and other stuff.

No objections.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
