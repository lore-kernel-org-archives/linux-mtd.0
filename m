Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OMhV5-0006iY-ML
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 13:08:53 +0000
Received: by gwj18 with SMTP id 18so4748572gwj.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jun 2010 06:08:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1276006648.5677.20.camel@localhost>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763914.2106.1.camel@localhost>
	<AANLkTin31PwUfXVHGV89VGrWG89RbIcY1L1I_VEO7mSk@mail.gmail.com>
	<1276006648.5677.20.camel@localhost>
Date: Thu, 10 Jun 2010 09:08:49 -0400
Message-ID: <AANLkTilHpprYBKnYrw4wTEWjYyQBFJoJZRCwEQbSUOuP@mail.gmail.com>
Subject: Re: UBIFS failed to recover master node
From: twebb <taliaferro62@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Yes, HW fails to correct bit errors. Why these errors are there - this
> it the question. May be MLC-related. You need to debug this. Or send me
> your board, I can try to take a look
>
> Did you enable UBI extra self checks?
>

It does appear to be an MLC-related problem - either read or write
disturb appears to have made an "empty" page not really empty.  Would
UBI extra self checks handle this situation?  I'm not familiar with
what the extra checks do - I'll look in the code.

Since read/write disturb errors are a trait of MLC, I'm curious how
others are dealing with this condition?  ECC can't correct for it
because it's supposed to be a blank page, implying no ECC is present.
So if a read or write disturb occurs and the blank page is no longer
blank - how does driver and/or UBI/UBIFS handle this?  Seems that the
remaining "good" block data would have to be moved to another LEB and
the current block somehow marked as dirty.
