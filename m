Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7V8f-0000Za-9J
	for linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 08:55:25 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HVA00C0N0OCZ8@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 09:55:24 +0200 (MEST)
Date: Sun, 28 Mar 2004 08:51:56 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20040328072532.3FCCA168A8@desire.actrix.co.nz>
To: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Message-id: <200403280951.56183.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406328A2.3060905@cray.com>
	<200403270907.07298.tglx@linutronix.de>
	<20040328072532.3FCCA168A8@desire.actrix.co.nz>
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

On Sunday 28 March 2004 09:34, Charles Manning wrote:
> > But the fs must be aware of the bad block marker position in the OOB
> > area, as it can not use this byte for storing fs dependend data. The OOB
> > usage is given by the fs layer.
>
> No. Part of the deal is that the OOB area should not be shown in "raw" form
> to the fs. There should be no l physical placement knowledge in the fs,
> only abstract.
>
> This should be shown to the fs as:
>   __u8 spare[8];
>   ECCResult (OK, fixed, failed)
>   BlockOK (OK, bad)

OK, I already have agreed, that we can use such an abstract form for new 
developments, but we _MUST_ maintain compability for the existing 
implementatitons. I like abstract models very much, but I will always keep in 
view what consequences we will have, if we change things.

That's all I'm insisting on.

YAFFS1 uses a different ECC placement than JFFS2. 
If we change this in general now, we will either break YAFFS or JFFS2 or even 
both. 

This prevents users to upgrade their kernels. They will have format 
incompabilities so they loose data on upgrading or loose the interoperability 
of systems. Will you tell your customer to either upgrade 1000 already sold 
devices or stick with the current code or accepting that interoperability is 
not given ? That's not what Open Source Software stands for.

I do not have any objections against an API extension, but breaking things I'm 
_NEVER_ going to accept.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
