Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7VNO-00015L-Tg
	for linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 09:10:39 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: tglx@linutronix.de, linux-mtd@lists.infradead.org
Date: Sun, 28 Mar 2004 20:19:40 +1200
References: <406328A2.3060905@cray.com>
	<20040328072532.3FCCA168A8@desire.actrix.co.nz>
	<200403280951.56183.tglx@linutronix.de>
In-Reply-To: <200403280951.56183.tglx@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040328081028.67681179BF@desire.actrix.co.nz>
Subject: Re: nand oob layout assumptions
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday 28 March 2004 19:51, Thomas Gleixner wrote:
> On Sunday 28 March 2004 09:34, Charles Manning wrote:
> > > But the fs must be aware of the bad block marker position in the OOB
> > > area, as it can not use this byte for storing fs dependend data. The
> > > OOB usage is given by the fs layer.
> >
> > No. Part of the deal is that the OOB area should not be shown in "raw"
> > form to the fs. There should be no l physical placement knowledge in the
> > fs, only abstract.
> >
> > This should be shown to the fs as:
> >   __u8 spare[8];
> >   ECCResult (OK, fixed, failed)
> >   BlockOK (OK, bad)
>
> OK, I already have agreed, that we can use such an abstract form for new
> developments, but we _MUST_ maintain compability for the existing
> implementatitons. I like abstract models very much, but I will always keep
> in view what consequences we will have, if we change things.
>
> That's all I'm insisting on.
>
> YAFFS1 uses a different ECC placement than JFFS2.
> If we change this in general now, we will either break YAFFS or JFFS2 or
> even both.
>
> This prevents users to upgrade their kernels. They will have format
> incompabilities so they loose data on upgrading or loose the
> interoperability of systems. Will you tell your customer to either upgrade
> 1000 already sold devices or stick with the current code or accepting that
> interoperability is not given ? That's not what Open Source Software stands
> for.
>
> I do not have any objections against an API extension, but breaking things
> I'm _NEVER_ going to accept.

I agree with that fully. We should continue to support the currect 
interfaces, but should perhaps depreciate them. As well as support what is 
already out there we need to also ensure that we provide a more healthy 
framework to move forward too.

Here's what I suggest:

* Keep the existing functions/interface (== the legacy interface) for the 
current concepts so we don't break current implementations.

* Extend the interface with new functions for the new interface.

* Future devices will not necessarily have to support both interfaces. For 
example, if a device has a bad block marking strategy that is not consistent 
with the legacy interface (ie the assumptions in the legacy interface are 
broken for that device)  then it might support the new interface, but not the 
legacy interface.

Current JFFS2, YAFFS1 and current 512byte page NAND devices can use the 
legacy interface and will not get broken.

Future JFFS2, YAFFS1 and 512byte NAND can be written to cope with either. 

YAFFS2 will require the new interface to run in YAFFS2 mode (eg 2k page 
support) and will support either interface to run in YAFFS1 mode.

-- CHarles
