Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LeuJQ-0003zU-Cr
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 16:51:19 +0000
Date: Wed, 4 Mar 2009 08:50:55 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support
Message-Id: <20090304085055.c9de6cbb.akpm@linux-foundation.org>
In-Reply-To: <49AE6907.1080702@nokia.com>
References: <20090303063605.GA30258@july>
	<20090303124948.dda294e5.akpm@linux-foundation.org>
	<49AE6907.1080702@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Rohit Hagargundgi <h.rohit@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 04 Mar 2009 13:41:59 +0200 Adrian Hunter <adrian.hunter@nokia.com> wrote:

> Andrew Morton wrote:
> >> ...
> >>
> >> +static loff_t flexonenand_get_addr(struct onenand_chip *this, int block)
> >> +{
> >> +	loff_t ofs = 0;
> >> +	int die = 0, boundary;
> >> +
> >> +	if (ONENAND_IS_DDP(this) && block >= this->density_mask) {
> >> +		block -= this->density_mask;
> >> +		die = 1;
> >> +		ofs = this->diesize[0];
> >> +	}
> >> +
> >> +	boundary = this->boundary[die];
> >> +	ofs += block << (this->erase_shift - 1);
> >> +	if (block > (boundary + 1))
> >> +		ofs += (block - boundary - 1) << (this->erase_shift - 1);
> > 
> > Both `block' and `boundary' have 32-bit types.  Are you sure that the
> > left-shift cannot overflow?
> 
> Only very recently has MTD supported sizes greater than 32 bits internally
> for any type of flash.  The external APIs (ioctls) are still 32-bit based.
> 
> For this driver, supporting sizes over 32-bits is a separate issue - and
> may never be needed.

So it doesn't support files >4G?  What's the max device size (now and
projected)?

> >> +	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
> >> +}
> > 
> > I wonder what the heck EUCLEAN was invented for and whether MTD's
> > extensive use of it is appropriate.
> 
> UBI uses it to detect bit-flips so that data can be moved before it
> can no longer be read.  So it is pretty much essential for flash
> memories.

That's not the point.

My point is: for what purpose was EUNCLEAN created by whoever created
it and, given that, is its use by MTD appropriate?  Because it does
appear that this gets returned all the way to userspace sometimes.
