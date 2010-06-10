Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OMhcQ-0001br-OO
	for linux-mtd@lists.infradead.org; Thu, 10 Jun 2010 13:16:31 +0000
Subject: Re: UBIFS failed to recover master node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTilHpprYBKnYrw4wTEWjYyQBFJoJZRCwEQbSUOuP@mail.gmail.com>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763914.2106.1.camel@localhost>
	<AANLkTin31PwUfXVHGV89VGrWG89RbIcY1L1I_VEO7mSk@mail.gmail.com>
	<1276006648.5677.20.camel@localhost>
	<AANLkTilHpprYBKnYrw4wTEWjYyQBFJoJZRCwEQbSUOuP@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Jun 2010 16:14:04 +0300
Message-ID: <1276175644.5016.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-10 at 09:08 -0400, twebb wrote:
> >
> > Yes, HW fails to correct bit errors. Why these errors are there - this
> > it the question. May be MLC-related. You need to debug this. Or send me
> > your board, I can try to take a look
> >
> > Did you enable UBI extra self checks?
> >
> 
> It does appear to be an MLC-related problem - either read or write
> disturb appears to have made an "empty" page not really empty.  Would
> UBI extra self checks handle this situation?  I'm not familiar with
> what the extra checks do - I'll look in the code.

No.

> Since read/write disturb errors are a trait of MLC, I'm curious how
> others are dealing with this condition?  ECC can't correct for it
> because it's supposed to be a blank page, implying no ECC is present.
> So if a read or write disturb occurs and the blank page is no longer
> blank - how does driver and/or UBI/UBIFS handle this?  Seems that the
> remaining "good" block data would have to be moved to another LEB and
> the current block somehow marked as dirty.

ubi_leb_change() could do this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
