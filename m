Received: from mail-sn1nam01on0108.outbound.protection.outlook.com
 ([104.47.32.108] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmjkU-0000dD-Kd
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 15:47:52 +0000
Date: Wed, 21 Sep 2016 10:47:23 -0500
From: Zach Brown <zach.brown@ni.com>
To: Richard Weinberger <richard@nod.at>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] UBI: add debugfs file for tracking PEB state
Message-ID: <20160921154723.GA16843@zach-desktop>
References: <1474404339-9524-1-git-send-email-zach.brown@ni.com>
 <c7a01872-7d8e-d2e7-3241-14bab9ed55f3@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c7a01872-7d8e-d2e7-3241-14bab9ed55f3@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 21, 2016 at 01:13:29PM +0200, Richard Weinberger wrote:
> Zach,
>
> On 20.09.2016 22:45, Zach Brown wrote:
> > From: Ben Shelton <ben.shelton@ni.com>
> >
> > Add a file under debugfs to allow easy access to the erase count for
> > each physical erase block on an UBI device.  This is useful when
> > debugging data integrity issues with UBIFS on NAND flash devices.
> >
> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> > Signed-off-by: Zach Brown <zach.brown@ni.com>
> > ---
> > v2
> >  * Cast pointer in unsigned long instead of int to avoid build warning
> >  * Use ubi->lookuptbl[] to get erase counter instead of reading from flash
> >
> >
>
> [...]
>
> > +enum block_status {
> > +	BLOCK_STATUS_OK,
> > +	BLOCK_STATUS_BAD_BLOCK,
> > +	BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX
> > +};
>
> Do you plan to add more states?
> In UBI a block can have much more states.
> I'd like to see all states, free, in protection, used, bad, corrupted, scrub, etc...
>

Adding more states sounds like a good idea, but I'm not sure how to get that
information. If I made the in_wl_tree function accessible I could use that to
get the information, but I'd have to check each RB Tree. Do you have a
suggestion?

> AFAIK BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX is also unreachable since UBI aborts before that.
>
Do you mean that the block would've have already been marked as bad? So there's
no point checking?


> What about locking? :-)
> This is racy.
> You need at least wl_lock. Otherwise wl might disappear under you.
> And ->lookuptbl[] can return a NULL object too.
>
Do you know what ->lookuptbl[] returning NULL would signify about the state of
the block? Currently I'm thinking of treating as a bad read status and letting
the show function move on.

> Thanks,
> //richard
